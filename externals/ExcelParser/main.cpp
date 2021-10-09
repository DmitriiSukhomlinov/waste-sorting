// main.cpp

#include <QCoreApplication>
#include <QDebug>

#include <QNetworkRequest>
#include <QNetworkReply>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

#include "xlsxdocument.h"
#include "xlsxchartsheet.h"
#include "xlsxcellrange.h"
#include "xlsxchart.h"
#include "xlsxrichstring.h"
#include "xlsxworkbook.h"
using namespace QXlsx;

int main(int argc, char *argv[]) {
    QCoreApplication a(argc, argv);
    setlocale(LC_ALL, "Russian");

    Document doc("F:/ExcelParser/debug/Adress.xlsx");
    if (!doc.load()) {
        return 1;
    }

    struct Point {
        QString MapPointAdress;
        QString mapPointCathegory;
        QString mapPointType;
        QString mapPointQuantity;
        QString mapPointV;
        QString mapPointCoordinates;
    };

    QList<Point> mapData;
    QString newUrl("https://geocode-maps.yandex.ru/1.x/?apikey=f299a44b-384b-4ff7-9575-1229225237b9&format=json&geocode=");
    for (int row = 6; row < 1441; row++) {
        QString adress;
        QString cathegory;
        QString type;
        QString qnt;
        QString v;
        for (int col = 1; col < 13; col++) {
            QVariant var = doc.read( row, col );
            if (col == 2 || col ==3 || col == 4) {
                adress += var.toString();
                adress += "+";
            } else if (col == 5) {
                cathegory = var.toString();
            } else if (col == 6) {
                type = var.toString();
            } else if (col == 7) {
                qnt = var.toString();
            } else if (col == 8) {
                v = var.toString();
            }
        }
        adress = adress.left(adress.size() - 1);

        QNetworkAccessManager *manager = new QNetworkAccessManager(nullptr);
        QString http = newUrl + adress;
        qDebug() << http;
        QNetworkRequest netRequest(QUrl(newUrl + adress));
        QNetworkReply *netReply = manager->get(netRequest);
        QEventLoop loop;
        QAbstractSocket::connect(netReply, SIGNAL(finished()), &loop, SLOT(quit()));
        loop.exec();

        QByteArray data = netReply->readAll();

        QJsonDocument itemDoc = QJsonDocument::fromJson(data);
        QJsonObject rootObject = itemDoc.object();

        QJsonValue response = rootObject.value("response");
        QJsonObject responseObj = response.toObject();

        QJsonValue geoObjectCollection = responseObj.value("GeoObjectCollection");
        QJsonObject geoObjectCollectionObj = geoObjectCollection.toObject();

        QJsonValue featureMember = geoObjectCollectionObj.value("featureMember");
        QJsonArray featureMemberArr = featureMember.toArray();
        if (featureMemberArr.isEmpty()) {
            continue;
        }
        QJsonObject featureMember0 = featureMemberArr[0].toObject();

        QJsonValue GeoObject = featureMember0.value("GeoObject");
        QJsonObject GeoObjectObj = GeoObject.toObject();

        QJsonValue point = GeoObjectObj.value("Point");
        QJsonObject pointObj = point.toObject();

        QJsonValue pos = pointObj.value("pos");
        QString posStr = pos.toString();
        QStringList poss = posStr.split(" ");
        if (poss.isEmpty()) {
            continue;
        }
        QString x = poss.last();
        /*if (!x.startsWith("54") && !x.startsWith("55")) {
            continue;
        }*/
        QString y = poss.first();
        /*if (!y.startsWith("82") && !y.startsWith("83")) {
            continue;
        }*/

        Point p;
        p.MapPointAdress = adress.replace("+", ", ");
        p.mapPointCathegory = cathegory;
        p.mapPointType = type;
        p.mapPointQuantity = qnt;
        p.mapPointV = v;
        p.mapPointCoordinates = QString("%1, %2").arg(x).arg(y);
        mapData << p;
        int i = 0;
    }

    QJsonArray map;
    for (const Point& p : mapData) {
        QJsonObject obj;
        obj.insert("MapPointAdress", p.MapPointAdress);
        obj.insert("MapPointCathegory", p.mapPointCathegory);
        obj.insert("MapPointType", p.mapPointType);
        obj.insert("MapPointQuantity", p.mapPointQuantity);
        obj.insert("MapPointVolume", p.mapPointV);
        obj.insert("MapPointCoordinates", p.mapPointCoordinates);
        map.append(obj);
    }

    QJsonObject mapObj;
    mapObj.insert("Color", "#00FF00");
    mapObj.insert("MapData", map);



    QJsonObject recordObject;
    recordObject.insert("aluminum-can--metal--pat--glass--cardboard", mapObj);

    QJsonDocument jsonDoc(recordObject);

    QFile users("F:/users.json");
    users.open(QIODevice::WriteOnly);
    //it is working to this point
    users.write(jsonDoc.toJson());
    users.close();



    return 0;
    // return a.exec();
}

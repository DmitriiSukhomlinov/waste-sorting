#include <QCoreApplication>

#include <locale.h>

#include <QXmlStreamReader>
#include <QFile>
#include <QMap>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>

#include <QColor>
#include <QRandomGenerator>

struct Element {
    QString addres;
    QString coordinates;
};

int main(int argc, char *argv[]) {
    QCoreApplication a(argc, argv);
    setlocale(LC_ALL, "Russian");

    QFile* file = new QFile("F://XmlParser//map.kml");
    if (!file->open(QIODevice::ReadOnly | QIODevice::Text)) {
        return 1;
    }
    QXmlStreamReader xml(file);

    QString lastStartElement;
    QString addres;
    QStringList cathegories;
    QString coordinates;
    QMap<QString, QList<Element>> elements;
    while (!xml.atEnd() && !xml.hasError()) {
        QXmlStreamReader::TokenType token = xml.readNext();
        if (token == QXmlStreamReader::StartDocument) {
            continue;
        }
        if (token == QXmlStreamReader::StartElement) {
            lastStartElement = xml.name().toString();
        }
        if (token == QXmlStreamReader::Characters) {
            QString node = xml.text().toString();
            if (lastStartElement == "name") {
                addres = node;
            } else if (lastStartElement == "description") {
                if (node.contains("Контейнер для алюминиевых и жестяных банок")) {
                    //"hdpe_ldpe_pp_ps_fe-cans_alu-aluminum-cans";
                    cathegories << "hdpe" << "ldpe" << "pp" << "ps" << "fe-cans" << "alu-aluminum-cans";
                } else if (node.contains("Контейнер для бумаги и картона")) {
                    cathegories << "paper" << "cardboard";
                } else if (node.contains("Контейнер для стекла")) {
                    cathegories << "glass";
                } else if (node.contains("пластик+металл")) {
                    cathegories << "hdpe" << "ldpe" << "pp" << "ps" << "fe-cans" << "alu-aluminum-cans";
                }
            } else if (lastStartElement == "coordinates") {
                node.remove(' ');
                node.remove('\n');
                auto splitted = node.split(",");
                splitted.pop_back();
                coordinates = QString("%1, %2").arg(splitted.last(), splitted.first());
            }
        }
        if (token == QXmlStreamReader::EndElement) {
            if (lastStartElement == "coordinates") {
                Element el;
                el.addres = addres;
                QString key = cathegories.join('_');
                el.coordinates = coordinates;
                //elements << el;
                elements[key].append(el);
                //elements.insert(cathegories.join('_'), el);
                addres.clear();
                cathegories.clear();
                coordinates.clear();
            }
            lastStartElement = "";
        }
    }

    QJsonObject recordObject;
    for (const QString& cathegories : elements.keys()) {
        QJsonArray map;
        for (const Element& value : elements[cathegories]) {
            QJsonObject obj;
            obj.insert("MapPointAdress", value.addres);
            obj.insert("MapPointCathegory", "Нет данных");
            obj.insert("MapPointType", "Бак");
            obj.insert("MapPointQuantity", "Нет данных");
            obj.insert("MapPointVolume", "Нет данных");
            obj.insert("MapPointCoordinates", value.coordinates);
            map.append(obj);
        }
        QJsonObject mapObj;
        QColor col = QColor::fromRgb(QRandomGenerator::global()->generate());
        QString rgb = col.name();
        mapObj.insert("Color", rgb);
        mapObj.insert("MapData", map);
        recordObject.insert(cathegories, mapObj);
    }

    QJsonDocument jsonDoc(recordObject);

    QFile users("F:/users.json");
    users.open(QIODevice::WriteOnly);
    //it is working to this point
    users.write(jsonDoc.toJson());
    users.close();

    return 0;
}

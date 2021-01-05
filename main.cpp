#include <QDir>
#include <QDirIterator>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include <QStandardPaths>

#if defined(Q_OS_ANDROID)
#include <QtAndroid>
#endif

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

#if defined(Q_OS_ANDROID)
    QtAndroid::PermissionResultMap resultHash = QtAndroid::requestPermissionsSync({"android.permission.WRITE_EXTERNAL_STORAGE",
                                                                                   "android.permission.READ_EXTERNAL_STORAGE"});
    if (resultHash["android.permission.WRITE_EXTERNAL_STORAGE"] == QtAndroid::PermissionResult::Denied) {
        return 0;
    }
    if (resultHash["android.permission.READ_EXTERNAL_STORAGE"] == QtAndroid::PermissionResult::Denied) {
        return 0;
    }
#endif

    QString tmploc = QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation) + "/stack/html/";
    tmploc = QDir(tmploc).absolutePath();
    QString newHtmlFile = tmploc + "/placemark.html";
    if (!QDir(tmploc).exists()) {
        if (!QDir(tmploc).mkpath(".")) {
            newHtmlFile = "https://yandex.ru/";
        }
    } else {

        //newHtmlFile = "https://google.com/";
    }
    QString newJsFile = tmploc + "/placemark.js";
    if (!QFile(QStandardPaths::writableLocation(QStandardPaths::DocumentsLocation)).exists()) {
        //newHtmlFile = "https://google.com/";
    }
    if (!QFile::copy(":/html/placemark.html", newHtmlFile)) {
        //newHtmlFile = "https://google.com/";
    }
    QFile::copy(":/html/placemark.js", newJsFile);

    //newHtmlFile = newHtmlFile.replace("qrc", "file");

    // if wanted, set the QML webview URL
    auto context = engine.rootContext();
    Q_ASSERT(context != nullptr);

    context->setContextProperty("placemarkUrl", QUrl::fromUserInput(newHtmlFile));

    return app.exec();
}

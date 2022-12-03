#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
//#include <QtWebEngine>

#if defined(Q_OS_ANDROID)
#include <QtAndroid>

static const QString PERMISSION_LOCATION = "android.permission.ACCESS_FINE_LOCATION";

#endif

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_ShareOpenGLContexts);
#endif

    //QtWebEngine::initialize();

    QGuiApplication app(argc, argv);
    app.setApplicationName("Waste sorting");
    app.setApplicationVersion("0.1");

    QQmlApplicationEngine engine;


    //Copy html and js files
#if defined(Q_OS_ANDROID)
    QtAndroid::PermissionResultMap resultHash = QtAndroid::requestPermissionsSync({PERMISSION_LOCATION});

    if (resultHash[PERMISSION_LOCATION] == QtAndroid::PermissionResult::Denied) {
        qCritical() << QObject::tr("The location permission is required, abort.");
        return 1;
    }
#endif

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

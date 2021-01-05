#include <QDebug>
#include <QDir>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQmlEngine>
#include <QStandardPaths>

#if defined(Q_OS_ANDROID)
#include <QtAndroid>

static const QString PERMISSION_WRITE = "android.permission.WRITE_EXTERNAL_STORAGE";
static const QString PERMISSION_READ = "android.permission.READ_EXTERNAL_STORAGE";

#endif

static const QString SUBFOLDER = "/stack/html/";

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
    QtAndroid::PermissionResultMap resultHash = QtAndroid::requestPermissionsSync({PERMISSION_WRITE,
                                                                                   PERMISSION_READ});
    if (resultHash[PERMISSION_WRITE] == QtAndroid::PermissionResult::Denied) {
        qCritical() << QObject::tr("The write permission is required, abort.");
        return 1;
    }
    if (resultHash[PERMISSION_READ] == QtAndroid::PermissionResult::Denied) {
        qCritical() << QObject::tr("The read permission is required, abort.");
        return 1;
    }
#endif

    QString tmploc = QStandardPaths::writableLocation(QStandardPaths::TempLocation) + SUBFOLDER;
    tmploc = QDir(tmploc).absolutePath();
    if (!QDir(tmploc).exists()) {
        if (!QDir(tmploc).mkpath(".")) {
            qCritical() << QObject::tr("Can't create temporary folder, abort.");
            return 1;
        }
    }
    QString newHtmlFile = tmploc + "/placemark.html";
    if (QFile(newHtmlFile).exists()) {
        if (!QFile(newHtmlFile).remove()) {
            qCritical() << QObject::tr("Can't remove the exists \"placemark.html\" file, abort.");
            return 1;
        }
    }
    if (!QFile::copy(":/html/placemark.html", newHtmlFile)) {
        qCritical() << QObject::tr("Can't copy \"placemark.html\", abort.");
        return 1;
    }
    QString newJsFile = tmploc + "/placemark.js";
    if (QFile(newJsFile).exists()) {
        if (!QFile(newJsFile).remove()) {
            qCritical() << QObject::tr("Can't remove the exists \"placemark.js\" file, abort.");
            return 1;
        }
    }
    if (!QFile::copy(":/html/placemark.js", newJsFile)) {
        qCritical() << QObject::tr("Can't copy \"placemark.js\", abort.");
        return 1;
    }

    auto context = engine.rootContext();
    Q_ASSERT(context != nullptr);

    context->setContextProperty("placemarkUrl", QUrl::fromUserInput(newHtmlFile));

    return app.exec();
}

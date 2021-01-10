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
    app.setApplicationName("Waste sorting");

    QQmlApplicationEngine engine;


    //Copy html and js files
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
    QFile htmlFile(newHtmlFile);
#ifndef Q_OS_ANDROID
    htmlFile.setPermissions(QFileDevice::Permission::ReadOther | QFileDevice::Permission::WriteOther);
#endif
    if (htmlFile.exists()) {
        if (!htmlFile.remove()) {
            qCritical() << QObject::tr("Can't remove the exists \"placemark.html\" file, error: \"%1\".").arg(htmlFile.errorString());
            return 1;
        }
    }
    if (!QFile::copy(":/html/placemark.html", newHtmlFile)) {
        qCritical() << QObject::tr("Can't copy \"placemark.html\", abort.");
        return 1;
    }

    QString newJsFile = tmploc + "/placemark.js";
    QFile jsFile(newJsFile);
#ifndef Q_OS_ANDROID
    jsFile.setPermissions(QFileDevice::Permission::ReadOther | QFileDevice::Permission::WriteOther);
#endif
    if (jsFile.exists()) {
        if (!jsFile.remove()) {
            qCritical() << QObject::tr("Can't remove the exists \"placemark.js\" file, error: \"%1\".").arg(jsFile.errorString());
            return 1;
        }
    }
    if (!QFile::copy(":/html/placemark.js", newJsFile)) {
        qCritical() << QObject::tr("Can't copy \"placemark.js\", abort.");
        return 1;
    }

    auto context = engine.rootContext();
    Q_ASSERT(context != nullptr);

    context->setContextProperty("htmlUrl", QUrl::fromUserInput(newHtmlFile));

    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

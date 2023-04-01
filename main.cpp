#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "file.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //qmlRegisterSingletonType(QUrl("qrc:/themes/Themes/OneDark.qml"),"MyModule",1,0,"OneDark");
    //注册C++类，用于在qml中调用
    engine.addImportPath("qrc:/");
    qmlRegisterType<File>("RollCall.File",1,0,"File");
    //
    engine.rootContext()->setContextProperty("appDir",qApp->applicationDirPath());

    const QUrl url(u"qrc:/RollCall/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}

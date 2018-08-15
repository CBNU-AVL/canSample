#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "modules/gcanmanager.h"
#include "modules/ccanmanager.h"
#include <QtQml>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<GCanManager>("edu.cbnu.avl.gcanmanager", 0, 1, "GCanManager");
    qmlRegisterType<CCanManager>("edu.cbnu.avl.ccanmanager", 0, 1, "CCanManager");
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}

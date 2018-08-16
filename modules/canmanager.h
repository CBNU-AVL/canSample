#ifndef CANMANAGER_H
#define CANMANAGER_H

#include <QObject>
#include <QtSerialBus/QCanBus>
#include <QDebug>
#include <QJsonObject>
#include <QJsonDocument>

class CanManager : public QObject
{
    Q_OBJECT
public:
    explicit CanManager(QObject *parent = nullptr);

    bool loadConf(const QString &path);
    void connectDevice();
    void disconnectDevice();
    void sendRawFrame(const QCanBusFrame &frame) const;
    void sendMessege(const QVariantMap &msg) const;
    void processReceivedFrames(); //dbc parsing using GENEVI/CANdb
    void processErrors(QCanBusDevice::CanBusError) const;
    void processFramesWritten(qint64);

private:
    QCanBusDevice *m_canDevice;
    bool bInitiated;
    QJsonObject jsonConfObj;
    qint64 m_numberFramesWritten;
    QVariant bitRate;
    QString pluginName;
    QString deviceInterfaceName;
signals:
    void canMessageReceived(const QVariantMap&);

public slots:
};

#endif // CANMANAGER_H

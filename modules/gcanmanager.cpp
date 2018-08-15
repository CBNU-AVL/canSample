#include "gcanmanager.h"
#define D true
GCanManager::GCanManager(QObject *parent) : CanManager (parent)
{
    bActive = false;
    m_AlvCnt = 0;
    timerSendMsg = new QTimer(this);
    timerSendMsg->setTimerType(Qt::PreciseTimer);
    connect(timerSendMsg, SIGNAL(timeout()), this, SLOT(sendCmdMessage()));
}
void GCanManager::incAlvCnt()
{
    ++m_AlvCnt;
    emit AlvCntChanged();
    if(D)
        qDebug() << tr("%1 > m_AlvCnt : %2").arg(__func__).arg(m_AlvCnt);
}
void GCanManager::resetAlvCnt()
{
    m_AlvCnt = 0;
    emit AlvCntChanged();
    if(D)
        qDebug() << tr("%1 > m_AlvCnt : %2").arg(__func__).arg(m_AlvCnt);
}
void GCanManager::setActive(const bool &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    if(bActive != arg)
    {
        bActive = arg;
        emit ActiveChanged();
    }
}
void GCanManager::setEpsEnable(const bool &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    if(m_EpsEnable != arg)
    {
        m_EpsEnable = arg;
        emit EpsEnableChanged();
    }
}
void GCanManager::setAccEnable(const bool &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    if(m_AccEnable != arg)
    {
        m_AccEnable = arg;
        emit AccEnableChanged();
    }
}
void GCanManager::setAebEnable(const bool &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    if(m_AebEnable != arg)
    {
        m_AebEnable = arg;
        emit AebEnableChanged();
    }
}
void GCanManager::setEpsOverrideIgnore(const bool &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    if(m_EpsOverrideIgnore != arg)
    {
        m_EpsOverrideIgnore = arg;
        emit EpsOverrideIgnoreChanged();
    }
}
void GCanManager::setSteerAngle(const double &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    m_SteerAngle = arg;
    emit SteerAngleChanged();
}
void GCanManager::setSteerSpeed(const quint8 &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    m_SteerSpeed = arg;
    emit SteerSpeedChanged();
}
void GCanManager::setVehicleAccel(const double &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    m_VehicleAccel = arg;
    emit VehicleAccelChanged();
}
void GCanManager::setAebDecRate(const double &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    m_AebDecRate = arg;
    emit AebDecRateChanged();
}
void GCanManager::setTargetSpeed(const double &arg)
{
    if(D)
        qDebug() << tr("%1 > arg : %2").arg(__func__).arg(arg);
    m_TargetVehicleSpeed = arg;
    emit TargetSpeedChanged();
    //bind cluster speed display
    //implement discrete pd controller for velocity control
}

void GCanManager::sendCmdMessage()
{
    //check acc, aeb, eps state
    if(D)
        qDebug() << tr("%1 >").arg(__func__);
}
void GCanManager::onActiveChanged()
{
    if(D)
        qDebug() << tr("%1 > bActive : %2").arg(__func__).arg(bActive);
    if(bActive)
    {
        //TODO: CAN connect
        timerSendMsg->start(20);
    }
    else
    {
        //TODO: CAN disconnect
        timerSendMsg->stop();
    }
}

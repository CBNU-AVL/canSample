#ifndef UBLOX_H
#define UBLOX_H

#include <QObject>

class ublox : public QObject
{
    Q_OBJECT
public:
    explicit ublox(QObject *parent = nullptr);

signals:

public slots:
};

#endif // UBLOX_H
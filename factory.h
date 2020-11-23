#ifndef FACTORY_H
#define FACTORY_H

#include <QObject>
#include "client.h"

class Factory : public QObject
{
    Q_OBJECT
public:
    explicit Factory(QObject *parent = nullptr);

    Q_INVOKABLE Client* createClient();

signals:

};

#endif // FACTORY_H

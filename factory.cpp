#include "factory.h"

Factory::Factory(QObject *parent) : QObject(parent)
{

}


Client *Factory::createClient()
{
    return new Client(this);
}

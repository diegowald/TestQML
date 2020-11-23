#include "client.h"

Client::Client(QObject *parent) : QObject(parent)
{

}

Client::~Client()
{
    //
}

void Client::connect()
{
    emit connectedChanged(true);
}

void Client::disconnect()
{
    emit connectedChanged(false);
}

void Client::sendCommand(const QString &cmdType, const QString& args)
{
    emit commandReplyrReceived(cmdType, args);
}

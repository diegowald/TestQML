#ifndef CLIENT_H
#define CLIENT_H

#include <QObject>
#include <QQmlApplicationEngine>

class Client : public QObject
{
    Q_OBJECT
public:
    explicit Client(QObject *parent = nullptr);
    virtual ~Client();

    Q_INVOKABLE void connect();
    Q_INVOKABLE void disconnect();
    Q_INVOKABLE void sendCommand(const QString &cmdType, const QString& args);

    static void registerTypeToQml() {
        qmlRegisterType<Client>("com.client", 1, 0, "Client");
    }

signals:
    void connectedChanged(bool value);
    void updateReceived(const QString json);
    void commandReplyrReceived(const QString commandId, const QString result);
};

#endif // CLIENT_H

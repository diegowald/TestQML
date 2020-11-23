// Pair.qml
import QtQuick 2.0

QtObject {
    id: pair

    property string pairId
    property string ip1
    property string ip2

    function sendCommand(cmdType, args) {
        client1.sendCommand(cmdType, args);
        client2.sendCommand(cmdType, args);
    }

    property BridgeClient client1: BridgeClient {
        id: client1
        ip: ip1

        onConnectedChanged: {
            pair.connectedChanged(pairId, client1, value);
        }

        onUpdateReceived: {
            pair.updateReceived(pairId, client1, json);
        }

        onCommandReplyReceived: {
            pair.commandReplyReceived(pairId, client1, commandId, result);
        }
    }

    property BridgeClient client2: BridgeClient {
        id: client2
        ip: ip2

        onConnectedChanged: {
            pair.connectedChanged(pairId, client2, value);
        }

        onUpdateReceived: {
            pair.updateReceived(pairId, client2, json);
        }

        onCommandReplyReceived: {
            pair.commandReplyReceived(pairId, client2, commandId, result);
        }

    }

    signal connectedChanged(string pairId, QtObject client, bool value)
    signal updateReceived(string pairId, QtObject client, string json)
    signal commandReplyReceived(string pairId, QtObject client, string commandId, string result)
}

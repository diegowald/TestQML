// BridgeClient.qml

import QtQuick 2.0

import com.client 1.0 as ComClient


QtObject {
    id: client

    property string ip

    property ComClient.Client theClient: ComClient.Client {

        onConnectedChanged: {
            console.log("Client " + ip + " connectionChanged " + value);
            connectedChanged(client, value);
        }

        onUpdateReceived: {
            console.log("Client " + ip + " onUpdateReceived " + json);
            updateReceived(client, json);
        }

        onCommandReplyrReceived: {
            console.log("Client " + ip + " onCommandReplyrReceived " + commandId + ": " + result);
            commandReplyReceived(client, commandId, result)
        }

    }

    function sendCommand(cmdType, args) {
        theClient.sendCommand(cmdType, args);
    }

    signal connectedChanged(QtObject client, bool value)
    signal updateReceived(QtObject client, string json)
    signal commandReplyReceived(QtObject client, string commandId, string result)
}

// MainCaontroller.qml
import QtQuick 2.15
import QtQuick.Controls 2.15

QtObject {
    id: mainController

    /*property ListModel model: ListModel {

    }*/
    property var model: ({})

    function addPPair(pairId, ip1, ip2) {
        var component = Qt.createComponent("Pair.qml");
        if (component.status === Component.Ready) {
            var pair = component.createObject(mainController, {pairId: pairId, ip1: ip1, ip2: ip2});
            if (pair !== null) {
                //model.append(pair);
                model[pairId] = pair;
                pair.connectedChanged.connect(pairConnectedChanged);
                pair.updateReceived.connect(pairUpdateReceived);
                pair.commandReplyReceived.connect(pairCommandReplyReceived);

            }
        } else {
            console.log(component.status);
            console.log(component.errorString());
        }
        console.log(model.length);
    }


    function removePPair(pairID) {
        if (model[pairID]) {
            delete model[pairID];
        }
    }


    function sendCommand(pairId, cmdType, args) {
        /*var pair = find(function(item) {
            return item.pairId === pairId;
        });
        if (pair !== null) {
            pair.sendCommand(cmdType, args);
        }*/
        if (model[pairId]) {
            model[pairId].sendCommand(cmdType, args);
        }
    }

    function find(criteria) {
      for (var i = 0; i < model.count; ++i) {
          if (criteria(model.get(i))) {
              return model.get(i)
          }
      }
      return null
    }

    function findIndex(criteria) {
      for (var i = 0; i < model.count; ++i) {
          if (criteria(model.get(i))) {
              return i
          }
      }
      return -1
    }

    signal information(string data);


    function pairConnectedChanged(pairId, client, value) {
        var t = "ConnectedChanged " + pairId + " " + value;
        information(t);
    }

    function pairUpdateReceived(pairId, client, json) {
        var t = "pairUpdateReceived " + pairId + " " + json;
        information(t);
    }

    function pairCommandReplyReceived(pairId, client, commandId, result) {
        var t = "pairCommandReplyReceived " + pairId + " " + commandId + " " + result ;
        information(t);
    }

}

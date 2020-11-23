import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    width: 640
    height: 480
    visible: true
    title: qsTr("Scroll")

    MainController {
        id: controller
        onInformation: infoText.text = data;
    }

    ScrollView {
        anchors.fill: parent

        Column {
            spacing: 2
            Button {
                id: btn
                text: "Create element"
                onClicked: {
                    controller.addPPair("pairId1", "1", "2")
                    controller.sendCommand("pairId1", "Hola", "mundo");
                }
                height: 30
            }

            Text {
                id: infoText
                text: qsTr("text")
            }

            ListView {
                id: listView
                width: parent.width
                model: controller.model
                delegate: ItemDelegate {
                    text: "Item " + pairId
                    width: listView.width
                }
            }
        }
    }
}

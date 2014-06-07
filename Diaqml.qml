import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

import "Nodes/node_handling.js" as Node

ApplicationWindow {
    id: application
    title: qsTr("Hello World")
    width: 640
    height: 480

    property bool linkModeEnabled: false

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    MouseArea {
        id: documentArea
        anchors.fill: parent

        onClicked: { Node.select(null) }
    }

    Rectangle {
        id: window
        anchors.fill: parent

        // top panel
        Rectangle {
            id: toolbox
            color: "white"
            height: 80
            anchors { right: parent.right; top: parent.top; left: parent.left}

            Column {
                anchors.centerIn: parent
                spacing: 8

                Text { text: "Drag an item into the scene." }

                Rectangle {
                    width: palette.width + 50; height: palette.height + 20
                    border.color: "black"

                    Row {
                        id: palette
                        anchors.centerIn: parent
                        spacing: 8

                        DiaItem {
                            anchors.verticalCenter: parent.verticalCenter
                            componentFile: "Nodes/Flow/InOutput.qml"
                        }
                        DiaItem {
                            anchors.verticalCenter: parent.verticalCenter
                            componentFile: "Nodes/Flow/PredefinedProcess.qml"
                        }
                        DiaItem {
                            anchors.verticalCenter: parent.verticalCenter
                            componentFile: "Nodes/Flow/Connector.qml"
                        }
                        DiaItem {
                            anchors.verticalCenter: parent.verticalCenter
                            componentFile: "Nodes/Flow/Process.qml"
                        }
                    }
                }
            }
        }
    }
}

import QtQuick 2.2
import QtQuick.Controls 1.1
import QtQuick.Window 2.0

ApplicationWindow {
    title: qsTr("Hello World")
    width: 640
    height: 480

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
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
                            componentFile: "DiaTest1.qml"
                            color: "blue"
                        }
                        DiaItem {
                            anchors.verticalCenter: parent.verticalCenter
                            color: "red"
                            componentFile: "DiaTest2.qml"
                        }
                        DiaItem {
                            anchors.verticalCenter: parent.verticalCenter
                            color: "black"
                            componentFile: "DiaTest3.qml"
                        }
                        DiaItem {
                            anchors.verticalCenter: parent.verticalCenter
                            color: "yellow"
                            componentFile: "DiaTest4.qml"
                        }
                    }
                }
            }
        }
    }
}

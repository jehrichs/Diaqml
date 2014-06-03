import QtQuick 2.0

Rectangle {
    width: 20
    height: 20

    color: "red"

    MouseArea {
        id: iconMouseArea
        anchors.fill: parent

        drag.target: parent
        drag.axis: Drag.XandYAxis

    }
}

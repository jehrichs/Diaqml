import QtQuick 2.0

import "node_handling.js" as Node

Rectangle {
    id: socket

    width: 5
    height: 5

    color: "black"
    border.color: "black"
    border.width: 3

    property bool mouseOver: false
    opacity: mouseOver ? 1 : parent.hoverFrameEnabled

    MouseArea {
        id: socketArea
        anchors.fill: parent
        hoverEnabled: true

        onEntered: { parent.mouseOver=true; parent.color = "red"; parent.width=10;parent.height=10; }
        onExited: { parent.mouseOver=false; parent.color = "black"; parent.width=5;parent.height=5;}
        onClicked: {
            if(Node.curLink) { console.log("current link exist") }
            else {console.log("current link does not exist")}
        }
    }
}

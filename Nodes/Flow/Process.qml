import QtQuick 2.0

import "../"

NodeFrame {
    id: node

    property real minimumWidth: 100
    property real minimumHeight: 100

    LinkSocket {
        id: top
        z: 10
        x: parent.width/2-top.width/2
    }
    LinkSocket {
        id: bottom
        z: 10
        x: parent.width/2-bottom.width/2
        y: parent.height-bottom.height
    }

    LinkSocket {
        id: left
        z: 10
        y: parent.height/2-left.height/2
    }
    LinkSocket {
        id: right
        z: 10
        x: parent.width-right.width
        y: parent.height/2-right.height/2
    }
    LinkSocket {
        id: center
        z: 10
        x: parent.width/2-right.width/2
        y: parent.height/2-right.height/2
    }

    Rectangle {
        x: parent.gap
        y: parent.gap
        width: parent.width-2*parent.gap
        height: parent.height-2*parent.gap
        border.width: parent.nborder ? parent.nborderWidth : 0
        border.color: parent.nborderColor
        color: parent.nfill ? parent.nbgColor : "transparent"

        Text {
            width: parent.width
            height: parent.height
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter

            text: parent.parent.ntext
            elide: Text.ElideMiddle
            wrapMode: Text.Wrap
            font.family: parent.parent.nfamily
            font.pointSize: parent.parent.npointSize
            color: parent.parent.ntextColor
        }
    }
}

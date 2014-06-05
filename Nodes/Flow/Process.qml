import QtQuick 2.0

import "../"

NodeFrame {
    id: node

    property real minimumWidth: 100
    property real minimumHeight: 100

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

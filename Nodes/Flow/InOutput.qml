import QtQuick 2.2

import "../"

NodeFrame {
    id: inout

    property real minimumWidth: 100
    property real minimumHeight: 100

    Rectangle {
        id: body
        width: parent.width - parent.gap*2
        height: parent.height - parent.gap*2
        x: parent.gap
        y: parent.gap

        color: parent.nbgColor


        Text {
            anchors.fill: parent

            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            elide: Text.ElideMiddle
            wrapMode: Text.Wrap

            text: inout.ntext
            font.family: inout.nfamily
            font.pointSize: inout.npointSize
            color: inout.ntextColor
        }

    }
}

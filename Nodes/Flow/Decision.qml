import QtQuick 2.2

import "../"

NodeFrame {
    id: node

    property real minimumWidth: 50
    property real minimumHeight: 50

    property real rectWidth: Math.sqrt(Math.pow(Math.min(height,width),2)/2)-2*gap
    property real diagWidth: Math.sqrt(Math.pow(rectWidth,2)*2)

    LinkSocket {
        id: top
        z: 10
        x: parent.width/2-top.width/2
        y: (parent.height-diagWidth)/2-top.height/2
    }
    LinkSocket {
        id: bottom
        z: 10
        x: parent.width/2-bottom.width/2
        y: parent.height-top.y-parent.gap
    }

    LinkSocket {
        id: left
        z: 10
        y: parent.height/2-left.height/2
        x: (parent.width-diagWidth)/2-left.width/2
    }
    LinkSocket {
        id: right
        z: 10
        y: parent.height/2-right.height/2
        x: parent.width-left.x-parent.gap
    }
    LinkSocket {
        id: center
        z: 10
        x: parent.width/2-center.width/2
        y: parent.height/2-center.height/2
    }

    Rectangle {
        id: itemRect
        x: parent.gap
        y: parent.gap
        width: rectWidth//Math.sqrt(Math.pow(Math.min(parent.height,parent.width),2)/2)
        height:rectWidth//Math.sqrt(Math.pow(Math.min(parent.height,parent.width),2)/2)
        border.width: parent.nborder ? parent.nborderWidth : 0
        border.color: parent.nborderColor
        color: parent.nfill ? parent.nbgColor : "transparent"
        rotation: 45
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
    }


    Text {
        width: diagWidth
        height: diagWidth
        x: (parent.width-diagWidth)/2
        y: (parent.height-diagWidth)/2
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter

        text: parent.ntext
        elide: Text.ElideMiddle
        wrapMode: Text.Wrap
        font.family: parent.nfamily
        font.pointSize: parent.npointSize
        color: parent.ntextColor
    }
}

import QtQuick 2.2

import "node_handling.js" as Node

Item {
    id: frame

    width: 40
    height: 40
    transformOrigin: Item.Center

    property int hoverFrameEnabled: handle.opacity

    property bool dynamic: false
    property real minimumWidth: 100
    property real minimumHeight: 100

    property color nbgColor: "red"
    property color nfgColor: "blue"
    property bool nfill: true

    property color nborderColor: "black"
    property bool nborder: true
    property int nborderWidth: 2

    property color ntextColor: "black"
    property string ntext: ""
    property real npointSize: 16
    property string nfamily: "Helvetica"

    property real nalpha: 1

    property int gap: 5

    SizeMoveHandle {
        id: handle
        z: 5
    }
}

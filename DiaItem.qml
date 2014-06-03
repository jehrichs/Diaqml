import QtQuick 2.2
import "itemCreation.js" as Code

Rectangle {
    id: paletteItem
    width: 20
    height: 20

    property string componentFile

    MouseArea {
        anchors.fill: parent

        onPressed: {
            console.log("on pressed")
            Code.startDrag(mouse);
        }
        onPositionChanged: Code.continueDrag(mouse);
        onReleased: Code.endDrag(mouse);
    }
}

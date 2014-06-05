import QtQuick 2.2
import "itemCreation.js" as Code

Item {
    id: paletteItem
    width: 40
    height: 40

    property string componentFile

    Loader {
        id: loader
        source: componentFile
    }


    MouseArea {
        anchors.fill: parent

        onPressed: {
            Code.startDrag(mouse);
        }
        onPositionChanged: Code.continueDrag(mouse);
        onReleased: Code.endDrag(mouse);
    }
}

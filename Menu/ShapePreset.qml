import QtQuick 2.2
import "shapePresetLoader.js" as SPL


Item {
    id: shapePresetItem
    width: itemShapeGridSize
    height: itemShapeGridSize

    property string componentFile
    property Item documentArea

    Loader {
        id: loader
        width: itemShapeGridSize
        height: itemShapeGridSize
        source: componentFile
    }

    MouseArea {
        anchors.fill: parent

        onPressed: { SPL.startDrag(mouse); }
        onPositionChanged: SPL.continueDrag(mouse);
        onReleased: SPL.endDrag(mouse);
    }
}

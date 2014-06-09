import QtQuick 2.0

Rectangle {
    id: shapeList
    height:listView.height+titleRect.height

    gradient: Gradient {
        GradientStop { position: 0.0; color: "#1753ce" }
        GradientStop { position: 1.0; color:  "#15159c"}
    }

    property alias titleText: titleTxt.text
    property alias customModel: listView.model

    Rectangle{
        id: titleRect
        width: parent.width
        height: 40
        gradient: Gradient {
            GradientStop { position: 0.0; color: "#1141a7" }
            GradientStop { position: 1.0; color:  "#0f1273"}
        }
        Image {
            id: titleArrow
            width:  20
            height:  20
            anchors.left: parent.left
            anchors.leftMargin: 5
            anchors.verticalCenter: parent.verticalCenter
            source: "arrowdown.png"

        }
        Text{
            id: titleTxt
            anchors.left: titleArrow.right
            anchors.leftMargin: 10
            anchors.verticalCenter: parent.verticalCenter
            font.bold: true
            font.pixelSize: 18
            color:  "#c1c3c8"
        }
        MouseArea{
            width: parent.width
            height: parent.height
            onClicked: {
                if (shapeList.state == "collapsed") {
                    shapeList.state = ""
                }
                else {
                    shapeList.state = "collapsed"
                }
            }
        }
    }

    GridView {
        id: listView
        interactive: false
        width: parent.width
        height: parent.height-titleRect.height
        anchors.top: titleRect.bottom
        cellWidth: itemShapeGridSize
        cellHeight: itemShapeGridSize
        model: customModel
    }

    states: [
    State {
        name: "collapsed"
        PropertyChanges {
            target: listView
            height: 0
            opacity: 0
        }
        PropertyChanges {
            target: shapeList
            height: titleRect.height
        }
        PropertyChanges {
            target: titleArrow
            rotation: -90
        }
    }
    ]

    transitions: [
    Transition {
        NumberAnimation { target: listView; property: "height"; duration: 200 }
        NumberAnimation { target: listView; property: "opacity"; duration: 200 }
        NumberAnimation { target: titleArrow; property: "rotation"; duration: 100 }
    }
    ]

    Component.onCompleted:  {
        shapeList.height = titleRect.height+listView.contentHeight
        shapeList.state = "collapsed"
    }
}

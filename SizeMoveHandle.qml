import QtQuick 2.0

Rectangle {
    id: sizeMoveHandle
    anchors.fill: parent
    border.width: 3
    border.color: "gray"
    color: "transparent"
    opacity: 1

    property int minHandleSize: 10
    property int maxHandleSize: 10

    MouseArea {
        id: moveHandle
        anchors.fill: parent
        hoverEnabled: true

        onEntered: { sizeMoveHandle.state = "hoverOn" }
        onExited: { sizeMoveHandle.state = "hoverOff" }

        drag.target: parent.parent
        drag.axis: Drag.XandYAxis


        MouseArea {
            id: resizeTophandle
            width: parent.width
            height: minHandleSize//parent.height - 3*(parent.height/4)
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseY
                resize = true
            }

            onReleased: { resize = false }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseY;

                    container.height = container.height+diff;
                    container.y = container.y - diff;
                    courserPos = mouseY;
                }
            }


            onEntered: { topHandle.opacity = 0.5 }
            onExited: { topHandle.opacity = 0 }

            Rectangle {
                id: topHandle
                anchors.fill: parent
                color: "red"
                opacity: 0
            }
        }

        MouseArea {
            id: resizeBottomhandle
            y:parent.height-minHandleSize//3*(parent.height/4)
            width: parent.width
            height: minHandleSize//parent.height - 3*(parent.height/4)
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseY
                resize = true
            }

            onReleased: { resize = false }

            onEntered: { bottomHandle.opacity = 0.5 }
            onExited: { bottomHandle.opacity = 0 }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseY;

                    container.height = container.height-diff;
                    courserPos = mouseY;
                }
            }

            Rectangle {
                id: bottomHandle
                anchors.fill: parent
                color: "blue"
                opacity: 0
            }
        }

        MouseArea {
            id: resizeRighthandle
            x: parent.width-minHandleSize//3*(parent.width/4)
            width: minHandleSize//parent.width - 3*(parent.width/4)
            height: parent.height
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseX
                resize = true
            }

            onReleased: { resize = false }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseX;

                    container.width = container.width-diff;
                    courserPos = mouseX;
                }
            }

            onEntered: { rightHandle.opacity = 0.5 }
            onExited: { rightHandle.opacity = 0 }

            Rectangle {
                id: rightHandle
                anchors.fill: parent
                color: "green"
                opacity: 0
            }
        }

        MouseArea {
            id: resizeLefthandle
            width: minHandleSize//parent.width - 3*(parent.width/4)
            height: parent.height
            hoverEnabled: true

            property int courserPos: 0
            property bool resize: false

            onPressed: {
                courserPos = mouseX
                resize = true
            }

            onReleased: { resize = false }

            onPositionChanged: {
                if(resize) {
                    var diff = courserPos - mouseX;

                    container.width = container.width+diff;
                    container.x = container.x - diff;
                    courserPos = mouseX;
                }
            }

            onEntered: { leftHandle.opacity = 0.5 }
            onExited: { leftHandle.opacity = 0 }

            Rectangle {
                id: leftHandle
                anchors.fill: parent
                color: "black"
                opacity:0
            }
        }
    }





    states: [
        State {
            name: "hoverOn"

            PropertyChanges {
                target: sizeMoveHandle
                opacity: 1
            }
        },

        State {
            name: "hoverOff"

            PropertyChanges {
                target: sizeMoveHandle
                opacity: 0
            }
        }
    ]
}

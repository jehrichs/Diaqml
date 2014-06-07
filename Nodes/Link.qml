import QtQuick 2.0

Item {
     id: root

     property real tailX
     property real tailY
     property real headX
     property real headY

     property item start
     property item end

     //Component.onCompleted: console.log("Link onCompleted", "tailX", tailX, "tailY", tailY, "headX", headX, "headY", headY)
     //onTailXChanged: console.log("Link", "tailX", tailX)
     //onHeadXChanged: console.log("Link", "headX", headX)
 }

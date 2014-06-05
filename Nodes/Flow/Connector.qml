import QtQuick 2.0

import "../"

NodeFrame {
    id: node

    property real minimumWidth: 50
    property real minimumHeight: 50

   Text {
       width: node.width > node.height ? node.height-canvas.gap : node.width-canvas.gap
       height: node.width > node.height ? node.height-canvas.gap : node.width-canvas.gap
       x: node.width/2 - canvas.radius-canvas.gap
       y: node.height/2 - canvas.radius-canvas.gap
       verticalAlignment: Text.AlignVCenter
       horizontalAlignment: Text.AlignHCenter

       text: node.ntext
       elide: Text.ElideMiddle
       wrapMode: Text.Wrap
       font.family: node.nfamily
       font.pointSize: node.npointSize
       color: node.ntextColor
   }

    onHeightChanged: {
        canvas.requestPaint();
    }
    onWidthChanged: {
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: node
        antialiasing: true
        renderStrategy: Canvas.Threaded;

        property int gap: node.gap
        property int radius: node.width > node.height ? (node.height/2)-gap : (node.width/2)-gap
        property int rectx: node.width/2
        property int recty: node.height/2

        onPaint: {
            var ctx = getContext("2d");
            ctx.reset();
            ctx.save();
            ctx.clearRect(0,0,width, height);

            ctx.strokeStyle = node.nborderColor;
            ctx.lineWidth = node.nborderWidth;
            ctx.fillStyle = node.nbgColor;
            ctx.globalAlpha = node.nalpha;

            ctx.beginPath();
            ctx.arc(rectx,recty,radius,0,360,true);
            ctx.closePath();

            if (node.nfill) {
                ctx.fill();
            }
            if (node.nborder) {
                ctx.stroke();
            }

            ctx.restore();
        }
    }
}

import QtQuick 2.0

Rectangle {
    id: container
    width: 100
    height: 100
    color: "transparent"

    SizeMoveHandle {}

    onHeightChanged: {
        canvas.requestPaint();
    }
    onWidthChanged: {
        canvas.requestPaint()
    }

    Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true
        renderStrategy: Canvas.Threaded;

        property int radius: 20
        property int rectx: 4
        property int recty: 4
        property int rectWidth: width - 2*rectx
        property int rectHeight: height - 2*recty
        property color strokeStyle:  Qt.darker(fillStyle, 1.4)
        property color fillStyle: "#ae32a0" // purple
        property int lineWidth: 2
        property bool fill: true
        property bool stroke: true
        property real alpha: 1

        onPaint: {
            console.log(canvasWindow);
            var ctx = getContext("2d");
            ctx.reset();
            ctx.save();
            ctx.clearRect(0,0,canvas.width, canvas.height);
            ctx.strokeStyle = canvas.strokeStyle;
            ctx.lineWidth = canvas.lineWidth
            ctx.fillStyle = canvas.fillStyle
            ctx.globalAlpha = canvas.alpha
            ctx.beginPath();
            ctx.moveTo(rectx+radius,recty);                 // top side
            ctx.lineTo(rectx+rectWidth-radius,recty);
            // draw top right corner
            ctx.arcTo(rectx+rectWidth,recty,rectx+rectWidth,recty+radius,radius);
            ctx.lineTo(rectx+rectWidth,recty+rectHeight-radius);    // right side
            // draw bottom right corner
            ctx.arcTo(rectx+rectWidth,recty+rectHeight,rectx+rectWidth-radius,recty+rectHeight,radius);
            ctx.lineTo(rectx+radius,recty+rectHeight);              // bottom side
            // draw bottom left corner
            ctx.arcTo(rectx,recty+rectHeight,rectx,recty+rectHeight-radius,radius);
            ctx.lineTo(rectx,recty+radius);                 // left side
            // draw top left corner
            ctx.arcTo(rectx,recty,rectx+radius,recty,radius);
            ctx.closePath();
            if (canvas.fill)
                ctx.fill();
            if (canvas.stroke)
                ctx.stroke();
            ctx.restore();
        }
    }

}

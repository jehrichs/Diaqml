.pragma library

var lastSelectedNode = null;
var curLink = null;

var lastSelectedBgColor = "white"
var lastSelectedBorderColor = "black"
var lastSelectedTextColor = "black"
var lastSelectedTextSize = 10

var flipable = null;
var setItemWidth = null;
var setItemHeight = null;
var setItemX = null;
var setItemY = null;
var setItemZ = null;
var setItemFillBackground = null;
var setItemBgColor = null;
var setItemLineWidth = null;
var setItemOpacity = null;
var setItemFontSize = null;
var setItemDrawBorder = null;
var setItemBorderColor = null;
var setItemTextColor = null
var setItemText = null;

function setFlipable(item) {
    flipable = item;
}

function select(node) {
    if(node == lastSelectedNode) {
        return;
    }
    
    if(lastSelectedNode) {
        lastSelectedNode.selected=false;
        lastSelectedNode.state = "hoverOff"
        lastSelectedNode = null;
    }

    lastSelectedNode = node

    if(node) {
        node.selected = true;

        if(setItemWidth) {
            updatePropertiesMenu();
        }
    }


    if(lastSelectedNode) {
        flipable.flipped = true
    }
    else {
        flipable.flipped = false
    }
}


function updatePropertiesMenu() {
    if(lastSelectedNode && setItemWidth) {
        setItemWidth.value = lastSelectedNode.parent.width;
        setItemHeight.value = lastSelectedNode.parent.height;
        setItemX.value = lastSelectedNode.parent.x;
        setItemY.value = lastSelectedNode.parent.y;
        setItemZ.value = lastSelectedNode.parent.z;
        setItemFillBackground.checked = lastSelectedNode.parent.nfill;
        setItemBgColor.color = lastSelectedNode.parent.nbgColor;
        setItemDrawBorder.checked = lastSelectedNode.parent.nborder;
        setItemBorderColor.color = lastSelectedNode.parent.nborderColor;
        setItemLineWidth.value = lastSelectedNode.parent.nborderWidth;
        setItemOpacity.value = lastSelectedNode.parent.opacity;
        setItemFontSize.value = lastSelectedNode.parent.npointSize;
        setItemTextColor.color = lastSelectedNode.parent.ntextColor;
        setItemText.text = lastSelectedNode.parent.ntext;
    }
}

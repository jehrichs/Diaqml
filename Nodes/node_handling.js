.pragma library

var lastSelectedNode = null;
var curLink = null;
var flipable = null;

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

    if(node) {
        node.selected = true;
    }

    lastSelectedNode = node

    if(lastSelectedNode) {
        flipable.flipped = true
    }
    else {
        flipable.flipped = false
    }
}


.pragma library

var lastSelectedNode = null;
var curLink = null;

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
}


.pragma library

var lastNode = null;

function select(node) {
    if(node == lastNode) {
        return;
    }
    
    if(lastNode) {
        lastNode.selected=false;
        lastNode.state = "hoverOff"
        lastNode = null;
    }

    if(node) {
        node.selected = true;
    }

    lastNode = node
}

/*
 Diaqml - [Proof of Concept] Diagram editor
 Copyright (C) 2014  Joerg Ehrichs

 This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.

 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

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

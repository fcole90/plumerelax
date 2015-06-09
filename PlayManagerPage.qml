import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem

Page {

    UbuntuListView {
        id: selectedItemsListView
        anchors { left: parent.left; right: parent.right; }
        height: parent.height
        //Avoid overlapping other elements and the listview
        clip: true
        model: selectedItemsModel

        delegate: ListItem.Standard {
            id: selectedItemsListItem
            //this takes the name property of the model
            text: selectionName
            control: CheckBox {
                anchors.verticalCenter: parent.verticalCenter
            }
            //If no icon path is defined a default pic is loaded
            iconSource: {selectionIconPath ? Qt.resolvedUrl("pics/" + selectionIconPath) : Qt.resolvedUrl("pics/avatar_contacts_list.png")}

            onClicked: {
                //Play a preview
                print("Playing a preview");
            }

        }
    }
}

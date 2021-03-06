import QtQuick 2.0
import QtMultimedia 5.0
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem

Page {
    Column {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
        }

        Label {
            id: soundSelectorLabel
            objectName: "soundSelectorLabel"
            width: parent.width
            z: 1

            //Make the text wrap at word boundaries
            wrapMode: Text.WordWrap
            text: i18n.tr("Select your sounds an then move to play your relax.")
        }

        SoundSelectorListModel{
            id: soundSelectorlistModel
        }


        UbuntuListView {
            id: soundSelectorListView
            anchors { left: parent.left; right: parent.right; }
            height: parent.height - soundSelectorLabel.height
            //Avoid overlapping other elements and the listview
            clip: true
            model: soundSelectorlistModel

            delegate: ListItem.Standard {
                id: soundSelectorListItem
                //this takes the name property of the model
                text: soundName
                control: CheckBox {
                    anchors.verticalCenter: parent.verticalCenter
                    onCheckedChanged: {
                        if (checked)
                        {
                            selectedItemsModel.append({"selectionName": soundName,"selectionIconPath": iconPath });
                            var myIndex = selectedItemsModel.count;
                            print(myIndex);
                            //temp
                            sound.play();
                        }
                        else //Check if the index is correct and remove the sound
                        {
                            sound.stop();
                            var soundObj = selectedItemsModel.get(myIndex)
                            if (soundObj.selectionName === soundName)
                            {
                                selectedItemsModel.remove(myIndex)
                            }
                            else
                            {
                                for(var i = 1; i<=selectedItemsModel.count; i++)
                                {
                                    if(selectedItemsModel.get(i).selectionName === soundName)
                                    {
                                        selectedItemsModel.remove(i);
                                        break;
                                    }
                                }
                            }
                        }
                    }
                }
                //If no icon path is defined a default pic is loaded
                iconSource: {iconPath ? Qt.resolvedUrl("pics/" + iconPath) : Qt.resolvedUrl("pics/avatar_contacts_list.png")}

                SoundEffect {
                        id: sound
                        source: "media/seagulls/sound.wav"

                }
                onClicked: {
                    //Play a preview
                    print("Playing a preview");
                    sound.play();
                }

            }
        }

    }
}

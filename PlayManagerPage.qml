import QtQuick 2.0
import Ubuntu.Components 1.1

Page {
    Column {
        spacing: units.gu(1)
        anchors {
            margins: units.gu(2)
            fill: parent
        }

        Label {
            id: label
            objectName: "label"
            wrapMode: Text.WordWrap
            text: i18n.tr("Hello..")
        }

        Button {
            objectName: "button"
            width: parent.width

            text: i18n.tr("Tap me!")

            onClicked: {
                label.text = i18n.tr("..world!")
            }
        }
    }
}

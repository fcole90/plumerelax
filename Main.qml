import QtQuick 2.0
import Ubuntu.Components 1.1

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "plumerelax.fcole90"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(40)
    height: units.gu(75)

    Tabs {


        Tab {
            title: i18n.tr("Choose your sound")
            page: SoundSelectorPage{
                id: soundSelectorPage
            }
        }

        Tab {
            title: i18n.tr("Play your relax")
            page: PlayManagerPage {
                id: playManagerPage
            }
        }

    }



}

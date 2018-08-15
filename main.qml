import QtQuick 2.11
import QtQuick.Controls 2.4
import edu.cbnu.avl.gcanmanager 0.1

ApplicationWindow {
    id: root
    visible: true
    width: 1280
    height: 720
    title: qsTr("CBNU AVL Ioniq")

    GCanManager {
        id: gcan
    }

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        GCanConfPage {

        }

        Page2Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("GCAN Conf")
        }
        TabButton {
            text: qsTr("Page 2")
        }
    }
}

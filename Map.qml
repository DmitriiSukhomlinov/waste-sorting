import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebView 1.1

Page {
    property StackView view

    height: view.height
    width: view.width

    title: qsTr("Home")

    WebView {
        anchors.fill: parent
        url: placemarkUrl
    }
}

import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebView 1.1

Page {
    width: 600
    height: 400

    title: qsTr("Home")

    WebView {
        anchors.fill: parent
        url: placemarkUrl
        //url: "file:///html/placemark.html"

    }
}

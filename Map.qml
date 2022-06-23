import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebView 1.1

Page {
    property StackView view
    property alias pageUrl: webView.url

    height: view.height
    width: view.width

    title: "Карта"

    WebView {
        id: webView
        anchors.fill: parent
    }
}

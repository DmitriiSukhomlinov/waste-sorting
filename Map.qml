import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebView 1.1

Page {
    property StackView view
    property alias web: webView
    property alias pageUrl: webView.url

    height: view.height
    width: view.width

    title: "Карта"

    WebView {
        id: webView
        objectName: "webView"
        anchors.fill: parent

        Component.onCompleted: {

            var resource = 'qrc:/html/placemark.html';
            webView.loadHtml(htmlUrl);

            /*var xhr = new XMLHttpRequest;
            xhr.open('GET', resource);
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    var response = xhr.responseText;
                    webView.loadHtml(response);
                }
            };
            xhr.send();*/
        }
    }
}

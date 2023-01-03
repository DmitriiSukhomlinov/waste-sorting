import QtQuick 2.12
import QtQuick.Controls 2.5
import QtWebView 1.1

Page {
    property StackView view
    property alias pageUrl: webView.url
    property string originalUrl: ""

    height: view.height
    width: view.width

    title: "Карта"

    WebView {
        id: webView
        anchors.fill: parent

        onLoadingChanged: {
            /*console.log("onLoadingChanged: status=" + loadRequest.status);
            if (loadRequest.status == WebView.LoadStartedStatus)
                console.log("Loading started...");
            if (loadRequest.status == WebView.LoadFailedStatus) {
               console.log("Load failed! Error code: " + loadRequest.errorCode);
               if (loadRequest.errorCode === NetworkReply.OperationCanceledError)
                   console.log("Load cancelled by user");
            }
            if (loadRequest.status == WebView.LoadSucceededStatus)
                console.log("Page loaded!");*/

            if (!originalUrl) {
                console.log("ORIGINAL: " + pageUrl)
                originalUrl = pageUrl
            }


            console.log("URL: " + loadRequest.errorString)
            if (loadRequest.status == WebView.LoadFailedStatus) {
                console.log("ERROR: " + loadRequest.errorString)
                //console.log("CURRENT URL: " + pageUrl)
                var newUrl = pageUrl.toString().replace('intent', 'http')
                console.log("NEW URL: " + newUrl)
                url = originalUrl
                Qt.openUrlExternally(newUrl)
                //webView.loadHtml(originalUrl)
            }


            return;
            console.log(loadRequest.errorString)
            console.log(loadRequest.status)
            if (loadRequest.status != WebView.LoadStartedStatus) {
                return;
            }
            console.log(loadRequest.url)
            var strUrl = loadRequest.url.toLocaleString()
            var index = strUrl.indexOf("https://dmitriisukhomlinov.github.io")
            console.log(index)
            if (index == 0) {
                return;
            }

            //Qt.openUrlExternally(loadRequest.url)

            console.log(loadRequest.errorString)
            console.log(loadRequest.status)
        }

    }
}

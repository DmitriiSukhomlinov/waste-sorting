import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    id: page
    property StackView view
    property Map mapView

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "Текстиль"

    ColumnLayout {
        spacing: 0

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton {
            Layout.topMargin: 10
            width: page.width
            header: "На благотворительность"
            text: "<ul>
                   <li>Постельное бельё</li>
                   <li>Полотна</li>
                   <li>Шторы</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "ecoPrepareText": "Постирать, сложить в отдельный пакет.",
                           "ecoPrepareTextHeight": "70",
                           "placePrepareText": "Постирать, сложить в отдельный пакет.",
                           "placePrepareTextHeight": "70" })
            }
        }

        Custom.WSCategoryTextButton {
            width: page.width
            header: "На переработку"
            text: "<ul>
                   <li>Постельное бельё</li>
                   <li>Полотна</li>
                   <li>Шторы</li>
                   <li>Тканевые обрезки</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                              "ecoPrepareText": "Постирать, сложить в отдельный пакет.",
                              "ecoPrepareTextHeight": "70",
                              "placePrepareText": "Постирать, сложить в отдельный пакет.",
                              "placePrepareTextHeight": "70" })
            }
        }

        Custom.WSTextHeader {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            labelText: "Не принимается"
        }

        Label {
            Layout.leftMargin: leftMargin
            text: "<ul>
                   <li>Вещи из натурального и искусственного меха  и кожи на переработку (только на благотворительность)</li>
                   </ul>"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.preferredWidth: page.width - leftMargin
        }
    }
}

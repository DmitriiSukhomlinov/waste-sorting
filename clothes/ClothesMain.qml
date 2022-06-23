import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    id: page
    property StackView view

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "Одежда"

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
            header: "Одежда на благотворительность"
            text: "<ul>
                   <li>Одежда, обувь в хорошем состоянии</li>
                   <li>Нижнее бельё, купальники, носки,<br>колготки - только новые, в упаковке</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "pageTitle": header,
                           "ecoPrepareText": "Постирать, сложить в отдельный пакет.",
                           "ecoPrepareTextHeight": "70",
                           "placePrepareText": "Постирать, сложить в отдельный пакет.",
                           "placePrepareTextHeight": "70" })
            }
        }

        Custom.WSCategoryTextButton {
            width: page.width
            header: "Аксессуары на\nблаготворительность"
            text: "<ul>
                   <li>Сумки, рюкзаки</li>
                   <li>Аксессуары (платки, ремни),<br>украшения (только целые)</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "pageTitle": header,
                           "placePrepareText": "Постирать, сложить в отдельный пакет.",
                           "placePrepareTextHeight": "70" })
            }
        }

        Custom.WSCategoryTextButton {
            width: page.width
            header: "На переработку"
            text: "<ul>
                   <li>Одежда из хлопка, синтетики,<br>трикотажа, вязаные вещи</li>
                   <li>Верхняя одежда<br>(в том числе на синтепоне)</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
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
                   <li>Нижнее бельё, купальники, носки, колготки (кроме новых в упаковке)</li>
                   <li>Вещи из натурального и искусственного меха  и кожи на переработку (только на благотворительность)</li>
                   </ul>"
            font.pixelSize: 14
            wrapMode: Text.WordWrap
            Layout.preferredWidth: page.width - leftMargin
        }
    }
}

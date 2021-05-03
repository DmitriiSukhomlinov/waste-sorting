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

    title: "Опасные отходы"

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
            header: "Источники питания"
            text: "<ul>
                   <li>Батарейки</li>
                   <li>Аккумуляторы</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "ecoPrepareText": "Сложить отдельно.",
                           "ecoPrepareTextHeight": "70",
                           "squirrelPrepareText": "Сложить отдельно.",
                           "squirrelPrepareTextHeight": "70",
                           "placePrepareText": "Сложить отдельно.",
                           "placePrepareTextHeight": "70",
                           "adressPrepareText": "Предварительно позвонить в пункт приёма и уточнить актуальность информации.",
                           "adressPrepareTextHeight": "90"})
            }
        }

        Custom.WSCategoryTextButton {
            width: page.width
            header: "Ртутьсодержащие отходы "
            text: "<ul>
                   <li>Лампы ртутные</li>
                   <li>Лампы энергосберегаюшие</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "adressPrepareText": "Предварительно позвонить в пункт приёма и уточнить актуальность информации.",
                           "adressPrepareTextHeight": "90" })
            }
        }

        Custom.WSCategoryTextButton {
            width: page.width
            header: "Ртутьсодержащие отходы "
            text: "<ul>
                   <li>Градусники</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "servicePrepareText": "Упаковать во избежание повреждений.",
                           "servicePrepareTextHeight": "70" })
            }
        }
    }
}

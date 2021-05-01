import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    property StackView view
    property Map mapView

    property int leftMargin: 40

    height: view.height
    width: view.width

    title: "Стекло"

    ColumnLayout {

        Custom.WSTextHeader {
            Layout.topMargin: 30
            Layout.leftMargin: leftMargin
            labelText: "Что можно переработать?"
        }

        Custom.WSTextButton {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            width: 300
            header: "Разное"
            text: "<ul>
                   <li>Бумага</li>
                   <li>Картон</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "mapView": mapView,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, сжать, кидать без пакетов.Предметы мельче алюминиевой банки сдавать другим способом.",
                           "mapPrepareTextHeight": "100",
                           "ecoPrepareText": "Разделить на картон (гофро и обычный) и прочую бумагу, связать в кипы/наполнить бумажный или пластиковый пакет.",
                           "ecoPrepareTextHeight": "100",
                           "squirrelPrepareText": "Сложить в пачки, коробки или пакеты. Перевязать крест-накрест, чтобы не рассыпались.",
                           "squirrelPrepareTextHeight": "80",
                           "jsScript": "updatePoints(\"paper_cardboard\")" })
            }
        }
    }
}

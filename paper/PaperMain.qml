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

    title: "Бумага"

    ColumnLayout {
        spacing: 0

        Custom.WSTextHeader {
            Layout.topMargin: 10
            Layout.leftMargin: leftMargin
            labelText: "Принимается"
        }

        Custom.WSCategoryTextButton {
            Layout.topMargin: 10
            Layout.preferredHeight: height
            width: page.width
            header: "Макулатура"
            text: "<ul>
                   <li>Бумага</li>
                   <li>Картон</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "pageTitle": header,
                           "mapPrepareText": "Опустошить, сжать, кидать без пакетов.Предметы мельче алюминиевой банки сдавать другим способом.",
                           "mapPrepareTextHeight": "100",
                           "ecoPrepareText": "Разделить на картон (гофро и обычный) и прочую бумагу, связать в кипы/наполнить бумажный или пластиковый пакет.",
                           "ecoPrepareTextHeight": "100",
                           "squirrelPrepareText": "Сложить в пачки, коробки или пакеты. Перевязать крест-накрест, чтобы не рассыпались.",
                           "squirrelPrepareTextHeight": "80",
                           "pointsType": "paper_cardboard" })
            }
        }

        Custom.WSCategoryTextButton {
            Layout.preferredHeight: height
            width: page.width
            header: "Пульперкартон и втулки"
            text: "<ul>
                   <li>Упаковки от яиц</li>
                   <li>Втулки от ткани, бумаги, бумажных полотенец</li>
                   </ul>"
            onClicked: function() {
                view.push("../prepare_page/how_2_prep.qml",
                          {"view": view,
                           "pageTitle": header,
                           "ecoPrepareText": "Упаковки от яиц сложить друг в друга, не рвать, не мять. Втулки можно сминать.\nСложить в отдельный пакет пакет.",
                           "ecoPrepareTextHeight": "100" })
            }
        }

        Custom.WSTextHeader {
            Layout.topMargin: 20
            Layout.leftMargin: leftMargin
            labelText: "Не принимается"
        }

        Custom.WSNoClickTextButton {
            Layout.leftMargin: leftMargin
            Layout.preferredWidth: page.width - leftMargin
            labelText: "<ul>
                        <li>Ламинированная бумага (проверяется на надрыв)</li>
                        <li>Чеки, калька, копирка, обои</li>
                        <li>Подложки от яиц, тетрапаки</li>
                        <li>\"Бумажные\" стаканчики</li>
                        <li>Смывающиеся втулки от туалетной бумаги</li>
                        <li>Отходы с маркировкой C/PAP</li>
                        </ul>"
        }
    }
}

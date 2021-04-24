import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import "../custom" as Custom
import "../"

Page {
    property StackView view
    property Map mapView

    property int leftMargin: 40
    property string pageTitle: ""
    property string howPrepare: ""
    property string jsScript: ""

    property alias mapPrepareText: prepare.text
    property int mapPrepareTextHeight: 0
    property alias ecoPrepareText: ecoPrepare.text
    property int ecoPrepareTextHeight: 0
    property alias placePrepareText: placePrepare.text
    property int placePrepareTextHeight: 0
    property alias squirrelPrepareText: squirrelPrepare.text
    property int squirrelPrepareTextHeight: 0

    title: pageTitle

    Flickable{
        height: view.height
        width: view.width
        contentHeight: columnLayout.height
        ScrollBar.vertical: ScrollBar { }

        ColumnLayout {
            id: columnLayout
            width: parent.width

            Custom.WSTextHeader {
                Layout.topMargin: 30
                Layout.leftMargin: leftMargin
                labelText: "Как сдать?"
            }

            Custom.WSTextButton {
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                header: "Найти контейнер"
                text: "Вторсырье лучше отнести в ближайший подходящий контейнер. Это снизит нагрузку на волонтеров организаций."
                visible: mapPrepareTextHeight != 0
                onClicked: function() {
                    view.push(mapView)
                    mapView.web.runJavaScript(jsScript)
                }
            }

            Custom.WSPrepareAndDescription {
                id: prepare
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                Layout.preferredHeight: mapPrepareTextHeight
                visible: mapPrepareTextHeight != 0
            }

            ToolSeparator {
                orientation: Qt.Horizontal
                Layout.preferredWidth: view.width
                visible: mapPrepareTextHeight != 0
            }

            Custom.WSTextButton {
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                header: "Заказать экотакси"
                text: "Вторсырье могут забрать у вашего дома в один из дней выезда, устанавливаемых организвацией. Стоимость услуги зависит от региона. Узнать стоимость и оставить заявку можно в группе организации.."
                visible: ecoPrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("https://vk.com/ecotaxi_nsk")
                }
            }

            Custom.WSPrepareAndDescription {
                id: ecoPrepare
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                Layout.preferredHeight: ecoPrepareTextHeight
                visible: ecoPrepareTextHeight != 0
            }

            ToolSeparator {
                orientation: Qt.Horizontal
                Layout.preferredWidth: view.width
                visible: ecoPrepareTextHeight != 0
            }

            Custom.WSTextButton {
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                header: "Отнести в пункт приема"
                text: "Экоцентр ProZero (Восход 1)\nГрафик работы: сб, вс с 12:00 до 20:00"
                visible: placePrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("https://vk.com/prozero_eco")
                }
            }

            Custom.WSPrepareAndDescription {
                id: placePrepare
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                Layout.preferredHeight: placePrepareTextHeight
                visible: placePrepareTextHeight != 0
            }


            ToolSeparator {
                orientation: Qt.Horizontal
                Layout.preferredWidth: view.width
                visible: placePrepareTextHeight != 0
            }

            Custom.WSTextButton {
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                header: "Сдать на акции \"Зеленая белка\""
                text: "Предварительно разобранное вторсырье можно сдать на одной из точек сбора в день проведения акции. Расписание и расположение точек указано в группе акции."
                visible: squirrelPrepareTextHeight != 0
                onClicked: function() {
                    Qt.openUrlExternally("https://vk.com/eco_week")
                }
            }

            Custom.WSPrepareAndDescription {
                id: squirrelPrepare
                Layout.topMargin: 10
                Layout.leftMargin: leftMargin
                Layout.preferredHeight: squirrelPrepareTextHeight
                visible: squirrelPrepareTextHeight != 0
            }
        }
    }
}

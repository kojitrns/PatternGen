import QtQuick 2.4
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Item {
    id: element
    width: 400
    height: 400
    property alias img_dsp_check: img_dsp_check
    property alias img_open_btn: ima_open_btn
    property alias char_row: char_row
    property alias rand_btn: rand_btn
    property alias char_btns: char_btns
    property alias color_rect_2: color_rect_2
    property alias color_rect_1: color_rect_1
    property alias co1_mouse_arear2: co1_mouse_arear2
    property alias co1_mouse_arear1: co1_mouse_arear1
    property alias div_slider: div_slider

    Rectangle {
        id: rectangle
        color: "#858383"
        anchors.fill: parent

        Text {
            id: col_ctrl_txt
            x: 100
            y: 31
            width: 200
            height: 25
            text: qsTr("Select color")
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.NoWrap
            lineHeight: 1.7
            anchors.horizontalCenter: parent.horizontalCenter
            fontSizeMode: Text.VerticalFit
            anchors.top: parent.top
            anchors.topMargin: 31
            font.pixelSize: 100
        }

        Text {
            id: div_slider_txt
            x: 100
            width: 200
            height: 25
            text: qsTr("Division number")
            horizontalAlignment: Text.AlignHCenter
            fontSizeMode: Text.VerticalFit
            anchors.horizontalCenter: parent.horizontalCenter
            opacity: 1
            anchors.top: col_select_rect.bottom
            anchors.topMargin: 6
            font.pixelSize: 100
        }

        Slider {
            id: div_slider
            x: 100
            y: 141
            focusPolicy: Qt.TabFocus
            live: true
            to: 25
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: div_slider_txt.bottom
            anchors.topMargin: 0
            value: 0
        }

        Button {
            id: rand_btn
            y: 74
            width: 67
            height: 32
            text: qsTr("Rand")
            spacing: 9
            font.pointSize: 8
            anchors.verticalCenter: col_select_rect.verticalCenter
            anchors.left: col_select_rect.right
            anchors.leftMargin: 10
            display: AbstractButton.TextOnly
        }

        Rectangle {
            id: col_select_rect
            width: 89
            height: 48
            color: "#00ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: col_ctrl_txt.bottom
            anchors.topMargin: 10

            Rectangle {
                id: color_rect_2
                x: 205
                width: 40
                height: 40
                color: "#ffffff"
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.right: parent.right
                anchors.rightMargin: 0

                MouseArea {
                    id: co1_mouse_arear2
                    anchors.fill: parent
                }
            }

            Rectangle {
                id: color_rect_1
                width: 37
                height: 40
                color: "#ffffff"
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.left: parent.left
                anchors.leftMargin: 0

                MouseArea {
                    id: co1_mouse_arear1
                    anchors.fill: parent
                }
            }
        }

        GroupBox {
            id: char_group
            width: 250
            height: 74
            bottomPadding: 0
            rightPadding: 5
            leftPadding: 5
            topPadding: 0
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: char_gr_title.bottom
            anchors.topMargin: 10

            ButtonGroup {
                id: char_btns
                buttons: char_row.children
            }

            RowLayout {
                id: char_row
                spacing: 5
                anchors.fill: parent

                RadioButton {
                    id: char_none
                    text: qsTr("none")
                    font.pointSize: 9
                    checked: true
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    leftPadding: 0
                }

                RadioButton {
                    id: char_kanji
                    text: qsTr("kanji")
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    leftPadding: 0
                }

                RadioButton {
                    id: char_any
                    text: qsTr("any")
                    rightPadding: 0
                    bottomPadding: 0
                    topPadding: 0
                    leftPadding: 0
                }
            }
        }

        Text {
            id: char_gr_title
            x: 2
            width: 200
            height: 25
            text: qsTr("Character")
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: div_slider.bottom
            anchors.topMargin: 10
            fontSizeMode: Text.VerticalFit
            font.pixelSize: 100
        }

        GroupBox {
            id: img_ctrl_grp
            x: -8
            y: 4
            width: 250
            height: 74
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 10
            anchors.top: img__gr_title.bottom
            leftPadding: 5
            bottomPadding: 0

            Row {
                id: row
                width: 200
                height: 52
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 10

                Button {
                    id: ima_open_btn
                    text: qsTr("Open")
                    anchors.verticalCenter: parent.verticalCenter
                }

                CheckBox {
                    id: img_dsp_check
                    text: qsTr("ImageOn")
                    anchors.verticalCenter: parent.verticalCenter
                    font.pointSize: 7
                }
            }

            ButtonGroup {
                id: char_btns1
                buttons: char_row.children
            }

            topPadding: 0
            rightPadding: 5
        }

        Text {
            id: img__gr_title
            x: 6
            y: -3
            width: 200
            height: 25
            text: qsTr("Image")
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.topMargin: 10
            anchors.top: char_group.bottom
            font.pixelSize: 100
            fontSizeMode: Text.VerticalFit
        }
    }
}




/*##^## Designer {
    D{i:3;anchors_y:116}D{i:5;anchors_x:260}D{i:7;anchors_y:66}D{i:9;anchors_x:155;anchors_y:66}
D{i:12;anchors_height:100;anchors_width:100}D{i:19;anchors_height:52;anchors_width:200}
D{i:1;anchors_height:200;anchors_width:200}
}
 ##^##*/

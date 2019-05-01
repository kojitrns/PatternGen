import QtQuick 2.8
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.3

Window {
    visible: true
    width: 1000
    height: 800
    title: qsTr("PatternGen")
    property int divnum: 5
    property bool which_col: true
    property bool dsp_img: ctrl.img_dsp_check.checked
    property color color_1: "white"
    property color color_2: "black"
    property int char_mode: 0
    property string img_url: ""

    Image {
        id: img
        source: "nyoki.jpg"
    }

    ColorDialog {
        id: color_ctrl
        visible: false
        onCurrentColorChanged: {
            if(which_col) color_1 = currentColor
            else color_2 = currentColor
            my_canvas.requestPaint()
        }
    }

    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
        onAccepted: {
            console.log("You chose: " + fileDialog.fileUrls)
            img.source = fileDialog.fileUrl
            ctrl.img_dsp_check.checked = true
            my_canvas.requestPaint()
        }
        onRejected: {
            console.log("Canceled")
        }
    }

    SplitView {
        anchors.fill: parent
        orientation: Qt.Horizontal
        focus: true

        Controller {
            id: ctrl
            width: 270
            Layout.minimumWidth: 260
            color_rect_1.color: color_1

            co1_mouse_arear1.onClicked: {
                which_col = true;
                color_ctrl.color = color_1
                color_ctrl.visible = true
            }
            color_rect_2.color: color_2
            co1_mouse_arear2.onClicked: {
                which_col = false;
                color_ctrl.color = color_2
                color_ctrl.visible = true
            }

            rand_btn.onClicked: {
                color_1 = Qt.rgba(Math.random(250), Math.random(250), Math.random(250), 1.0)
                color_2 = Qt.rgba(Math.random(250), Math.random(250), Math.random(250), 1.0)
                my_canvas.requestPaint()
            }

            div_slider.onValueChanged: {
                divnum = Math.floor(div_slider.value)
                my_canvas.requestPaint()
            }

            char_btns.onClicked: {
                char_mode = 0
                switch(button.text){
                    case "kanji":
                        char_mode = 1
                        break
                    case "any":
                        char_mode = 2
                        break
                }
                my_canvas.requestPaint()
            }
            img_open_btn.onClicked: {
                fileDialog.open()
            }
            img_dsp_check.onCheckStateChanged: {
                my_canvas.requestPaint()
            }
        }

        Canvas {
            id: my_canvas
            Layout.fillWidth: true

            onPaint: {
                var ctx = getContext("2d")
                var x, y, wx = width/divnum,wy=height/divnum

                for(var i = 0,col_v; i < divnum*divnum; i++) {
                    col_v = i%2
                    if(divnum%2==0) col_v += Math.floor(i/divnum)
                    ctx.fillStyle = col_v%2==0 ? color_1 : color_2
                    x = wx * (i%divnum)
                    y = wy * Math.floor(i/divnum)
                    ctx.fillRect(x, y, wx, wy)

                    if(dsp_img){
                        ctx.drawImage(img,0,0,img.width,img.height,x,y,wx+1,1+wy)
                    }

                    if(char_mode!=0) {
                        ctx.font = Math.min(wx,wy) + "px sans-serif"
                        ctx.textBaseline = "top"
                        ctx.fillStyle = "black"
                        var s
                        if(char_mode===1) s = String.fromCharCode(0x4E01+Math.random()*(0x9fff-0x4e01))
                        else s = String.fromCharCode(Math.random()*0xFFFF)
                        ctx.fillText(s, x, y)
                    }
                }
            }
            onImageLoaded: {
                console.log("image loaded",img_url)
            }
        }
        Keys.onPressed: {
             if (event.key === Qt.Key_Escape) {
                 Qt.quit()
             }
        }
    }
}

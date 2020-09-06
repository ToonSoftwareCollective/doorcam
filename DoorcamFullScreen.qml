import QtQuick 2.1
import qb.components 1.0

Screen {
	id: doorcamFullScreen
	screenTitle: "Doorcam";

	onCustomButtonClicked: {
		if (app.doorcamConfigScreen) {
			 app.doorcamConfigScreen.show();
		}
	}

	onShown: {
		console.log("webcam: WebcamFullScreen.onShown() called")
		addCustomTopRightButton("Configuratie")
		screenStateController.screenColorDimmedIsReachable = false
		app.doorcamTimer1Interval = 1000
		app.pictureCountdownCounter = app.pictureCountdownCounterStart
		app.doorcamTimer1Running = true

		//zet de Domoticz parameter naar 150
		var doc = new XMLHttpRequest();
        	doc.onreadystatechange = function() {
            		if (doc.readyState == XMLHttpRequest.DONE) {
            		}
        	}
        	var domURL2 = app.domoticzURL1
		domURL2 += "/json.htm?type=command&param=updateuservariable&vname="
		domURL2 += app.domoticzVAR
		domURL2 += "&vtype=2&vvalue=150"

		doc.open("get", domURL2);
        	doc.setRequestHeader("Content-Encoding", "UTF-8");
        	doc.send();
	}

	onHidden: {
		console.log("webcam: WebcamFullScreen.onHidden() called")
		app.doorcamTimer1Interval = 10000
		app.pictureCountdownCounter = -1
		screenStateController.screenColorDimmedIsReachable = true

		//zet de Domoticz parameter naar 150
		var doc = new XMLHttpRequest();
        	doc.onreadystatechange = function() {
            		if (doc.readyState == XMLHttpRequest.DONE) {
            			}
        	}
		var domURL2 = app.domoticzURL1
		domURL2 += "/json.htm?type=command&param=updateuservariable&vname="
		domURL2 += app.domoticzVAR
		domURL2 += "&vtype=2&vvalue=150"

		doc.open("get", domURL2);

        	doc.setRequestHeader("Content-Encoding", "UTF-8");
        	doc.send();
		app.doorcamImage1Source = "qrc:/tsc/connect.jpg";
		app.doorcamImage2Source = "qrc:/tsc/connect.jpg";
		this.close();
	}


	Image {
		id: doorcamImage1
		width: app.enableForceMode? parent.width - 110 : parent.width
		height: parent.height - 30
		fillMode: app.enableForceMode? Image.Stretch : Image.PreserveAspectFit
		source: app.doorcamImage1Source
		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top
		}
		cache: false
		z: app.doorcamImage1Z
		onStatusChanged: {
			app.doorcamImage1Ready = (doorcamImage1.status == Image.Ready)
		}
		MouseArea {
			anchors.fill: parent
		 	onClicked: {
				app.pictureCountdownCounter = app.pictureCountdownCounterStart
		 	}
 		}
	}


	Image {
		id: doorcamImage2
		width: app.enableForceMode? parent.width - 110 : parent.width
		height: parent.height - 30
		fillMode: app.enableForceMode? Image.Stretch : Image.PreserveAspectFit
		source: app.doorcamImage2Source
		anchors {
			horizontalCenter: parent.horizontalCenter
			top: parent.top
		}
		cache: false
		z: app.doorcamImage2Z
		onStatusChanged: {
			app.doorcamImage2Ready = (doorcamImage2.status == Image.Ready)
		}
	}

	Rectangle {
	    width: parent.width
	    height: 20
	    color: "white"
			anchors {
				left: parent.left
				bottom: parent.bottom
			}
			z: 10
	}

	Rectangle {
	    width: Math.abs((app.pictureCountdownCounter/app.pictureCountdownCounterStart)*parent.width)
	    height: 20
	    color: app.enableForceMode? "blue" : "green"
			anchors {
				left: parent.left
				bottom: parent.bottom
			}
			z: 20
	}

}

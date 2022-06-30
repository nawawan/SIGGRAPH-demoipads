#include "ofApp.h"

#import "VideoPlayerControls.h"
#import "VideoPlayerControlsDelegateForOF.h"
#import "AVFoundationVideoPlayer.h"

//-------------------------------------------------------------- video controls.

//--------------------------------------------------------------
void ofApp::setup() {
	ofSetFrameRate(30);
	ofBackground(0, 0, 0);
    tapx = -100;
    tapy = -100;
    receiver.setup(PORT);
    handState = "";
    tranps.resize(2);
    flipped.resize(2, false);
	tranps[0].load("card.mov");
    tranps[1].load("card2.mov");
    window.setOrientation(OF_ORIENTATION_90_LEFT);
    for(int i = 0; i < (int)tranps.size(); ++i) {
        tranps[i].setLoopState(OF_LOOP_NORMAL);
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    duration = tranps[0].getTotalNumFrames();
    for(int i = 0; i < (int)tranps.size(); ++i){
        if(!tranps[i].isLoaded()) return;
        if(!flipped[i]){
            if(tranps[i].getCurrentFrame() > duration / 2){
                flipped[i] = true;
                tranps[i].setPaused(true);
            }
        }
        else{
            if(tranps[i].getCurrentFrame() <= duration / 2){
                flipped[i] = false;
                tranps[i].setPaused(true);
            }
        }
        tranps[i].update();
    }
    while(receiver.hasWaitingMessages()){
        ofxOscMessage m;
        receiver.getNextMessage(m);
        cout << m.getAddress() << endl;
        if(m.getAddress() == "/gesture/tapped"){
            tapx = m.getArgAsInt32(0);
            tapy = m.getArgAsInt32(1);
            tapz = m.getArgAsInt32(2);
            cout << tapx << ' ' << tapy << ' ' << tapz << endl;
            if(-40 < tapx && tapx < 0 && 20 <= tapy && tapy < 20 + tranps[0].getHeight() && -30 <= tapz && tapz <= 30){
                tranps[0].setPaused(false);
            }
            else if(0 < tapx && tapx < 40 && 20 <= tapy && tapy < 20 + tranps[1].getHeight() && -30 <= tapz && tapz <= 30){
                tranps[1].setPaused(false);
            }
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    windowWidth = window.getHeight();
    for(int i = 0; i < (int)tranps.size(); ++i) {
        tranps[i].getTexturePtr()->draw(windowWidth / 2 + tranps[i].getWidth() * (-1 + i), 20);
    }
}

//--------------------------------------------------------------
void ofApp::playPressed() {
}

void ofApp::pausePressed() {
}

void ofApp::scrubBegin() {
}

void ofApp::scrubToPosition(float position) {
}

void ofApp::scrubEnd() {
}

void ofApp::loadPressed() {
}

void ofApp::unloadPressed() {
}

void ofApp::loopOnPressed() {
}

void ofApp::loopOffPressed() {
}

void ofApp::nativeOnPressed() {
}

void ofApp::nativeOffPressed() {
}

void ofApp::muteOnPressed() {
}

void ofApp::muteOffPressed() {
}

//--------------------------------------------------------------
void ofApp::exit(){
}

//--------------------------------------------------------------
void ofApp::touchDown(int x, int y, int id){
    cout << x << ' ' << y << ' ' << id << endl;
    if(windowWidth / 2 - tranps[0].getWidth() < x && x < windowWidth / 2){
        tranps[0].setPaused(false);
    }
    else if(windowWidth / 2 < x && x < windowWidth / 2 + tranps[1].getWidth()){
        tranps[1].setPaused(false);
    }
}

//--------------------------------------------------------------
void ofApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::touchCancelled(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void ofApp::lostFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotFocus(){
    
}

//--------------------------------------------------------------
void ofApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void ofApp::deviceOrientationChanged(int newOrientation){
    
}


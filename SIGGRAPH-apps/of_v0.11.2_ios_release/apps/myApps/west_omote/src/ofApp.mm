#include "ofApp.h"

#import "VideoPlayerControls.h"
#import "VideoPlayerControlsDelegateForOF.h"
#import "AVFoundationVideoPlayer.h"

//-------------------------------------------------------------- video controls.

//--------------------------------------------------------------
void ofApp::setup() {
	ofSetFrameRate(30);
	ofBackground(0, 0, 0);
    receiver.setup(PORT);
    tranps.resize(2);
    flipped.resize(2, false);
	tranps[0].load("card9_omote.mov");
    tranps[1].load("cardA_omote.mov");
    keyStatus = 'n';
    nowStatus = 0;
    window.setOrientation(OF_ORIENTATION_90_LEFT);
    for(int i = 0; i < (int)tranps.size(); ++i) {
        tranps[i].setLoopState(OF_LOOP_NORMAL);
        tranps[i].play();
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    duration = tranps[0].getTotalNumFrames();
    if(nowStatus == 1){
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
    }
    else{
        for(int i = 0; i < (int)tranps.size(); ++i){
            tranps[i].update();
        }
    }
    while(receiver.hasWaitingMessages()){
        ofxOscMessage m;
        receiver.getNextMessage(m);
        cout << m.getAddress() << endl;
        if(m.getAddress() == "/key/pressed"){
            keyStatus = m.getArgAsChar(0);
            if(keyStatus == 't'){
                nowStatus = 1;
            }
            else if(keyStatus == 'r'){
                for(int i = 0; i < (int)tranps.size(); ++i){
                    tranps[i].setFrame(0);
                }
            }
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    windowWidth = window.getHeight();
    for(int i = 0; i < (int)tranps.size(); ++i) {
        tranps[i].getTexturePtr()->draw(windowWidth / 2 + 240 * (-1 + i), 20, 240, 360);
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


#include "ofApp.h"

#import "VideoPlayerControls.h"
#import "VideoPlayerControlsDelegateForOF.h"
#import "AVFoundationVideoPlayer.h"

//-------------------------------------------------------------- video controls.
//north_ura
//--------------------------------------------------------------
void ofApp::setup() {
    ofSetFrameRate(30);
    ofBackground(0, 0, 0);
    receiver.setup(PORT);
    movies.resize(4);
    textImages.resize(2);
    flipped.resize(2, false);
    movies[0].load("card10_ura.mov");
    movies[1].load("cardQ_ura.mov");
    movies[2].load("hiyoko.mp4");
    movies[3].load("southfire.mp4");
    textImages[0].load("SIGGRAPHjaW.PNG");
    textImages[1].load("SIGGRAPHjaY.PNG");
    keyStatus = 'n';
    nowStatus = 0;
    textIndex = 0;
    incre = 0;
    window.setOrientation(OF_ORIENTATION_90_LEFT);
    for(int i = 0; i < (int)movies.size(); ++i) {
        movies[i].setLoopState(OF_LOOP_NORMAL);
        if(i < 2) movies[i].play();
    }
}

//--------------------------------------------------------------
void ofApp::update(){
    duration = movies[0].getTotalNumFrames();
    if(nowStatus == 0){
        movies[0].update();
        movies[1].update();
    }
    else if(nowStatus == 1){
        movies[2].update();
    }
    else if(nowStatus == 2){
        movies[3].update();
    }
    while(receiver.hasWaitingMessages()){
        ofxOscMessage m;
        receiver.getNextMessage(m);
        cout << m.getAddress() << endl;
        if(m.getAddress() == "/key/pressed"){
            keyStatus = m.getArgAsChar(0);
            cout << keyStatus << endl;
            if(keyStatus == '2'){
                if(nowStatus != 3){
                    for(int i = 0; i < movies.size(); ++i){
                        if(movies[i].isPlaying()){
                            movies[i].setPaused(false);
                        }
                    }
                    nowStatus = 3;
                }
                else{
                    textIndex = (incre == yellowIndex);
                    incre = (incre + 1) % 4;
                }
            }
            else if(keyStatus == '1'){
                for(int i = 0; i < (int)movies.size(); ++i){
                    if(movies[i].isPlaying()){
                        movies[i].setPaused(true);
                    }
                }
                if(nowStatus > 3){
                    nowStatus = 0;
                }
                nowStatus = (nowStatus + 1) % 3;
                if(nowStatus == 0){
                    movies[0].setPaused(false);
                    movies[1].setPaused(false);
                }
                else if(nowStatus == 1){
                    movies[2].setPaused(false);
                }
                else{
                    movies[3].setPaused(false);
                }
            }
            else if(keyStatus == '9'){
                if(nowStatus == 3){
                    textIndex = (textIndex + 1) % 2;
                }
            }
            else if(keyStatus == '0'){
                for(int i = 0; i < (int)movies.size(); ++i){
                    movies[i].setFrame(0);
                }
            }
        }
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    windowWidth = window.getHeight();
    //cout << window.getHeight() << ' ' << window.getWidth() << endl;
    if(nowStatus == 0){
        for(int i = 0; i < 2; ++i) {
            movies[i].getTexturePtr()->draw(windowWidth / 2 + 260 * (-1 + i), 0, 240, 420);
        }
    }
    else if(nowStatus == 1){
        //cout << movies[2].getWidth() << ' ' << movies[2].getHeight() << endl;
        movies[2].getTexturePtr()->draw(windowWidth / 2 - 480, 0, 960, 540);
    }
    else if(nowStatus == 2){
        movies[3].getTexturePtr()->draw(0, 0);
    }
    else if(nowStatus == 3){
        textImages[textIndex].draw(77, 0, 1040, 780);
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


#pragma once

#include "ofxiOS.h"
#include "ofxOSC.h"
#define PORT 8000
class ofApp : public ofxiOSApp{
    
public:
        
    void setup();
    void update();
    void draw();
    void exit();
    
    void touchDown(int x, int y, int id);
    void touchMoved(ofTouchEventArgs & touch);
    void touchUp(ofTouchEventArgs & touch);
    void touchDoubleTap(ofTouchEventArgs & touch);
    void touchCancelled(ofTouchEventArgs & touch);
    
    void lostFocus();
    void gotFocus();
    void gotMemoryWarning();
    void deviceOrientationChanged(int newOrientation);

    void playPressed();
    void pausePressed();
    void scrubBegin();
    void scrubToPosition(float position);
    void scrubEnd();
    void loadPressed();
    void unloadPressed();
    void loopOnPressed();
    void loopOffPressed();
    void nativeOnPressed();
    void nativeOffPressed();
    void muteOnPressed();
    void muteOffPressed();
private:
    vector<ofxiOSVideoPlayer> movies;
    vector<ofImage> textImages;
    vector<bool> flipped;
    int duration;
    int windowWidth;
    ofxOscReceiver receiver;
    ofAppiOSWindow window;
    char keyStatus;
    int nowStatus;
    int textIndex;
    int incre;
    const int yellowIndex = 3;
};

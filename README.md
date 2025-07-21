# Automation-Testing-of-Video-playback-app

### Goal
I want to gain experience with creating a basic Swift application and writing some tests to make sure the features of the application works.  The app will contain the music video APT and will let the user pause, unpause, skip 5 seconds, and rewind 5 seconds of the video.  The tests that I am creating are the following:
 - Whether the video loads
 - Whether the video can play
 - Whether rewind button loads and can handle spam rewinds and rewinding while the video is paused or unpaused
 - Whether the skip button loads and can handle spam skips and skipping while the video is paused or unpaused
 - Whether the pause/unpause button loads and can tap to pause, tap to play, and handle spam taps

### Reason for making tests
With an application as small as this, there isn’t a need to create these tests since each test can be quickly checked within a couple seconds.  However, as the project scales and more functions are added, we don’t want to constantly repeat each and every test over and over again to make sure new features did not break the pause/unpause or rewind/skip feature which is why creating these tests are helpful.

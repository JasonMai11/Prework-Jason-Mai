# Pre-work - *Tip Calculator and Conversion*

**Tip Calculator and Conversion** is a tip calculator application for iOS.

Submitted by: **Jason Mai**

Time spent: **12** hours spent in total

## User Stories

The following **required** functionality is complete:

* [X] User can enter a bill amount, choose a tip percentage, and see the tip and total values.
* [X] User can select between tip percentages by tapping different values on the segmented control and the tip value is updated accordingly

The following **optional** features are implemented:

* [X] Using locale-specific currency and currency thousands separators.
* [X] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

## Video Walkthrough

Here's a walkthrough of implemented user stories:

![](https://i.imgur.com/YW4bYpP.gif)


GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

Describe any challenges encountered while building the app.

The biggest challenge that took me almost a week to try to find out was taking information from the SettingsViewController and having the MainViewController already have the information from the settings. (For example, in the SettingsViewController it already loads in the previous Currency that you would like out of the three segmenst [USD, YEN, EURO]. If you had YEN in your Settings and you closed the app and loaded it up again it would go back to USD which is the default Currency even though if you go back to the SettingsViewController it would show YEN as the last option that you previously chose. I kept on getting errors and I searched for many solutions through the internet but it wasn't close to what I was looking for. I then found an alternative solution to the problem which was to push the ViewController even though it looks messy.

The next challenge was the conversions. Since my code was beginning to look messy, it was hard to keep track of the conversions and the labels.

The last challenge was trying to get the Keyboard to pop up.

## License

    Copyright [2021] [Jason Mai]

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.

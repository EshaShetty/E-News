# E-News

This is a native iOS application to view the latest News around the globe.

Made using UIKit and is written in Swift.

## Adobe XD Design 
The design file can be found in the git files as "E-News.xd"

## Application Features
1. Country Specific Top Stories
2. Save News Items

|![en1](https://user-images.githubusercontent.com/28254428/94185555-6eb0dc00-fe73-11ea-9580-f8ef01dc3cf1.gif) | ![en2](https://user-images.githubusercontent.com/28254428/94185687-986a0300-fe73-11ea-8952-e379ee9e57f6.gif)|

## Dependencies
The NewsAPI is used to fetch the latest news stories. The API applied here is a free API and has a limit of 500 Requests per day
url: https://newsapi.org


After testing the midnight scenario it seems that the start and end times must be entered on the same day.
Case 1: 
<img width="1159" alt="Screen Shot 2021-01-27 at 3 38 08 PM" src="https://user-images.githubusercontent.com/77290438/106145694-da69c500-6143-11eb-99bf-906fa81c5ee2.png">

Case 2: The app showed the live stream at 12am and ended at 1am
<img width="1161" alt="Screen Shot 2021-01-27 at 3 41 46 PM" src="https://user-images.githubusercontent.com/77290438/106146119-4c420e80-6144-11eb-8b7b-4ef477a31a37.png">








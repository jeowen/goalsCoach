# Goals Coach README

[![N|Solid](https://cldup.com/dTxpPi9lDf.thumb.png)](https://nodesource.com/pr
### Checkpoint 5: Intro Sequence
1. replace main view controller with goals coach intro sequence
2. have single view controller control entire sequence of views
3. implement arrow button + swipe right, swipe left, swipe up, swipe down
4. display introduction image/arrow view when no goals are present

### Checkpoint 6: New Goal Sequence
1. manage sequence of 4 or 5 steps to enter a new goal
2. enter low anchor
3. enter high enchor
4. rate goal for today
5. encouragement to come back daily

### Checkpoint 7: Details to Detail View
1. detail view defaults to 50, or most recent goalValue submitted
2. detail view displays controller buttons at bottom to 1) display graph/history, 2) to get automated coaching


### Checkpoint 8: Graph/History View
1. display button: implement visual graph of most recent 7 updates
2. display full history below in reverse chronological order

### Checkpoint 9: Basic Coaching
1. Determine whether slope, averaged over past week with minimum of 2 goal updates, is positive, neutral, or negative for past week
2. Determine whether slope comparing first 5 values to most recent 5 values, once at least 10 values have been provided, is positive, neutral or negative for full history with this goal

### Checkpoint 10: App Analytics
1. Wire to flurry
2. Wire to Google Firebase
3. Generate test reports from each analytics platform

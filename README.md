# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

📝 `NOTE - PASTE PART 2 SNIPPET HERE:` Paste the README template for part 2 of this assignment here at the top. This will show a history of your development process, which users stories you completed and how your app looked and functioned at each step.

---

## Flix Part 1

### User Stories
#### REQUIRED (10pts)
- [x] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [x] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [x] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [x] (2pt) User can view the app on various device sizes and orientations.
- [x] (1pt) Run your app on a real device.

### App Walkthrough GIF
`NOTE`: Save gif files in Github folder to load them with syntax:
![](file_name.gif)
## Iphone 8
![](Flix_iPhone8_Portrait.gif)
![](Flix_iPhone8_Landscape.gif)
## Iphone 11
![](Flix_iPhone11_Portrait.gif)
![](Flix_iPhone11_Landscape.gif)

GIF created with [LiceCap](http://www.cockos.com/licecap/).
### Notes
Describe any challenges encountered while building the app.
1. Custom cell did not display all labels.
Problem: After creating my custom cell with two labels (title, synopsis) and image, I run it on the simulator but the cell only displayed a fraction of the title.
Even though I changed the height of the cell, it did not fix the problem. After receiving help from the TA and self-debugging, I changed the row height of the "TableViewCell" which resolved my problem.
Solution: Change row height of "TableViewCell"
2. AlamofireImage af_setImage method is deprecated
  Problem: Following the tutorial, I was stuck when seeing the af_setImage was crossed out on my Xcode. I tried to search Google for the new method but couldn't find any. I then decided to use the deprecated method anyway. Then, Xcode suggested me with the new method.
  Solution: Keep using it until Xcode suggest new method, New method: af.setImage(withUrl: URL)

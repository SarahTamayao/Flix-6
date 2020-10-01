# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [X] (5pts) User can tap a cell to see more details about a particular movie.
- [X] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [x] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [X] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthrough GIF
`TODO://` Add the URL to your animated app walkthough `gif` in the image tag below, `YOUR_GIF_URL_HERE`. Make sure the gif actually renders and animates when viewing this README. (🚫 Remove this paragraph after after adding gif)

<img src="YOUR_GIF_URL_HERE" width=250><br>

### Notes
Describe any challenges encountered while building the app.

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
3. CTRL drag does not show segue
Problem: I was attempting to create show movie trailer whenever user click on the poster. I
held "ctrl" on the posterImage and drag it to the VideoViewController but there was nothing
popup to setup the segue.
Attempt:
	x	Tried again
	x	Tried with different elements
	x Restart xcode
	x Create new project and new viewcontrollers
	x Check mark on attribute User Interaction Enable

	v	Tried with button element

-->somehow, ctrl drag only works with button now. BUG IN XCODE???	
Solution:
	1. Create segue from MovieDetailsViewController to VideoViewController
	2. Add UITapGestureRecognizer to posterView in MovieDetailsViewController
	3. Call performSegue when user click on the posterView

# Previous-Work
All of the files uploaded are from previous projects that I have worked on either by self or with a group. Majority of them will not list Evelyn as my name as I have changed it since the project was completed. Similarly there may be references to a former github account of mine with my old name, although the username should be very similar to my current one as it also includes my last name.

If you have any questions about these projects, please contact me.

**Team Projects**

These projects were all comepleted with the same team of four or five members, the fifth member left the group to pursue a different project more aligned with their interests for the last project (Lunar Alpha). They were all done with a team called Team Return(AWESOME).

*Battleship:*

Our team was tasked with designing a game of battleship with an 8 by 8 board with a variable number of ship (between 1 and 5). Each ship will be a different length such that if 3 ships are to be used there will be one 1x1, one 1x2, and one 1x3. After the number of ships is chosen players can seceretly orient and place ships. Once both players have placed all of their ships, they must be able to take turns firing and recieve feed back for missing, hitting, and sinking ships. Players must have a view of their boards including which portions of their ships have been hit and the board they are firing upon which shows which cells they have hit and missed. The game ends once someone has sunk all of the other person's ships. We had two weeks to develop a solution with any language.

We utlized a web based approach that heavily utilized javascript to manage our board elements and determine what should be displayed. It also allowed us to add some small UI touches and allow the users to play with the mouse. Myself and one other person architected the initial design and each file's job and interactions. I wrote the Grid class and then provided a heavy amount of aid in resolving the bugs plauging Executive file.

*Battleship 2.0:*

For this project our team inherited another team's battleship program so we had to stay within some of their initial design. We were required to fix any bugs that occured and implment a three difficulties of AI to play against as well as two small custom additions of our choice. Each of the AI acted slightly differently, the easy AI fired randomly, the medium AI used and intuitive guessing pattern to sink ships faster, and the hard AI got a hit every turn. We had two weeks to complete this project.

From the beginning our team struggled with the C++ design (that was played through the terminal) that the prior team used. It was relatively monolithic with only three files: main to launch Executive, Executive to handle all of the screen printing, and Map to handle all other functionality of the game. Several portions of the code were hard coded within the same file. It took us over a week to refactor enough of the code so that we could add the features we wanted to. We used a similar design to last time with similar roles. I wrote the Grid class again and developed a testing infustructure that worked and wrote tests for some of the power functions in addition to the code I wrote.

*Lunar Alpha:*

Unlike previous projects the design description for this one was very open-ended. For this project our team got to pick an idea and develop it. It had to be a reasonable scope for the amount of time available and our design had to include documentation (inclusive of a user manual, maintence plan, and deployment plan if the project was to expand) and a small test suite. We had to have a prototype turned in a week after it was assigned. Afterwards, we had a month to finish the project and work on the more specific facests of the design.
 
Our team noticed that chemical engineering students have to use several different units which they often have to convert between. Addtionally, they have a large variety of differnt constants that they have to reference that use all of these different units. Finally, they have several different formulas that they have to utlize some of which require a series of complex iterations where they often have to look up certain portions on charts and then plug in slightly different answers until they are within an error tollerance. Our design provided a lightweight webpage (that used a decent bit of javascript again) to do all of that. I specifically worked on the formula portion including the complexities of Bernulli's equation. I also developed another test suite for this application.

**Individual Projects**


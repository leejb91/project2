#Project 2:

##_X - L E A G U E_
by Jerry Brown Lee

GitHub: [https://github.com/leejb91/project2/tree/master/x_league_app](https://github.com/leejb91/project2/tree/master/x_league_app)

Project Link: [https://shrouded-ocean-86275.herokuapp.com/](https://shrouded-ocean-86275.herokuapp.com/)

Trello: [https://trello.com/b/582FLLtx/project-2-x-league](https://trello.com/b/582FLLtx/project-2-x-league)

##Introduction
I am currently taking part in a basketball league called X-League and found the current website somewhat lacking. It displays all the necessary information for a local basketball league but it did not feel satisfying. Thus, utilizing technologies such as HTML, CSS, Bootstrap, and Ruby on Rails, the new and improved X-League web application takes the original website [www.xleaguenation.org](www.xleaguenation.org) to the next level. The current website simply portrays the stats per game; however, the web application will manipulate the data to have a more interactive experience so that users will be able to look up individual players and teams and find per game stats as well as season totals all in a single page. The ultimate goal will be to bring about another level of competition through statistics among the players. In the future, I hope to present this to the league commissioner and incorporate this web application to the actual league website.


##The App
The application will allow users to view stats based on the team or player. In addition, if the user signs up, he will be able to set a favorite player to be portrayed on the home page after logging in. Therefore, the user will no longer have to navigate through the players page and search for his player.

The X-League commissioner will have the sole admin status to be able to create, update and delete game/team/player/performance information.

##Home Page
![Home Page](https://i.imgur.com/hthHGLY.png)

##Home Page - Logged in with favorite player
![Logged In Home](https://i.imgur.com/EE2cszB.png)

##Player Page
![My Player Page](https://i.imgur.com/3bnG9gr.png)

##Teams Page
![Team Page](https://i.imgur.com/uiJyMpS.png)


##Technologies
- HTML
- CSS
- Bootstrap
- Javascript/jQuery
- Heroku

##Design
The website utilizes bootstrap to create a clean and modern look. The users (logged in or not) are able to navigate through the navigation bar or pages to view the stats for a team or player. If the user chooses to sign in, he/she will be able to choose a "favorite" player and set it as his/her home page for easy access. The stats are portrayed in tables with links that are intuitive for easy navigation.

##Get Started
1. Open up your web browser.
2. Input link https://shrouded-ocean-86275.herokuapp.com/.
3. Log in to set up a personalized home page.

##Deploying to Heroku

1. Create an account on www.heroku.com
2. Install Heroku Toolbelt
3. ```heroku login```
4. ```heroku create```
5. ```heroku git:remote -a shrouded-ocean-86275```
6. ```git push heroku master```
7. ```heroku run rake db:migrate```
8. ```heroku run rake db:seed```


##Going Forward
1. Include all time stat leaders.
2. Create tables for the edit performance page for UX.
3. Add conditions to new/edit pages to ensure information is properly added.
4. Create a more intuitive teams/players page.
5. Add values to the division attribute on teams to distinguish the teams' levels.
2. Include pictures to home page to look more welcoming.

##Suggestions
Please send any questions, bugs, suggestions, etc. to leejb91@gmail.com.
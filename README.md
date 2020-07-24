# Orbital 2020 Apollo 11

**twoGeeks is a mobile application to allow students to find study partners to make more friends, knowledge and experiences as well as to provide an avenue for them to ask for help in subjects they are weak at.**

Download apk file [here](https://drive.google.com/file/d/1HUb6m5JJ-hSuULo3gyvgQnHGIFIlYEVG/view?usp=sharing)

<div align="center">
    <span display="inline">Build using </span>
    <img alt="Flutter" src="https://img.shields.io/badge/-Flutter-blue">
    <img alt="Firebase" src="https://img.shields.io/badge/-Firebase-orange">
</div>

<div align="center">
    <span display="inline">Build status: </span>
    <a href="https://codemagic.io/apps/5edf43a10e8f471f538d981f/5edf43a10e8f471f538d981e/latest_build">
        <img alt="Build Status" src="https://api.codemagic.io/apps/5edf43a10e8f471f538d981f/5edf43a10e8f471f538d981e/status_badge.svg">
    </a>
    <a href='https://coveralls.io/github/TwoGeeks/TwoGeeks?branch=master'><img src='https://coveralls.io/repos/github/TwoGeeks/TwoGeeks/badge.svg?branch=master' alt='Coverage Status' /></a>

</div>


## Motivation

In Singapore, many students do not have a partner to study with especially if they are freshmen.
There are a lot of proven benefits of studying with someone especially if you need help clarifying concepts and doing homework.
Students may also want to expand their social circle and to make more friends who study the same subjects or modules as them.
Furthermore, we are also committed to help students with their schoolwork without having to spend an absurd amount of money on tuition.
We want to help students seek the help they need from other students who are better in concepts.
As such, we are motivated to create a mobile app that connects students, forge new relationships and make studying much easier.

## User Stories

As a student,
1. I want to create a profile about myself so that others can find me easily and match with me.
2. I want to look at profiles of other students, swipe left to view a new student and swipe right to send a friend request to the student so that I can connect with them.
3. I want to be able to filter students by age, gender, education level so that I can view selections that best match my preferences.
4. I want to accept or reject friend requests sent by other students.
5. I want to be able to chat with my fellow students so that I can plan when to study together after accepting a friend request.
6. I want to be able to see all my chats with other students so that I can resume chatting with them.

As a tutor (another student),
1. I want to inform other students in the area of studies that I am proficient in.
2. I want to be able to accept friend requests from other students.
3. I want to show a list of chats with students I have been helping.

## Design of system

Using Adobe XD, we have come up we a mockup of our mobile application.

### Authentication pages
<p float="left">
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Login-SIgnup.png" width="200" />
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Login%20page.png" width="200" /> 
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page.png" width="200" />
</p>

### Sign up pages
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%201.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%202.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%203.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%204.png" width="200" />
</p>

### In-app screens pages
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Home%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Matching%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Chat%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Settings.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/People%20details%20page.png" width="200" />
</p>

### Chat page and FriendRequest notification
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Chatroom%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Notification.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Notification%20%E2%80%93%20Accept.png" width="200" />
</p>

### Tutor UI pages
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Tutor%20matching%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Tutor%20details%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Tutor%20Home%20page.png" width="200" />
</p>

---

For our database, we have come up with a initial schema.
![backend schema](https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/schema.jpg)

---

### Overall app design
![app design](https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/userflow.jpg)

## Development Plan

<table style="width:100%">
  <tr>
    <th>Date</th>
    <th>Objective</th>
  </tr>
  
  <tr>
    <td>11 May - 24 May 2019</td>
    <td>
      <ol>
        <li>Set up firebase</li>
        <li>Do up user interface for all screen</li>
        <li>Set up firebase authentication, enable sign up and login</li>
        <li>Do up poster and video</li>
      </ol>
    </td>
  </tr>
  
  <tr>
    <td>25 May - 7 June 2019</td>
    <td>
      <ol>
        <li>Set up firestore and schema</li>
        <li>Connect frontend screens with backend database</li>
        <li>Prepare for milestone 1</li>
      </ol>
    </td>
  </tr>
  
  <tr>
    <td>8 June - 21 June 2019</td>
    <td>
      <ol>
        <li>Write tests for flutter widgets</li>
      </ol>
    </td>
  </tr>
  
  <tr>
    <td>22 June - 5 July 2019</td>
    <td>
      <ol>
        <li>Do up user interface for tutors screens</li>
        <li>Set up backend schema for tutors</li>
        <li>Prepare for milestone 2</li>
      </ol>
    </td>
  </tr>
  
  <tr>
    <td>6 July - 19 July 2019</td>
    <td>
      <ol>
        <li>Write test for tutor screen widgets</li>
        <li>Refine search algorthim</li>
        <li>Explore using collaborative filtering</li>
      </ol>
    </td>
  </tr>
  
  <tr>
    <td>19 July - 27 July 2019</td>
    <td>
      <ol>
        <li>Prepare for milestone 3</li>
        <li>Prepare application for production build</li>
      </ol>
    </td>
  </tr>
</table>

## Software engineering design practices
- Using Github for version control and merging of conflicts
    - Creating separate branches for both of us to work on before doing a pull request to merge it to master branch
    - ![branch](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/branches.png)
- Ensure all test are passed before merging to master branch / (Continuous Integration/ Continuous Development)
    - We used travis CI such that every time there is a pull request, the unit testing will be auto ran on the new branch's code
    - If all tests are passed then we will merge branch to master branch
    - ![travisCI](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/travis1.png)
    - ![travisCI2](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/travis2.png)
- Adopt DRY Principle
    - We have a folder for common widgets that are used by several pages or components to ensure that we do not duplicate codes
    - ![DRY](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/commonWidgets.png)
- Abstraction
    - We abstracted out the logic for routing so that configuring routing will only be in one file
    - Easier for us to make changes to routing if needed
    - ![routing](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/routingpage.png)
- Defensive programming
    - Check inputs are well validated before submission
    - ![validate](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/validators.png)
- Ensure harder to understand codes are well commented
- Write test to ensure code is working

## Testing Methods

### Unit Testing
- Testing individual widgets with Flutter in-built tester
- Loaded widgets to tester to check if the required elements are present (E.g texts, pictures, buttons)
- Check if logic in functions are working

### Stubs
- Used [Mockito](https://flutter.dev/docs/cookbook/testing/unit/mocking) package to mock authentication
- Preconfigure mock class to return a particular user
- Used [cloud_firestore_mocks](https://pub.dev/packages/cloud_firestore_mocks) package to mock firestore
- Preconfigued data for the mock firestore

### Integration Testing
- Using combination of unit test to test each main pages
- Mock presses on buttons to test navigation to other pages

### Testing Automation and Coverage
- Set up automatic testing using TravisCI on pull request
- Calculate test coverage score using TravisCI

### System Testing
- Ensure the features created is working as per expected
- Ensure there is input validation and error handling in places such as 
    - login
    - signup
    - edit profile
    - chat messaging input
- Ensure inputs cannot exceed a certain length
- Ensure buttons are not obscured
- Ensure app is easy to use and understand

### User Testing
We have asked some of our friends to try our app and followed up with a simple [survey](https://docs.google.com/forms/d/e/1FAIpQLSdOvKnX5yGGNCqL8BNKcIwv3203P2BXHNEKR-64E-Pu_bZLzw/viewform?usp=sf_link)

Here are the results:
<table style="width:100%">
  <tr>
    <th>Name</th>
    <th>How good is the UI design?</th>
    <th>Are the buttons for functions obvious?</th>
    <th>Was there any bugs that you discovered while using this app?</th>
  </tr>
  
  <tr>
    <td>Shaun</td>
    <td>4</td>
    <td>Yes</td>
    <td>Details page which have missing info have empty boxes</td>
  </tr>
  
  <tr>
    <td>Jonathan</td>
    <td>5</td>
    <td>Yes</td>
    <td></td>
  </tr>
  
  <tr>
    <td>Wei Zhi</td>
    <td>4</td>
    <td>Yes</td>
    <td></td>
  </tr>
  
  <tr>
    <td>Timothy</td>
    <td>5</td>
    <td>Yes</td>
    <td></td>
  </tr>
</table>

In general, the feedback for the UI design and button functions are well received. Some of them mentioned serveral bugs and have fixed them.

## Problems Encountered
- Since Android phones comes in difference sizes, we are expecting some phones to have bad UI issues.
- Since firebase and firestore are deeply intertwined in our app, it was hard to set up testing as most of the time it would break. One way we resolved this issue was to mock both dependencies
- The code was rather cluttered and not very reusable so to solve this issue, we had to spend time refactoring our code and making our code more resuable.
- When we tested the app with several people, many people find it hard to know what to do in the matching page, as such we decided to replace it with buttoned text to let users know what each button does

## Other Similar Applications

### Reddit r/FindStudyBuddies
![r/FindStudyBuddies](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/other2.png)
- Limitations
    - Hard to filter and search based on preferences as reddit can only sort via latest or most popular or search via description

### MoocLab
![mooclab](https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/other1.png)
- Limitations
    - This platform is designed for students to meet up online and share their progress on MOOC courses. It doest really support looking at finding physical interactions and studying

---

## Design of Final product

Here is a view of our latest design for the application. We decided to have a more consistant color palette, have images and animations to make it more appealing for users.

### Authentication pages
<p float="left">
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Login-SIgnup.png" width="200" />
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Login%20page.png" width="200" /> 
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page.png" width="200" />
</p>

### Sign up pages
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%201.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%202.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%203.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Signup%20page%20%E2%80%93%204.png" width="200" />
</p>

### In-app screens pages
<p float="left">
    <img src="https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/final/Homepage.jpg" width="200" />
    <img src="https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/final/Matching%20page.jpg" width="200" />
    <img src="https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/final/Tutor%20search%20page.jpg" width="200" />
    <img src="https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/final/Settings.jpg" width="200" />
    <img src="https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/final/Edit%20tutor%20profile.jpg" width="200" />
    <img src="https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/final/Edit%20user%20preference.jpg" width="200" />
    <img src="https://raw.githubusercontent.com/TwoGeeks/TwoGeeks/master/project_assets/final/Edit%20user%20profile.jpg" width="200" />
</p>

### Chat page and FriendRequest notification
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Chatroom%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Notification.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project_assets/mockups/Notification%20%E2%80%93%20Accept.png" width="200" />
</p>

---

By Dev++  
Andre Wong Zhi Hua  
Peh Jun Siang

# Orbital 2020 Apollo 11

**twoGeeks is a mobile application to allow students to find study partners to make more friends, knowledge and experiences as well as to provide an avenue for them to ask for help in subjects they are weak at.**

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
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Login-SIgnup.png" width="200" />
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Login%20page.png" width="200" /> 
  <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Signup%20page.png" width="200" />
</p>

### Sign up pages
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Signup%20page%20%E2%80%93%201.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Signup%20page%20%E2%80%93%202.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Signup%20page%20%E2%80%93%203.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Signup%20page%20%E2%80%93%204.png" width="200" />
</p>

### In-app screens pages
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Home%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Matching%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Chat%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Settings.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/People%20details%20page.png" width="200" />
</p>

### Chat page and FriendRequest notification
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Chatroom%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Notification.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Notification%20%E2%80%93%20Accept.png" width="200" />
</p>

### Tutor UI pages
<p float="left">
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Tutor%20matching%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Tutor%20details%20page.png" width="200" />
    <img src="https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/mockups/Tutor%20Home%20page.png" width="200" />
</p>

---

For our database, we have come up with a initial schema.
![backend schema](https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/schema.jpg)

---

### Overall app design
![app design](https://raw.githubusercontent.com/todoge/TwoGeeks/master/project%20assets/userflow.jpg)

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

## Testing Methods

### Unit Testing
- Testing individual widgets with Flutter in-built tester
- Loaded widgets to tester to check if the required elements are present (E.g texts, pictures, buttons)
- Check if logic in functions are working

### Stubs
- Used Mockito package to mock authentication
- Preconfigure mock class to return a particular user
- Used cloud_firestore_mocks package to mock firestore
- Preconfigued data for the mock firestore

### Integration Testing
- Using combination of unit test to test each main pages
- Mock presses on buttons to test navigation to other pages

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

## Software engineering design practices

## Problems Encountered
- Since Android phones comes in difference sizes, we are expecting some phones to have bad UI issues. 

## Other Similar Applications

---

By Dev++  
Andre Wong Zhi Hua  
Peh Jun Siang

# Team AMMA.exe

## Phase One Video

<p align="left">
      <a href="https://drive.google.com/file/d/1qrzOrLa2lYwb130EcHiFBMrbswX2yQP0/view?usp=sharing">Phase One Video here</a>
</p>

Thank you mnr!!!


<p>
  AMMA.exe is a dynamic, enthusiastic and talented team. We leverage our unique individual strengths to bring out the best in our team. With skills Ranging from devops, frontend, backend, our team delievers the best solution for your       
  problem
</p>

## Team Members
<p>
  <img width="250" height="240" align='left' src="agape.jpg">
</p>

#### Agape Mamphasa

#### Role(s): Database Engineer, DevOps Engineer, Backend Engineer

#### 3rd Year Computer Science Student at The University Of Pretoria

#### Favourite Language(s): Java, JavaScript, php

<br>
<br>
<br>
<br>

<p>
  <img width="250" height="240" align='left' src="monica.jfif">
</p>

#### Monica Brancon

#### Role(s): Lead Frontend designer

#### 2nd Year Computer Science Student at The University Of Pretoria

#### Favourite Language(s): Java

[<img src="https://camo.githubusercontent.com/a80d00f23720d0bc9f55481cfcd77ab79e141606829cf16ec43f8cacc7741e46/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c696e6b6564496e2d3030373742353f7374796c653d666f722d7468652d6261646765266c6f676f3d6c696e6b6564696e266c6f676f436f6c6f723d7768697465" data-canonical-src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&amp;logo=linkedin&amp;logoColor=white" style="max-width: 100%;">](https://za.linkedin.com/in/reneiloe-brancon-a68316257)

<br>
<br>

<p>
  <img width="250" height="240" align='left' src="amanda.jfif">
</p>

#### Amanda Khuzwayo

#### Role(s): Backend Engineer, Frontend Engineer, Database Engineer

#### 3rd Year Computer Science Student at The University Of Pretoria

#### Favourite Language(s): Java, C++

[<img src="https://camo.githubusercontent.com/a80d00f23720d0bc9f55481cfcd77ab79e141606829cf16ec43f8cacc7741e46/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c696e6b6564496e2d3030373742353f7374796c653d666f722d7468652d6261646765266c6f676f3d6c696e6b6564696e266c6f676f436f6c6f723d7768697465" data-canonical-src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&amp;logo=linkedin&amp;logoColor=white" style="max-width: 100%;">](https://za.linkedin.com/in/amanda-khuzwayo-894130135)

<br>
<br>

<p>
  <img width="250" height="240" align='left' src="mbofho.jfif">
</p>

#### Mbofho Mamatsharaga

#### Role(s): Frontend Engineer

#### 3rd Year Computer Science Student at The University Of Pretoria

#### Favourite Language(s): Java, dart

[<img src="https://camo.githubusercontent.com/a80d00f23720d0bc9f55481cfcd77ab79e141606829cf16ec43f8cacc7741e46/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f4c696e6b6564496e2d3030373742353f7374796c653d666f722d7468652d6261646765266c6f676f3d6c696e6b6564696e266c6f676f436f6c6f723d7768697465" data-canonical-src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&amp;logo=linkedin&amp;logoColor=white" style="max-width: 100%;">](https://za.linkedin.com/in/mbofho-mamatsharaga-54992823b)

<br>

## Tech Stack

<p>
  Our Technology stack is very diverse and unique. We didn't go the full Javascript/typescript stereotypical stack. We mixed and matched different technologies. This was due to our diverse skills and knowledge of different technologies.
  How we intergrated all of these elements together was an interesting challenge to say the least.
</p>

### Frontend: Flutter

<p>
  Flutter is a very good framework that isn't restricted by any operating system or platfor. Whether you are on android, the web or IOS, flutter is the best framework for the job. Build one app, and simply port it across all the 
  platforms.
</p>

### Backend: Nodejs

<p>
  Nodejs is essentially serverside javascript. Our familiarity with JavaScript made working with the backend a fairly straight forward task. Javascript just works, and that's why our backend engineers chose it. Beside it
  being user-friendly, javaScript is very fast, and making API endpoints with it is super simple.
</p>

### Database: Postgres

<p>
  Postgres is an Object Relational database management system. It's what happens when you intergrate object oriented features with a traditional relational database. Postgres is also compitable with many backend frameworks like
  node. So that was also a factor why we chose it.
</p>

## Git Strategy

<p>
  For our version control and project management, we used git-flow. Essentially, we have 3 main branches:
</p>

-   **main**: This is where the latest and stable version of our code will lie. Only the devOps engineer may push to main.
-   **develop**: This is the development playground. A lot of things are built, tested and broken on this branch. This ensures that bad code doesn't make it to main.
-   **feature**: This is where developers work on different features of the app e.g the login page. The final page is then merged into develop.

**Here is a nice neat diagram to illustrate how git-flow works:**
 
 <img width="1000" alt="paste" src="https://user-images.githubusercontent.com/93540728/172563460-f0933f29-21c3-4892-9fde-b81a3f9be9fb.png">


## Architecture

<p>
  For our system, we used a simple n-tier architecture. The 3 main tiers were:
</p>
 
-   **Database Layer**: This is where our database resides. We used Postgres for our database implementation. We use PGAdmin for our database visualiser and query tool.
-   **Business Logic Layer**: This is where the backend resides. The backend is essentially a set of functions that communicate with the database, and the client uses URL endpoints to connect with the backend. 
-   **Presentation Layer**: We used flutter for the presentation layer. We chose flutter because of it's compatibility with many operating systems.


  **Below is a picture of our Architectural diagram:**
  
  <br>

 <img width="1000" alt="paste" src="MnR_hackathon_architecture.drawio.png">

## Database Model

<p>
  We modelled our database using UML diagrams. This fits into the theme of using postgres. It's an Object Relational Database Management System. Using UML models correctly fits that narrative of Object Orientation
</p>

  **Below is a picture of our Database Model:**
  
  <br>

<img width="1000" alt="paste" src="Entity Relationship Diagram1.jpg">

## How to Run

### Backend

- Download nodejs v18 or higher
- cd into the backend folder
- run npm install (to install all the packages)
- go into the terminal
- run node database.js (to run the db)
- run node populate.js (to populate the db with mock data)
- run node main.js (to run the backend)
- [http:localhost:3000](http://localhost:3000/) will be the main url endpoint

### Frontend

- If you do not have the Flutter SDK installed already, install it as follows, if you do have it installed, skip:
  - Download the latest stable version of the Flutter SDK on [The Flutter site](https://docs.flutter.dev/get-started/install)
  - Follow the instruction for installation on your operating system.
  - Test if installation was successful by running the command "flutter doctor" in your command prompt or powershell.
  - If all is successful, you can skip the next instruction.
  - If it is not successful, resolve (consult the Flutter site and GitHub Repo issues for possible resolutions).
- clone our main branch on our Repo.
- Open the project in any IDE of your choice, preferrably Visual Studio Code.
- change device to any emulator of a mobile device available ( We used the Google Pixel 3a emulator)
- wait for device emulator to boot up
- Once booted, navigate to the 'main.dart' file.
- in the main.dart file, at the top right of the screen, click on the drop-down next to the play button.
- click on "start debugging".
- the app will be running on the emulator.

## Other Documents

<p>
  Below is a set of documents we used in the implementation process. This includes our coding standards, api documentation and brain storming documentation we used to 
  come up with te initial concept and design.
</p>

<p align="left">
      <a href="https://docs.google.com/document/d/1Q_UGGy3Zy7aTKsgCVdtZIqQkih8GgJ4NibeXF9X5ShY/view?usp=sharing">Coding Standards</a>
        <br/>
      <a href="https://docs.google.com/document/d/1uDweZnDODpkeqNZ519_F3i5KZRffJw9s2gxqEbJY9yU/view?usp=sharing">Brain Storm</a>
        <br/>
      <a href="https://docs.google.com/document/d/14FxS9RjSJ_9CiGTXnoT7CUYo_Y14H0Pw8A7o_hApow4/view?usp=drive_link">api Doc</a>
        <br/>
      <a href="https://www.figma.com/file/PaALFcqUjmLU1Kjz33sVAP/HEALTHI-io?type=design&node-id=1%3A2&mode=design&t=9q9WTcecWPQzA3QV-1">High Fidelity Prototypes</a>
  </p>   <br/>



















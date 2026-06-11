# Haveit - The backend for the opensource quick commerce platform built by people built for people not for a single person or business to be richer and more richer.

## What is haveit?

Have it is an opensource ripoff of quick commerce platform like blinkit, zomato, flipkart minutes.

## People behind this project?

This project is never meant to be a business, this is a people’s company, everyone’s contribution is equally important here so it is not possible to say who the founder of the project is? The answer to the question is “we”, “we the shopkeepers and street vendors”, “we the delivery partners”, “we the engineers” are behind these, we the shopkeepers are the stake holders, our product is what we take stake on, we the delivery partners are the stake holders, our time, health and life is what we stake on, we the engineers are the stake holders, our cognitive ability and right intuition that oftentimes becomes questionable by the less knowledgeable higher authorities is what we take stake on.

## What is the value we get from this project?

1. For shopkeepers : Maximize profit by increased sales and upgrading customer experience as they are getting connected to a delivery network, something that is absolutely must in this tech world where customers love to have orders delivered to their doorstep
2. For delivery partners : A daily stable income that is completely measurable and quantifiable using certain datapoints that are completely open and available to view for everyone.
3. For code contributers and engineers : An eternal proof of work that is directly related to public welfare and a platform to contribute and proof their skills and a lumpsum salary payment or bug bounty lumpsum payment (when possible) for the gratification of their hardwork.

**PLEASE NOTE THAT ALL THE ACCOUNTING INFORMATION OF THIS PROJECT WILL BE AVAILABLE ONLINE FOR VIEW FOR ALL FOR THEIR CRITICISM AND ALWAYS MAKING SURE THIS PROJECT MUST NEVER TURN TO A BUSINESS AND NO VENTURE CAPITALISTS ARE PERMITTED TO PROVIDE ANY SORT OF INVESTMENT, HOWEVER DONATIONS ARE WELCOMED ABIDE BY THE DONATION LAWS FROM THE GOVERNMENT, IN THE CORE THIS PROJECT MACHINERY IS ACTUALLY OPERATED BY SHOPKEEPERS AND DELIVERY PARTNERS AND IS FUNDED BY THEIR MONTHLY SUBSCRIPTION OF rs. 99/- (HOWEVER THIS PRICE CAN BE REVISED AFTER DISCUSSING THIS WITH A CONTRIBUTER WHO IS A ECONOMISTS WITH A AIM TO KEEP THIS THIS AS LOW AS POSSIBLE AND SET A PRICE FOR WHICH THIS PROJECT CAN BE OPERATED WITHOUT ANY VC INVESTMENT).**

## System design

### Overview 
The entire system is comprised in 3 apps :
- haveit : The main app from where the customers gonna place their order
- haveit store : The app using which the shopkeepers will be listing their products.
- haveit delivery partner : The app using which the delivery partners will moderate the order delivery 

Above mentioned 3 apps will not have any local computation (for security reasons) unless absolutely required for certain less secure tasks. All those will communicate to or through the server to operate or communicate to each other.

### Server architecture
The central server is responsible for all of the actions from each of the app and coordination between the different apps. Each and every functional api endpoints will be defined here and will be secured through RBAC.

#### Tech stack :
1. DOCKER (for running the app in different types of containers so that deployment and onboarding developers on this app for development becomes easier)
2. NESTJS (nodejs based server writing framework).
3. POSTGRESQL via TYPEORM (database).
4. SWAGGER (Api documentation framework).
5. JEST (Unit testing framework).
6. SUPERTEST (End to end testing).
7. GLITCHTIP (Hosted system for log observation)

## Development guide

### Run this project locally
Since this is a dockerized project so you don't need any external packages to install in order to run this project, but this project requires docker daemon to be running in the machine where you want to run this project, the docker daemon gets installed automatically when you install docker desktop, go to the docker website to install docker if not already installed on your system.

**Since you have docker in your system follow the following steps to run this project locally and start contributing or extending this project :**
1. Clone this repo.
2. Open this repo in vscode (or any other code editor of your choice i am using vscode here so the further steps are as per vscode, you can understand what i am trying to do and replicate this in your code editor of choice).
3. You will see a message in the bottom right corner of the vscode like "Reopen folder in container" continue to reopen it, this will reopen the entire project in the dev container and you will be logged into the container terminal, the vscode terminal now is actually the container terminal. If you dont see the message popped up in the bottom right then use "ctrl + p" to open the vscode command window and type ">Reopen in container" to open the project as per mentioned.

### Agentic development using opencode

This project supports agentic development using **opencode**. The AI agent can explore the codebase, propose changes, and implement them with your approval.

**Setup:**
1. Install opencode from [opencode's official website](https://opencode.com).
2. Open this project in opencode (or any editor that supports opencode).
3. The agent already has all the context it needs from the project's `.opencode/` configuration.

**Usage:**
Simply describe the task you want done in natural language. For example:
- *"Add a volume for PostgreSQL data in docker-compose.yml"*
- *"Remove external PostgreSQL connection code from startup.sh"*
- *"Fix the terminal profile in devcontainer.json"*

The agent will explore the relevant files, propose a plan, wait for your approval, and then implement the changes.
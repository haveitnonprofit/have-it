# Haveit - an opensource quick commerce platform built by people built for people not for a single person or business to be richer and more richer.

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
1. NESTJS (nodejs based server writing framework).
2. SWAGGER (Api documentation framework).
3. JEST (Unit testing framework).
4. SUPERTEST (End to end testing).
5. GLITCHTIP (Hosted system for log observation)
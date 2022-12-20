# Flutter Web Application with AWS Amplify

## Table Content

* install and create flutter project
* Setup github actions for CICD
* Setup amplify with github for deploy the flutter web app
* configure custom domain in Domain management amplify



### 1.install and create flutter project

Please check this link to install flutter and setup environment
https://docs.flutter.dev/get-started/install

Once you done this, you create flutter project with terminal or cmd:

Exmple my project name is 'cloud_portfolio_project'

```javascript
  flutter create cloud_portfolio_project
```

then cd to the project then install the packaage

```javascript
  flutter pub get
```
you can run it test in chrome by using command

🌐 Flutter Web

```javascript
  flutter run -d chrome
```

🖥️ Flutter Desktop Mac OS

```javascript
  flutter run -d macos
```

📱 Flutter Desktop iOS

```javascript
  flutter run -d ios
```

once done, you can upload the project to github

### 2. Setup github actions for CICD

Here is my project which I already upload in my github private

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/1.png)

👉 then you need to you go github `Actions` tab

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/2a.png)

👉 Then go `set up a workflow yourself` to create your own curstom workflow

Time to put the script in `main.yml` 😈

```
name: On Website Deploy
"on":
  push:
    # (1)
    branches:
      - "develop"
jobs:
  build_and_deploy_web:
    name: Build & Deploy Flutter to Web
    runs-on: ubuntu-latest
    # (2)
    steps:
      - uses: actions/checkout@v2

      - uses: subosito/flutter-action@v2
        with:
          channel: "stable"

      - name: 🌍 Enable Web
        run: flutter config --enable-web

      - name: 📦 Get packages
        run: flutter pub get


      - name: 🏭 Build Web Application
        run: flutter build web --release

      # (3)
      - name: Make copy of artifacts
        run: |
          chmod u+x "${GITHUB_WORKSPACE}/createandcopytofolder.sh"
          bash "${GITHUB_WORKSPACE}/createandcopytofolder.sh"
      # (4)
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Commit the artifacts.
```

For your understanding

choose the branch you wanna build
```
branches:
      - "develop"
```
OS for build artifacts

`runs-on: ubuntu-latest`

this section is script for choose flutter channel and build web release

```
 # (2)
    steps:
      - uses: actions/checkout@v2

      - uses: subosito/flutter-action@v2
        with:
          channel: "stable"

      - name: 🌍 Enable Web
        run: flutter config --enable-web

      - name: 📦 Get packages
        run: flutter pub get


      - name: 🏭 Build Web Application
        run: flutter build web --release
```

this one for run the createandcopytofoler.sh script to copy artifact to the artifact folder

```
 # (3)
      - name: Make copy of artifacts
        run: |
          chmod u+x "${GITHUB_WORKSPACE}/createandcopytofolder.sh"
          bash "${GITHUB_WORKSPACE}/createandcopytofolder.sh"
```

last part of the script is called the git auto commit from mr stefanzweifel git

```
 # (4)
      - uses: stefanzweifel/git-auto-commit-action@v4
        with:
          commit_message: Commit the artifacts.
```

you can go check his github actions and dont forget to give him a star 😁

👉 next you need to commit and push it in github

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/2.png)

now check in your workflow you must have main.yml and the workflow will not work yet because we need to
add the script createandcopytofolder.sh 

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/3.png)

👉 create the file and add the script

```
  #!/bin/bash
  [[ -d artifacts ]] && rm -r artifacts
  mkdir artifacts
  cp -R build/web artifacts
```

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/4.png)

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/5.png)

### 3. Setup amplify with github for deploy the flutter web app

👉 now you can jump to AWS Amplify to try powerful of click click automate 👽

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/6.png)

👉 Get start

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/7.png)

👉 choose Amplify Hosting

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/8.png)

👉 Github 

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/9.png)

👉 Authorize it with github

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/10.png)

👉 install & Authorize

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/11.png)

👉 select the branch in github that you chose to build and next

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/12.png)

👉 put `artifacts/web` (that's the folder which contain flutter web build after you do the commit)
👉 next
![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/13.png)

👉 this happen because I didn't commit anything after I've done configure github action so you can just
commit somthing so the github action will run and build flutter web to put in the folder

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/14.png)

👉 it will show the green tick once it is success

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/15.png)

👉 once it is success the error on aws that we saw earlier will be gone
👉 next you will see this page
👉 click the `Allow AWS Amplify to ...` (you know it 😅)

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/16.png)

👉 save and deploy

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/17.png)

👉 wait until it's done deploy

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/18.png)

Tada 🤩🍻🥳
you can find the link `https//developer...amplifyapp.com` that is the link to you application.

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/19.png)

### 4. configure custom domain in Domain management amplify

Last but not least, you might wanna add you domain to run your web application. well there are an other
powerful of click click

👉 On the left side be go to
👉 Domain management
👉 add domain
👉 just put you domain and save

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/20.png)

👉 let it process! you need to move to next step to make it work.

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/21.png)


now you need to go AWS Route 53 service
👉 Hosted Zones
👉 Create hosted zone


![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/23.png)

example you have abc.com
👉 put `abc.com` create


![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/24.png)

👉 you will see this name space which you need to add it one by one in your domain service provider 

```
ns-2018.awsdns-60.co.uk.
ns-1449.awsdns-53.org.
ns-643.awsdns-16.net.
ns-479.awsdns-59.com.
```

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/25.png)


👉 then go back to AWS Amplify
👉 Domain management
👉 Action
👉 view DNS Records
👉 follow the guideline

Note: the 2 step might need you do the forward domain in your domain service provider. please check in aws document you will found for sure (Godaddy/goodleDomain) 

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/26.png)

Yays deploy and domain configure success now it's up in the cloud 🚀🚀🚀

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/22.png)

Here is website with my domain 🥶🥶🥶

![alt text](https://github.com/kanchanproseth/cloud_portfolio_project/blob/develop/blogImages/27.png)

Thanks you so much for reading the whole part. I hope you enjoy and learn something new from this 🫶🫶🫶


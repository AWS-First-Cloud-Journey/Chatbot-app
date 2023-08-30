# Setup Guide

## Install Docker

Update your system and install Docker on your EC2 instance:

```bash
sudo yum update -y
sudo amazon-linux-extras install docker
sudo yum install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
docker info
```

## Install Docker Compose on EC2

Install Docker Compose by running the following commands:

```
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose version
```

## Install NPM on EC2
Install NVM and Node.js on your EC2 instance:

```
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts
node -e "console.log('Running Node.js ' + process.version)"
npm install -g npm@latest
npm install next@latest
npm install ai openai @huggingface/inference clsx lucide-react latest

```

## Build Docker Images

Create a file named input.txt and add the following content:

```
REGION="ap-southeast-1"
REPO_NAME="aws-fcj-repo"
ACCOUNT="XXXXXXXXXXX"
DOCKER_IMAGE="aws-fcj-chatbot-app"
```

## Custom Docker Run

Create and edit the docker-run.sh script:

```
vi docker-run.sh
```

## Run Docker Images and Push to ECR
Execute the following commands to run your Docker images and push them to Amazon ECR:

```
sudo su
chmod +x docker-run.sh
./docker-run.sh
```

## Test Docker Images
Test your Docker image by running a container and accessing it on port 3000:

```
docker run -p 3000:3000 aws-fcj-chatbot-app:latest
```

This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).



## Build Chatbot

Prerequisites: you have to create a Hugging Face token [here]()

Let go int the directory chatbot-app and create a new nextjs project

```bash
npx create-next-app@latest
```

Then install dependencies

```bash
npm install ai openai @huggingface/inference clsx lucide-react
```

Store your Hugging Face token in .env

```bash
OPENAI_API_KEY=xxxxxxxxx
```

The nextjs project has a project structure as below

```
|--chatbot-app
   |--app
      |--api
         |--route.ts
      |--global.css
      |--icons.tsx
      |--layout.tsx
      |--page.tsx
    |--public
    |--.env
    |--.eslintrc.json
    |--Dockerfile
    |--next.config.js
    |--package-lock.json
    |--package.json
    |--postcss.config.js
    |--tailwind.config.ts
    |--tsconfig.json
```

## Build and push an ECR image manulaly

There is a python script in /chatbot-app/docker-run.sh will

```bash
chmod +x docker-run.sh
./docker-run.sh
```

You can test this iamge locally

```bash
sudo docker run -p 3000:3000 $IMAGE_NAME
```


## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `app/page.tsx`. The page auto-updates as you edit the file.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.

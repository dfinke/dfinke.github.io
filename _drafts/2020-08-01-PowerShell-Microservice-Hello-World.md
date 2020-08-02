---
layout: post
title:  "PowerShell Microservice - Hello World"
date:   2020-08-01 09:00
comments: true
description: "PowerShell-Microservice-Hello-World"
categories:
    - PowerShell, Docker, Pode
tags:
    - PowerShell, Docker, Pode
---

Ever want to run some PowerShell tools (or deliver them to a customer) but don't want to all the setup, all the `Install-Module`, and then figure out how to kick it off?

Read on to see how Docker is the way to go.

## PowerShell Microservice

My GitHub Repo https://github.com/dfinke/PowerShellMicroservice, has a PowerShell script `StartPodeServer.ps1` which creates a web server that serves a PowerShell REST API running as a microservice in a Docker container.

It uses [Pode](https://github.com/Badgerati/Pode), a PowerShell module which is a Cross-Platform framework for creating web servers.

You can use the `docker build` command to pull and build all the right pieces from the repo and run it in an isolated container on your machine to check it out.

## Docker Desktop

All you need is Docker installed. I'm running Docker Desktop on Windows 10.

[Install Docker Desktop on Windows](https://docs.docker.com/docker-for-windows/install/#:~:text=Install%20Docker%20Desktop%20on%20Windows%20%F0%9F%94%97%201%20Double-click,complete%20dialog%20and%20launch%20the%20Docker%20Desktop%20application.
)

## Direct from GitHub

Build and run the Docker container straight from the repo. This is very compelling.

You setup your GitHub repo, create your `Dockerfile`, then you, your colleagues, and others can easily get to your latest implementation quickly and easily. This includes running it in an isolated environment, on the operating system you designate, and including modules/components you need to ship with your scripts.

Here are a few lines of PowerShell, using `Docker` commands to build and run the PowerShell Microservice on you local machine in an isolated container 

```powershell
$name = "powershellmicroservice"

docker build --tag $name https://github.com/dfinke/PowerShellMicroservice.git
docker run -d --name $name -p 8080:8080 $name

sleep 2 # give the container a chance to spin up

Invoke-RestMethod http://localhost:8080/ # Hello from PowerShell in Docker
```

The last line tests to see if you can hit the REST endpoint in the newly spun up container.

## How it should look

![](/images/posts/PowerShellMicroservice.png)

## What's running in Docker

List docker containers.

```powershell
docker ps -a
```

Should see this:

```
IMAGE                    COMMAND                  CREATED             STATUS              PORTS                    NAMES
powershellmicroservice   "pwsh -c 'cd /usr/sr…"   27 seconds ago      Up 23 seconds       0.0.0.0:8080->8080/tcp   powershellmicroservice
```

List docker images.

```powershell
docker image ls
```
Should see this:

```
REPOSITORY                           TAG                 IMAGE ID            CREATED             SIZE
powershellmicroservice               latest              39892971d389        2 minutes ago       305MB
mcr.microsoft.com/powershell         latest              eedb9e0d7e31        2 weeks ago         305MB
docker/desktop-storage-provisioner   v1.1                e704287ce753        4 months ago        41.8MB
docker/desktop-vpnkit-controller     v1.0                79da37e5a3aa        5 months ago        36.6MB
```

## Clean up

Now you can clean up what you "installed". Stop and remove the running container, and then remove the image you pulled from GitHub.

```powershell
docker stop powershellmicroservice # stop the powershellmicroservice container
docker rm powershellmicroservice   # remove the powershellmicroservice container
docker rmi powershellmicroservice  # remove the powershellmicroservice image
```

## Summary

This approach is a great way to provide early previews of code your building, and ensuring it doesn't pollute the target machines it is installed on. Then, the containers can be removed as well as the images, considerably reducing the amount of code needed for cleaning up what was delivered.

Another added bonus, the container can be run anywhere docker is installed. Now, your PowerShell "solutions" are even more portable.
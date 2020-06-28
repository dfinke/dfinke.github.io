---
layout: post
title:  "Hello from PowerShell in Docker"
date:   2020-06-28 09:00
comments: true
description: "Hello-from-PowerShell-in-Docker"
categories:
    - PowerShell, Docker, Pode
tags:
    - PowerShell, Docker, Pode
---

## PowerShell Microserice

A PowerShell REST API running as a microservice in a Docker container.

Plus, use PowerShell's Invoke-Build as continuous build to stop the container, rebuild the image, and then run the new container. Ready for testing.

## Direct from GitHub

Build and run Docker the container straight from the repo.

```powershell
$name = "powershellmicroservice"

docker build --tag $name https://github.com/dfinke/PowerShellMicroservice.git
docker run -d --name $name -p 8080:8080 powershellmicroservice

sleep 2 # give the container a chance to spin up

Invoke-RestMethod http://localhost:8080/ # Hello from PowerShell in Docker
```

## How it should look

![](/images/posts/PowerShellMicroservice.png)
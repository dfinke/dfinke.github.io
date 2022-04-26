---
layout: post
title:  Track YouTube Statistics with PowerShell
date:   2021-10-28 16:00
comments: true
description: "Track-YouTube-Statistics-with-PowerShell"
categories:
    - PowerShell, YouTube, GitHub Actions
tags:
    - PowerShell, YouTube, GitHub Actions
---

This article shows you how to track the number of views, likes, and comments on a YouTube video, or playlist and update and Excel spreadsheet with the latest results. Plus, it runs every day on a schedule.

Technology used:

- PowerShell Excel integration module (`ImportExcel.psm1`)
- YouTube API
- GitHub Actions

1. Fork the repository
1. Get a YouTube API key https://developers.google.com/youtube/v3/getting-started
1. Create a `secret` for the YouTube API Key on the GitHub Repo - [Create a Secret](https://github.com/Azure/actions-workflow-samples/blob/master/assets/create-secrets-for-GitHub-workflows.md#:~:text=Creating%20secrets%201%20On%20GitHub%2C%20navigate%20to%20the,value%20for%20your%20secret.%207%20Click%20Add%20secret.)
    - `GoogleApiKey` is the name of the secret
1. Update the `playlists.csv` file with the YouTube playlist IDs you want to track
1. Run the GitHub Action workflow. After it runs, it will create a new Excel file with the results and check it back into the repository.



<!-- # Get YouTube Video Stats on Your Channel Using GitHub Actions and PowerShell
# Track YouTube Video Stats on Your Channel Using GitHub Actions and PowerShell
# Automate Tracking YouTube Video Stats on Your Channel Using GitHub Actions and PowerShell

Do you post videos on YouTube? Do you want to track your YouTube video stats? This one is for you!

You can fork this repository [here](TBD), and you'll be good to go.

Following is a walkthrough using GitHub Actions and PowerShell to automate tracking YouTube video stats and saving them to Excel, and putting it on a schedule to do it everyday.

I organize the NYC [PowerShell online meetup](https://www.meetup.com/NycPowershellMeetup/), and make the recordings available on [my YouTube channel](https://www.youtube.com/playlist?list=PL5uoqS92stXiRX67A85FyrXvtn71eTiWO). 

YouTube has a REST API that you can use to get the video stats, marry that with the PowerShell `Invoke-RestMethod` function and you can get the data you want.

These are the fields that I'm interested in for each video:

- Published
- Year
- Month
- MonthName
- Title
- ViewCount
- LikeCount
- DislikeCount
- FavoriteCount
- CommentCount

Running the PowerShell script every.

# PowerShell for the YouTube API

## Get-YouTubePlaylist

This function takes a YouTube playlist ID and returns a list of the videos in the playlist. If there are more than 50 videos in the playlist, it will loop until it retrieves them all.

```powershell
function Get-YouTubePlaylist {
    param(
        [Parameter(Mandatory)]
        [string]
        $playListId
    )

    do {
        $URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId={0}&maxResults=50&key={1}&pageToken={2}" -f $playListId, $GoogleApiKey, $nextPageToken
        $r = Invoke-RestMethod $URL
        $nextPageToken = $r.nextPageToken
        $r.items.snippet
    } until ($null -eq $nextPageToken)

}
```

## Get-YouTubeVideo

This function takes a YouTube video ID and returns the video stats.

```powershell
function Get-YouTubeVideo {
    param(
        [Parameter(ValueFromPipeline)]
        $YouTubeVideo
    )

    Process {
        $videoId = $YouTubeVideo.resourceId.videoId
        Write-Progress -Activity "Getting YouTube Stats - $($YouTubeVideo.channelTitle)" -Status "Processing video stats - $($YouTubeVideo.title)"
        $URL = "https://www.googleapis.com/youtube/v3/videos?id={0}&key={1}&part=snippet,contentDetails,statistics,status" -f $videoId, $GoogleApiKey
        
        $r = Invoke-RestMethod -uri $URL

        if ($r.items.count -gt 0) {
            $publishedAt = $r.items.snippet.publishedAt
        
            $publishedAt = (Get-Date $publishedAt).ToString("yyyy-MM-dd HH:mm:ss")
        
        
            $stats = $r.items.statistics
            [pscustomobject][Ordered]@{
                Published     = $publishedAt
                Year          = (Get-Date $publishedAt).Year
                Month         = (Get-Date $publishedAt).Month
                MonthName     = (Get-Date $publishedAt).ToString("MMM")
                Title         = $r.items.snippet.title
                ViewCount     = $stats.viewCount
                LikeCount     = $stats.likeCount
                DislikeCount  = $stats.dislikeCount
                FavoriteCount = $stats.favoriteCount
                CommentCount  = $stats.commentCount
                Url           = 'https://www.youtube.com/watch?v={0}' -f $videoId
            }
        }
    }    
}
```

# Saving the data to Excel

This snippet saves the data to an Excel file.

```powershell
Get-YouTubePlaylist $_.ID |
    Get-YouTubeVideo |
    Export-Excel -Path .\youTubeStats.xlsx -WorksheetName stats -AutoSize -AutoFilter
```

The PowerShell Excel module needs to be installed. `Get-Module -ListAvailable` will tell you if it's installed.

# YAML for the GitHub Action
# Google API Key for the YouTube automation
# Scheduling the job
# Checking in the Excel file
# Done, Done, and Done! -->
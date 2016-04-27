# Hey! Tweet Stream

* [Introduction](#introduction)
* [Setup](#setup)
* [Running](#running)
* [Screenshot](#screenshot)


## Introduction

This is a hastily written application to power a live tweet stream used during our [Hey!](https://heyst.ac) events.

It uses [Pusher](https://pusher.com) to stream tweets collected by a broker to a simple web client.


## Setup

To get things running you'll need to bundle your environment and define some env vars.

First bundle (the application currently uses Ruby 2.2.2):

```
bundle install
```

Then set your Pusher env vars:

```
PUSHER_URL=
PUSHER_PUBLIC_KEY=
```

As well as your Twitter credentials:

```
TWITTER_CONSUMER_KEY=
TWITTER_CONSUMER_SECRET=
TWITTER_ACCESS_TOKEN=
TWITTER_ACCESS_TOKEN_SECRET=
```

Finally you'll want to set the query to the hashtag you want to follow:

```
TWITTER_QUERY=#heyldf
```


## Running

To run the application, use Foreman:

```
bundle exec foreman start
```

This will start the broker used to stream tweets to the client as well as the Sinatra application.


## Screenshot

![Screenshot](http://wearest.ac/1fhF4+)

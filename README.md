iTunesSearch
============

A gem for searching iTunes.

Usage
=====

    @payload = ITunesSearch.new.search({ 
      :term => "Angry Birds", 
      :media => "software",
      :limit => 10,
      :offset => 0
    })


For full list of params see:
[Search API Documentation](http://www.apple.com/itunes/affiliates/resources/documentation/itunes-store-web-service-search-api.html#searching)


Test
====

    rspec spec
    
From the root directory of your application.
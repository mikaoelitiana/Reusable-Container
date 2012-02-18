Reusable Containers
===================


Main Concept
------------

This engine was created as because it is not that easy to use widespread Content Management System. End users still have to learn how to publish and organise their content. Most of the times it is Ok.

On the other hand, when the content is well structured, and when the end user does not really want to take care of the formatting and the content organisation, it becomes harder to use classic CMS.

Here 'Reusable Containers' come.


Publication System
------------------

End users know their contents. They just want them to be published.

Web developpers don't want to be called everytime their customers want to add a picture, or when the editor didn't close a tag ...

In classic CMS, new kind of content are managed with plugins. I used to try Drupal, Refinery, Joomla... None of them satisfied us. We just want our end users to fill forms, the way they know their contents and the system will take care of creating links, formatting and everything.


Structured Content
------------------

We want contents well structured in the database engine, as the publishers see them, we can publish them anywhere on the website.

i.e: a company website, publishers wants to:

* Say 'Welcome'
* Give an overview of their products and services
* Give an overview of how the company is structured
* Publish 'latests news'

In the database we will have these kind of contents:

* WelcomeText: name, title, subtitle, content, illustrations
* Product: name, title, short\_description, description, illustrations
* Service: name, title, short\_description, description
* Testimonial: name, ...
* NewsSnippet: ...

and so on...

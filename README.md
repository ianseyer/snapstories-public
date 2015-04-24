# snapstories API
An application to generate content and collect data onsite dynamically, via custom survey generation and collection.

This is the API repository. For the frontend, check out snapstories-spa.

# Technical Overview
This API RESTs on a Padrino backend. It uses mixed-persistence via PostGreSQL and MongoDB, laid out as such:
- PostGreSQL: Charities have Projects have Surveyors have Case Studies have
- MongoDB: Reports

# Documentation
Documentation is automatically generated via YARD. You can view it <here>.

# Installation
Install requirements.
```
bundle install
```

Then, deploy.
```
padrino start
```

Wow!
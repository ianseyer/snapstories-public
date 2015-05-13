# SnapStories API
An application to generate content and collect data onsite dynamically, via custom survey generation and collection.

This is the API repository. For the frontend, check out snapstories-spa.

# Technical Overview
This API RESTs on a Padrino backend. It uses mixed-persistence via PostGreSQL and MongoDB, laid out as such:
- PostGreSQL: Charities have Projects have Surveyors have Case Studies have
- MongoDB: Reports

Testing via RSpec.

Authentication is token-based, with encryption via BCrypt.

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

Note: In order to successfully request anything, you must authenticate. Send valid credentials to /auth/login and store the received API key. Include it in the header of your request as 'HTTP_ACCESS_TOKEN.' Note that your HTTP request library may automatically include the HTTP. Check and make sure you are not sending HTTP_HTTP_ACCESS_TOKEN.
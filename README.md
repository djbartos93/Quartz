# Quarts - Minecraft Whitelisting & Invites

Quartz is a ruby app written to pair with the [Sponge](https://spongepowered.org) [SQL-Whitelist plugin](https://github.com/fmohican/SQL-WhiteList) to automatically add registered users to the Minecraft whitelist.

# Features
- User signup and email verification
- Ability to use invite codes or open registration

# Requirements

- A Minecraft server
- A server to deploy this app on (can be the same as your Minecraft server)
- A MySQL database to link to
- For this app to actually do anything in minecraft you will need the [SQL-Whitelist plugin](https://github.com/fmohican/SQL-WhiteList)


### Signup Email Verification

Config info coming soon

### SSO Provider

This app has builtin SSO for a discourse forum. To use, change the name of disourse_sso_controler.rb.example to discourse_sso_controler.rb and edit the defaults

### Deployment

### Dev setup

To work on Quartz you need to run a few commands, I am assuming you already have ruby installed on your machine

1. npm install to download the theme
2. run rails active_storage:install (this may not be needed, but it wont hurt to run again)
3. bundle install
4. rake db:migrate
  1. to skip manually creating an admin user you can run rake db:seed to create the default admin user listed below
5. Launch the app with rails server
6. go to your-site-path/admin (if running locally localhost:3000/admin) and login, if you aren't using the seed, you will have to make an account and set admin to "1" in the database. if you are redirected, just go back to /admin
7. create your site! Name it whatever, put in the path and click create. When you do this and its done, stop the server.
8. rake 'comfy:cms_seeds:import[primary, primary]'

##### Default admin user if running rake db:seed


**NOTE! If you do run the seed command, you MUST change the email and password, they are stored in plain text in this repo. I am not responsible if you deply this app publicly and use the default admin credentials.**

Username/email: admin@example.com

password: admin1234

### Using Quartz without the built in CMS

If you dont need the Content managment and blog functionality of Quartz you can disable a few things and it will stay out of your way. First you will need to disable the CMS routes by commenting out the following lines in your app/routes.rb file.

`  comfy_route :blog_admin, path: "/admin"
  comfy_route :blog, path: "/blog"
  comfy_route :cms_admin, path: "/admin"`

`  comfy_route :cms, path: "/" `

You will also have to change your root path. again in app/routes.rb change `root to: 'comfy/cms/content#show'` to something else. I reccomend `root to: 'dashboard#index'`


# TODO
## Overall
- [ ] Write tests
- [ ] Create standard theme thats easy to modify
- [ ] make sure routes work right
- [x] create admin authorization
- [x] prevent users from seeing things they shouldnt
- [ ] when user account is disabled or deleted disable or delete Minecraft player from wihtelist database
## Whitelist
### Core
- [x] Validate players minecraft username
  - [x] Call uuid from Mojang and insert on player creation
- [ ] Make invite codes work
  - [ ] Create invalid invite page
- [ ] Create error pages
- [ ] Prevent users from inviting more players than they are allowed to
- [ ] Allow users to request more invites from an admin
  - [ ] Create request pages
  - [ ] Create request confirmation / deny actions (emails or alerts on the site?)
- [ ] allow admins to have unlimited invites
- [ ] prevent players from deleting used invites
- [ ] create minecraft player view
  - [ ] create invite tree view
### Style
- [ ] Finish styling login/signup pages
- [ ] Create user dashboard
- [ ] style player adding pages
## CMS
### Core
- [x] Create home page that doesnt require logins
- [x] Create settings page and settings
- [x] Create "blog/announcements"
- [x] Make posts pinnable to top of home page
- [x] Make static pages
  - [x] static page manager
- [x] Image and file upload
- [ ] Docs section (some kind of wiki like function)
- [ ] better minecraft server status on sidebar (that is easy to customize)

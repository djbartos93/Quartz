# Quarts - Minecraft Whitelisting & Invites

Quartz is a ruby app written to pair with the [Sponge](https://spongepowered.org) [SQL-Whitelist plugin](https://github.com/fmohican/SQL-WhiteList) to automatically add registered users to the Minecraft whitelist.

#Features
- User signup and email verification
- Ability to use invite codes or open registration

# Requirements

- A Minecraft server
- A server to deploy this app on (can be the same as your Minecraft server)
- A MySQL database to link to
- For this app to actually do anything in minecraft you will need the [SQL-Whitelist plugin](https://github.com/fmohican/SQL-WhiteList)

## Config & Deployment

### Signup Email Verification

Config info coming soon

### SSO Provider

This app has builtin SSO for a discourse forum. To use, change the name of disourse_sso_controler.rb.example to discourse_sso_controler.rb and edit the defaults

### Deployment


## Style development / css editing

We are using Bulma as our css framework. To customize you will need to run npm install, npm run watch when editing your theme and npm run build when preparing for deployment.
currently working on making this a less complex process.

# TODO
## Overall
- [ ] Write tests
- [ ] Create standard theme thats easy to modify
- [ ] make sure routes work right
- [ ] create admin authorization
- [ ] prevent users from seeing things they shouldnt
## Whitelist
### Core
- [ ] Validate players minecraft username
  - [ ] Call uuid from Mojang and insert on player creation
- [ ] Make invite codes work
  - [ ] Create invalid invite page
- [ ] Create error pages
- [ ] Prevent users from inviting more players than they are allowed to
- [ ] Allow users to request more invites from an admin
  - [ ] Create request pages
  - [ ] Create request confirmation / deny actions (emails or alerts on the site?)
### Style
- [ ] Finish styling login/signup pages
- [ ] Create user dashboard
- [ ] style player adding pages
## CMS
### Core
- [ ] Create home page that doesnt require logins
- [ ] Create settings page and settings
- [ ] Create "blog/announcements"
- [ ] Make posts pinnable to top of home page
- [ ] Make static pages
  - [ ] static page manager
- [ ] Image and file upload
- [ ] Docs section (some kind of wiki like function)

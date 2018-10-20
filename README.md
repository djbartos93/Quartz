# Quarts - Minecraft Whitelisting & Invites

Quartz is a ruby app written to pair with the [Sponge](https://spongepowered.org) [SQL-Whitelist plugin](https://github.com/fmohican/SQL-WhiteList) to automatically add registered users to the Minecraft whitelist.

#Features
- User signup and email verification
- Ability to use invite codes or open registration

# Requirements

For this app to actually do anything in minecraft

## Config & Deployment

### Signup Email Verification

Config info coming soon

### SSO Provider

This app has builtin SSO for a discourse forum. To use, change the name of disourse_sso_controler.rb.example to discourse_sso_controler.rb and edit the defaults

### Deployment


##Style development / css editing

We are using Bulma as our css framework. To customize you will need to run npm install, npm run watch when editing your theme and npm run build when preparing for deployment.

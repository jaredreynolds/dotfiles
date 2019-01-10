'use strict'

const orderedWhitelist = [
    'Activity Monitor',
    'Amazon Music',
    'Microsoft Outlook',
    'Slack',
    'Microsoft OneNote',
    'Google Chrome',
    'Firefox',
    'iTerm',
    'VirtualBox',
    'Visual Studio Code',
    'Microsoft Remote Desktop',
    'Postman'
]

const dockPlistPath = `${process.env.HOME}/Library/Preferences/com.apple.dock.plist`
const fs = require('fs')
const plist = require('simple-plist')

// read existing dock plist
const dock = plist.readFileSync(dockPlistPath)

// whitelist apps and assemble them in order
const orderedWhitelistedApps = Array(orderedWhitelist.length)
for (const app of dock['persistent-apps']) {
    const fileLabel = app['tile-data']['file-label']
    const index = orderedWhitelist.indexOf(fileLabel)
    if (index >= 0) {
        orderedWhitelistedApps[index] = app
    }
}

// replace the app list, excluding null apps
dock['persistent-apps'] = orderedWhitelistedApps.filter(app => app)

// backup and write out the new dock plist
fs.copyFileSync(dockPlistPath, `${dockPlistPath}.bak`)
plist.writeBinaryFileSync(dockPlistPath, dock)

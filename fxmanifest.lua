fx_version 'cerulean'
game 'gta5'

description 'TW-Template'
version '1.0.0'

shared_script {
    '@ox_lib/init.lua',
    'config.lua'
}

server_scripts {
    'server/main.lua'
}

client_script {
    'client/main.lua'
}

lua54 'yes'
use_fxv2_oal 'yes'

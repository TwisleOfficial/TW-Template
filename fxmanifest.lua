fx_version 'cerulean'
game 'gta5'

description 'TW-Template'
repository 'https://github.com/TwisleOfficial/TW-Template'
version '1.0.0'

--ox_lib 'locale'                         -- Not using ox_lib locales? Remove it!

shared_scripts {
    '@ox_lib/init.lua',                 -- Not using ox_lib? Remove it!
    --'@es_extended/imports.lua',         -- Not using esx framework? Remove it!
    --'@qb-core/shared/locale.lua',       -- Not using qb framework? Remove it!
    '@qbx_core/modules/lib.lua',        -- Not using qbx framework? Remove it!
    'config.lua'
}

server_scripts {
    --'@oxmysql/lib/MySQL.lua',           -- Not using Database? Remove it!
    'server/main.lua',
    'server/utils_qbx.lua',                 -- Not using qbx framework? Remove it!
    --'server/utils_qb.lua',                  -- Not using qb framework? Remove it!
    --'server/utils_esx.lua',                 -- Not using esx framework? Remove it!
}

client_scripts {
    'client/main.lua',
    'client/utils_qbx.lua',                 -- Not using qbx framework? Remove it!
    --'client/utils_qb.lua',                  -- Not using qb framework? Remove it!
    --'client/utils_esx.lua',                 -- Not using esx framework? Remove it!
}

--------- Not using ox_lib locales? Remove it!
-- files {
--     'locales/*.json',
-- }
----------------------------------------------

lua54 'yes'
use_experimental_fxv2_oal 'yes'

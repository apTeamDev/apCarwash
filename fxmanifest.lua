fx_version 'cerulean'
games { 'gta5' };

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua"
}

shared_scripts {
    'config.lua'
}

client_scripts {
    '@es_extended/locale.lua',
    'cl_carwash.lua',
    'locales/*.lua'
}

server_scripts {
    '@es_extended/locale.lua',
	'sv_carwash.lua',
    'locales/*.lua',
}
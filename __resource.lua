resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'GTAPDrp Money Laundry'

version '0.0.1'

server_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'server/main.lua'
}

client_scripts {
	'@es_extended/locale.lua',
	'locales/en.lua',
	'config.lua',
	'client/main.lua'
}

ui_page 'html/main.html'

files {
	'html/main.html',
	'html/pricedown.ttf',
	'html/cursor.png'
}

fx_version 'adamant'

game 'gta5'

description 'Supportbefehl by Grewo  -  Admin-Kleidung über Befehl.'

version '1.0.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server/main.lua',
	'de.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/main.lua',
	'de.lua',
}

dependency {
	'es_extended'
}

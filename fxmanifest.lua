fx_version 'adamant'

game 'gta5'

description 'Teamcommand by Grewo  -  Change Team-Clothes with command.'

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'config.lua',
	'server/server.lua',
	'de.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'config.lua',
	'client/client.lua',
	'de.lua',
}

dependency {
	'es_extended'
}

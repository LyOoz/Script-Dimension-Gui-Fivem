fx_version 'adamant' 
game 'gta5' 

ui_page "html/index.html"

files {
    'html/index.html',
    'html/script.js',
    'html/img/*.png',
    'html/style.css*'
}

client_scripts { 
    "config.lua",
	"client.lua" 
} 
 
server_scripts { 
	"server.lua" 
} 

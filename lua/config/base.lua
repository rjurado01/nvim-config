-- Basic settings

-- vim.g.mapleader = ' '

-- muestra los números a la izquierda
vim.wo.number = true

-- número de espacios que representa un tabulador 
vim.opt.tabstop = 2
-- cuántos espacios se usarán para las operaciones de indentación
vim.opt.shiftwidth = 2
-- reemplaza las tabulaciones (caracteres de tabulación \t) por espacios
vim.opt.expandtab = true
-- cantidad de espacios para la tabulación en modo de inserción
vim.bo.softtabstop = 2
-- ajustar el número de espacios de indentación
vim.opt.shiftround = true

-- Deshabilitar la compatibilidad con vi
vim.opt.compatible = false

-- Activar la auto-indentación
vim.opt.autoindent = true

-- Corregir el comportamiento de la tecla de retroceso
vim.opt.backspace = { 'indent', 'eol', 'start' }

-- Usar el portapapeles del sistema
vim.opt.clipboard = 'unnamedplus'

-- Mostrar una línea a los 100 caracteres
vim.opt.colorcolumn = '100'

-- Activar el resaltado de la línea actual
vim.opt.cursorline = true

-- Deshabilitar el estilo de cursor (para usar el predeterminado)
vim.opt.guicursor = ''

-- Resaltar los resultados de la búsqueda
vim.opt.hlsearch = true

-- Búsqueda incremental
vim.opt.incsearch = true

-- Activar el soporte para el ratón
vim.opt.mouse = 'a'

-- Deshabilitar la creación de archivos swap (.swp)
vim.opt.swapfile = false

-- Configurar la longitud máxima de línea para la sintaxis
vim.opt.synmaxcol = 300

-- Establecer el tamaño de las tabulaciones
vim.opt.tabstop = 2

-- Abrir el vsplit a la derecha
vim.opt.splitright = true

vim.o.background = "dark"

-- Deja siempre el hueco de los iconos a la izquierda
vim.opt.signcolumn = "yes"

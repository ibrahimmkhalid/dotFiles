At the time of this commit, the windows terminal cannot properly display icons from Nerd Font 3. Also at the time of this commit, WSL2 has native support for GUI applications. These applications do not have the same rendering issues as the main terminal.

Create a shortcut in windows with the folling target
`wscript "C:\path\to\gnome-terminal.vbs"`

from colorama import Fore, Style

gx = "  ,ad8888ba,  88888888888 888b      88 8b        d8\n\
 d8\"'    `\"8b 88          8888b     88  Y8,    ,8P   \n\
d8'           88          88 `8b    88   `8b  d8'   \n\
88            88aaaaa     88  `8b   88     Y88P     \n\
88      88888 88\"\"\"\"\"     88   `8b  88     d88b     \n\
Y8,        88 88          88    `8b 88   ,8P  Y8,   \n\
 Y8a.    .a88 88          88     `8888  d8'    `8b  \n\
  `\"Y88888P\"  88888888888 88      `888 8P        Y8\n"

gx_lines = gx.split('\n')

for i in range(len(gx_lines)):
    new_ln = Fore.GREEN + gx_lines[i][:39] + Fore.CYAN + gx_lines[i][39:] + Style.RESET_ALL
    gx_lines[i] = new_ln

new_gx = '\n'.join(gx_lines)
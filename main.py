import click
from util import new_gx


print(new_gx)
out = open('/home/justin/dummy.txt', 'w')
out.write(new_gx)
out.close()

value = click.prompt('Please enter a valid integer', type=int, default=1, show_default=True)
click.confirm('Do you want to continue?')
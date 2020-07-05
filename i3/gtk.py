#!/usr/bin/env python
import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk
 
 
win = Gtk.Window()
vb = Gtk.VBox()
tv = Gtk.TextView()
vb.add(tv)
win.show_all()
style = tv.get_style_context()
# bgcolor = style.get_background_color(Gtk.StateType.NORMAL) 
print(style)

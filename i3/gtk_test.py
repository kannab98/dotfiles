#!/usr/bin/env python

import gi
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk

# Create an empty style context
style_ctx = Gtk.StyleContext();

# Create an empty widget path
widget_path =  Gtk.WidgetPath();

# Specify the widget class type you want to get colors from
widget_path.append_type(Gtk.Button);
style_ctx.set_path(widget_path);

# Print style context colors of widget class Gtk.Button
print('Gtk.Button: Normal:')
print('foreground color: ', style_ctx.get_color(Gtk.StateFlags.NORMAL) )
print('color:            ', style_ctx.get_property('color', Gtk.StateFlags.NORMAL) )
print('background color: ', style_ctx.get_property('background-color', Gtk.StateFlags.NORMAL) )
print('outline color:    ', style_ctx.get_property('outline-color', Gtk.StateFlags.NORMAL) )

print('Gtk.Button: Link:')
print('foreground color: ', style_ctx.get_color(Gtk.StateFlags.LINK) )
print('color:            ', style_ctx.get_property('color', Gtk.StateFlags.LINK) )
print('background color: ', style_ctx.get_property('background-color', Gtk.StateFlags.LINK) )
print('outline color:    ', style_ctx.get_property('outline-color', Gtk.StateFlags.LINK) )

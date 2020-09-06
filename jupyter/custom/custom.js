// Turn off cursor blinking
var rate = 0;
// apply setting to  all current CodeMirror instances
IPython.notebook.get_cells().map(
    function(c) {  return c.code_mirror.options.cursorBlinkRate=rate;  }
);
// make sure new CodeMirror instance also use this setting
CodeMirror.defaults.cursorBlinkRate=rate;

// Remap jj to <Esc> in vim mode
require([
  'nbextensions/vim_binding/vim_binding',
], function() {
  CodeMirror.Vim.map("jk", "<Esc>", "insert");
  CodeMirror.Vim.map("kj", "<Esc>", "insert");
});

// Change cell to markdown with Ctrl-2 while
// in vim mode
require([
  'nbextensions/vim_binding/vim_binding',
  'base/js/namespace',
], function(vim_binding, ns) {
  // Add post callback
  vim_binding.on_ready_callbacks.push(function(){
    var km = ns.keyboard_manager;
    // Allow Ctrl-2 to change the cell mode into Markdown in Vim normal mode
    km.edit_shortcuts.add_shortcut('ctrl-2', 'vim-binding:change-cell-to-markdown', true);
    // Update Help
    km.edit_shortcuts.events.trigger('rebuild.QuickHelp');
  });
});

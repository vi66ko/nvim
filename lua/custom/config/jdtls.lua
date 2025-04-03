return {
  'mfussenegger/nvim-jdtls',
  ft = 'java', -- Load only for Java files
  config = function()
    local jdtls = require 'jdtls'
    local config = {
      -- Command to launch jdtls (Mason should handle the executable path)
      cmd = { vim.fn.expand '~/.local/share/nvim/mason/bin/jdtls' },
      -- Root directory detection (adjust as needed)
      root_dir = vim.fs.dirname(vim.fs.find({ '.git' }, { upward = true })[1]) or vim.fn.getcwd(),
      -- Settings for jdtls
      settings = {
        java = {
          project = {
            referencedLibraries = {
              '/usr/share/openjfx/lib/javafx.base.jar',
              '/usr/share/openjfx/lib/javafx.graphics.jar',
              '/usr/share/openjfx/lib/javafx.controls.jar',
              '/usr/share/openjfx/lib/javafx.fxml.jar',
              '/usr/share/openjfx/lib/javafx-swt.jar',
              '/usr/share/openjfx/lib/javafx.swing.jar',
              '/usr/share/openjfx/lib/javafx.media.jar',
              '/usr/share/openjfx/lib/javafx.web.jar',
              -- Add more JARs if needed, e.g., '/usr/share/openjfx/lib/javafx.media.jar'
            },
          },
        },
      },
    }
    -- Start or attach jdtls with this configuration
    jdtls.start_or_attach(config)
  end,
}

return {
  {
    -- Add neotest-pest plugin for running PHP tests.
    -- A package is also available for PHPUnit if needed.
    'nvim-neotest/neotest',
    dependencies = { 'nvim-neotest/nvim-nio', 'V13Axel/neotest-pest' },
    opts = { adapters = { 'neotest-pest' } },
  },
}

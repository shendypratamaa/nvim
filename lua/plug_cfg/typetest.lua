local type_ok, type = pcall(require, 'duckytype')

if not type_ok then
  return
end

local opts = {
  expected = 'english_common',
  number_of_words = 60,
  average_word_length = 6,
  window_config = {
    border = 'rounded',
  },
  highlight = {
    good = 'Comment',
    bad = 'Error',
    remaining = '',
  },
}

type.setup(opts)


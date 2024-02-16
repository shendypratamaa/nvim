local pantran_ok, pantran = pcall(require, 'pantran')

if not pantran_ok then
  return
end

local opts = {
  default_engine = 'google',
  engines = {
    google = {
      fallback = {
        default_source = 'en',
        default_target = 'id',
      },
    },
  },
}

pantran.setup(opts)


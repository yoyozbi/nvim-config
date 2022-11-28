local status, packer = pcall(require, "packer")
if (not status) then
    print("Packer is not installed")
    return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/nvim-cmp'
    use 'onsails/lspkind.nvim'
    use 'princejoogie/tailwind-highlight.nvim'
    use 'glepnir/lspsaga.nvim' -- LSP UIS
    use 'L3MON4D3/LuaSnip'

    --Prettier
    use 'jose-elias-alvarez/null-ls.nvim'
    use 'MunifTanjim/prettier.nvim'

    use 'windwp/nvim-autopairs'

    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    }

    use 'morhetz/gruvbox' --theme

    use 'nvim-lualine/lualine.nvim' -- status line

    -- file explorer
    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

    use {
        'wellle/context.vim',
        config = function()
            vim.g.context_enabled = 1
        end
    }
   use 'gelguy/wilder.nvim' --autocompletion for vim commands
   
   use {
        'nvim-telescope/telescope.nvim',
        requires = {"nvim-lua/plenary.nvim"}
   }

   use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
     })
end)

return {
	settings = {
		tsserver = {
			preferences = {
				importModuleSpecifierPreference = "relative", -- Customize import paths
				includeInlayParameterNameHints = "all", -- Show inlay hints for parameter names
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
}

-- LUALOCALS < ---------------------------------------------------------
local ItemStack, error, minetest, nodecore, pairs, type
    = ItemStack, error, minetest, nodecore, pairs, type
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()

-- ================================================================== --

minetest.register_node(modname .. ":cobble", {
		description = "Shiny Cobble",
		tiles = {modname .. ".png^nc_terrain_cobble.png"},
		color = "turquoise",
		groups = {
			cracky = 3,
			lux_absorb = 12,
			metallic = 1,
			adamant_cobble = 1
		},
		sounds = nodecore.sounds("nc_terrain_stony"),
		alternate_loose = {
			repack_level = 2,
			groups = {
				cracky = 0,
				crumbly = 2,
				falling_repose = 3,
				metallic = 1,
				adamant_cobble = 1
			},
			sounds = nodecore.sounds("nc_terrain_chompy")
		}
	})
	
-- ================================================================== --
	
minetest.register_node(modname .. ":block", {
		description = "Adamant Crystal",
		tiles = {modname .. ".png"},
		groups = {
			cracky = 4,
			lux_absorb = 12,
			metallic = 1,
			adamant_crystal = 1
		},
		sounds = nodecore.sounds("nc_optics_glassy")
	})

minetest.register_node(modname .. ":block_infused", {
		description = "Lambent Adamant Crystal",
		tiles = {modname .. ".png^(nc_lux_gravel.png^[opacity:25)"},
		groups = {
			cracky = 4,
			metallic = 1,
			lux_emit = 1
		},
		light_source = 1,
		sounds = nodecore.sounds("nc_optics_glassy")
	})

-- ================================================================== --

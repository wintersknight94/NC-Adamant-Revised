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
	
minetest.register_node(modname .. ":block", {
		description = "Adamant Crystal",
		tiles = {modname .. ".png"},
		groups = {
			cracky = 4,
			lux_absorb = 12,
			metallic = 1
		},
		sounds = nodecore.sounds("nc_optics_glassy")
	})

-- ================================================================== --

nodecore.register_craft({
		label = "heat adamant cobble",
		action = "cook",
		touchgroups = {lava = 3},
		duration = 30,
		cookfx = true,
		indexkeys = {"group:adamant_cobble"},
		nodes = {
			{
				match = {groups = {adamant_cobble = true}},
				replace = modname .. ":block"
			}
		}
	})
	
-- ================================================================== --	
	
nodecore.register_craft({
		label = "pack shiny rocks to cobble",
		action = "pummel",
		indexkeys = {modname .. ":ore"},
		nodes = {
			{
				match = {name = modname .. ":ore", count = 8},
				replace = modname .. ":cobble_loose"
			}
		},
		toolgroups = {thumpy = 3}
	})
nodecore.register_craft({
		label = "break shiny cobble to rocks",
		action = "pummel",
		indexkeys = {modname .. ":cobble_loose"},
		nodes = {
			{match = modname .. ":cobble_loose", replace = "air"}
		},
		items = {
			{name = modname .. ":ore", count = 8, scatter = 5}
		},
		toolgroups = {cracky = 2},
		itemscatter = 5
	})
	
-- ================================================================== --	

nodecore.register_craft({
		label = "crack crystal to shards",
		action = "pummel",
		indexkeys = {modname .. ":block"},
		nodes = {
			{match = modname .. ":block", replace = "air"}
		},
		items = {
			{name = modname .. ":shard", count = 4, scatter = 5}
		},
		toolgroups = {cracky = 4},
		itemscatter = 5
	})

-- ================================================================== --	



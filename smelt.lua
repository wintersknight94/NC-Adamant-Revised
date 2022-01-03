-- LUALOCALS < ---------------------------------------------------------
local ItemStack, error, minetest, nodecore, pairs, type
    = ItemStack, error, minetest, nodecore, pairs, type
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()

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
		toolgroups = {cracky = 4, thumpy = 5},
		itemscatter = 5
	})
nodecore.register_craft({
		label = "crack infused crystal to shards",
		action = "pummel",
		indexkeys = {modname .. ":block_infused"},
		nodes = {
			{match = modname .. ":block_infused", replace = "air"}
		},
		items = {
			{name = modname .. ":shard_infused", count = 4, scatter = 9}
		},
		toolgroups = {cracky = 3, thumpy = 4},
		itemscatter = 9
	})

-- ================================================================== --	



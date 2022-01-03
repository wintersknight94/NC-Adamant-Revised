-- LUALOCALS < ---------------------------------------------------------
local ItemStack, minetest, nodecore
    = ItemStack, minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()

-- ================================================================== --

minetest.register_craftitem(modname..":ore", {
	description = "Shiny Rock",
	inventory_image = "nc_stonework_stone.png",
	wield_image = "nc_stonework_stone.png",
	wield_scale = {x = 1.25, y = 1.25, z = 1.75},
	sounds = nodecore.sounds("nc_terrain_stony"),
	color = "turquoise",
	groups = {
		cracky = 1,
		adamanty = 1,
		metallic = 1,
		shiny_rock = 1
		}
})

minetest.register_craftitem(modname..":shard", {
	description = "Adamant Shard",
	inventory_image = modname .. "_shard.png",
	wield_image = modname .. "_shard.png",
	wield_scale = {x = 1.25, y = 1.25, z = 1.75},
	sounds = nodecore.sounds("nc_optics_glassy"),
	groups = {
		cracky = 1,
		metallic = 1,
		shiny_rock = 1
		}
})

-- ================================================================== --
minetest.override_item("nc_lode:ore", {drop = {items={{items={modname..":ore"},rarity=10}}}})
-- ================================================================== --

minetest.register_craftitem(modname..":shard_infused", {
	description = "Infused Adamant Shard",
	inventory_image = modname .. "_shard.png^(nc_lux_gravel.png^[opacity:75)",
	wield_image = modname .. "_shard.png^(nc_lux_gravel.png^[opacity:75)",
	wield_scale = {x = 1.25, y = 1.25, z = 1.75},
	sounds = nodecore.sounds("nc_optics_glassy"),
	groups = {
		cracky = 1,
		adamanty = 1,
		metallic = 1,
		lux_emit = 1,
		shiny_rock = 1
		},
	light_source = 1
})


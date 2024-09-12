-- LUALOCALS < ---------------------------------------------------------
local ItemStack, minetest, nodecore
    = ItemStack, minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
local shiny = "nc_stonework_stone.png^[colorize:#40e0d0:60" --TURQUOISE
--local shiny = modname.. "_shard.png"
-- ================================================================== --
minetest.register_alias(modname.. ":shard",			"wc_crystals:adamant_crystal")
minetest.register_alias(modname.. ":shard_infused",	"wc_crystals:luxite_crystal")
-- ================================================================== --
minetest.register_craftitem(modname..":ore", {
	description = "Adamantine Chip",
	inventory_image = shiny,
	wield_image = shiny,
	wield_scale = {x = 1.25, y = 1.25, z = 1.75},
	sounds = nodecore.sounds("nc_terrain_stony"),
	groups = {
		cracky = 1,
		adamanty = 1,
		shiny_rock = 1
	}
})
-- ================================================================== --
--minetest.override_item("nc_lode:ore", {drop = {items={{items={modname..":ore"},rarity=100}}}})
--minetest.override_item("nc_lux:stone", {drop = {items={{items={modname..":ore"},rarity=100}}}})
-- ================================================================== --


-- LUALOCALS < ---------------------------------------------------------
local ItemStack, error, minetest, nodecore, pairs, type
    = ItemStack, error, minetest, nodecore, pairs, type
-- LUALOCALS > ---------------------------------------------------------
local modname = minetest.get_current_modname()
------------------------------------------------------------------------
local crystal = "wc_crystals.png^[colorize:#40e0d0:120"
local adamant = "nc_terrain_stone.png^[colorize:#40e0d0:60"
-- ================================================================== --
minetest.register_node(modname .. ":stone", {
	description = "Raw Adamantine",
	tiles = {adamant},	--TURQUOISE
--	drawtype = "glasslike",
--	use_texture_alpha = "blend",
--	paramtype = "light",
	groups = {
		cracky = 6,
		lux_absorb = 24,
		adamant = 1,
		adamant_stone = 1
	},
	sounds = nodecore.sounds("nc_optics_glassy"),
	drop_in_place = modname.. ":cobble",
})
--<>----------------------------------------------------------------<>--
minetest.register_node(modname .. ":cobble", {
	description = "Adamantine Cobble",
	tiles = {crystal.. "^(nc_terrain_cobble.png^[colorize:#40e0d0:60)"},
	drawtype = "allfaces_optional",
	use_texture_alpha = "blend",
	paramtype = "light",
	groups = {
		cracky = 4,
		lux_absorb = 24,
		adamant = 1,
		adamant_cobble = 1
	},
	sounds = nodecore.sounds("nc_terrain_stony"),
	alternate_loose = {
		repack_level = 2,
		groups = {
			cracky = 0,
			crumbly = 4,
			falling_repose = 3,
--			adamant = 1,
--			adamant_cobble = 1
		},
		sounds = nodecore.sounds("nc_terrain_chompy")
	}
})
--<>----------------------------------------------------------------<>--
nodecore.register_stone_bricks("adamant", "Adamant",
	adamant,
	180, 80,
	modname .. ":stone",
	{cracky = 6},
	{
		cracky = 5,
		nc_door_scuff_opacity = 45,
		door_operate_sound_volume = 25
	}
)
-- ================================================================== --
minetest.register_alias(modname.. ":block",			"wc_crystals:adamant")
minetest.register_alias(modname.. ":block_infused",	"wc_crystals:luxite")
minetest.register_alias(modname.. ":shard",			"wc_crystals:adamant_crystal")
minetest.register_alias(modname.. ":shard_infused",	"wc_crystals:luxite_crystal")
-- ================================================================== --



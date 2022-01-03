-- LUALOCALS < ---------------------------------------------------------
local minetest, nodecore
    = minetest, nodecore
-- LUALOCALS > ---------------------------------------------------------

local modname = minetest.get_current_modname()

-- ================================================================== --

local function tooltip(name, group)
	local tool = modname .. ":tool_" .. name:lower() .. "_infused"
	local wood = "nc_woodwork:tool_" .. name:lower()
	minetest.register_tool(tool, {
			description = "Infused Adamant-Tipped " .. name,
			inventory_image = "nc_woodwork_tool_" .. name:lower() .. ".png^"
			.. modname .. "_tip_" .. name:lower() .. ".png^(nc_lux_gravel.png^[opacity:75)",
			tool_wears_to = wood,
			groups = {
				flammable = 2,
				metallic = 1,
				lux_emit = 1,
				lux_tool = 1
			},
			tool_capabilities = nodecore.toolcaps({
					uses = 0.01,
					[group] = 8
				}),
			on_ignite = modname .. ":shard",
			light_source = 1,
			sounds = nodecore.sounds("nc_optics_glassy")
		})
	nodecore.register_craft({
			label = "assemble " .. tool,
			action = "stackapply",
			wield = {name = modname .. ":shard_infused"},
			consumewield = 1,
			indexkeys = {wood},
			nodes = {{match = wood, replace = "air"}},
			items = {tool}
		})
end

tooltip("Mallet", "thumpy")
tooltip("Spade", "crumbly")
tooltip("Hatchet", "choppy")
tooltip("Pick", "cracky")

-- ================================================================== --

local adzedef
adzedef = {
	description = "Infused Adamant-Tipped Adze",
	inventory_image = "nc_woodwork_adze.png^" .. modname .. "_tip_adze.png^(nc_lux_gravel.png^[opacity:75)",
	groups = {
		flammable = 2,
		metallic = 1,
		lux_emit = 1,
		lux_tool = 1
	},
	tool_capabilities = nodecore.toolcaps({
			uses = 0.01,
			choppy = 6,
			crumbly = 7,
			cracky = 5,
		}),
	sounds = nodecore.sounds("nc_optics_glassy"),
	tool_wears_to = "nc_woodwork:adze",
	on_ignite = modname .. ":shard",
	light_source = 1
}
minetest.register_tool(modname .. ":adze_infused", adzedef)

nodecore.register_craft({
		label = "assemble adamant adze",
		action = "stackapply",
		wield = {name = modname .. ":shard_infused"},
		consumewield = 1,
		indexkeys = {"nc_woodwork:adze"},
		nodes = {
			{
				match = {
					name = "nc_woodwork:adze",
					wear = 0.05
				},
				replace = "air"
			},
		},
		items = {
			{name = modname .. ":adze_infused"}
		},
	})

-- ================================================================== --

nodecore.register_soaking_abm({
		label = "adamant infusion",
		fieldname = "adalux",
		interval = 10,
		nodenames = {"group:adamant_crystal"},
		arealoaded = 14,
		soakrate = nodecore.lux_soak_rate,
		soakcheck = function(data, pos)
			if data.total < 5000 then return end 
			nodecore.set_loud(pos, {name = modname .. ":block_infused"})
		end
	})

-- ================================================================== --


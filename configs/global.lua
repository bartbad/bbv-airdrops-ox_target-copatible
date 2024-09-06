Global = {}

Global.Settings = {
    Enabled = false,
    Time = 30, -- How often the global event will happen (in minutes)
    Positions = {
        vector3(1294.24, 1438.71, 99.82),
        vector3(1528.0, 1722.59, 109.95)
    },
    Rewards = {
        [1] = { -- if you leave only 1 reward it will aways give that reward if you add more it will chose at random ( you can add as much as you want)
            'scrapmetal',
            'garbage',
        },
        [2] = {
            'scrapmetal',
            'garbage',
        }
        -- Random3 = {
        --     'weapon_pistol',
        --     'weapon_heavypistol'
        -- }
        -- Random4 = {
        --     'weapon_pistol',
        --     'weapon_heavypistol'
        -- }
        -- Random5 = {
        --     'weapon_pistol',
        --     'weapon_heavypistol'
        -- }
    }
}
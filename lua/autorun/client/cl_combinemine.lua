local mat = Material("sprites/glow04_noz")

hook.Add("PostDrawOpaqueRenderables", "LuaCombineMineReplacementSprite", function()
    for k, v in ipairs(ents.FindByClass("combine_mine")) do
        if !v:GetNWBool("light") then continue end

        local ang = v:GetAngles()
        local pos = v:GetPos() + ang:Up() * 10

        local color = v:GetNWVector("lightcolor", Vector(255, 0, 0)):ToColor()
        color.a = v:GetNWInt("lightalpha", 255)

        render.SetMaterial(mat)
        render.DrawSprite(pos, 18, 18, color)
    end
end)

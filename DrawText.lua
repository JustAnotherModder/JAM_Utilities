function JUtils.DrawTextTemplate(text,x,y,font,scale1,scale2,colour1,colour2,colour3,colour4,wrap1,wrap2,centre,outline,dropshadow1,dropshadow2,dropshadow3,dropshadow4,dropshadow5,edge1,edge2,edge3,edge4,edge5)
  return {
    text         =                    "",
    x            =                    -1,
    y            =                    -1,
    font         =  font         or    6,
    scale1       =  scale1       or  0.5,
    scale2       =  scale2       or  0.5,
    colour1      =  colour1      or  255,
    colour2      =  colour2      or  255,
    colour3      =  colour3      or  255,
    colour4      =  colour4      or  255,
    wrap1        =  wrap1        or  0.0,
    wrap2        =  wrap2        or  1.0,
    centre       =  ( type(centre) ~= "boolean" and true or centre ),
    outline      =  outline      or    1,
    dropshadow1  =  dropshadow1  or    2,
    dropshadow2  =  dropshadow2  or    0,
    dropshadow3  =  dropshadow3  or    0,
    dropshadow4  =  dropshadow4  or    0,
    dropshadow5  =  dropshadow5  or    0,
    edge1        =  edge1        or  255,
    edge2        =  edge2        or  255,
    edge3        =  edge3        or  255,
    edge4        =  edge4        or  255,
    edge5        =  edge5        or  255,
  }
end

function JUtils.DrawText(t)
  if not t or not t.text or t.text == "" or t.x == -1 or t.y == -1
  then return false
  end
  -- Setup Text
  SetTextFont (t.font)
  SetTextScale (t.scale1, t.scale2)
  SetTextColour (t.colour1,t.colour2,t.colour3,t.colour4)
  SetTextWrap (t.wrap1,t.wrap2)
  SetTextCentre (t.centre)
  SetTextOutline (t.outline)
  SetTextDropshadow (t.dropshadow1,t.dropshadow2,t.dropshadow3,t.dropshadow4,t.dropshadow5)
  SetTextEdge (t.edge1,t.edge2,t.edge3,t.edge4,t.edge5)
  SetTextEntry ("STRING")

  -- Draw Text
  AddTextComponentSubstringPlayerName (t.text)
  DrawText (t.x,t.y)
  return true
end
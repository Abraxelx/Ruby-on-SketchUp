mod = Sketchup.active_model # Open model
ent = mod.entities # All entities in model
sel = mod.selection # Current selection
@dizi = Array.new(53)
@view = mod.active_view
  
deger =0


  (0..51).each { |i|
    group = mod.active_entities.add_group
    yk = (i+1)*5
    yk2 = yk-5

    if i < 25
       deger = deger + 5
    elsif i < 35
       deger = deger + 3
    elsif i> 46
       deger = deger + 1
    else
       deger = deger + 2
    end
    orjin = Geom::Point3d.new(1, 1, yk2.cm)
    orjin1 = Geom::Point3d.new(1, 1, yk.cm)
    cember = group.entities.add_circle(orjin, Z_AXIS, (200-deger).cm, 6)
  #Baslangıc,Boyut,Yarıcap,Kacge7
    cember1 = group.entities.add_circle(orjin1, Z_AXIS, (200-deger).cm, 6)
    face = group.entities.add_face(cember)
    path = group.entities.add_edges(orjin,orjin1)
    face.back_material = [255,55,(250/(i+1)).round]
    face.followme(path)
    rot_angle = (i*5).degrees
    rot_transformation = Geom::Transformation.rotation(ORIGIN,Z_AXIS,rot_angle)
    group.transform!(rot_transformation)
    @dizi[i] = group
    
}

 for x in 0..10
  rot_transformation = Geom::Transformation.rotation([0,0,0], [0,0,1], (x*5).degrees)
  for y in 0..51
    @dizi[y].transformation *= rot_transformation
   
    end
    sleep 0.09
    @view.refresh
end


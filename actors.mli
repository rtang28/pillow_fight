module type Actors = sig

  (* invariant representing the types of girl *)
  type girl = Bloom | Soap | Margarinecup

  (* invariant representing the types of people *)
  type people = Professor| Girl

  (* invariant representing the types of furniture *)
  type furniture = Bed | Walls

  (* invariant representing the types of pillow *)
  type pillow = Regular | Hard | Repeating

  (* invariant representing the types of objects *)
  type obj = People | Furniture | Pillow

end
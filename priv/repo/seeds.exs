# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     JustGames.Repo.insert!(%JustGames.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

JustGames.Repo.insert!(%JustGames.User{
  name: "Brett Dudo",
  email: "brett@dudo.io",
  admin: true
})

JustGames.Repo.insert!(%JustGames.User{
  name: "Test User",
  email: "brett+test@dudo.io",
  admin: false
})

# Chess

area = JustGames.Repo.insert!(%JustGames.Area{
  name: "board",
  height: 100.0,
  width: 100.0,
  padding: 5.0,
  shape: "square"
})

set = JustGames.Repo.insert!(%JustGames.Set{
  name: "chess set",
})

game = JustGames.Repo.insert!(%JustGames.Game{
  name: "chess",
  min_players: 2,
  max_players: 2,
  area_id: area.id,
  set_id: set.id
})

Enum.map([6.25, 6.25+12.5, 6.25+25, 6.25+37.5, 6.25+50, 6.25+62.5, 6.25+75, 6.25+87.5], fn(x) ->
  Enum.map([6.25, 6.25+12.5, 6.25+25, 6.25+37.5, 6.25+50, 6.25+62.5, 6.25+75, 6.25+87.5], fn(y) ->
    JustGames.Repo.insert!(%JustGames.Space{
      game_id: game.id,
      name: "square",
      required: true,
      player: false,
      height: 12.5,
      width: 12.5,
      padding: 1.0,
      shape: "square",
      coordinates: "#{x} #{y}",
      anchor: "center",
      piece_swap: true
    })
  end)
end)

Enum.map(["white", "black"], fn(variant) ->
  JustGames.Repo.insert!(%JustGames.Space{
    game_id: game.id,
    name: variant,
    required: true,
    player: true,
    height: 12.5,
    width: 100.0,
    padding: 1.0,
    shape: "auto",
    coordinates: "auto",
    anchor: "center",
    piece_overlap: 0.5
  })
end)

Enum.map(["white", "black"], fn(variant) ->
  Enum.map(["rook", "knight", "bishop", "queen", "king", "bishop", "knight", "rook", "pawn", "pawn", "pawn", "pawn", "pawn", "pawn", "pawn", "pawn"], fn(piece) ->
    JustGames.Repo.insert!(%JustGames.Piece{
      set_id: set.id,
      name: piece,
      variant: variant,
    })
  end)
end)

# English Draughts (Checkers)

set = JustGames.Repo.insert!(%JustGames.Set{
  name: "english draught set"
})

game = JustGames.Repo.insert!(%JustGames.Game{
  name: "english draughts",
  min_players: 2,
  max_players: 2,
  area_id: area.id,
  set_id: set.id
})

Enum.map([6.25, 6.25+12.5, 6.25+25, 6.25+37.5, 6.25+50, 6.25+62.5, 6.25+75, 6.25+87.5], fn(x) ->
  Enum.map([6.25, 6.25+12.5, 6.25+25, 6.25+37.5, 6.25+50, 6.25+62.5, 6.25+75, 6.25+87.5], fn(y) ->
    JustGames.Repo.insert!(%JustGames.Space{
      game_id: game.id,
      name: "square",
      required: true,
      player: false,
      height: 12.5,
      width: 12.5,
      padding: 1.0,
      shape: "square",
      coordinates: "#{x} #{y}",
      anchor: "center",
      piece_reversible: true, # king
      piece_overlap: 0.9
    })
  end)
end)

Enum.map(["light", "dark"], fn(variant) ->
  JustGames.Repo.insert!(%JustGames.Space{
    game_id: game.id,
    name: "#{variant}",
    required: true,
    player: true,
    height: 12.5,
    width: 100.0,
    padding: 1.0,
    shape: "auto",
    coordinates: "auto",
    anchor: "center",
    piece_overlap: 0.5
  })
end)

Enum.map(["light", "dark"], fn(variant) ->
  Enum.map(["piece", "piece", "piece", "piece", "piece", "piece", "piece", "piece", "piece", "piece", "piece", "piece"], fn(piece) ->
    JustGames.Repo.insert!(%JustGames.Piece{
      set_id: set.id,
      name: piece,
      variant: variant,
    })
  end)
end)

# Euchre

area = JustGames.Repo.insert!(%JustGames.Area{
  name: "table",
  height: 100.0,
  width: 100.0,
  padding: 5.0,
  shape: "circle"
})

set = JustGames.Repo.insert!(%JustGames.Set{
  name: "euchre deck",
  pieces_random: true
})

game = JustGames.Repo.insert!(%JustGames.Game{
  name: "euchre",
  min_players: 4,
  max_players: 4,
  area_id: area.id,
  set_id: set.id
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "draw",
  required: true,
  secret: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "rectangle",
  coordinates: "auto",
  anchor: "center",
  piece_overlap: 0.99
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "discard",
  required: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "rectangle",
  coordinates: "auto",
  anchor: "center",
  piece_overlap: 1.0
})

Enum.map(["score", "score"], fn(name) ->
  JustGames.Repo.insert!(%JustGames.Space{
    game_id: game.id,
    name: name,
    required: true,
    height: 3.5,
    width: 2.5,
    padding: 1.0,
    shape: "square",
    coordinates: "auto",
    anchor: "center",
    piece_rotatable: true,
    piece_overlap: -1.0
  })
end)

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "hand",
  required: false,
  player: true,
  secret: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "auto",
  coordinates: "auto",
  anchor: "bottom",
  piece_organizable: true,
  piece_overlap: 0.9
})

Enum.map(["diamond", "club"], fn(variant) ->
  Enum.map(["ace", "king", "queen", "jack", "10", "9"], fn(piece) ->
    JustGames.Repo.insert!(%JustGames.Piece{
      set_id: set.id,
      name: piece,
      variant: variant,
    })
  end)
end)

Enum.map(["spade", "heart"], fn(variant) ->
  Enum.map(["ace", "king", "queen", "jack", "10", "9", "2", "3"], fn(piece) ->
    JustGames.Repo.insert!(%JustGames.Piece{
      set_id: set.id,
      name: piece,
      variant: variant,
    })
  end)
end)

# Texas Hold Em

set = JustGames.Repo.insert!(%JustGames.Set{
  name: "deck of cards",
  pieces_random: true
})

game = JustGames.Repo.insert!(%JustGames.Game{
  name: "texas hold em",
  min_players: 2,
  max_players: 22,
  area_id: area.id,
  set_id: set.id
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "dealer",
  required: true,
  secret: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "rectangle",
  coordinates: "auto",
  anchor: "center",
  piece_overlap: 0.99
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "discard",
  required: true,
  secret: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "rectangle",
  coordinates: "auto",
  anchor: "center",
  piece_overlap: 1.0
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "flop",
  required: true,
  height: 3.5,
  width: 7.5,
  padding: 1.0,
  shape: "rectangle",
  coordinates: "auto",
  anchor: "center",
  piece_reversible: true,
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "turn",
  required: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "rectangle",
  coordinates: "auto",
  anchor: "center",
  piece_reversible: true,
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "river",
  required: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "rectangle",
  coordinates: "auto",
  anchor: "center",
  piece_reversible: true,
})

JustGames.Repo.insert!(%JustGames.Space{
  game_id: game.id,
  name: "hand",
  required: false,
  player: true,
  secret: true,
  height: 3.5,
  width: 2.5,
  padding: 1.0,
  shape: "auto",
  coordinates: "auto",
  anchor: "bottom",
  piece_organizable: true,
  piece_overlap: 0.9
})

Enum.map(["diamond", "club", "spade", "heart"], fn(variant) ->
  Enum.map(["ace", "king", "queen", "jack", "10", "9", "8", "7", "6", "5", "4", "3", "2"], fn(piece) ->
    JustGames.Repo.insert!(%JustGames.Piece{
      set_id: set.id,
      name: piece,
      variant: variant,
    })
  end)
end)
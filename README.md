<div align="center">
    <picture>
      <img src="./doc/logo.svg">
    </picture>
</div>

# Intro
![Visitors](https://visitor-badge.laobi.icu/badge?page_id=sole.SuperSubScripts)

This pkg is used to convert real numbers or strings to **super**scripts and **sub**scripts. Note that some letters have no superscript or subscript in the Unicode format.

# Usage

Basically, we provide two simple APIs : `sub` and `super`.

## Converting from Integer

The two APIs support `base` kwarg

```julia
sub(s::Int; base=10) :: String
super(s::Int; base=10) :: String
```

see the example below

```julia
julia> "X" * sub(321) * "Y" * super(123)
"X₃₂₁Y¹²³"

julia> "X" * sub(5, base=2) * super(1990, base=16)
"X₁₀₁⁷ᶜ⁶"
```

## Converting from Float

The two APIs do NOT support `base` kwarg

```julia
sub(s::AbstracFloat) :: String
super(s::AbstracFloat) :: String
```

see the example below

```julia
julia> "X" * sub(3.21) * "Y" * super(12.3)
"X₃.₂₁Y¹².³"
```

## Converting from String

The two APIs do NOT support `base` kwarg either

```julia
sub(s::AbstracString) :: String
super(s::AbstracString) :: String
```

see the example below

```julia
julia> sub("abcdefghijklmnopqrstuvwxyz0123456789")
"ₐbcdₑfgₕᵢⱼₖₗₘₙₒₚqᵣₛₜᵤᵥwₓyz₀₁₂₃₄₅₆₇₈₉"

julia> super("abcdefghijklmnopqrstuvwxyz0123456789")
"ᵃᵇᶜᵈᵉᶠᵍʰⁱʲᵏˡᵐⁿᵒᵖqʳˢᵗᵘᵛʷˣʸᶻ⁰¹²³⁴⁵⁶⁷⁸⁹"

julia> super("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
  "ᴬᴮCᴰᴱFᴳᴴᴵᴶᴷᴸᴹᴺᴼᴾQᴿSᵀᵁⱽᵂXYZ"
```

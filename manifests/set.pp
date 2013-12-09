define limits::set (
  $limits_context = 'limits.conf',
  $domain,
  $item,
  $soft = undef,
  $hard = undef
) {
  if $soft {
    limits::entry { "${domain}-soft-${item}":
      limits_context  => $limits_context,
      domain          => $domain,
      type            => 'soft',
      item            => $item,
      value           => $soft,
    }
  }
  if $hard {
    limits::entry { "${domain}-hard-${item}":
      limits_context  => $limits_context,
      domain          => $domain,
      type            => 'hard',
      item            => $item,
      value           => $hard,
    }
  }
}

class limits (
  $config    = {},
  $use_hiera = false
) {

  if $use_hiera {
    $limits = hiera_hash('limits', $config)
  }
  else {
    $limits = $config
  }

  if $limits {
    create_resources( 'limits::domain', $limits )
  }
}

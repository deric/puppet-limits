class limits (
  $config    = undef,
  $use_hiera = false
) {

  if is_hash($limits) {
    create_resources( 'limits::domain', $limits )
  }
}

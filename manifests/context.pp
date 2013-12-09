define limits::file ( $config = undef, ) {
  $limits_context = {'limits_context' => $title }
  $merged_config = merge($config, $limits_context)
  create_resources( 'limits::domain', $merged_config )
}

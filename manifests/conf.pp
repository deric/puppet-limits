# From: https://projects.puppetlabs.com/projects/puppet/wiki/Puppet_Augeas
# Changes:
# - modified match to use 'size == 0' rather than 'size != 1'
# - avoid nested define
#
# Example:
#  limits::conf { 'wso2esb':
#    domain => "@mygroup",
#    type   => 'soft',
#    item   => 'nofile',
#    value  => '4096'
#  }
define limits::conf (
  $domain,
  $type,
  $item,
  $value
) {
  # guid of this entry
  $key = "${domain}/${type}/${item}"

  # augtool> match /files/etc/security/limits.conf/domain[.="root"][./type="hard" and ./item="nofile" and ./value="10000"]

  $context = '/files/etc/security/limits.conf'

  $path_list  = "domain[.=\"${domain}\"][./type=\"${type}\" and ./item=\"${item}\"]"
  $path_exact = "domain[.=\"${domain}\"][./type=\"${type}\" and ./item=\"${item}\" and ./value=\"${value}\"]"

  augeas { "limits_conf/${key}":
    context => $context,
    onlyif  => "match ${path_exact} size == 0",
    changes => [
      # remove all matching to the ${domain}, ${type}, ${item}, for any ${value}
      "rm ${path_list}",
      # insert new node at the end of tree
      "set domain[last()+1] ${domain}",
      # assign values to the new node
      "set domain[last()]/type ${type}",
      "set domain[last()]/item ${item}",
      "set domain[last()]/value ${value}",
    ],
  }
}

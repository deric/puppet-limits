# _Unmaintained_

I no longer use Puppet actively and this software has not been maintained for some time.

# puppet-limits

Puppet module to set entries in /etc/security/limits.d or as a special case
/etc/security/limits.conf

## limits

The recommended usage is to call it as a parameterised class passing in the configuration data as a hash - for example:
```ruby
    class { 'limits':
      config => {
        'limits.conf' => {
          'limits_domain' => '*',
          'nofile' => {
            soft => '2048',
            hard => '8192',
          },
          'nproc' => {
            soft => '20',
            hard => '20',
          },
        },
        '20_myuser_limits.conf' => {
          'limits_domain' => 'myuser',
          'nofile' => {
            soft => '4068',
            hard => '8192',
        },
        '10_mygroup_limits.conf' => {
          'limits_domain' => '@mygroup',
          'nproc' => {
            hard => '50',
          },
        },
      },
      use_hiera => false,
    }
```

The configuration can also be placed under a limits hash in hiera.  The limits module may now included in your puppet configuration:

    include limits

NOTE:  This is global in nature and *NOT* recommended.

Example hiera config:
```yaml
    limits:
      limits.conf:
        limits_domain: '*'
        nofile:
          soft: '2048'
          hard: '8192'
        nproc:
          soft: '20'
          hard: '20'
      20_myuser_limits.conf:
        limits_domain: 'myuser'
        nofile:
          soft: '4068'
          hard: '8192'
      10_mygroup_limits.conf:
        limits_domain: '@mygroup'
        nproc:
          hard: '50'
```
This example creates the following entries in /etc/security/limits.conf:
```bash
    * nofile soft 2048
    * nofile hard 8192
    myuser nofile soft 4068
    myuser nofile hard 8192
    * nproc soft 20
    * nproc hard 20
    @mygroup nproc hard 50
```
replacing any existing items in the same domain.

### Parameters

Each entry title is the file name - in examples above, 'limits.conf' refers to 
/etc/security/limits.conf while '20_myuser_limits.conf' refers to the file that will
be created in /etc/security/limits.d/.  

NOTE: The file names MUST have '.conf' appended to them or augeas will fail to write 
out the file.  Augeas appears to rely on the extension to determine which lens to use 
to parse the file.

For each file a domain must be specified via the limits_domain parameter.  For 
example '*' for all users, '@wheel' for members of the wheel group, 'root' for the 
root user etc.

For each domain there is one or more items: one of: 'core', 'data', 'fsize',
'memlock', 'nofile', 'rss', 'stack', 'cpu', 'nproc', 'as', 'maxlogins',
'maxsyslogins', 'priority', 'locks', 'sigpending', 'msqqueue', 'nice',
'rtprio'. 

For each item the following parameters are accepted:

   * *soft*: the item's soft limit. Optional.

   * *hard*: the item's hard limit. Optional.

See the limits.conf(5) man page for more information.

Implementation based on https://projects.puppetlabs.com/projects/puppet/wiki/Puppet_Augeas

### Credits

This module is based on the puppet limits module at https://github.com/erwbgy/puppet-limits.

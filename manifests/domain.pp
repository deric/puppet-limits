define limits::domain (
  $limits_domain  = undef,
  $as             = undef,
  $core           = undef,
  $cpu            = undef,
  $data           = undef,
  $fsize          = undef,
  $locks          = undef,
  $maxlogins      = undef,
  $maxsyslogins   = undef,
  $memlock        = undef,
  $msgqueue       = undef,
  $nice           = undef,
  $nofile         = undef,
  $nproc          = undef,
  $priority       = undef,
  $rss            = undef,
  $rtprio         = undef,
  $sigpending     = undef,
  $stack          = undef,
) {

  $limits_context = $title
  $domain = $limits_domain

  # core: limits the core file size (KB)
  if $core {
    limits::set{ "${domain}-core":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'core',
      soft            => $core[soft],
      hard            => $core[hard],
    }
  }

  # data: maximum data size (KB)
  if $data {
    limits::set{ "${domain}-data":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'data',
      soft            => $data[soft],
      hard            => $data[hard],
    }
  }

  # fsize: maximum filesize (KB)
  if $fsize {
    limits::set{ "${domain}-fsize":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'fsize',
      soft            => $fsize[soft],
      hard            => $fsize[hard],
    }
  }

  # memlock: maximum locked-in-memory address space (KB)
  if $memlock {
    limits::set{ "${domain}-memlock":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'memlock',
      soft            => $memlock[soft],
      hard            => $memlock[hard],
    }
  }

  # nofile: maximum number of open files
  if $nofile {
    limits::set{ "${domain}-nofile":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'nofile',
      soft            => $nofile[soft],
      hard            => $nofile[hard],
    }
  }

  # rss: maximum resident set size (KB) (Ignored in Linux 2.4.30 and higher)
  if $rss {
    limits::set{ "${domain}-rss":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'rss',
      soft            => $rss[soft],
      hard            => $rss[hard],
    }
  }

  # stack: maximum stack size (KB)
  if $stack {
    limits::set{ "${domain}-stack":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'stack',
      soft            => $stack[soft],
      hard            => $stack[hard],
    }
  }

  # cpu: maximum CPU time (minutes)
  if $cpu {
    limits::set{ "${domain}-cpu":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'cpu',
      soft            => $cpu[soft],
      hard            => $cpu[hard],
    }
  }

  # nproc: maximum number of processes
  if $nproc {
    limits::set{ "${domain}-nproc":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'nproc',
      soft            => $nproc[soft],
      hard            => $nproc[hard],
    }
  }

  # as: address space limit (KB)
  if $as {
    limits::set{ "${domain}-as":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'as',
      soft            => $as[soft],
      hard            => $as[hard],
    }
  }

  # maxlogins: maximum number of logins for this user except for this with uid=0
  if $maxlogins {
    limits::set{ "${domain}-maxlogins":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'maxlogins',
      soft            => $maxlogins[soft],
      hard            => $maxlogins[hard],
    }
  }

  # maxsyslogins: maximum number of all logins on system
  if $maxsyslogins {
    limits::set{ "${domain}-maxsyslogins":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'maxsyslogins',
      soft            => $maxsyslogins[soft],
      hard            => $maxsyslogins[hard],
    }
  }

  # priority: the priority to run user process with (negative values boost process priority)
  if $priority {
    limits::set{ "${domain}-priority":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'priority',
      soft            => $priority[soft],
      hard            => $priority[hard],
    }
  }

  # locks: maximum locked files (Linux 2.4 and higher)
  if $locks {
    limits::set{ "${domain}-locks":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'locks',
      soft            => $locks[soft],
      hard            => $locks[hard],
    }
  }

  # sigpending: maximum number of pending signals (Linux 2.6 and higher)
  if $sigpending {
    limits::set{ "${domain}-sigpending":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'sigpending',
      soft            => $sigpending[soft],
      hard            => $sigpending[hard],
    }
  }

  # msgqueue: maximum memory used by POSIX message queues (bytes) (Linux 2.6 and higher)
  if $msgqueue {
    limits::set{ "${domain}-msgqueue":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'msgqueue',
      soft            => $msgqueue[soft],
      hard            => $msgqueue[hard],
    }
  }

  # nice: maximum nice priority allowed to raise to (Linux 2.6.12 and higher) values: [-20,19]
  if $nice {
    limits::set{ "${domain}-nice":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'nice',
      soft            => $nice[soft],
      hard            => $nice[hard],
    }
  }

  # rtprio: maximum realtime priority allowed for non-privileged processes (Linux 2.6.12 and higher)
  if $rtprio {
    limits::set{ "${domain}-rtprio":
      limits_context  => $limits_context,
      domain          => $domain,
      item            => 'rtprio',
      soft            => $rtprio[soft],
      hard            => $rtprio[hard],
    }
  }
}

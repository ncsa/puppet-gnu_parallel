#
# @summary
#
# @example
#
# @param
class gnu_parallel {

    $pkglist = [
        'bzip2',
        'curl',
    ]
    ensure_packages( $pkglist )

    exec { 'install_gnu_parallel' :
        path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin',
        command => 'curl -S pi.dk/3/ | bash',
        creates => '/usr/local/bin/parallel',
        require => Package[ $pkglist ]
    }

    file { '/root/.parallel':
        ensure => 'directory',
        group  => '0',
        mode   => '0755',
    }

    file { '/root/.parallel/will-cite':
        ensure  => 'file',
        content => '{md5}d41d8cd98f00b204e9800998ecf8427e',
        group   => '0',
        mode    => '0644',
        owner   => '0',
    }

}

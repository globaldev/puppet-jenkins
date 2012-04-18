define jenkins::job($branches = ["*/master"], $gitrepo = "git@github.com:globaldev/${title}.git") {
  file { "/var/lib/jenkins/jobs/${name}":
    content => template("${module_name}/job.xml.erb"),
    owner   => jenkins,
    group   => jenkins,
    require => Class['jenkins::package'],
    ensure  => directory
  }

  file { "/var/lib/jenkins/jobs/${name}/config.xml":
    content => template("${module_name}/job.xml.erb"),
    owner   => jenkins,
    group   => jenkins,
    require => File["/var/lib/jenkins/jobs/${name}"],
    notify  => Service['jenkins'],
  }
}


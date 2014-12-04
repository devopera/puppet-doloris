define doloris::base (

  # class arguments
  # ---------------
  # setup defaults

  $user = 'web',
  $group = 'www-data',
  $repo_source = 'https://github.com/pulibrary/loris.git',
  $repo_path = '/var/www/git/github.com',
  $repo_provider = 'git',
  $appname = 'loris',
  $symlinkdir = '/home/web/',

  # end of class arguments
  # ----------------------
  # begin class

) {

  dorepos::getrepo { "doloris-loris-${title}" :
    source => $repo_source,
    user => $user,
    group => $group,
    path => $repo_path,
    provider => $repo_provider,
    appname => $appname,
    symlinkdir => $symlinkdir,
  }->
  
  exec { "doloris-loris-install-${title}" :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && cd ${repo_path}/${appname} && python2.7 setup.py install\"",
  }

}

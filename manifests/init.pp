class doloris (

  # class arguments
  # ---------------
  # setup defaults

  $user = 'web',

  # end of class arguments
  # ----------------------
  # begin class

) {

  if ! defined(Package['libjpeg-turbo']) {
    package { 'libjpeg-turbo' : ensure => present }
  }
  if ! defined(Package['libjpeg-turbo-devel']) {
    package { 'libjpeg-turbo-devel' : ensure => present }
  }
  if ! defined(Package['freetype']) {
    package { 'freetype' : ensure => present }
  }
  if ! defined(Package['freetype-devel']) {
    package { 'freetype-devel' : ensure => present }
  }
  if ! defined(Package['zlib-devel']) {
    package { 'zlib-devel' : ensure => present }
  }
  if ! defined(Package['libtiff-devel']) {
    package { 'libtiff-devel' : ensure => present }
  }

  # need LittleCMS

  # Additional instructions not yet implemented
  # https://github.com/pulibrary/loris/blob/development/doc/redhat-install.md
  # 
  # wget https://github.com/sul-dlss/Djatoka/raw/master/lib/Linux-x86-64/libkdu_v60R.so
  # wget https://github.com/sul-dlss/Djatoka/raw/master/bin/Linux-x86-64/kdu_expand
  # 
  # mv libkdu_v60R.so /usr/local/lib
  # mv kdu_expand /usr/local/bin
  # export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

  exec { 'doloris-install-pip-werkzeug' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && pip install --quiet Werkzeug\"",
  }
  exec { 'doloris-install-pip-pil' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && pip install --quiet PIL\"",
  }
  exec { 'doloris-install-pip-pillow' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && pip install --quiet Pillow\"",
  }
  exec { 'doloris-install-pip-configobj' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && pip install --quiet configobj\"",
  }
  exec { 'doloris-install-pip-requests' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && pip install --quiet requests\"",
  }
  exec { 'doloris-install-pip-mock' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && pip install --quiet mock\"",
  }
  exec { 'doloris-install-pip-responses' :
    path    => '/usr/bin:/bin:',
    command => "bash -c \"source /usr/local/pythonenv/galaxy/bin/activate && pip install --quiet responses\"",
  }

}

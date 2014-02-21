#!/bin/sh
SVN_URL=svn://svn.freebsd.org/base/releng/$(freebsd-version | cut -d - -f 1)

svn_update(){
  #if svn is not installed then install
  # pkg install devel/subversion
  if [ ! -d /usr/src/.svn ] ; then
    svn co' $SVN_URL '/usr/src
  fi
  svn update /usr/src
}


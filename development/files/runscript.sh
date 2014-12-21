#!/bin/sh
set -e

get_ip() {
  ip a show dev eth0 | grep "inet " | cut -d' ' -f 6 | cut -d'/' -f 1
}

cd $DNDTOOLS_DIR

echo updating requirements...
pip install -r requirements.txt

cd dndtools

if [ ! -f "dndproject/local.py" ]
then
  ln -s $DATA_DIR/local.py dndproject/local.py
fi

echo updating database...
python manage.py syncdb --all

echo ========================================================
echo 
echo Starting dndtools on http://$(get_ip):8000
echo 
echo ========================================================
python manage.py runserver $(get_ip):8000

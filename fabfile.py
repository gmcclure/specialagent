from fabric.api import *

env.hosts = ['gmcclure@specialagent.me']
APP_DIR   = '/srv/www/specialagent'

def deploy():
    with cd(APP_DIR):
        run('git pull')
        sudo('supervisorctl restart specialagent')

def check_invites():
    run('mysql -uroot -p --database=specialagent -e "select * from privatebeta_inviterequest;"')

def commit():
    local('git add .')
    local('git ci')
    local('git push origin master')

def gun_status():
    sudo('supervisorctl status')

every :reboot do
    command 'bin/delayed_job -n2 start'
end
export LD_LIBRARY_PATH=/usr/physics/torque/lib
while true ;do
    MINE=`qtop --brief`
    complex=`qtop --free complex`
    medphys=`qtop --free medphys`
    cmt=`qtop --free cmt`
    if [ -z $MINE ]
    then
        MINE=0;
    fi
    echo "^fg(white)$(hostname -s)  ^fg(green)Complex:^fg(gray)$complex ^fg(green)Medphys:^fg(gray)$medphys ^fg(green)Cmt:^fg(gray)$cmt ^fg(green)Mine:^fg(gray)$MINE"
    sleep 10
done

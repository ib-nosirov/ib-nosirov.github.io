for i in videos/*/*.html
do
        vim  -c ":%s/h2/h1/g" -c wq "$i"
done




#### process down log ####
# unzip down log
cd /Users/xuejiwang/Documents/dev/MusicBox/data/raw/
for f in *_down.log.tar.gz
do
 echo "Processing $f"
 tar -xvzf $f && mv *_down.log /Users/xuejiwang/Documents/dev/MusicBox/data/down/${f//".tar.gz"/""}
done

# append file_name to each row (will be used for date)
cd /Users/xuejiwang/Documents/dev/MusicBox/data/down/
for f in *.log
do
 echo "Processing $f"
 awk -v var="$f" '{print $0,"\t",substr(var,1,8)}' $f > ${f}.fn
done

# cat all log with filename to one file
cat *.log.fn > all_down_log
rm *.log
rm *.log.fn




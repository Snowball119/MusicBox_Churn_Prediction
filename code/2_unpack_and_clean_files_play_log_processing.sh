## working dir is src

#### process play log ####
# unzip play log
cd /Users/xuejiwang/Documents/dev/MusicBox/data/raw/
for f in *_play.log.tar.gz
do
 echo "Processing $f"
 tar -xvzf $f 
done

mv *_play.log /Users/xuejiwang/Documents/dev/MusicBox/data/play/

# append file_name to each row (will be used for date)
cd /Users/xuejiwang/Documents/dev/MusicBox/data/play/
for f in *.log
do
 echo "Processing $f"
 awk -v var="$f" '{print $0,"\t",substr(var,1,8)}' $f > ${f}.fn
done

# cat all log with filename to one file
cat *.log.fn > all_play_log
rm *.log
rm *.log.fn





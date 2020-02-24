#!/bin/bash
cd ~/cleaning-plan.vandud.beget.tech/public_html;


#previous

touch `pwd`/previous.html;
> `pwd`/previous.html;
cat `pwd`/header.prev | sed -e "s#Date#Для периода с <b>$(date -d "`date +%Y-%m-%d` - `expr $(date +%u) - 1` days - 7 days" +%d-%m-%Y)</b> по <b>$(date -d "`date +%Y-%m-%d` - `expr $(date +%u) - 1` days" +%d-%m-%Y)</b>#g" >> `pwd`/previous.html;

Location_nums=(`for i in {0..2}; do expr \( \( \( $(date +%W) % 3 \) + $i \) % 3 \) + 1; done`);

for position in {1..3};
do
	Name=$(sed -n ${position}p `pwd`/names);

	location_num=${Location_nums[`expr $position - 1`]};
	Location=$(sed -n ${location_num}p `pwd`/locations.prev);

	cat `pwd`/table | sed -e "s/Name/${Name}/g" | sed -e "s/Location/${Location}/g" >> `pwd`/previous.html;
done;

cat `pwd`/footer.prev >> `pwd`/previous.html;




# curent

touch `pwd`/index.html;
> `pwd`/index.html;
cat `pwd`/header | sed -e "s#Date#Для периода с <b>$(date -d "`date +%Y-%m-%d` - `expr $(date +%u) - 1` days" +%d-%m-%Y)</b> по <b>$(date -d "`date +%Y-%m-%d` - `expr $(date +%u) - 1` days + 7 days" +%d-%m-%Y)</b>#g" >> `pwd`/index.html;

Location_nums=(`for i in {0..2}; do expr \( \( \( $(date +%W) % 3 \) + $i \) % 3 \) + 1; done`);

for position in {1..3};
do
	Name=$(sed -n ${position}p `pwd`/names);

	location_num=${Location_nums[`expr $position - 1`]};
	Location=$(sed -n ${location_num}p `pwd`/locations);

	cat `pwd`/table | sed -e "s/Name/${Name}/g" | sed -e "s/Location/${Location}/g" >> `pwd`/index.html;
done;

cat `pwd`/footer >> `pwd`/index.html;




# next

touch `pwd`/next.html;
> `pwd`/next.html;
cat `pwd`/header.next | sed -e "s#Date#Для периода с <b>$(date -d "`date +%Y-%m-%d` - `expr $(date +%u) - 1` days + 7 days" +%d-%m-%Y)</b> по <b>$(date -d "`date +%Y-%m-%d` - `expr $(date +%u) - 1` days + 14 days" +%d-%m-%Y)</b>#g" >> `pwd`/next.html;

Location_nums=(`for i in {0..2}; do expr \( \( \( $(date +%W) % 3 \) + $i \) % 3 \) + 1; done`);

for position in {1..3};
do
	Name=$(sed -n ${position}p `pwd`/names);

	location_num=${Location_nums[`expr $position - 1`]};
	Location=$(sed -n ${location_num}p `pwd`/locations.next);

	cat `pwd`/table | sed -e "s/Name/${Name}/g" | sed -e "s/Location/${Location}/g" >> `pwd`/next.html;
done;

cat `pwd`/footer.next >> `pwd`/next.html;

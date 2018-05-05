import csv
import operator
import sys
import functools

fout = open('output/recmd.csv', 'w')
fout.close()

data = []
users = {}
movies = {}
occupation = {}
age = {}

def extract_categories(reader):
    global categories

    # making a copy of the fieldname list, instead of using the reference directly
    categories = list(reader.fieldnames)
    categories.remove('user_id')
    categories.remove('movie_id')
    categories.remove('rating')
    categories.remove('movie title')
    categories.remove('occupation')
    categories.remove('zip_code')
    categories.remove('unix_timestamp')
    categories.remove('release date')
    categories.remove('IMDb URL')

with open('input/recommending system.csv') as csvfile:
    reader = csv.DictReader(csvfile)
    extract_categories(reader)

    for row in reader:
        data.append(row)
        users[row['user_id']] = True
        movies[row['movie_id']]= row['movie title']
        occupation[row['user_id']]=row['occupation']
        age[row['user_id']]=row['age']

    for uid in users:
        #approach 1
        print(uid, 'begin')

        print('approch 1 begin')
        urows = [row for row in data if row['user_id'] == uid]
        crank = {}
        for cname in categories:
            ucrows = [row for row in urows if  == '1']
            if len(ucrows) == 0:
                continue
            ucrows = list(map(lambda x: float(x['rating']), ucrows))
            score = functools.reduce(lambda x, y: x + y, ucrows) / len(ucrows)
            crank[cname] = score
        ufavor = max(crank.items(), key=operator.itemgetter(1))[0]

        excrows = [row for row in data if row['user_id'] != uid and row[ufavor] == '1']
        mrank = {}
        for mid in movies:
            mrows = [row for row in excrows if row['movie_id'] == mid]
            if len(mrows) == 0:
                continue
            mrows = list(map(lambda x: float(x['rating']), mrows))
            score = functools.reduce(lambda x, y: x + y, mrows) / len(mrows)
            mrank[mid] = score
        sugmid = max(mrank.items(), key=operator.itemgetter(1))[0]
        mname = movies[sugmid]
        print('approch 1 end')

        #approach 2
        print('approch 2 begin')
        uoccupation = occupation[uid]
        excrows2 = [row for row in data if row['user_id'] != uid and row['occupation'] == uoccupation]
        mrank2 = {}
        for mid in movies:
            mrows2 = [row for row in excrows2 if row['movie_id'] == mid]
            if len(mrows2) == 0:
                continue
            mrows2 = list(map(lambda x: float(x['rating']), mrows2))
            score2 = functools.reduce(lambda x, y: x + y, mrows2) / len(mrows2)
            mrank2[mid] = score2
        sugmid2 = max(mrank2.items(), key=operator.itemgetter(1))[0]
        mname2 = movies[sugmid2]
        print('approch 2 end')

        #approach 3
        print('approch 3 begin')
        uage = age[uid]
        excrows3 = [row for row in data if row['user_id'] != uid and float(row['age']) >= (float(uage)-5) and float(row['age']) <= (float(uage)+5)]
        mrank3 = {}
        for mid in movies:
            mrows3 = [row for row in excrows3 if row['movie_id'] == mid]
            if len(mrows3) == 0:
                continue
            mrows3 = list(map(lambda x: float(x['rating']), mrows3))
            score3 = functools.reduce(lambda x, y: x + y, mrows3) / len(mrows3)
            mrank3[mid] = score3
        sugmid3 = max(mrank3.items(), key=operator.itemgetter(1))[0]
        mname3 = movies[sugmid3]
        print('approch 3 end')

        print(uid, 'end')

        #output
        fout = open('output/recmd.csv', 'a', newline='')
        w = csv.writer(fout)
        w.writerow([uid, sugmid, mname, sugmid2, mname2, sugmid3, mname3])
        fout.close()

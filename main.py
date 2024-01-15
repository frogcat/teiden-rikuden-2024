import os
import sys
import requests
from bs4 import BeautifulSoup


# 停電情報配下の HTML を取得して BeautifulSoup を返す
def fetch(filename):
    base = "https://www.rikuden.co.jp/nw/teiden/f2/now/"
    res = requests.get(base + filename)
    return BeautifulSoup(res.content, "html.parser")


# 全域の HTML を取得
soup = fetch("otj030.html")

# 更新日時をチェックし、すでに処理済みであれば終了
dist = "./docs/"
files = [s for s in os.listdir(dist) if ".csv" in s]

time = soup.select_one("div#time").get_text()
file = "".join(filter(str.isdigit, time)) + ".csv"

if file in files:
    print(f"The file {file} exists.")
    sys.exit(1)

# スクレイピング処理本体
table = []

for a in soup.select("tr.on-color"):
    for b in fetch(a.get("data-href")).select("tr.on-color"):
        s = fetch(b.get("data-href"))
        pref = s.select_one("div#AreaLocation>p>a:nth-of-type(4)").get_text()
        city = s.select_one("div#AreaLocation>p>span").get_text()
        for c in s.select("tr.cyoline"):
            td = [d.get_text().replace(",", "") for d in c.find_all("td")]
            code = c.get("class")[1]
            row = [td[1], code, pref, city, td[0], td[2], td[3], td[4], td[5]]
            table.append(",".join(row))

# 新規CSVの書き込み
with open(dist + file, "w") as f:
    f.write("\n".join(sorted(table)))
    f.write("\n")

# ファイルリストの書き込み
with open(dist + "files.txt", "w") as f:
    files.append(file)
    f.write("\n".join(sorted(files)))
    f.write("\n")

print(f"Wrote {file}")

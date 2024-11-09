# ログローテーション
sudo cat /var/log/nginx/access.log | alp ltsv -m "/users/\d+.json","/items/\d+.json","/new_items/\d+.json","/upload/.+.jpg","/transactions/\d+.png" --sort sum -r > ~/log/$(date +access.log-%m-%d-%H-%M -d "+9 hours")
sudo rm /var/log/nginx/access.log
sudo pt-query-digest /var/log/mysql/mysql-slow.log > ~/log/$(date +mysql-slow.log-%m-%d-%H-%M -d "+9 hours")
sudo rm /var/log/mysql/mysql-slow.log

# 再起動
sudo systemctl reload nginx
sudo systemctl restart mysql

# ベンチ
cd ~/bench
./bench -target-addr 127.0.0.1:443

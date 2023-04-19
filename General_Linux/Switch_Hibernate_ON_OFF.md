Turn OFF hibernate
```
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

Turn ON hibernate
```
sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

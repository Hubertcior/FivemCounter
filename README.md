### FivemCounter

Simple mod for FIVEM to add 1 to number and save it to database i make it public for someone who want learn NUI/database

## ✨ Features

- When you click F5 key the nui will show up


## 📚 Installation

-Create folder in [qb] and put all files into it.

-Open database and create database query 

```MySQL
CREATE TABLE IF NOT EXISTS player_counters (
    id INT AUTO_INCREMENT PRIMARY KEY,
    identifier VARCHAR(50) NOT NULL,
    count INT DEFAULT 0,
    UNIQUE(identifier)
);
```



## Supported frameworks

- [qbox](https://github.com/Qbox-project/qbx_core)


## Copyright

Copyright © 2024 Overextended <https://github.com/overextended>

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

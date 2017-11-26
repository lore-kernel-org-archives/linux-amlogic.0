From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 26 Nov 2017 17:40:53 +0100
Subject: [PATCH 0/4] meson i2c driver cleanups
Message-ID: <20171126164057.27728-1-b.galvani@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Some cleanups for the u-boot meson i2c driver.

Beniamino Galvani (4):
  i2c: meson: improve Kconfig description
  i2c: meson: reduce timeout
  i2c: meson: fix return codes on error
  i2c: meson: add some comments

 drivers/i2c/Kconfig     |  7 ++++++-
 drivers/i2c/meson_i2c.c | 31 ++++++++++++++++++++++---------
 2 files changed, 28 insertions(+), 10 deletions(-)

-- 
2.14.3

From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 22:51:23 +0100
Subject: [PATCH net-next 0/5] Realtek Ethernet PHY driver improvements
Message-ID: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

This series provides some small improvements and cleanups for the
Realtek Ethernet PHY driver.
None of the patches in this series should change any functionality.
The goal is to make the code a bit easier to read by:
- re-using the BIT and GENMASK macros (which makes it easier to compare
  the #defines in the kernel with the values from the datasheets)
- rename a #define from a generic name to a PHY-specific name since it's
  only used for one specific PHY
- logically group the register #defines and their register bit #defines
  together
- indentation cleanups
- removed some code duplicating for reading/writing registers on a
  Realtek specific "page"


Martin Blumenstingl (5):
  net: phy: realtek: use the BIT and GENMASK macros
  net: phy: realtek: rename RTL821x_INER_INIT to RTL8211B_INER_INIT
  net: phy: realtek: group all register bit #defines for RTL821x_INER
  net: phy: realtek: use the same indentation for all #defines
  net: phy: realtek: add utility functions to read/write page addresses

 drivers/net/phy/realtek.c | 116 ++++++++++++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 44 deletions(-)

-- 
2.15.1

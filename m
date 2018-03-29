From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 29 Mar 2018 16:24:06 +0200
Subject: [PATCH u-boot 3/3] phy: Add Amlogic Meson USB2 & USB3 Generic PHY
 drivers
In-Reply-To: <5e871c6b-d4b9-4765-607d-229a5fbfa0ec@denx.de>
References: <1522330940-25062-1-git-send-email-narmstrong@baylibre.com>
 <1522330940-25062-4-git-send-email-narmstrong@baylibre.com>
 <5e871c6b-d4b9-4765-607d-229a5fbfa0ec@denx.de>
Message-ID: <d6fa460a-2871-c6e5-f266-74648f337086@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 29/03/2018 15:54, Marek Vasut wrote:
> On 03/29/2018 03:42 PM, Neil Armstrong wrote:
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---
>>  drivers/phy/Kconfig          |   8 ++
>>  drivers/phy/Makefile         |   1 +
>>  drivers/phy/meson-gxl-usb2.c | 238 +++++++++++++++++++++++++++++++++++++++++++
>>  drivers/phy/meson-gxl-usb3.c | 201 ++++++++++++++++++++++++++++++++++++
>>  4 files changed, 448 insertions(+)
>>  create mode 100644 drivers/phy/meson-gxl-usb2.c
>>  create mode 100644 drivers/phy/meson-gxl-usb3.c
> 
> Commit message is missing, otherwise looks reasonable.
> 

OOps, will add in v2.

Thanks,
Neil

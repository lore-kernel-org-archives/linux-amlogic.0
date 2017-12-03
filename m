From: davem@davemloft.net (David Miller)
Date: Sun, 03 Dec 2017 09:38:31 -0500 (EST)
Subject: [PATCH net-next 0/5] Realtek Ethernet PHY driver improvements
In-Reply-To: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
Message-ID: <20171203.093831.1940811223427294065.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat,  2 Dec 2017 22:51:23 +0100

> This series provides some small improvements and cleanups for the
> Realtek Ethernet PHY driver.
> None of the patches in this series should change any functionality.
> The goal is to make the code a bit easier to read by:
> - re-using the BIT and GENMASK macros (which makes it easier to compare
>   the #defines in the kernel with the values from the datasheets)
> - rename a #define from a generic name to a PHY-specific name since it's
>   only used for one specific PHY
> - logically group the register #defines and their register bit #defines
>   together
> - indentation cleanups
> - removed some code duplicating for reading/writing registers on a
>   Realtek specific "page"

Series applied.

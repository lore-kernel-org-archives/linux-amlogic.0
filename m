From: andrew@lunn.ch (Andrew Lunn)
Date: Sun, 3 Dec 2017 04:29:47 +0100
Subject: [PATCH net-next 5/5] net: phy: realtek: add utility functions to
 read/write page addresses
In-Reply-To: <20171202215128.20202-6-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
 <20171202215128.20202-6-martin.blumenstingl@googlemail.com>
Message-ID: <20171203032947.GE21613@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Dec 02, 2017 at 10:51:28PM +0100, Martin Blumenstingl wrote:
> Realtek PHYs implement the concept of so-called "extension pages". The
> reason for this is probably because these PHYs expose more registers
> than available in the standard address range.
> After all read/write operations on such a page are done the driver
> should switch back to page 0 where the standard MII registers (such as
> MII_BMCR) are available.
> 
> When referring to such a register the datasheets of RTL8211E and
> RTL8211F always specify:
> - the page / "ext. page" which has to be written to RTL821x_PAGE_SELECT
> - an address (sometimes also called reg)
> 
> These new utility functions make the existing code easier to read since
> it removes some duplication (switching back to page 0 is done within the
> new helpers for example).
> 
> No functional changes are intended.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

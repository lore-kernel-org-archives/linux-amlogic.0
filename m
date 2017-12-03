From: andrew@lunn.ch (Andrew Lunn)
Date: Sun, 3 Dec 2017 04:24:57 +0100
Subject: [PATCH net-next 2/5] net: phy: realtek: rename RTL821x_INER_INIT
 to RTL8211B_INER_INIT
In-Reply-To: <20171202215128.20202-3-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
 <20171202215128.20202-3-martin.blumenstingl@googlemail.com>
Message-ID: <20171203032457.GB21613@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Dec 02, 2017 at 10:51:25PM +0100, Martin Blumenstingl wrote:
> This macro is only used by the RTL8211B code. RTL8211E and RTL8211F both
> use other bits to initialize the RTL821x_INER register.
> No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

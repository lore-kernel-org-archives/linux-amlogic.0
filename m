From: andrew@lunn.ch (Andrew Lunn)
Date: Sun, 3 Dec 2017 04:25:31 +0100
Subject: [PATCH net-next 3/5] net: phy: realtek: group all register bit
 #defines for RTL821x_INER
In-Reply-To: <20171202215128.20202-4-martin.blumenstingl@googlemail.com>
References: <20171202215128.20202-1-martin.blumenstingl@googlemail.com>
 <20171202215128.20202-4-martin.blumenstingl@googlemail.com>
Message-ID: <20171203032531.GC21613@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Dec 02, 2017 at 10:51:26PM +0100, Martin Blumenstingl wrote:
> This simply moves all register bit #defines which describe the (PHY
> specific) bits in the RTL821x_INER right below the RTL821x_INER register
> definition. This makes it easier to spot which registers and bits belong
> together.
> No functional changes.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

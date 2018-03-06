From: andrew@lunn.ch (Andrew Lunn)
Date: Tue, 6 Mar 2018 13:48:55 +0100
Subject: [PATCH net-next] net: phy: mdio-mux: slience probe defer error
In-Reply-To: <20180306111045.19315-1-jbrunet@baylibre.com>
References: <20180306111045.19315-1-jbrunet@baylibre.com>
Message-ID: <20180306124855.GC26143@lunn.ch>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Mar 06, 2018 at 12:10:45PM +0100, Jerome Brunet wrote:
> If we fail to register the mdio bus due to probe defer, we should not
> print an error message. Just be silent in this case.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

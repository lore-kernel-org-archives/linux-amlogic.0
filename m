From: davem@davemloft.net (David Miller)
Date: Wed, 07 Mar 2018 12:40:29 -0500 (EST)
Subject: [PATCH net-next] net: phy: mdio-mux: slience probe defer error
In-Reply-To: <20180306111045.19315-1-jbrunet@baylibre.com>
References: <20180306111045.19315-1-jbrunet@baylibre.com>
Message-ID: <20180307.124029.619020251426137855.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue,  6 Mar 2018 12:10:45 +0100

> If we fail to register the mdio bus due to probe defer, we should not
> print an error message. Just be silent in this case.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Applied, thanks Jerome.

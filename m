From: davem@davemloft.net (David Miller)
Date: Mon, 19 Feb 2018 11:27:00 -0500 (EST)
Subject: [net-next PATCH v1 0/3] dwmac-meson8b: small cleanup
In-Reply-To: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
References: <20180217140820.30257-1-martin.blumenstingl@googlemail.com>
Message-ID: <20180219.112700.346909623772944138.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 17 Feb 2018 15:08:17 +0100

> This is a follow-up to my previous series "dwmac-meson8b: clock fixes for
> Meson8b" from [0].
> during the review of that series it was found that the clock registration
> could be simplified. now that the previous series has landed we can start
> cleaning up the clock registration.
> 
> the goal of this series is to simplify the code in the dwmac-meson8b
> driver. no functional changes are intended.
> 
> I have tested this on my Khadas VIM2 (GXM SoC, with RGMII PHY) and my
> Endless Mini (EC-100, Meson8b SoC with RMII PHY, .dts support is not part
> of mainline yet). no problems were found.
> 
> 
> [0] http://lists.infradead.org/pipermail/linux-amlogic/2018-January/006143.html

Series applied, thank you very much.

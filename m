From: davem@davemloft.net (David Miller)
Date: Thu, 02 Feb 2017 22:01:38 -0500 (EST)
Subject: [PATCH] net: stmmac: add separate warning for PTP not being
 supported by HW
In-Reply-To: <0983485b-418d-5c9b-e94b-8f4edc9f13cf@gmail.com>
References: <0983485b-418d-5c9b-e94b-8f4edc9f13cf@gmail.com>
Message-ID: <20170202.220138.452126742272467066.davem@davemloft.net>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Wed, 1 Feb 2017 22:02:02 +0100

> Chips like Amlogic S905GXBB are supported by this driver but don't
> have support for PTP. Add a separate warning for missing HW support
> to differentiate it from other actual failures.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to net-netxt.

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DA5C3600C
	for <linux-amlogic@archiver.kernel.org>; Mon, 31 Mar 2025 23:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=du8zNy7R6ztu9sKThd0amg1LScYUJcuH30kgiqNK5kk=; b=UDHOdNbLut7Xm8
	eurml+sBw91QeeR/PWaFNb3moq5asw/falUEseXKptVfq6H/jKX24Wt9/GxqMr74xpUyWZ6VHt9i/
	AFagGz+xcQMBbgsSi0wScQc+r81zjp6Tx3IN8LGTFcDJwHSlXR9gRSlN/EsYAE8ejib3SiajdIIPh
	2edBMx4cL3r1cpFjuazVwmUrFk6fNt3WxXTvHNUYoaHXNcVqe6AM8FdIIpqSEHrwQJH5mf+WaNmMZ
	4BNDpZR9iS+O730DWK5X18UtsjxPC7vpHt2iRSKpZze1ze/8q+olOl29dECBBIX1d7DLdTQXv9aod
	mB4W7CyDqi48zN2ZELKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzP2c-00000001ciR-3Kdd;
	Mon, 31 Mar 2025 23:59:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzP2Z-00000001chm-33P5;
	Mon, 31 Mar 2025 23:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Tmf7ncwVgVWuyzc5cYxsbvgKOZsAU8DzNdzbOOmf17Q=; b=0ag+A0wE54kG5CVWg2YhBJ6RlV
	I/x442UnGC7ZGd93Z1rnW58RCtCT84L0GobDhQ+NLxS8FNx8AHd+93Sk1oHX0r/4EUL1NbNK4zTqo
	m6/ehJfUHcjXuongTsaAWX45rRvqV3yYKXF9IWZCLUDuZwhYJaFCxCkT8tClvAaCeQHPvNOuSPLJL
	+sSFaZciN7kWcwA0BIVGGB3mzUdlk3Hm1+o8putRYBxOD6UGLl0rvD0zJmer8oZv7DA/B41Ckd1gf
	aRmUDPr6wfvm+ulSWBJRYc0JZmZIRDW7INyPrO8O+EOoIxe73SCcgPzjQFOWvYx7GLT/cU1SVVbpg
	R5jE/4Sw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:58766)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tzP2P-000532-0j;
	Tue, 01 Apr 2025 00:59:29 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tzP2L-00027L-1g;
	Tue, 01 Apr 2025 00:59:25 +0100
Date: Tue, 1 Apr 2025 00:59:25 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Da Xue <da@lessconfused.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Da Xue <da@libre.computer>,
	Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jakub Kicinski <kuba@kernel.org>, linux-amlogic@lists.infradead.org,
	Paolo Abeni <pabeni@redhat.com>,
	"David S . Miller" <davem@davemloft.net>,
	linux-arm-kernel@lists.infradead.org,
	Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2] net: mdio: mux-meson-gxl: set 28th bit in eth_reg2
Message-ID: <Z-ssXdmRLYqKbyn6@shell.armlinux.org.uk>
References: <20250331074420.3443748-1-christianshewitt@gmail.com>
 <17cfc9e2-5920-42e9-b934-036351c5d8d2@lunn.ch>
 <Z-qeXK2BlCAR1M0F@shell.armlinux.org.uk>
 <CACdvmAijY=ovZBgwBFDBne5dJPHrReLTV6+1rJZRxxGm42fcMA@mail.gmail.com>
 <Z-r7c1bAHJK48xhD@shell.armlinux.org.uk>
 <CACdvmAhvh-+-yiATTqnzJCLthtr8uNpJqUrXQGs5MFJSHafkSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACdvmAhvh-+-yiATTqnzJCLthtr8uNpJqUrXQGs5MFJSHafkSQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_165939_764530_4081BDE1 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Mar 31, 2025 at 05:21:08PM -0400, Da Xue wrote:
> I found this on the zircon kernel:
> 
> #define REG2_ETH_REG2_REVERSED (1 << 28)
> 
> pregs->Write32(REG2_ETH_REG2_REVERSED | REG2_INTERNAL_PHY_ID, PER_ETH_REG2);
> 
> I can respin and call it that.

Which interface mode is being used, and what is the MAC connected to?

"Reversed" seems to imply that _this_ end is acting as a PHY rather
than the MAC in the link, so I think a bit more information (the above)
is needed to ensure that this is the correct solution.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

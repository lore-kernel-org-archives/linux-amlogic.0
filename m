Return-Path: <SRS0=tjuu=SO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8567BC10F0E
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 22:48:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FD520818
	for <linux-amlogic@archiver.kernel.org>; Fri, 12 Apr 2019 22:48:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="R/Sd6B3z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="pmLB+YYC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FD520818
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4OgAqykXv+L+3P4ycbdTS1A4WdAgntjSztb56Tl2vg=; b=R/Sd6B3zr+1+gV
	wNFelGet3+yyGR7/xgiuDc8wzI9GfVhnaAXU5BwfXQl6TEtXaidb0odNP3WhzGN0g0oJLZ23rW+NI
	lBs2xFJB514PGnbS7nWRoFAfJ4iFaAefgrRErhUe2aIJEzj2trb5AMUgKCkNY3biq+coNcEXI2eIT
	IDMnL6FfzIi1FerMXlZUtBTHnaA//nnckMt6Ldu8kU4DoWUzx1bKezB58RhY4pvuk1hnvVW2z6zdB
	xEnpyqnVS5AKx2Sj+oDQaZm7Y1TthdfpNxOz8Z7dfOqYhh4OQzOpIJx1/AkGyXl0l5LDIHOk4EInO
	T2DQqwL15W+bOm6stk3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hF4xg-00066j-P4; Fri, 12 Apr 2019 22:47:56 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hF4xY-000605-J8; Fri, 12 Apr 2019 22:47:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4kXStC1/UaczOsDGKWzaTeUwM8QKA/+z8X0T5IHyOuE=; b=pmLB+YYClKT8C2pMJzoBaPDgAJ
 quW+npiLF5ZWRRlCiOoeNoaL6TleQ8Zk8qEPb4hMjiWTJPC4naUzrrgxpvJoEonWE96Sw+SY3ssxD
 A9MGLyTW0FJ2O0V6195gCSvvTUUrse1/6rb3Rufgr4+I2qMBCwQqEF88/iKuLhRsJymE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hF4xN-0000ps-W4; Sat, 13 Apr 2019 00:47:38 +0200
Date: Sat, 13 Apr 2019 00:47:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 net-next] net: phy: switch drivers to use dynamic
 feature detection
Message-ID: <20190412224737.GA1004@lunn.ch>
References: <3179601a-c58d-4df3-5d90-eb3598d2827b@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3179601a-c58d-4df3-5d90-eb3598d2827b@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_154748_782778_BFE3415F 
X-CRM114-Status: UNSURE (   9.30  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Richard Cochran <richardcochran@gmail.com>, linux-rockchip@lists.infradead.org,
 netdev@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 David Miller <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, Apr 12, 2019 at 08:47:03PM +0200, Heiner Kallweit wrote:
> Recently genphy_read_abilities() has been added that dynamically detects
> clause 22 PHY abilities. I *think* this detection should work with all
> supported PHY's, at least for the ones with basic features sets, i.e.
> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
> features explicitly and rely on phylib feature detection.
> 
> I don't have access to most of these PHY's, therefore I'd appreciate
> regression testing.

Hi Heiner

I tested v1 on the following PHYs:

88E1510, 88E1540, 88E6390, KSZ8041, 88E1545

No obvious regressions.

Tested-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

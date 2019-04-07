Return-Path: <SRS0=pUon=SJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 569B5C10F0E
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 22:13:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A09B20863
	for <linux-amlogic@archiver.kernel.org>; Sun,  7 Apr 2019 22:13:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kP64gAG3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="c3Whm38b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A09B20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwAM8Os5xPLDpajNQ7MnK7oI4oP/kSsch8nm5Ubeah4=; b=kP64gAG3Banxat
	GMwl/95DjF7xMQFBEzMviVE7zsxdZAJjiE4eOjcrlvTZZh4tO+U5mhe30fDVFyO5mPOenrw8TdxRF
	N4hmiBOudLwWxnvCUdXAuaherYqo1h011ZIEH+fQkr3bovdjnSJtRt2luih716inkpiYrvl72HTHm
	5zYyLe2Ioi8XvNVnjUS0oZ/UsnuErC9Q82IHDTeoDoToDsNW5GOLIeb38q9e5hOS80CA9bCz6SsnZ
	N/WKT/ZGtPOR9cW1UhEkwpndjxn2YcXDCMAzAOK1W9rCAiaTp0PBz9qsvAWWjMomVcOZpunmWd0db
	KTJAyaYuMoWlcRxbKKJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDG2c-0008KB-Am; Sun, 07 Apr 2019 22:13:30 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDG2U-0008D5-Kl; Sun, 07 Apr 2019 22:13:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3AC1NtMrOrQDwqFwAlWdmE9xQ5W4eXqXLuBYhyoYvag=; b=c3Whm38bKuP7qTGx5dVvVFHHjx
 HIwM+ZAZ/sLQ8wXsc2OxFl9+OJBbkARMpkejsOAWFQbDJjqlhJrBguvuNz22RzqExXArIyZEFxn7c
 UY4leDjP7oBQcbWxBqjHSVuf07nIstPy2Ec/iPPBm1wlUM7UfidzCPEgfNfufC18EaJg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.89)
 (envelope-from <andrew@lunn.ch>)
 id 1hDG2K-0003oL-9V; Mon, 08 Apr 2019 00:13:12 +0200
Date: Mon, 8 Apr 2019 00:13:12 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic feature
 detection
Message-ID: <20190407221312.GA14347@lunn.ch>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190407_151322_838376_9798BB3C 
X-CRM114-Status: UNSURE (   8.92  )
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

On Sun, Apr 07, 2019 at 11:57:13AM +0200, Heiner Kallweit wrote:
> Recently genphy_read_abilities() has been added that dynamically detects
> clause 22 PHY abilities. I *think* this detection should work with all
> supported PHY's, at least for the ones with basic features sets, i.e.
> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
> features explicitly and rely on phylib feature detection.

Hi Heiner

We could make this a two step process, to avoid regressions. For one
cycle compare genphy_read_abilities() against .features and raise a
WARN_ON() if they differ. And keep using the .features value.

Then a release late, complete the swap removing .features and the
WARN_ON.

	Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

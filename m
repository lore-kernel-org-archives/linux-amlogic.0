Return-Path: <SRS0=Id+k=IX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AD5AC433DB
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E681619E4
	for <linux-amlogic@archiver.kernel.org>; Thu, 25 Mar 2021 13:04:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E681619E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=um9X4Eev2DuUAKBQO0R8NOCj1dByZ7rfiFQvMbCc/UY=; b=IWp59P6DIkqunb6U7Cwddm3D/
	qyhNEgwjnvcrYLzVMV7Jj07juH0z9xgszeTn+gfsk0Q+3WgI0n4kv2whHjL1oZm3YtUC1oYrYjwUx
	Z5j2je5tD8mPJ7WYN4qCvNZMcHGgbCM9LAjKVD842ESxxZDNr/xUzXC4jymW4dJ/jb77qca9/UBCJ
	hDFx1+AXQ7o55QRf9k3YLozetcLNRCeZeR8vigImL+9mhwr2qtzJ3C0G4aKJQvOqMolfyBc0eqYqx
	/n47hKzrKkHPMUklYC5j/bncqaKqc0PFoVv6iBT/fyLfmPK32ah58CmjPgwic7Gq7djil8yqZhLzt
	M4GZWx2Yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPPf0-001Sw3-2t; Thu, 25 Mar 2021 13:04:26 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPPcr-001SkI-E3; Thu, 25 Mar 2021 13:04:15 +0000
Received: from andrew by vps0.lunn.ch with local (Exim 4.94)
 (envelope-from <andrew@lunn.ch>)
 id 1lPPcl-00CxFH-2x; Thu, 25 Mar 2021 14:02:07 +0100
Date: Thu, 25 Mar 2021 14:02:07 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCHv1 0/6] Amlogic Soc - Add missing ethernet mdio compatible
 string
Message-ID: <YFyJz/Ql615FQz3I@lunn.ch>
References: <20210325124225.2760-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210325124225.2760-1-linux.amoon@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210325_130414_053387_49F0CAA9 
X-CRM114-Status: GOOD (  11.94  )
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

On Thu, Mar 25, 2021 at 12:42:19PM +0000, Anand Moon wrote:
> On most of the Amlogic SoC I observed that Ethernet would not get
> initialize when try to deploy the mainline kernel, earlier I tried to
> fix this issue with by setting ethernet reset but it did not resolve
> the issue see below.
> 	resets = <&reset RESET_ETHERNET>;
> 	reset-names = "stmmaceth";
> 
> After checking what was the missing with Rockchip SoC dts
> I tried to add this missing compatible string and then it
> started to working on my setup.

Adding

compatible = "ethernet-phy-ieee802.3-c22"

should not fix anything, since that is the default. We need to better
understand what is going on here.

	   Andrew

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

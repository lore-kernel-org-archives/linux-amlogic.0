Return-Path: <SRS0=wRYZ=SA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4680BC43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:49:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1692A217F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2019 22:49:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S0do8uqU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dMYvwXkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1692A217F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:To:Subject:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHwZLGlCFM1n46U26BNcNSjBS3lD96X7/7zhiEiDIA0=; b=S0do8uqUWBtRpz
	YhPhUvSucQ+O+4qkdFWbtAsvHztLfXYh2O1RiDHfxfx8bZkjT8a0UBf9Ldpnrc4EKuvniqx8v1C7t
	Kj/uqdTn7r94JQsIjcxNuav/M9uQAE7++0/lKo0rEI0vLg/nIWB2gm6J+CDyctzTH2PVTo/nTxhth
	HpoVH72AWBWm08FqeUpPOd+URfn2+63zdxWbHyAaaQfaXHHw6nEagRO35q9g4OuGk3O5gek96xwjM
	Kmhq1kYlpIx1Tl25ckN5AE1I1vXtlKxgXqFh+NOTv/FcCQ5s+TOtA5YZ8wYgAe+z7P8bSrE4wEx1z
	ghVEAw15Uafem4kd26eg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hA0JC-0007sD-FU; Fri, 29 Mar 2019 22:49:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hA0J9-0007rm-Fn
 for linux-amlogic@lists.infradead.org; Fri, 29 Mar 2019 22:49:08 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1C4C5217F5;
 Fri, 29 Mar 2019 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1553899747;
 bh=GV+izptyYmo+vlcN/98TyLqJg7ve6KpDouC2W+axdyM=;
 h=In-Reply-To:References:From:Subject:Cc:To:Date:From;
 b=dMYvwXkMfyAM1GROMXbRWYZQbjDTKyJjjdpqpEdabutrJ8ffqDwDkT0FH5AIIJvXs
 4VH4B9Zp9lp77IrvVs9+PbjmJHhMVDOBf5DcQrNA0pTLxirSMtOZfeLh18SvQsVDnx
 Bd0Io7raMqZFkpEOmmBgrnxRMaIIHHD6RMPcSd44=
MIME-Version: 1.0
In-Reply-To: <20190329141512.29867-3-jbrunet@baylibre.com>
References: <20190329141512.29867-1-jbrunet@baylibre.com>
 <20190329141512.29867-3-jbrunet@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: phy: add amlogic g12a mdio mux
 support
To: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>
Message-ID: <155389974643.20095.8059052762611235333@swboyd.mtv.corp.google.com>
User-Agent: alot/0.8
Date: Fri, 29 Mar 2019 15:49:06 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190329_154907_545635_40EB5FC7 
X-CRM114-Status: UNSURE (   5.36  )
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jerome Brunet (2019-03-29 07:15:11)
> Add support for the mdio mux and internal phy glue of the g12a SoC family
> 
> [for the clock part]
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

I think you should write it like:

Reviewed-by: Neil Armstrong <narmstrong@baylibre.com> # clk parts


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

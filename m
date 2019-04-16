Return-Path: <SRS0=v2ss=SS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F8E5C10F0E
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE6920830
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Apr 2019 00:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ebsas3kb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE6920830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uTePOPohGIoEP+oqsGBdesAxBgNLxu78wPNBrcM4c5U=; b=ebsas3kbSNVKyW
	H8d4v2IGX68rMp3YYWZqL1rLa0NFGou7WY7eF0z22XIr7BTe3u5Og0tDYW7D/bD7KNyy+vjtDJvcE
	DgsLSwjkfxcOlMyFWneaGU60GxOEjqPTnk/Gy/na0L/nbQlALWEvaWLLovbX/sjiBAM/Zr3WaCiGK
	OAa2aMtKfVQSYLNDIbgCgenePgo5nrRx5ED6fOuMHunPllPszzsWr4yqO+Crl2x4RJuyF55bkeQf0
	VUoPT/gtY/4h197NxAQXW+GZqxb0rHRtD9Nl56NWrgiNcjlRvF3cYzu0x4aGas9b59ADLZh5no6rr
	LRmXeVNGoWTGBAoIFi9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGBpv-0002Qo-7g; Tue, 16 Apr 2019 00:20:31 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGBpt-0002QE-2S; Tue, 16 Apr 2019 00:20:30 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 5960814E03FEC;
 Mon, 15 Apr 2019 17:20:21 -0700 (PDT)
Date: Mon, 15 Apr 2019 17:20:17 -0700 (PDT)
Message-Id: <20190415.172017.1299396646743801898.davem@davemloft.net>
To: hkallweit1@gmail.com
Subject: Re: [PATCH v2 net-next] net: phy: switch drivers to use dynamic
 feature detection
From: David Miller <davem@davemloft.net>
In-Reply-To: <3179601a-c58d-4df3-5d90-eb3598d2827b@gmail.com>
References: <3179601a-c58d-4df3-5d90-eb3598d2827b@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Mon, 15 Apr 2019 17:20:21 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190415_172029_117811_B9C2B582 
X-CRM114-Status: UNSURE (   7.34  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, heiko@sntech.de,
 sbranden@broadcom.com, khilman@baylibre.com, richardcochran@gmail.com,
 linux-rockchip@lists.infradead.org, netdev@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Heiner Kallweit <hkallweit1@gmail.com>
Date: Fri, 12 Apr 2019 20:47:03 +0200

> Recently genphy_read_abilities() has been added that dynamically detects
> clause 22 PHY abilities. I *think* this detection should work with all
> supported PHY's, at least for the ones with basic features sets, i.e.
> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
> features explicitly and rely on phylib feature detection.
> 
> I don't have access to most of these PHY's, therefore I'd appreciate
> regression testing.
> 
> v2:
> - make the feature constant a comment so that readers know which
>   features are supported by the respective PHY
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied, thanks Heiner.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=BQut=RS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8584C43381
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 22:34:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7AAB21019
	for <linux-amlogic@archiver.kernel.org>; Fri, 15 Mar 2019 22:34:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MmIwU9He"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7AAB21019
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9bTnB/6zfK0T2WywZdhFaqNRSw2iqCsYkqxgUQxfamk=; b=MmIwU9HeIj2sqC
	h6Nwe5Slrk2BLwgs5QY47/cjkFxYuVUMC9rdRNBY6JaXqAhG4Rc8mh+mFL+sA0SdtrdhPOm0Jhccf
	uxohQeeUFLx4/qrskQfTe1CUAeRwCogOM5zYLAxeG8jQ+3TNWhltv7muCqYMmSRkcGJn359J90oGM
	kqHeux929pTDp5V50eM2vg0CRxxDjjh0BBX3ZzV/+9MAat0hfw+AMorRCHvdxi0bogotL+6MRxDeo
	hR2FO2/6RFmdetpeY8aj8w0kaU9KTlQvlQkG1rMpqNhEN8R0kr9dfi/44OUXiVEaXxHdlL9FoAzUB
	aV0uW4lehrUFYVaY8KOg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h4vPW-00011d-Qe; Fri, 15 Mar 2019 22:34:42 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h4vPT-000118-VN
 for linux-amlogic@lists.infradead.org; Fri, 15 Mar 2019 22:34:40 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::3d5])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 07CD91405239D;
 Fri, 15 Mar 2019 15:34:32 -0700 (PDT)
Date: Fri, 15 Mar 2019 15:34:32 -0700 (PDT)
Message-Id: <20190315.153432.819379020783488812.davem@davemloft.net>
To: jbrunet@baylibre.com
Subject: Re: [PATCH net] net: phy: meson-gxl: fix interrupt support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20190314134945.17300-1-jbrunet@baylibre.com>
References: <20190314134945.17300-1-jbrunet@baylibre.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Fri, 15 Mar 2019 15:34:33 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190315_153440_015304_A766A246 
X-CRM114-Status: UNSURE (   5.99  )
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
Cc: andrew@lunn.ch, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 14 Mar 2019 14:49:45 +0100

> If an interrupt is already pending when the interrupt is enabled on the
> GXL phy, no IRQ will ever be triggered.
> 
> The fix is simply to make sure pending IRQs are cleared before setting
> up the irq mask.
> 
> Fixes: cf127ff20af1 ("net: phy: meson-gxl: add interrupt support")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Looks good, applied and queued up for -stable.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

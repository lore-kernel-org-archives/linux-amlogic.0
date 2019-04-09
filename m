Return-Path: <SRS0=8EGG=SL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C098C282DA
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 21:00:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C97F220645
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Apr 2019 21:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QHnU4y46"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C97F220645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davemloft.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	From:Subject:To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rSZAlg2jJEyuxpjwMhGs30kDVp9G/S0eEsL/5HkH9Gw=; b=QHnU4y46CwXYG6
	k422sF5wvjk4fpHMN++1xLhw5DHDnby1v0lYtZCA645ZBudNMtH+Sr3n6ti+c8jBQZsFQMngTax3O
	EkitEnMTaPm6AZpgvrfZ378gcamLArxFKiO4SOQo95ObrSfK8yXjScCg1rAZNA+sVWItgLuppZy9a
	5UDiyOjFH4woHSUqy5gH1bxm2j+OmqXjczQHECOpT30d9Vwyatj6685v+U74TkPkByON830cUIthb
	6W9LXdoJWxmBQm+fPVqT6bbu1snEkzbYsy7Cb6l9s7qQGsJS5W/gF6CsnU+xFQIGy+ZjuKo0Pkf8U
	E622cNCh5JQB3TGcvRKQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDxqT-0006M9-B2; Tue, 09 Apr 2019 20:59:53 +0000
Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDxqP-0006Lj-Vi; Tue, 09 Apr 2019 20:59:51 +0000
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::d71])
 (using TLSv1 with cipher AES256-SHA (256/256 bits))
 (Client did not present a certificate)
 (Authenticated sender: davem-davemloft)
 by shards.monkeyblade.net (Postfix) with ESMTPSA id 0608614B5B891;
 Tue,  9 Apr 2019 13:59:46 -0700 (PDT)
Date: Tue, 09 Apr 2019 13:59:44 -0700 (PDT)
Message-Id: <20190409.135944.1516944884952068835.davem@davemloft.net>
To: hkallweit1@gmail.com
Subject: Re: [PATCH net-next] net: phy: switch drivers to use dynamic
 feature detection
From: David Miller <davem@davemloft.net>
In-Reply-To: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
References: <0cc96fab-e102-c0d1-ade0-90e3e06dc9f1@gmail.com>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12
 (shards.monkeyblade.net [149.20.54.216]);
 Tue, 09 Apr 2019 13:59:47 -0700 (PDT)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_135950_021477_0887DC4F 
X-CRM114-Status: UNSURE (   7.39  )
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
Date: Sun, 7 Apr 2019 11:57:13 +0200

> Recently genphy_read_abilities() has been added that dynamically detects
> clause 22 PHY abilities. I *think* this detection should work with all
> supported PHY's, at least for the ones with basic features sets, i.e.
> PHY_BASIC_FEATURES and PHY_GBIT_FEATURES. So let's remove setting these
> features explicitly and rely on phylib feature detection.
> 
> I don't have access to most of these PHY's, therefore I'd appreciate
> regression testing.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

This appears to need to be done differently.

A question was asked as to why fast ethernet PHY identification from the
source is important, well I'd say it's important for someone working on
the PHY code to see how "all fast ethernet PHY drivers do or handle X"

:-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

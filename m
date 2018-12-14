Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACB49C67872
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:28:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F6482146F
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CTE7mtGu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="A9V8KdWG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F6482146F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6BHS27WCo84wZ4+MEK3bUmWWM58e0mC0NjHnpmwZ8E=; b=CTE7mtGu+KrcqD
	Q8qKkvHMvws51XYewse6OrS9zskTLuzmY1eFjQbNiPKexbJDBOCCIeInIMJn6RwhXHO8CwlJBJqHa
	XC4oxIP52obD38eZ1sA2FAwAVgQQzYRkqMKartW1WTjEL3+xsChzMCvaii0LKnGHE4JUg/iqES8NM
	jlHzDxIDfelwyFDRLAtyQplzdk09uvGwzyRQuHVZPvotxmF4JjIujoquLjrYZvlyFXrvRky1U7YVI
	NBcbCBkf/ZqpcjadZQYNA6TeoWfo5T/fs3+5F5tHpOvyQJJVxE61hNv1/4or3UlxVfq450BKUR+Hl
	K3kIHUiXRdUHG5I2l0Kw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXmZQ-00074p-3A; Fri, 14 Dec 2018 12:27:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmZO-0006Nr-Hb
 for linux-amlogic@bombadil.infradead.org; Fri, 14 Dec 2018 12:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6hsGFuXCAc8O7vNACqrFsBJ3jrvkCnTuzyqXflaLDNw=; b=A9V8KdWG1IFIcDhAbi8E6m5N43
 1loqLnHz1n6DD8MZ2DMhz/wRNvFNV9ltj8MmksEXrzZ5Sn8TFLPvGaeHkYFBqHDh+uDkoEFF5czMP
 d1JeWggk5N10HZi7VLnULJd2ycuZ4bU5JzT5+8WJg4S3/SnY5iXDD86JeHWm7uwLLG64N7MIvUJp+
 QCRck23J9nQUl5kWbpjFEN/9JmBmFqCApmg8iJ7vkBdoOBLgpDzRgOST9Lok5rhcmcDdm6QleFaox
 cwJHg8Tnn21C+vi87hiprCbJ9ASYiwtAYuFvULeW+RJgKkk4j2WtREX3xpzEKlLeIz03+h6Tbu7Yf
 C1uvHXag==;
Received: from gloria.sntech.de ([185.11.138.130])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmLK-0006Ii-6w
 for linux-amlogic@lists.infradead.org; Fri, 14 Dec 2018 12:13:23 +0000
Received: from wf0848.dip.tu-dresden.de ([141.76.183.80] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1gXmL3-0006Vx-Dr; Fri, 14 Dec 2018 13:13:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RFC v2 4/8] drm/bridge: dw-hdmi: add support for YUV420
 output
Date: Fri, 14 Dec 2018 13:13:04 +0100
Message-ID: <1724249.dsAJmDaf8c@phil>
In-Reply-To: <20181130134301.17963-5-narmstrong@baylibre.com>
References: <20181130134301.17963-1-narmstrong@baylibre.com>
 <20181130134301.17963-5-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_121322_267205_B0B6BCB5 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: architt@codeaurora.org, maxime.ripard@bootlin.com,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-amlogic@lists.infradead.org, Zheng Yang <zhengyang@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am Freitag, 30. November 2018, 14:42:57 CET schrieb Neil Armstrong:
> In order to support the HDMI2.0 YUV420 display modes, this patch
> adds support for the YUV420 TMDS Clock divided by 2 and the controller
> passthrough mode.
> 
> YUV420 Synopsys PHY support will need some specific configuration table
> to support theses modes.
> 
> This patch is based on work from Zheng Yang <zhengyang@rock-chips.com> in
> the Rockchip Linux 4.4 BSP at [1]
> 
> [1] https://github.com/rockchip-linux/kernel/tree/release-4.4
> 
> Cc: Zheng Yang <zhengyang@rock-chips.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Please see comments in patch1 for details.

on rk3288 and rk3328
Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=/cGg=OX=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C664C67839
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:31:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66BA320892
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Dec 2018 12:31:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H8iLFnxb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ufDqmTjC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66BA320892
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sntech.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+E27CA29NEuctTRnbL9w88Wnmx+zagVs/kyNfzBE8Q4=; b=H8iLFnxbkTqJxL
	QSM0azJ5/QUKc+if7WKTfp5sUhQcxNX4s++izk6WoGjgR+nFldnsiF6qizL1QVDZXmwwwS0xi5v1M
	9G1nmlUuRTAvCAQYlZE1Ij0H7t4z7UTdlJ8GXwTifIzwcM5ncvsSzS9RWaHJsFeHV1jgxiQT0Rn0S
	yHkqR31rJvE8vWAzJhpbDLHe5s9mNDIbqjmYhw0qcX0iEFEbPN7zUjzhdl3XSxJFfpyrA1d126aVv
	2oEs9OoWYPudDK/Rad1qW1Jc0ViMrJrmblzfKC0dxo66zAUXzcmkv+ivzs7xNjvVo4GH3o3Wk/cnM
	GpiPP6DS+j7/RTn07T9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXmcq-0000UZ-4U; Fri, 14 Dec 2018 12:31:28 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmco-0000Tl-6v
 for linux-amlogic@bombadil.infradead.org; Fri, 14 Dec 2018 12:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VbSTskM8BptORHJF3A9vK/dMKf2yfBxz+QQhkeSSPmE=; b=ufDqmTjCrnusZs9SAB1vbgyCAJ
 uDHAsXDoca+Dk9MHY3xHRbLVzqGG/cuGJuPYMi3SYzRCxVZxtboQJpPXZXyDJimH4gRmOieinR4kZ
 kQiKAyvFzGmjkFyo6fYS5cu+MxzIXU7JNT7Av78eVbuQkToRa3oKA5nhqxGkV7qwYX8Y8JajGBEsz
 6mDsepq/d26HMt8VN3E8ZGC0mh6vuZfR2j1G1peiRIKDx+E1EsiYJ1Ogpyb7+5dhUVmrh919EP+97
 JvhzO9SYI7KlvsQVyDkrXxozQ8tJBAZhmN7tkynEGPNk/tsZGaUc9JirtW/HTzIXmK2cGSkT/teGv
 4U3rqPfw==;
Received: from gloria.sntech.de ([185.11.138.130])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXmLs-0005tM-3K
 for linux-amlogic@lists.infradead.org; Fri, 14 Dec 2018 12:13:56 +0000
Received: from wf0848.dip.tu-dresden.de ([141.76.183.80] helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1gXmLb-0006Wm-T8; Fri, 14 Dec 2018 13:13:39 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH RFC v2 6/8] drm/bridge: dw-hdmi: allow ycbcr420 modes for
 >= 0x200a
Date: Fri, 14 Dec 2018 13:13:39 +0100
Message-ID: <4353596.jtuL0mA8pD@phil>
In-Reply-To: <20181130134301.17963-7-narmstrong@baylibre.com>
References: <20181130134301.17963-1-narmstrong@baylibre.com>
 <20181130134301.17963-7-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181214_071356_311259_6FFA323B 
X-CRM114-Status: UNSURE (   6.98  )
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
Cc: architt@codeaurora.org, maxime.ripard@bootlin.com,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com,
 Laurent.pinchart@ideasonboard.com, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Am Freitag, 30. November 2018, 14:42:59 CET schrieb Neil Armstrong:
> Now the DW-HDMI Controller supports the HDMI2.0 modes, enable support
> for these modes in the connector if the platform supports them.
> We limit these modes to DW-HDMI IP version >= 0x200a which
> are designed to support HDMI2.0 display modes.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

Please see comments in patch1 for details.

on rk3288 and rk3328
Tested-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

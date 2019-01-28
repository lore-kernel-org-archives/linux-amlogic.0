Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B2EC282C8
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 19:56:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2167A2087F
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 19:56:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HxPrCGeh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2167A2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ysmdx2EbMNH5nIh5yyZol6AQnixSIvILNVGDYDXOXfs=; b=HxPrCGeh+UJgaV
	kDNJpNQkxLhK07NyWTaL/xYOFqW/Mpa3CxszJiJdhqvjAyE0UCdw9TMabd67iKFFXKSlw1rrtOItT
	IwAZ9xszooCb8ewSHaMUgumK+l1uXqKn4gN9d4b0YBV+KHADsfdxP4VuDby6N9VIWATyBOQHitGai
	rZ8fIwCVmjmSMUPnoZ6+/s9wJ1TScJ7d6Gi9zqe/VAkwzWjEZHV/45QYeOAzVqv1nZFeRLHKTbjGA
	MBkMzn2PuXpLw1oM41xxQ6BFIdLYyH91gX+093CfsocMHutjGiI+idQYO211mOmAoEwa6suZOAP4N
	wpTFEUcwwLWn+X+askzg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1goD12-0001iF-T3; Mon, 28 Jan 2019 19:56:20 +0000
Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1goD0z-0001hn-J0
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 19:56:19 +0000
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 43pL3c4GPKz1qxDw;
 Mon, 28 Jan 2019 20:56:12 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 43pL3c3fwvz1qqlD;
 Mon, 28 Jan 2019 20:56:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id 3RKjAueOT5L9; Mon, 28 Jan 2019 20:56:11 +0100 (CET)
X-Auth-Info: 16bOV/ARN74fwloZlkbjasNgAREAsQ0k6fQ1qRduTFA=
Received: from crub (p508DEA88.dip0.t-ipconnect.de [80.141.234.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Mon, 28 Jan 2019 20:56:11 +0100 (CET)
Date: Mon, 28 Jan 2019 20:56:11 +0100
From: Anatolij Gustschin <agust@denx.de>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH u-boot 04/11] video: Add Meson Video Processing Unit Driver
Message-ID: <20190128205611.46598f8a@crub>
In-Reply-To: <20190115161759.1657-5-narmstrong@baylibre.com>
References: <20190115161759.1657-1-narmstrong@baylibre.com>
 <20190115161759.1657-5-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_115617_771192_A77B1227 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: mjourdan@baylibre.com, u-boot@lists.denx.de,
 linux-amlogic@lists.infradead.org, Jorge Ramire-Ortiz <jramirez@baylibre.com>,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, 15 Jan 2019 17:17:52 +0100
Neil Armstrong narmstrong@baylibre.com wrote:

> This adds video output support for Amlogic GXBB/GXL/GXM chips.
> The supported ports are CVBS and HDMI (based on DW_HDMI).
> 
> When using HDMI, only DMT modes are supported.
> 
> There is support for simple-framebuffer (CONFIG_VIDEO_DT_SIMPLEFB)
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Signed-off-by: Jorge Ramire-Ortiz <jramirez@baylibre.com>
> Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>

Reviewed-by: Anatolij Gustschin <agust@denx.de>

Please see minor comment below.

> diff --git a/drivers/video/meson/meson_canvas.c b/drivers/video/meson/meson_canvas.c
...
> +/* DMC Registers */
> +#define DMC_CAV_LUT_DATAL	0x48 /* 0x12 offset in data sheet */
> +#define CANVAS_WIDTH_LBIT	29
> +#define CANVAS_WIDTH_LWID       3
> +#define DMC_CAV_LUT_DATAH	0x4c /* 0x13 offset in data sheet */
> +#define CANVAS_WIDTH_HBIT       0
> +#define CANVAS_HEIGHT_BIT       9
> +#define CANVAS_BLKMODE_BIT      24
> +#define DMC_CAV_LUT_ADDR	0x50 /* 0x14 offset in data sheet */
> +#define CANVAS_LUT_WR_EN        (0x2 << 8)
> +#define CANVAS_LUT_RD_EN        (0x1 << 8)

Some define values are not aligned by tab here.

--
Anatolij

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

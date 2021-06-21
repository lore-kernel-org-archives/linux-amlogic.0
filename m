Return-Path: <SRS0=jJRA=LP=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB74C48BE5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 06:18:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BD776100B
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Jun 2021 06:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BD776100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bi0cAp8at27xNBDFmP0kmjLs59q2BEnSCn4Rrl8OKW4=; b=Ity9px9ANn+64Z
	BJos+Ypz/U8xac6vhyJfNcnou/pGMTxt7Xc9GBHkT44vVdk1kaVYf9VLHTtdfbQETzERkzi5CRYZo
	uXk9yjHL/Xm/E0+1fsUY4xYISWYSqCBPndsSiCGDpxVnMMLW2b6zdV5ZXLBod6lW9oGGegHlR31CI
	LJl6oUUPxZgCouJw2YQUy+tx9xHnE3blddwkTZ6DOoOR8/QbIia6yFxEnbOeUPyZT4/2Qqx20ZJiF
	3Tmqu6oYM5bdWhZ1iHayZLy0IB7zh9uaVgXL6pcbmTMWzUoKIrC0YcWbA9c+frIPXaW7N6rbYmDAd
	PmbkzqRHc/wMoiBGv6oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvDGF-002IEP-CZ; Mon, 21 Jun 2021 06:18:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvDGA-002IDI-Rn; Mon, 21 Jun 2021 06:18:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 877C76100B;
 Mon, 21 Jun 2021 06:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624256294;
 bh=YFZygVbRLxrAS2J28Fh5EQZmQgGwcUaOw0GMfbFbMUI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iqmDwOxrZLPQoYJ27yefzt4i0apxEJoiWDl6okQepYJuyM0oq1k2774163AhJOkNj
 8TgJomOdjyk26J04eN6i16uJu2Mx/dhyh05IC0npJecRMjSDJek7JVHkuQ4nWMWdeX
 oYgac/cSufdvyDR6nvg9QpjaUKxYuOUtBtzGqgRHguqBpvYgv85cfuRxcMmCRCsaDa
 D6zhTII9kWmSxbxK3ZOhfyfkp0Kpo03ba0JPUYrkj/i50k7bQkf8ENcByZ9nNFP614
 znf44JUyZFdoY5jOmF1N3Ewy2xzAocWYDvDEwEIwTeA42W3U2CE9Xr5s0RtbfYWAyv
 wsJvUTexufetw==
Date: Mon, 21 Jun 2021 11:48:10 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: robh+dt@kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 kishon@ti.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] phy: amlogic: Add a new driver for the HDMI TX PHY
 on Meson8/8b/8m2
Message-ID: <YNAvItt8BQH1QmQT@vkoul-mobl>
References: <20210604190338.2248295-1-martin.blumenstingl@googlemail.com>
 <20210604190338.2248295-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210604190338.2248295-3-martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210620_231814_955745_8B069FC3 
X-CRM114-Status: GOOD (  14.70  )
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

On 04-06-21, 21:03, Martin Blumenstingl wrote:
> Amlogic Meson8/8b/8m2 have a built-in HDMI PHY in the HHI register
> region. Unfortunately only few register bits are documented. For
> HHI_HDMI_PHY_CNTL0 the magic numbers are taken from the 3.10 vendor
> kernel.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/phy/amlogic/Kconfig              |  11 ++
>  drivers/phy/amlogic/Makefile             |   1 +
>  drivers/phy/amlogic/phy-meson8-hdmi-tx.c | 150 +++++++++++++++++++++++
>  3 files changed, 162 insertions(+)
>  create mode 100644 drivers/phy/amlogic/phy-meson8-hdmi-tx.c
> 
> diff --git a/drivers/phy/amlogic/Kconfig b/drivers/phy/amlogic/Kconfig
> index db5d0cd757e3..e6c3a2a8b769 100644
> --- a/drivers/phy/amlogic/Kconfig
> +++ b/drivers/phy/amlogic/Kconfig
> @@ -2,6 +2,17 @@
>  #
>  # Phy drivers for Amlogic platforms
>  #
> +config PHY_MESON8_HDMI_TX
> +	tristate "Meson8, Meson8b and Meson8m2 HDMI TX PHY driver"
> +	default ARCH_MESON
> +	depends on (ARCH_MESON && ARM) || COMPILE_TEST

depends on ARM seems redundant..

> + * Meson8, Meson8b and Meson8m2 HDMI TX PHY.
> + *
> + * Copyright (C) 2020 Martin Blumenstingl <martin.blumenstingl@googlemail.com>

2021..
-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

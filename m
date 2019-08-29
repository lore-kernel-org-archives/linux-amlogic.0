Return-Path: <SRS0=jO5x=WZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA6EC3A59F
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7011D215EA
	for <linux-amlogic@archiver.kernel.org>; Thu, 29 Aug 2019 18:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mv693FHd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sXXYtAAa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7011D215EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZyIKzjXxDo1UogmwjqHrO5xP0vsIm4X1WYPNKU8F8g=; b=Mv693FHdumasgK
	zKRm4IhKxtEA6VSeJQsgdo3DmZZ5dxe+NDuzBBJ5GNXcBhS5vhIkMc+4oZRVDZFYqy36sXtuu0nWT
	Rw7p+Q969KMClJnOapNOuUKoLNjz96V8yEBxKM7nQWkdDOGVRrSgNUuc1mOA9NA/M1vgkVS0x92fg
	Yg6eoXN3SkQDEzxj8opMHhZSv8Q+UNv1U7jbxbIcLAnNPiggOLDEggaLuyN6EAQvn90mwBVuxvpwj
	M5OhgQ1KmcqnZ2Z1URQoEfa/GDihzu+85lSu2zSq+xE/Kd9G0LObgdNS1Ug0+5WM/0TutxO7F2W+Q
	lOGEbLQXe1dE9KdafoJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3POw-0000jX-TF; Thu, 29 Aug 2019 18:44:06 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3POu-0000in-9g
 for linux-amlogic@lists.infradead.org; Thu, 29 Aug 2019 18:44:06 +0000
Received: by mail-pl1-x641.google.com with SMTP id w11so2001411plp.5
 for <linux-amlogic@lists.infradead.org>; Thu, 29 Aug 2019 11:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=v1Wo1j2tnlDDBx+9tVoNxVDQEbVVitJMbE6zkrCsNYQ=;
 b=sXXYtAAaVMdonPdNFmCLacc1yMs7M1edc94O5lELRYJxadC3JjUM5YbUwWi4dWK0jJ
 zN29PrPjete6yiziQDuS3B95q7jfnVD8wxKih2rukf/ma6btEa7zj5D+Yc/L3IS1sn3U
 Wzo+4s7a1O06d9y0kvd5ashlirrH5iOvhibysr7HVY69SnScODa2J78ftUOVJxT1EWW3
 9om/44Pa0e6rQamyCftba66Zw3RTmOnxK8wAbFNqJ2qRomcgzemIdJxt+QbsO18zv/Nq
 zzUYrsM5YSe2WqLJp4NWtD/ZnQTypUYO3+AYtZiL7/gQb+E0qjUlhkq1YrIt1qDMwOfE
 HcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=v1Wo1j2tnlDDBx+9tVoNxVDQEbVVitJMbE6zkrCsNYQ=;
 b=qUToGT2/Jp+a7iSUTlPYAkogz8PRc7P7FtI3v3e8DtgGhySlYxDUv5gc3DUQCyp5HI
 md+7uyxd7FigvLQ8tGVGr4hxobWji+5HND3UmWvh7XMkzhK9x3/hUDhiAKjNBhuG5Z94
 0mqHJn3yIN5SJU011o8qm2OlEHoAkFr+qkA86Mig0yNjIu3JRQ1qcZ9ghj8qkuxQ4rhM
 APArm3P+qN5euonRBSIxY25+5huK/bunSPYvxHoxNtSsV+lwiKX0p8ozYHTMfXIoH3YX
 cFmzkGLqOvNG2UF1fqJNs3nU03MsQaOvHtEKuVYqNX4t1koqy818FeKeQehsdnQqHkKO
 HuIg==
X-Gm-Message-State: APjAAAVGaNxCQdFPPuHxRYVZ0wFftnkzN4Wqd6LqEklK0Z3uzgcL2gtC
 2aCr1Fe8A8/1xG2VrLr3DbgSgQ==
X-Google-Smtp-Source: APXvYqySV7f6ZMmiEy8g7xUfSMB1MLLk+cK+esN7+JKSPp3z46QGrwido2SYzkKtN/oLNUGfcjySEw==
X-Received: by 2002:a17:902:ba16:: with SMTP id
 j22mr10261299pls.253.1567104243423; 
 Thu, 29 Aug 2019 11:44:03 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id z189sm6021212pfb.137.2019.08.29.11.44.02
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 29 Aug 2019 11:44:02 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Thomas Gleixner <tglx@linutronix.de>,
 Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH 2/2] irqchip/meson-gpio: Add support for meson sm1 SoCs
In-Reply-To: <20190829161635.25067-3-jbrunet@baylibre.com>
References: <20190829161635.25067-1-jbrunet@baylibre.com>
 <20190829161635.25067-3-jbrunet@baylibre.com>
Date: Thu, 29 Aug 2019 11:43:59 -0700
Message-ID: <7h1rx3revk.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190829_114404_341700_AD449A1D 
X-CRM114-Status: GOOD (  12.73  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Jerome Brunet <jbrunet@baylibre.com> writes:

> The meson sm1 SoCs uses the same type of GPIO interrupt controller IP
> block as the other meson SoCs, A total of 100 pins can be spied on:
>
> - 223:100 undefined (no interrupt)
> - 99:97   3 pins on bank GPIOE
> - 96:77   20 pins on bank GPIOX
> - 76:61   16 pins on bank GPIOA
> - 60:53   8 pins on bank GPIOC
> - 52:37   16 pins on bank BOOT
> - 36:28   9 pins on bank GPIOH
> - 27:12   16 pins on bank GPIOZ
> - 11:0    12 pins in the AO domain
>
> Mapping is the same as the g12a family but the sm1 controller
> allows to trig an irq on both edges of the input signal. This was
> not possible with the previous SoCs families
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/irqchip/irq-meson-gpio.c | 52 +++++++++++++++++++++++---------
>  1 file changed, 38 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
> index dcdc23b9dce6..829084b568fa 100644
> --- a/drivers/irqchip/irq-meson-gpio.c
> +++ b/drivers/irqchip/irq-meson-gpio.c
> @@ -24,14 +24,25 @@
>  #define REG_PIN_47_SEL	0x08
>  #define REG_FILTER_SEL	0x0c
>  
> -#define REG_EDGE_POL_MASK(x)	(BIT(x) | BIT(16 + (x)))
> +/*
> + * Note: The S905X3 datasheet reports that BOTH_EDGE is controlled by
> + * bits 24 to 31. Tests on the actual HW show that these bits are
> + * stuck at 0. Bits 8 to 15 are responsive and have the expected
> + * effect.
> + */

nice catch!

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

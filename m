Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CAC9C31E46
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 10:22:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D1E8207E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 10:22:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dtbxVWQh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="rulL1S3r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D1E8207E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7z0MWzeMtHh8sgdn71H7t6Mrev24zOnKq/J8vQxpSic=; b=dtbxVWQhgXM26W
	NL/jffTG/9FQLkBuLBxJr1BuuKJw5iGm3zkD3LPkJvUKfg2DMXg5Q/BUey/Xe0IoGOMD6hpLkmAdq
	wC/Qy4ajc509AguWQl2+AhkhQ3SsMh85cETewud6Q6SrfP3w270rq0yXKxAVLT33Lg/YS+Woy+Lz2
	w343wMJBf51v84TX/Ms4o5jVPDzLZgFQ2D1isr4Bvfm5gzOkG8COfGys3ykf7oNpUTh47s3X9wy/e
	2PFvbjAiSpugnXW3Lzx1EbkF72sV8G5xkjl71gWXUaR4nYN5F/RNCtG7WI/ZG6wbvEo8lvPmaw+7q
	/CsQtDl43ap9OnAtwXeg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hb0OU-0002xF-GD; Wed, 12 Jun 2019 10:22:14 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hb0OG-0002f3-15
 for linux-amlogic@lists.infradead.org; Wed, 12 Jun 2019 10:22:01 +0000
Received: by mail-wm1-x343.google.com with SMTP id s15so5940253wmj.3
 for <linux-amlogic@lists.infradead.org>; Wed, 12 Jun 2019 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AFoHMSEj9tVrWcEUPH5FAzB19SGdLo79LhrgprT3fB0=;
 b=rulL1S3rudmYvANWuk91UMefuzuee5m+1kiBg/S4z4W6rohQIQJvVef0Ga8/kNwqJP
 kQbz+GWJXFvKOlUq8wHsIOsVwPqBI6yU4JVUxy8FcXHzelpiTu0d9AnpLnqKnk6brVeP
 0fI7UN+JLLjazssXG03F2xYy4RGi8lRQZddXYhMMtpv3pOhX4qKtG2S8uhFGlc+GLnT6
 pvwprNWkUYEuVh6VpDMyqPFBM3B4d4BM96DCh7LGjxch5bvcQL2oQCAMKcd+OcUFDS/9
 lerJBd9pWHPVwxh6CPJHbt3h+bxG3bzij0XlNY2uclYVY1/q+J8iyOw8VXcY4XYFT3kO
 9meA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AFoHMSEj9tVrWcEUPH5FAzB19SGdLo79LhrgprT3fB0=;
 b=t9aKUY5TIbA3ZMrQmywnyFrqiIWwj0FrGv7FjDKqFgu1TxiTEcJahLOjN/BwlM+Z3Y
 DywP8rpMmYLfLoEztPPs6UFRiifxtJtPwIJIqQnYzTB7UwUv2FL3aGW2o6QNWK27lRa+
 fkK7NIKR1xWXq2ccB7kWsWhYOUB23SwbonEQG73i7FdQ2KRr7yhLK8MFKCuV8A4Yyx2t
 S0Vy2ZXVczYRX1Zbwop/8ef8UB7VAuiN270Mk7Th3/WiOYyQEu0ehDPcJe9a10z+mSdx
 w79O2npTFTKDuobTm8yYaCnSbUGMSsw23692St47D7uiV6inPrdtrR8EA8W0Ae1LNjw1
 swsw==
X-Gm-Message-State: APjAAAXw9qKy+SVhCu5lQeW8wnI0sTHzx8gGpxxHQ7AsXl+ey2nml4eu
 ztu5n/W3+OrRben6plRFgrkwgA8XngpIAY8g73Z5qw==
X-Google-Smtp-Source: APXvYqz6AjVcZoYHA6CdaGJpxS+2mtUzECSit9/BS1GTOdIOLeI2k4WuyT2w1sPbw2Vab/weDhNLTVi2+YFEotGwynw=
X-Received: by 2002:a1c:ed07:: with SMTP id l7mr19968400wmh.148.1560334917880; 
 Wed, 12 Jun 2019 03:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190612100536.22368-1-yuehaibing@huawei.com>
In-Reply-To: <20190612100536.22368-1-yuehaibing@huawei.com>
From: Maxime Jourdan <mjourdan@baylibre.com>
Date: Wed, 12 Jun 2019 12:21:47 +0200
Message-ID: <CAMO6nayiXiOkHSxgZU+oyPdSo5ugcV6XaCdy7P1Riutv+c7XRQ@mail.gmail.com>
Subject: Re: [PATCH -next] media: meson: vdec: Add missing kthread.h
To: YueHaibing <yuehaibing@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190612_032200_135038_B0CCD8D2 
X-CRM114-Status: GOOD (  12.76  )
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
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, linux-media@lists.freedesktop.org,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Wed, Jun 12, 2019 at 12:05 PM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Fix building error:
>
> drivers/staging/media/meson/vdec/vdec.c: In function vdec_recycle_thread:
> drivers/staging/media/meson/vdec/vdec.c:59:10: error: implicit declaration
>  of function kthread_should_stop;
>  did you mean thread_saved_sp? [-Werror=implicit-function-declaration]
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 3e7f51bd9607 ("media: meson: add v4l2 m2m video decoder driver")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
> ---
>  drivers/staging/media/meson/vdec/vdec.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
> index 4e4f9d6..0a1a04f 100644
> --- a/drivers/staging/media/meson/vdec/vdec.c
> +++ b/drivers/staging/media/meson/vdec/vdec.c
> @@ -12,6 +12,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/slab.h>
>  #include <linux/interrupt.h>
> +#include <linux/kthread.h>
>  #include <media/v4l2-ioctl.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-ctrls.h>
> --
> 2.7.4
>
>

Thanks for the patch, sorry that this one slipped through.

Acked-by: Maxime Jourdan <mjourdan@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

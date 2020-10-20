Return-Path: <SRS0=scox=D3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2CCBC433E7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:58:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E06FA2225F
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Oct 2020 07:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fP/SEKxd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WYUx6z2s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E06FA2225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5PMtIXvU+PWjS4n08BZdEffUrDK6Pz7cOnlNp4H5VMc=; b=fP/SEKxd1magH8gjx5rYLcHgk
	I3+DGs54Tst1TgS3ylkF/MUxbVBi2nuEQqNeSgQccBGIDtkqeiQBsXV6fXTlsntubnWXEcMN5TYcO
	eYwqPFxa/svArq+YBThFatu9aOHwxb0EKzh7C4Lt5OtpaUYl2qx/xvUg6VQxBafn1L9xroJZWjoPd
	3Ui1Jgun3jPLR+yfML9IcOr2by9+UzZagFezE9q8TLR/Ohj82bL6HuB7W4Bce8V4i6ePdZ8kR+gTz
	XLvYgZXlmirtIcTxVMfZ6I3xbX9o9dJK1ba4wld/e1eXzFp1gdHKQy9z2hmO3NSLM74wlz2nUFbIo
	rHkrvk0zg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUmXb-0004OD-U5; Tue, 20 Oct 2020 07:58:43 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUmXX-0004ND-4W
 for linux-amlogic@lists.infradead.org; Tue, 20 Oct 2020 07:58:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id k21so615927wmi.1
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Oct 2020 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=K8JuO2fBhsJwORgh/kgcwy05sFvXimHJIcyXrkVyotA=;
 b=WYUx6z2sgxRoHATgMLiZNIU2YEIbpDILNwOQV7xs0tB3gLCaNzwiDOrI8B1iK6T3S9
 1aZR1C84+nacZ1MJwkTVtwjjgDLaDUNDuqo+nD82ehBuypu5gFUWykMCSptDmk93/n2y
 f76sQdeoEdgjRR3zrDtNwZ9og8zgBtJGF5fysXG7CfbOnMuzWg8BQA/zfNPdupdmXOJ4
 P28CQy6JgFrloFrZzU1GCp5OEMiklaubhjrdT+n6mikjow6gGesLxvs1pEWehr3I3sWS
 9Ga1cN8oSnCukzWw9Ir+jyKJdGR3zon16elAOk/FlCKb0zXjiz77gKDQ6f+tZnGE24gz
 MbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=K8JuO2fBhsJwORgh/kgcwy05sFvXimHJIcyXrkVyotA=;
 b=piO6IZcPMCNTZ1LQfihOYzBOSyknLP5DFEUKOA5xMtPsOxnkJGhOaJlUia/F6iQ8+g
 qd8M3M/rGSTlNj5HSHyO71xMEoVw10W8D/kx5Zx+N+2EMFiz+Txbs6epzKTuu7PWHF2M
 rd7meA7Y4khtzpUqiS853Dr9vvHA1aux72Z0mSv5tazBkqd1LoqKbHCJxUr5uocyAw7n
 ISLF7qtBEeqyQsMUdx+I3t36Z4sl7LDGhYhvoy9EodjVnmMfgbojzH/8573AqTUUoSnT
 gxtt32ClAgSm7V+s0/3gh/lOLeZ8dib7+OgmViZiciWKi97DRAiLkXHVaJWg9srVeixc
 zqkQ==
X-Gm-Message-State: AOAM530iOKN9CdcuxCawivDhBdAacw1FSbWf57WlUEGRirFFdMDmr9aD
 dRvxFoxOUvpkyPBXJP6ekvoafywE4wo6uQ==
X-Google-Smtp-Source: ABdhPJxtWV71rct8ADx0oEMrGmC2HcMPNt0PxGx0aRcps1ljueuSegOxaDj2kdaGNjVoTNufMH8JAg==
X-Received: by 2002:a1c:2485:: with SMTP id k127mr896939wmk.130.1603180717728; 
 Tue, 20 Oct 2020 00:58:37 -0700 (PDT)
Received: from localhost (82-65-169-74.subs.proxad.net. [82.65.169.74])
 by smtp.gmail.com with ESMTPSA id j5sm1637534wrx.88.2020.10.20.00.58.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 00:58:36 -0700 (PDT)
References: <20201019224649.14302-1-khilman@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 1/2] soc: mx-socinfo: only build for arm
In-reply-to: <20201019224649.14302-1-khilman@baylibre.com>
Date: Tue, 20 Oct 2020 09:58:36 +0200
Message-ID: <1jk0vlmiqb.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_035839_202670_367545B4 
X-CRM114-Status: GOOD (  13.79  )
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
Cc: linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 20 Oct 2020 at 00:46, Kevin Hilman <khilman@baylibre.com> wrote:

> This driver only supports 32-bit ARM SoCs.  Only build it for those.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  drivers/soc/amlogic/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/soc/amlogic/Kconfig b/drivers/soc/amlogic/Kconfig
> index 321c5e26a268..2d7ee1397d59 100644
> --- a/drivers/soc/amlogic/Kconfig
> +++ b/drivers/soc/amlogic/Kconfig
> @@ -63,7 +63,7 @@ config MESON_SECURE_PM_DOMAINS
>  
>  config MESON_MX_SOCINFO
>  	bool "Amlogic Meson MX SoC Information driver"
> -	depends on ARCH_MESON || COMPILE_TEST
> +	depends on (ARM && ARCH_MESON) || COMPILE_TEST

Would to it make sense to apply the same to the GX soc info ? depends on
ARM64 ?

>  	default ARCH_MESON
>  	select SOC_BUS
>  	help

Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

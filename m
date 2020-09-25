Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4027FC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 08:58:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B898420BED
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 08:58:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OagCx7bk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="v8Y6GM9j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B898420BED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vWZQ9Rjb0ecBppWlPjzY7ql/Y3dR6S1XVswjii8wlyM=; b=OagCx7bkLj4nmoWV4A1oP+gOO
	yzRvZIahlDCi9RpO+TDxeBmu7jBAO6axQuqCUZlDN1/0K/aqOZ5UQPWJ3Y9lZwDMq6h2JbLuJoN5m
	IWpPMXB9/CSoA2aTKqvGYKrdUwbez9o/dygwDaHch09oCP8GqTZhFRfWz2BbWnUiDrGRQhwRdMpSO
	WFGqG+f31dkxa+lhvH8fkQUzJdx4BB9s+m6BgSski63G2vndYXTwHjYBMmAhMefTqOqSuc/zZBprU
	Ub7+ee4qmdf7fCTP4tSMO6KJCy34xCk6j9GbmOsEW0PTgMPJUL5K9jFof6cndrn13dAWq4CU0RrnN
	AlVK4C0vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjYR-0007m7-Pn; Fri, 25 Sep 2020 08:58:11 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjYL-0007k5-Oa
 for linux-amlogic@lists.infradead.org; Fri, 25 Sep 2020 08:58:07 +0000
Received: by mail-ej1-x644.google.com with SMTP id p9so2587573ejf.6
 for <linux-amlogic@lists.infradead.org>; Fri, 25 Sep 2020 01:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=eJsaR2S9c0RCFooPTqi2lQWjWsZMnHQ41gMbagMVzj0=;
 b=v8Y6GM9jKWXqAqyb8w0DpE3RFacTvtkMdVeac5CRaQtMbsw+wR0etpMczPxG5gBtu9
 RHXxUsXmlRG4uxuJCXthVTPqu1f1YqrWBogZOHjkPTDeWKKSObQAx7RT/D5zRz4+nOIj
 fRN9ixM4MpZml9LA9kZ0ERsJuRULY++2lfEI9Z7Ung1lZgZ6dUh6cKfScxWMNeKeF083
 4kl3t2JbvH0mWzmCL6unvpJ1ptbA4NPXc3OnU6dGDD9ATUoQ8KmEyQ0yWcIHvIoWpKhv
 r+f1IXAgcgGGFH7dM4b9/4l5Y6cS3VDIoZ3jumAF+qjjbmRDz2LntqkChCKW7+vrvnRU
 y9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=eJsaR2S9c0RCFooPTqi2lQWjWsZMnHQ41gMbagMVzj0=;
 b=TberuXpAitMKzElzgGRMMtm+1kv91fep7DGHJ7Rz6VzIqizHBxSKiJT9xqnOYTqF3I
 cQX0/IOItCnVLw+AqOhv1vxX2u/XQKnXBEwy2xzBHqDvbJbJzCt0WtYkuTxkHxxrdIwz
 9KKnGuzN2Q1sGfR01m8Cd/IJMVehFIncgKV7uT0gTEyWIQJoN2idqNDWb3NkENwvPdc5
 ERhTSLPbF1XDa5xtESo/SiWk0evvazyaUBKuxW1dJxGBlBQQOkWtEpJNdxfOi0YFHAWc
 KufjD65BMOgQ0aXTjBaYRjBH9H2DyJDuBT3KBIjXMLPXMkdG3g8TCf8XXPaBx2CHP7Ac
 +C8w==
X-Gm-Message-State: AOAM531cHxUOyIXk0r7o+aGyASMd0wlUXx+4TeRJgaeV/8gmYar+n+/r
 +8KlzNsEc+VqM+iWk3blK8UjOQ==
X-Google-Smtp-Source: ABdhPJz0C9RFuiseiwDk9qPjhkaxw7fXHw7IIbLa0ThW1vPCU2JlQrYGn/aJNpj2EFBaYnhOocYgvg==
X-Received: by 2002:a17:906:3ca2:: with SMTP id
 b2mr1736707ejh.460.1601024282799; 
 Fri, 25 Sep 2020 01:58:02 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id cf7sm1330341edb.78.2020.09.25.01.58.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 01:58:01 -0700 (PDT)
References: <20200925033017.1790973-1-art@khadas.com>
 <20200925033017.1790973-9-art@khadas.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Artem Lapkin <email2tema@gmail.com>, narmstrong@baylibre.com
Subject: Re: [PATCH 8/8] arm64: dts: meson: enable RTC for VIM2
 meson-gxm-khadas-vim2
In-reply-to: <20200925033017.1790973-9-art@khadas.com>
Date: Fri, 25 Sep 2020 10:58:00 +0200
Message-ID: <1j1riq9qsn.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_045805_845033_40D86275 
X-CRM114-Status: GOOD (  15.16  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, nick@khadas.com,
 linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Fri 25 Sep 2020 at 05:30, Artem Lapkin <email2tema@gmail.com> wrote:

> enable RTC for VIM2 meson-gxm-khadas-vim2
>
> Signed-off-by: Artem Lapkin <art@khadas.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> index 70343da2811..76b7e34a9a3 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
> @@ -229,7 +229,7 @@ &i2c_B {
>  
>  	rtc: rtc@51 {
>  		/* has to be enabled manually when a battery is connected: */

If going for this change, this comment should have been removed

> -		status = "disabled";
> +		status = "okay";

Unless the VIMs are provided with a battery by default, I believe this
should be kept disabled and only enabled by the bootloader if necessary.

If you think differently, feel free to resubmit with a complete commit
description and some details as to how this would be an improvement.

>  		compatible = "haoyu,hym8563";
>  		reg = <0x51>;
>  		#clock-cells = <0>;


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

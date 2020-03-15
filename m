Return-Path: <SRS0=a7J/=5A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 348B6C2BB1D
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Mar 2020 12:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 072EA20578
	for <linux-amlogic@archiver.kernel.org>; Sun, 15 Mar 2020 12:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LA2JgbS3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vdx/AWpb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 072EA20578
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qqol/XUL/GLJ+s78nBSGX0cNWMLOUUoWPyhSrh0/i4Y=; b=LA2JgbS3uIs5Ra
	FA9k8rNGCwTkI0KfD3a08U0ZQufq8fq9SUQ9U6T9lySZmUb3Q4KZWEo9AoOtNrt/Nh8dfm4kue6y1
	r21NSW5yqE5M6jKa+q0i9/vbfoaI+9+l9VjHGr51OGsAudRBjXzokxVYvXcRW+zcvTSE1GLmd8KU6
	WcqnmybeIl0z9baS3bvWaV4+zuk2URR3B+9FnUKT+I123xzlUpipaIRHyhggHFO0Wq+mV9GVIf3u7
	Ao9ZXrRVGXoz6hccSoB8/goemKiBDQrVrVn8kyPIJ1ZlYVij8moFM1sxQIhHrP3Gzu/AyeK8/NrEr
	8bKrbp8f2KerzRQrCeKA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDSHL-0000ng-Bt; Sun, 15 Mar 2020 12:22:03 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDSHI-0000ms-1H
 for linux-amlogic@lists.infradead.org; Sun, 15 Mar 2020 12:22:02 +0000
Received: by mail-wm1-x341.google.com with SMTP id 6so14632919wmi.5
 for <linux-amlogic@lists.infradead.org>; Sun, 15 Mar 2020 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=vha27SiAYzAhcDNBs+Dl9n27oWyXGNvtt3qs0cPd6sQ=;
 b=vdx/AWpbJGf6eGvcUWhRBV5AGujIONlqn5ljlh0AgQ66Phu9FKyLyrmWy/dwSOhasL
 JiPWXsOZNSIAh8A1Wh1pWA7qgDOjt1EFP0EB/r+auvvRyG+xVTnXol7hnamr1lIZwvOe
 HaadraWXgolGcPtFXWLhEaD5NJbjlJh3oMnL9DOpFK2M2jU/D338nlC9jpdyrrfmIAxs
 S4EbWrB7Vlkjo1cKRTeq+NbcrV9RNCiXTyvKOFpxfuHfRf4f5FMYoFOJ6UA0BBdnFb/m
 hR82zI96c6qAGYF+9oq2mSz+7ZVkMPxoixusUO2LlJg3Ow3eKhlB5oIVPkHRHQcP5AYl
 BbaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=vha27SiAYzAhcDNBs+Dl9n27oWyXGNvtt3qs0cPd6sQ=;
 b=rcUb5CLbuFx1NY2CcQZ/+dH7/qBOYLlIM6VuFHlYmvZTCOklMMPyxxhtR48/0nzf3C
 RyThXmn8IGumUVutHt7FeEkY05u+VcOamZnMr0sdZadT6SDitxkHPbX+Wm75/sGFtcdX
 ZKFeFbSSKvhp+EaEDH0eRE/Gfo40n3Fa4d/Fq0fpPxACOt5/RBoM9PcEp03Tf/Qbydd6
 LQ98UB6FfhXDIe5zyC1MQhPUHlfbLWfjyCCi+6WTJxpHBhVH/RvO0/aOB7VUwJ06djBE
 M6b33GFnRMYTIh1R6uWoY7/xLpnT3sA3ib1TH8N9AwsjTkA9s4pkKxfSJgMvq7NalzOS
 kDWg==
X-Gm-Message-State: ANhLgQ2UeYGcLsH+LW/XEILx/ex1fga4153xSu2F+ow8aVJwp6amMuQ5
 lMYyf7tvPQqd0YwmMCtixIbaRw==
X-Google-Smtp-Source: ADFU+vtQnU95n7qy8u75UCKhpXx1uwrD1M1UBVCsAjszEJYzX3P1D8bBHGSvVEKd+7LWflB5zO4tYg==
X-Received: by 2002:a1c:a950:: with SMTP id s77mr21714742wme.176.1584274917762; 
 Sun, 15 Mar 2020 05:21:57 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:9df:5498:f5ea:8be8])
 by smtp.gmail.com with ESMTPSA id v26sm7733803wra.7.2020.03.15.05.21.56
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 15 Mar 2020 05:21:57 -0700 (PDT)
Subject: Re: [PATCH] pwm: meson: Fix confusing indentation
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20200314113524.23031-1-krzk@kernel.org>
 <20200314214347.dun6ith5zamaa3m6@pengutronix.de>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <658d2096-8a2d-7cd0-b4fd-88f4516ac7a9@baylibre.com>
Date: Sun, 15 Mar 2020 13:21:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200314214347.dun6ith5zamaa3m6@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200315_052200_212130_8662DB99 
X-CRM114-Status: GOOD (  10.21  )
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
Cc: linux-pwm@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 kernel@pengutronix.de, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org



Le 14/03/2020 =E0 22:43, Uwe Kleine-K=F6nig a =E9crit :
> On Sat, Mar 14, 2020 at 12:35:24PM +0100, Krzysztof Kozlowski wrote:
>> Fix indentation of return block.  Smatch warning:
>>     drivers/pwm/pwm-meson.c:139 meson_pwm_request() warn: inconsistent i=
ndenting
>>
>> Reported-by: kbuild test robot <lkp@intel.com>
>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> =

> This exists since commit 211ed630753d ("pwm: Add support for Meson PWM
> Controller") in 2016. Added Neil to Cc:.
> =

> Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> =

> Thanks
> Uwe
> =


Missing

Fixes: 211ed630753d ("pwm: Add support for Meson PWM Controller")

With that

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

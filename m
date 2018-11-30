Return-Path: <SRS0=Tn3k=OJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF99BC04EB8
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 20:15:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BEDCB20863
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Nov 2018 20:15:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oN+TKCtT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1BDPI016"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BEDCB20863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKxAx6qN+yvjknJR4UWuAqZT9wSL1PaBMRP7wOLnD24=; b=oN+TKCtTPvGMq8
	b8YAMTpAuukuoS/xLHH2k9vUn+hiGuL3HAxGuPRD/Hxrp+D+POIE3FYCUXsszCLkdsU+qKCp/3E5m
	btSNPSwEyBfdfVvpOv7JaNe2/WWs8mpQhSusAlR+kudH0Bmto6zgzvXkDCjWnUteV+FAVAfVE5O4o
	jHneR8hIalj5O150i0+FBjJmBOFbJxy5B/ZD4rGVGIsf/RLk/Tjy6Vejx0ast1GTlhInGEgdp+jit
	I4IANBO6GtSao9uHnVL1QvU/lOPvf20HWnBngcEw9+rCtkPmkHP0vxQPt2CGYoN4Z+SP4cNTmF67S
	gVEKsarKMgVUHaPv8+ZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gSpCQ-0006YG-86; Fri, 30 Nov 2018 20:15:42 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSpCM-0006XL-Ii
 for linux-amlogic@lists.infradead.org; Fri, 30 Nov 2018 20:15:40 +0000
Received: by mail-pf1-x441.google.com with SMTP id w73so3328121pfk.10
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Nov 2018 12:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=S3h6x4Q6TrOxECPjVHrAnOIqdyNtF6hqLenH5hJehdU=;
 b=1BDPI016xvgYrBLeoB62dQHpwLB4u7nmTdmzYm/r1EILuZYxUYhkxo6YpxZ2lOV+HM
 OaPenc/9vtVpdI1aoa7Iv/ItFmFad1uZeXqGkQOeMGRx3Q1X+s4doIK3tw0IhG4IEIyK
 IJ+ttaMXcEOB8ad1tCl7bHuynKvAUdH1BItClmooTefHx+f6uqXUU3EQyDF0WItQryef
 T0MCjUwsTI/97ohpUYv62G1ox3dwj0MxeKPHh2EwoJsPCDTnUGBc0HB3VW54e6idPmkK
 WgZbr/fom5tBk61cfFUGBLm3bGpJUUohiSy4pglJVocJfLU/aXmQ6EXIPxiYl4xYJSPE
 cG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=S3h6x4Q6TrOxECPjVHrAnOIqdyNtF6hqLenH5hJehdU=;
 b=mgqm2nbdvWz+xNrDt8MjzrSYOK3tWdWmjvyCdDLsK2pYFf8nab6Jw2hSagGzwof92G
 Rl6hP+PlsoibMHdqWKunzVEKE7Na1XnuTAb2AL/wm/+aGaggPLTaQVMl5hwL3gYIL5bU
 WujcKPQ/o18XpqvVU9py3f8qsWFIP1F8hWnv4jBWmU768PpoDJHu0m+PwhqNfqDFcAUh
 6GYHvVNVuZQPJt2HiqdWB7vjHbM9SSGHrbC+iY3TEmJtJvVKF44rhmZjy1d/tcUUg6Qr
 o6wwylDYDXuyKSDTeo/OhLxN4LEMaCx28ethChoWBoyPYydu4UtHnWTCFP3mS2IWpJRQ
 EjeA==
X-Gm-Message-State: AA+aEWayt7TLoM80upm6T2uZegr/zUDjUmjNaArLiS/9yOL53Nx6vWrC
 kUMxOE5sqHnnnaQywOhuo77LFg==
X-Google-Smtp-Source: AFSGD/V49rUfH8fSiVj9lIqkQmaS5zKDm9FsJ6emdVDwWAPh9VVJtvCljOHV+DWWbByptnRugnl8aw==
X-Received: by 2002:a63:7b06:: with SMTP id w6mr5951812pgc.288.1543608927356; 
 Fri, 30 Nov 2018 12:15:27 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.googlemail.com with ESMTPSA id
 g15sm28232368pfj.131.2018.11.30.12.15.26
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 30 Nov 2018 12:15:26 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, jbrunet@baylibre.com,
 robh+dt@kernel.org, mark.rutland@arm.com, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to
 the HHI register area
In-Reply-To: <7hr2f25t4b.fsf@baylibre.com>
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
 <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com>
 <7hr2f25t4b.fsf@baylibre.com>
Date: Fri, 30 Nov 2018 12:15:25 -0800
Message-ID: <7h4lby5nky.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181130_121538_641618_22164D90 
X-CRM114-Status: GOOD (  11.93  )
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
Cc: sboyd@kernel.org, carlo@caione.org, mturquette@baylibre.com,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Kevin Hilman <khilman@baylibre.com> writes:

> Neil Armstrong <narmstrong@baylibre.com> writes:
>
>> On 28/10/2018 13:08, Martin Blumenstingl wrote:
>>> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
>>> register region called "HHI". This register area contains more
>>> functionality than just a clock controller:
>>> - the clock controller
>>> - some reset controller bits
>>> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
>>> - HDMI controller
>>> 
>>> Allow access to this HHI register area as "system controller". Also
>>> migrate the Meson8 and Meson8b clock controllers to this new node.
>>> 
>>> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>>> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
>>> ---
>>>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
>>>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
>>>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
>>>  3 files changed, 23 insertions(+), 14 deletions(-)
>>> 
>>> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
>>> index 0d9faf1a51ea..ad903d1a2cb6 100644
>>> --- a/arch/arm/boot/dts/meson.dtsi
>>> +++ b/arch/arm/boot/dts/meson.dtsi
>>
>> [...]
>>
>>>  
>>> +&hhi {
>>> +	clkc: clock-controller {
>>> +		compatible = "amlogic,meson8-clkc";
>>> +		#clock-cells = <1>;
>>> +		#reset-cells = <1>;
>>> +	};
>>> +};
>>> +
>>>  &hwrng {
>>>  	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
>>>  	clocks = <&clkc CLKID_RNG0>;
>>> 
>>
>> Kevin,
>>
>> I didn't apply this one, but it can wait another cycle I think.
>
> OK, I'll take that one through my dt branch.
>
> I don't see any obvious dependency on the clock patches,

... and a quick boot test shows I was wrong, and should've (re)read
Martin's cover letter a couple more times. :)

I think it's best to leave this one until the next cycle when all the
deps are merged.

Kevin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

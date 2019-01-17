Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B91C43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 18:14:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B745820855
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 18:14:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n7ahSWrX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="idTX8LHZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B745820855
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yvncbQh7JV2m/OlG2bgpXb/nKEDY6vvp7wCXMjLNhY=; b=n7ahSWrX7TRd70
	AQhv6S0k6n2VcMfrbbNN/rxlsikuHCj/3Sb67Y3uC4rpemsafo7jsIy47+9UoS2jk+ir711Dn8xJk
	Ler1R86snPZS44zbezyIhQ14pe8uQvQYpqc462A7OQRzTJMV+b+50au67MDQTBP4QQVz3mhzv3zWh
	HCRHyI2TQ7Tv63kqnkG2C1PKpghJstBG2HL0MoHpvtLkk/tRs/2vAghh4Sdx3RKWVaxNRRQrA3hOf
	CNdsH3Xaotankt9Lx7TZSoj3GE5q5fXX2BSb6G8jNJA+RvuD1/P6OK2/+y/BHELPNOnjVAOoUhTAf
	lGoUB5EaICl89LuJvh9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkCBC-0001l6-Jx; Thu, 17 Jan 2019 18:14:14 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkCB8-0001Zl-Lu
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 18:14:12 +0000
Received: by mail-wm1-x342.google.com with SMTP id g67so2067439wmd.2
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 10:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=ykscII2ksBNyB/Hjd+f+Vn2Obzc7BvKpk00Ux9/48dY=;
 b=idTX8LHZ8CxERMf+DA/UY4F4Rn4+V0awRVM0LO6N2FU0DpFk/ciy/xH4a2JO1dCYQa
 JO9SVtiOk/8w/kfnJWB3qANrb8agrtc9lQdnPro3uqIlwX5Gla/IUIT227LTqDPLEVN5
 eRJQjiu6n6mZg/Xfk6DGX2BEaMRR+Yb9za5k6ZAYZaJQK3UHSux6OyJQETYka2POfS+i
 cpBqagzjtkxlSv7cCSHbmni9sonEaqCCEGMKExn/I9C9auOvinAKFMBufBG0gn1zSWps
 H+1xWsXZPkMjHRPi+Ho3HmqCeXmRbXdZ5Hey1W9WwPVpA1t9Q2z36TLZb+TaJxyuFS9h
 CZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=ykscII2ksBNyB/Hjd+f+Vn2Obzc7BvKpk00Ux9/48dY=;
 b=oK5Bou5ee58aAJs3iJsdiGhmTtPh4qcS6UQuz/adX0GBtJ13Qi1XAC+qNe+mhl5kxM
 SjNFWGW2iv9mva7vvYxPzIsPDxojwSZmzGC1xzaBdD2j0VAyL3GP7rKGT5qQKH2hSv55
 6wZhuUu7w59dAKuAz08BVMxPeH/nKWoMS9XNjzVE8mruy5FcTHuUq7abl+twMLj3GCvN
 VW+8J8xZoSWOsxKwYHKVy91UmgoB1CGx5R6/9XH4lXpmWi6aLl4dk/52crRh8n7ExoxO
 lPeJXnCSaR+GjpiFr8dHL/FCXGsgUFlV9mLRp8cpeCa+SzeA9C+/D5h+kMHCG7qfhRa+
 w6sQ==
X-Gm-Message-State: AJcUukemvM7q1ZxJaoKRgJlVh+W5JV3LJYF37TfeXjwH8zEE1GVAggcA
 dRZYIeYOBd2TQdVIPSbM2yZzYQ==
X-Google-Smtp-Source: ALg8bN6ddt/5ZTwc41pOMsPMLu+R4ReEZJ+2EgW2MwUYFXlPJbClaf1jOaeveGEvKpxgeJAAp1Tndw==
X-Received: by 2002:a1c:570d:: with SMTP id l13mr13183908wmb.139.1547748847669; 
 Thu, 17 Jan 2019 10:14:07 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 y13sm40912021wme.2.2019.01.17.10.14.06
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 10:14:07 -0800 (PST)
Message-ID: <284838d9e1672f2d733e687cedbda1239eab5279.camel@baylibre.com>
Subject: Re: [PATCH 4/4] arm64: dts: meson: g12a: add clk measure support
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Date: Thu, 17 Jan 2019 19:14:05 +0100
In-Reply-To: <20190117164838.8008-5-jbrunet@baylibre.com>
References: <20190117164838.8008-1-jbrunet@baylibre.com>
 <20190117164838.8008-5-jbrunet@baylibre.com>
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_101410_857876_B2E33016 
X-CRM114-Status: GOOD (  13.94  )
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
Cc: linux-amlogic@lists.infradead.org, patchwork-bot+notify@kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-01-17 at 17:48 +0100, Jerome Brunet wrote:
> Add the clock measure device to the g12a SoC family
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> index bd24de947a5b..0d3d3af8ea6f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
> @@ -181,6 +181,11 @@
>  			status = "disabled";
>  		};
>  
> +		clk_msr: clock-sensor@ffd18000 {
> +			compatible = "amlogic,meson-g12a-clk-measure";
> +			reg = <0x0 0xffd18000 0x0 0x10>;
> +		};
> +

Hi Kevin,
I just noticed that I hace misplaced this node if, like for the axg, we are
ordering them by address

It should be under the GIC node.
Can you fix this on the fly or do you want me to resend ?

Cheers
Jerome

>  		gic: interrupt-controller@ffc01000 {
>  			compatible = "arm,gic-400";
>  			reg = <0x0 0xffc01000 0 0x1000>,



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

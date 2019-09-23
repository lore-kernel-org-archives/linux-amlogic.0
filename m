Return-Path: <SRS0=YI5+=XS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B66CC04EBF
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 10:06:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F177C20820
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Sep 2019 10:06:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MeyX4X0U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WC9lw/G4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F177C20820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BVIycqLhW6dgDEvv0s0QB8XxCAx2QfnFe3BY0acqxRA=; b=MeyX4X0UNQy0cp
	8z5ac5JAFwAS7su45gaTCYkYLD3U150Av99fiTAWUdCPTqXS46tL9IhFYmegyilfEbzUontBucnvk
	+W8mNwBIEC8DX02rEVFxkqIVWasJfMs67jCe8EWZR4q4sLBrHzk5XVOna4wOBP8Es3fmRYGcPoPQE
	9FcAa6Nag+o28gT191mix9W48lJCEPofTz1RzfXj/Ko0wMuKXnMG7P+24bjPAsJapugdJa4gS3fG8
	C9oTh9iARSEohlcK1B0aaZ8ML4ldRJuv2eYqqWb2Hu4SzP8iCK8o77JwOqvLrIYJeWoolMgDevFm2
	0nziY9dWJVQrXRqO1i+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iCLEr-0004Bb-Nw; Mon, 23 Sep 2019 10:06:38 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iCLEf-00040o-B6
 for linux-amlogic@lists.infradead.org; Mon, 23 Sep 2019 10:06:27 +0000
Received: by mail-wm1-x344.google.com with SMTP id f22so1453776wmc.2
 for <linux-amlogic@lists.infradead.org>; Mon, 23 Sep 2019 03:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=efP++C+n842ztdoruWHDsU5t7UYA9AhqrH+sQr0d664=;
 b=WC9lw/G4j9t7XfO7TyQQ+hQwJ2ffDW97T4DSfot/iXZ28CL777HiBBFAXG72dy3Xp/
 qBCUZFBu3ifqNu7HsTfJAg1/QfIzikeAXdne7P0iP6wKqE7joi4zx56TH6xqHy51C5e+
 53pQbs3zcWxdoKDXbZcmIsdLLGblPgAN7jVTknzeleIIR6dGZxC0YVniDjjFnvt419YH
 YBvdsaqx4r0HU0oLhLTwO0NzXSZF5KA+nEn3DOxdEQbJZ+6hsPxnWj6z+1Y6JA++yGcH
 WpF9gYtNUAoOcabk2M3GM4Exu56zcPS5sOpzP4PmmGXJomuH4VHZuA14bTmGPxLv4TsE
 LXmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=efP++C+n842ztdoruWHDsU5t7UYA9AhqrH+sQr0d664=;
 b=U4/gcQPNWHCSqhLTT0lzEc+gRWDn5GrTTwLcStMjuYgxywTkbbbWrFPNS6ZLfsRuK/
 A5BFwUiNcCHDsXLriFfsKWgTfSF4yqzGgXW5hWXExxHl3bCnyE0GLGHCR+w19YTbU3e3
 zhhISc+9uNhGWovDGxb/w7B5h3+2H3kd+m7kw8I4SsgIvfomtS5chiC4aKLx7aDGBFkU
 fiI5hBuHj/ICPVBwDeHETb/ysk/aO+Ceqgbc0V9669VAabenWnj5zOLyKnqLW2fmT+88
 KyP2Svs586igFk/E5FR97ptKEZOHMTPUH5d3zvjrhM990tSsNdKvmoWd+QOXH+SPGeUV
 SKKw==
X-Gm-Message-State: APjAAAWA4H/SG5612h4x9NSAY2uYBP7UUcoNr8f6lNrMAxWAhjVDj6TR
 bGlEuiEnojlHpOQpcvKRpfN0OQ==
X-Google-Smtp-Source: APXvYqz2luNiHMrLwslAQi441uViJJb8E2s1paCFVoS208d5LL0ax7NHmxfoN7H9JcWe1ml1uW1Kiw==
X-Received: by 2002:a1c:6841:: with SMTP id d62mr13297447wmc.48.1569233182680; 
 Mon, 23 Sep 2019 03:06:22 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t1sm9644294wrn.57.2019.09.23.03.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2019 03:06:22 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 khilman@baylibre.com
Subject: Re: [PATCH 0/6] add the DDR clock controller on Meson8 and Meson8b
In-Reply-To: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
References: <20190921151835.770263-1-martin.blumenstingl@googlemail.com>
Date: Mon, 23 Sep 2019 12:06:21 +0200
Message-ID: <1jsgons4wy.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190923_030625_446634_3AB52762 
X-CRM114-Status: GOOD (  14.43  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat 21 Sep 2019 at 17:18, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
> registers. This series:
> - adds support for this DDR clock controller (patches 0 and 1)
> - wires up the DDR PLL as input for two audio clocks (patches 2 and 3)

Have you been able to validate somehow that DDR rate calculated by CCF
is the actual rate that gets to the audio clocks ?

While I understand the interest for completeness, I suspect the having
the DDR clock as an audio parent was just for debugging purpose. IOW,
I'm not sure if adding this parent is useful to an actual audio use
case. As far as audio would be concerned, I think we are better of
without this parent.

> - adds the DDR clock controller to meson8.dtsi and meson8b.dtsi
>

Could you please separate the driver and DT series in the future ? Those
take different paths and are meant for different maintainers.

> Special thanks go out to Alexandre Mergnat for switching the Amlogic
> clock drivers over to parent_hws and parent_data. That made this series
> a lot easier for me!
>
> This series depends on my other series from [0]:
> "provide the XTAL clock via OF on Meson8/8b/8m2"
>
>
> [0] https://patchwork.kernel.org/cover/11155515/
>
>
> Martin Blumenstingl (6):
>   dt-bindings: clock: add the Amlogic Meson8 DDR clock controller
>     binding
>   clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
>   clk: meson: meson8b: use of_clk_hw_register to register the clocks
>   clk: meson: meson8b: add the ddr_pll input for the audio clocks
>   ARM: dts: meson8: add the DDR clock controller
>   ARM: dts: meson8b: add the DDR clock controller
>
>  .../clock/amlogic,meson8-ddr-clkc.yaml        |  50 ++++++
>  arch/arm/boot/dts/meson8.dtsi                 |  13 +-
>  arch/arm/boot/dts/meson8b.dtsi                |  13 +-
>  drivers/clk/meson/Makefile                    |   2 +-
>  drivers/clk/meson/meson8-ddr.c                | 153 ++++++++++++++++++
>  drivers/clk/meson/meson8b.c                   |  36 ++---
>  include/dt-bindings/clock/meson8-ddr-clkc.h   |   4 +
>  7 files changed, 245 insertions(+), 26 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
>  create mode 100644 drivers/clk/meson/meson8-ddr.c
>  create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h
>
> -- 
> 2.23.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

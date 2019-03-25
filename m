Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B613C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:55:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CEB120870
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:55:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c+yGcZGu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="OFeRfTYN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CEB120870
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqMVMrxZyQ+LVbJ9hzi+Q5AMxjCKsmOlNv/6sl4pvo8=; b=c+yGcZGuTkLzQ5
	WdI8J1eL6Mo7ENjEhpoaqGkZrrtWPOEwyMCQfiBZrisnFAG+tlM/XIwziPSDaDgVqjanSSbAs/8HM
	tt+VN+rai2G5OCOSsHD4l90NHzS87v/j+QijUyZf8Lw2CYzlE6Fz21sarXDfCqAkZEKBZ45teDRWK
	X4zzY+oisjXyWmnJ3K5CGZGlEDTV9h1ZKJaK8IRk9HkSxHQTFWapX6ZrbEmV1EIY3qD4Kmouj9esA
	I5fcXpzXDFIJfCgK/TcUQJ3rFN0G9DEyyRP+C0m/PqK8h3f0kABVkd+gS//gftEz3UNp12CmZWs32
	bQLyztTH5Zm2ZpYYZnVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MJt-0000xk-OF; Mon, 25 Mar 2019 09:55:05 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MJk-0000d6-KB
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:54:59 +0000
Received: by mail-wr1-x443.google.com with SMTP id y7so5194508wrn.11
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=aIjqM24c2LO+vY7cm+Vdv0ng2cthwTTr3CbZK+Vjb4E=;
 b=OFeRfTYN8zmSc9/yXPtt3achkb22KSydKR0P+401Jxi5pyFw3BDQBTnZAH+3AG4LKF
 +wRCH0WaDitz4htAWPG28vMhVhlbvHDLCBQ+y24/5uxQlG6lF1b/NU/5KpTehMRsE28+
 RsBAW/AAlCuhmyW2mAr4XdTDuUq4woAWYmPdG21C+A/s32O87wGdz79DJymsS6FqqKZ4
 TbhB3zAoRK4ZZCc0A0JA1Ae5TZSjBoPc8QcnV5a9ZoNSRyJEGe2w1TXb6uaf4cQwOab1
 q+j/T+SdqzZkcImRHpcnJNlBOP6SY5/nkKAcvGTM67aSo3SULUg4yziiUXc8+SxPMKmP
 Mgyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=aIjqM24c2LO+vY7cm+Vdv0ng2cthwTTr3CbZK+Vjb4E=;
 b=sRL9ZjYpoA3x0ZYDH3BkrZQwVCn+XtqOaZYfQbxh8mQUrLUGq3+aPMcBXXJt/ItmdJ
 35i2a5jOlPPwXPs7Hk6YZ6Juusrzfv8dxlvFHhuwlDPTL8MyoISz68cOr7V/i/r6/FTm
 gSxpACaDS59Gg4BQo7HlQciy/SWEmG/WHF3vstBa3lYK9ayhCt0+MkIvGdwSXwpbCJvT
 sGzIgJg76K2XOBiTBW0QeusXdtknt3snCJGV3WclpncTBnHRcZshyCEXkWdziUJlxPZU
 nOLJE+qR6L5p9jqcbW8wfu5DME6EU1Ymrux2iIONVbn4TE78zXojLkIqi98NoG12zpZN
 N+tQ==
X-Gm-Message-State: APjAAAWWg5nHv8HldCqgZ2pa+Iy1ZguiX7qDFLQkXRInG3QECdg04fGP
 9CQgfeQ67yroCojqiEMRR+qJJw==
X-Google-Smtp-Source: APXvYqwCctG5WqwtJOCuczYlgOhzvTAx5K7iS6oR8G78Hc8qzc66b0TY1jTBOZBV4UIhm2PZF84D+A==
X-Received: by 2002:adf:f451:: with SMTP id f17mr11398539wrp.272.1553507690860; 
 Mon, 25 Mar 2019 02:54:50 -0700 (PDT)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.gmail.com with ESMTPSA id
 f128sm29137484wme.28.2019.03.25.02.54.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 25 Mar 2019 02:54:50 -0700 (PDT)
Message-ID: <2cdcecddbadc41f6e94876c519153f071738f272.camel@baylibre.com>
Subject: Re: [PATCH v2 0/4] clk: meson8b: add the VPU clock tree
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Date: Mon, 25 Mar 2019 10:54:48 +0100
In-Reply-To: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
References: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_025456_659472_383393BE 
X-CRM114-Status: GOOD (  15.30  )
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
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 2019-03-24 at 16:11 +0100, Martin Blumenstingl wrote:
> This adds the VPU clock tree for Meson8, Meson8b and Meson8m2.
> The VPU clock tree is slightly different on all three SoCs. The details
> are explained in patch #4.
> 
> Meson8m2 requires the previously unsupported "gp_pll" PLL. This PLL only
> exists on Meson8m2 - Meson8 and Meson8b don't have it.
> A separate clk_hw_onecell_data is introduced for Meson8m2 (using the
> compatible string which is already available) to account for this SoC
> specific clock setup.
> 
> dependencies:
> This series is meant to be applied on top of my other patch from [0]:
>   dt-bindings: clock: meson8b: drop the "ABP" clock definition
> 
> changes since v1 at [1]:
> - fixed typo in the subject of patch #2 (spotted by Neil)
> - collected Reviewed-by tags from Neil (thank you!)
> 
> 
> [0] https://patchwork.kernel.org/patch/10860387/
> [1] https://patchwork.kernel.org/cover/10860401/
> 
> 
> Martin Blumenstingl (4):
>   dt-bindings: clock: meson8b: export the VPU clock
>   clk: meson: meson8b: use a separate clock table for Meson8m2
>   clk: meson: meson8b: add support for the GP_PLL clock on Meson8m2
>   clk: meson: meson8b: add the VPU clock trees
> 
>  drivers/clk/meson/meson8b.c              | 422 ++++++++++++++++++++++-
>  drivers/clk/meson/meson8b.h              |  12 +-
>  include/dt-bindings/clock/meson8b-clkc.h |   1 +
>  3 files changed, 433 insertions(+), 2 deletions(-)
> 

Looks sane.

Acked-by: Jerome Brunet <jbrunet@baylibre.com>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

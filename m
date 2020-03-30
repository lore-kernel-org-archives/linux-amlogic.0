Return-Path: <SRS0=cow0=5P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2042BC43331
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 16:28:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1E32072E
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Mar 2020 16:28:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bTQ8Ayn9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1E32072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2X9a9CPrO4spg/p6ZkB1rdKHLgLee236G1PmYa6GLs=; b=bTQ8Ayn9ORH1nn
	LA6Obpw+aw7i1sSdhDMvOzjwbw0eQOK1Yow8piXLImY1QDLgMJZntLcZFO+C5Om8K135bskEn9PBR
	/7aiEIQ4MVdRPfIIIwIgwex4qDmKUaMRRQnwO+Rxeg5Rl3FfnNN2VMSPzDCALQTffUR0PuR06qBbC
	/oZvQm0BSgUR7Se8VeLMIOSJEsXHj7Fr3I+qetC5gLOCCsEOpOC4nIrIG2YQI0dU1Jzw/eikTQNap
	rq4WoDpZxP01O+3GP5wtz+Rtk9YI069tc/0RkE3KS1KbA6IcO7BXJtC6RZcj4x4/k+LxkfxOKD0yW
	1Itpbx7YrLNBGYHVFguQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jIxGl-0002qC-Kb; Mon, 30 Mar 2020 16:28:11 +0000
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jIxGj-0002pf-60; Mon, 30 Mar 2020 16:28:10 +0000
Received: by mail-io1-f65.google.com with SMTP id i3so9251330ioo.13;
 Mon, 30 Mar 2020 09:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=g4xE6WgRPY/ofYo+AU3gHyBfgox1LqQ8FIlPCkJQGyk=;
 b=DTFjZM4waWImd5bY4n2xxPeK3bzzplkj0+LLz2SA/p3+kbSTykySpxUMCv/aQMn09D
 bN3zugMWS+zNOAZ/Ndd7V6luZSY9aQdiAEL7+QFEt183WW6b8hpxYlCSF28rhzKUOjW7
 MwuDgPHJqstcidWM9PnaAVYWn1px5gDnj3k4SA/CFo7BWpHTFYbZL73fhKOhZQQPRoY4
 5oVRB1PyjoABwzhkbVH/S/LlpNQkb3pDcKtWXBeXOY6ipLONvsajuPd4VdYnsx+qNqhK
 5TFc/AYeUFGp+VaxDltAa1WEsXqygM1HtRJgv8TvlwLpJnCsCoiYxtAGD6FYWJC4qqzc
 tS4A==
X-Gm-Message-State: ANhLgQ1kPAK5a61N0JxuKqGNw/zBrzdDfvvHNann2MG/S+VWiOJmE7Ad
 K7Yg4me8dYgUWKPjAkcWtg==
X-Google-Smtp-Source: ADFU+vtqY4AfJ9Mj+w3Ew+uvBRq1gXk3qUFKAIQJlsvqmcTWMhltCzJINAWQvEG/UaLUJ+dp7lTSjQ==
X-Received: by 2002:a02:a85:: with SMTP id 127mr11347531jaw.51.1585585686698; 
 Mon, 30 Mar 2020 09:28:06 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id s66sm5031561ilc.9.2020.03.30.09.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 09:28:05 -0700 (PDT)
Received: (nullmailer pid 28168 invoked by uid 1000);
 Mon, 30 Mar 2020 16:28:04 -0000
Date: Mon, 30 Mar 2020 10:28:04 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v5 1/3] dt-bindings: mmc: Document the Amlogic Meson SDHC
 MMC host controller
Message-ID: <20200330162804.GA27288@bogus>
References: <20200328003249.1248978-1-martin.blumenstingl@googlemail.com>
 <20200328003249.1248978-2-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328003249.1248978-2-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200330_092809_222343_7BDD909B 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, ulf.hansson@linaro.org,
 jianxin.pan@amlogic.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yinxin_1989@aliyun.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 lnykww@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sat, Mar 28, 2020 at 01:32:47AM +0100, Martin Blumenstingl wrote:
> This documents the devicetree bindings for the SDHC MMC host controller
> found in Meson6, Meson8, Meson8b and Meson8m2 SoCs. It can use a
> bus-width of 1/4/8-bit and it supports eMMC spec 4.4x/4.5x including
> HS200 mode (up to 100MHz clock). It embeds an internal clock controller
> which outputs four clocks (mod_clk, sd_clk, tx_clk and rx_clk) and is
> fed by four external input clocks (clkin[0-3]). "pclk" is the module
> register clock, it has to be enabled to access the registers.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/mmc/amlogic,meson-mx-sdhc.yaml   | 83 +++++++++++++++++++
>  .../dt-bindings/clock/meson-mx-sdhc-clkc.h    |  8 ++
>  2 files changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/amlogic,meson-mx-sdhc.yaml
>  create mode 100644 include/dt-bindings/clock/meson-mx-sdhc-clkc.h

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

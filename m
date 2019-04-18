Return-Path: <SRS0=/MY2=SU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90C7BC10F0E
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:46:21 +0000 (UTC)
X-Greylist: delayed 830 seconds by postgrey-1.34 at mail.kernel.org; Thu, 18 Apr 2019 20:46:21 UTC
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J9O40neP";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="IVo+aFRO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D422214DA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D422214DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 18 Apr 2019 20:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oXduvr+hr/DOYRmwSuR9c5H34UsoBwu6AkrwQZOjzlg=; b=J9O40nePruGbxh
	E6paXTmqGndGiZdamf179nacNWvQVgPClRWjmEX3EXRmoLM2bJTEGM/ulX2k2zlX+8UuOWaQCUOZJ
	mnrzFXVfLhqsguLaCIp45l0NE12Z1g4ATQzljmQAz/8aCvtXlsmwi8xSi6EviV428viOF2b5oYVc3
	uxo/xkiv30mqmBiGFFwPL7F5ZPm2DAkGAKEhEUQbVeRfNo82prRxUNjA8Faa80I/Gr5TBuIZs/zbj
	t/GcD9iGbKY87yHtHxkhSRzmpY25nOf5ePwH02JexToQkpbkfqima4wXz4cRMrxeMA/tNHCTfPlj4
	sm2DJ0tYm4rxfitTvpqA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHDvC-0005X5-Ac; Thu, 18 Apr 2019 20:46:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHDv9-0005Vw-2D
 for linux-amlogic@lists.infradead.org; Thu, 18 Apr 2019 20:46:12 +0000
Received: by mail-wr1-x444.google.com with SMTP id w18so4506203wrv.11
 for <linux-amlogic@lists.infradead.org>; Thu, 18 Apr 2019 13:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=wficahtGGlEvfoZUHHveXjxRdIRK8DDrer2LkRlm6jU=;
 b=IVo+aFROZrxIuP0WLvA34sdd6tNipnqxs3zx06XiCOpH0m0LbJUIEyZSzwXYSa3IMf
 qa3P3kafPr232RfPWjYg4SMfFVoXAR3bkcSjyao58DruuxwCAwXMPI4N7b+NYfgH0Ca6
 DfCRkMtxzmRJ4Byo4NlFi7YhEucESYNLQKIIu09xkubJDIUz1BGyX2VEZClw73oa3SXD
 SM3Y1TIfOagsHyPzHrPrw8Wf6p5Opn+Xy1cL8JuHIzVd+4pgvesO1+orLeTPtr89VS78
 Lu67/Mw6az0BkHDwt6NHvPVqH7L+Q6D3LgXmMZR3LowoU9afb1axY6omlel9PUztTwMk
 010w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=wficahtGGlEvfoZUHHveXjxRdIRK8DDrer2LkRlm6jU=;
 b=K1TUJdbEbvZ9OjMbkBJJlrsIwvVDVHxzZGH4WzMHBwNTYw/Tychzmmx7OmfCdPUE+B
 +q8fba+DasCGYaakuAfTQTUAbmDxEipZYdazd10MLqXhKsVlTqjUje6S63cG0sWOOqCf
 MAoIc474jkXmL78aBkAnheuufNB+gkkupTfQJT7T08lHYgvjX97Aa21brVNqFhOBAFA8
 bHgT3JrUOD+haqhhd6aYiiAQo0lRUhZzq2MOVxycV9eD+AGDN1iKpT+mDKHWxYQi/CNg
 XfJnBSlTuJ0+TulVO/8wVonge+ceeP5lPK91VKT0bmMxh42dlWAZYB1yhdjMbPnj9TmQ
 aGoA==
X-Gm-Message-State: APjAAAU1qj2TWTTIMyEQj3HYARBYse+yDT7nrieOd11Fh+LF4gJeOxb/
 WGpUakz6SNVfrj/0V2sXurn9Sg==
X-Google-Smtp-Source: APXvYqyolIXXdwhRp4JJIvpOF5SlWArEQ2SZdjo8yhlqX7BQTkGpmPbd/dbtOXvPFzsim6faWixC+w==
X-Received: by 2002:adf:fc47:: with SMTP id e7mr141013wrs.100.1555620368407;
 Thu, 18 Apr 2019 13:46:08 -0700 (PDT)
Received: from boomer.baylibre.com (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id l19sm4744601wrf.35.2019.04.18.13.46.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 18 Apr 2019 13:46:07 -0700 (PDT)
Message-ID: <8316d7875bf0479e91cc11ce5fbf3b2e21f92a2c.camel@baylibre.com>
Subject: Re: [PATCH 5/7] mmc: meson-gx: avoid clock glitch when switching to
 DDR modes
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 22:46:05 +0200
In-Reply-To: <CAFBinCCAbMpWYY6-W+909Q=jLpweC2F6ED6CVf6zVGrRiA1hxg@mail.gmail.com>
References: <20190417204355.469-1-jbrunet@baylibre.com>
 <20190417204355.469-6-jbrunet@baylibre.com>
 <CAFBinCCAbMpWYY6-W+909Q=jLpweC2F6ED6CVf6zVGrRiA1hxg@mail.gmail.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_134611_131189_FE92698E 
X-CRM114-Status: GOOD (  13.64  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 2019-04-18 at 22:16 +0200, Martin Blumenstingl wrote:
> Hi Jerome,
> 
> On Wed, Apr 17, 2019 at 10:44 PM Jerome Brunet <jbrunet@baylibre.com> wrote:
> > Activating DDR in the Amlogic mmc controller, among other things, will
> > divide the output clock by 2. So by activating it with clock on, we are
> > creating a glitch on the output.
> > 
> > Instead, let's deal with DDR when the clock output is off, when setting
> > the clock.
> > 
> > Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> it seems that this patch breaks SD card on my Khadas VIM and Khadas VIM2.

The error I see in your logs is with eMMC and hs200, not SD card.

Either way, There is something I don't really get. eMMC should not go through
any DDR mode to reach HS200 (which is an SDR mode), neither should SD to reach
HS.

All this does is flipping the DDR bit (when necessary) when clock if off for
the mmc device, avoiding a glitch on clk line. 

This patch should not make any difference for SDR only setup, Maybe I missed
something, but I don't see how it could make anything different for SDR only.

I (repeatedly) tested both vim1 and vim2, without seeing this issue, so I can't
debug this. I'll need more detail to progress, something does not make sense here.

> I used git bisect within this series to find that issue.
> applying your .dts patches on top doesn't fix it
> 
> two boot logs attached:
> * kvim-broken.txt has patches 1-5 (= including this patch) applied
> * kvim-working.txt has only patches 1-4 (= excluding this patch) applied
> 
> 
> Regards
> Martin



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

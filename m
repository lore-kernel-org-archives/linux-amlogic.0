Return-Path: <SRS0=R+dC=Z6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB86C2D0BF
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 22:08:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A21E8206D6
	for <linux-amlogic@archiver.kernel.org>; Sun,  8 Dec 2019 22:08:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QM0650C5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="JiUPaF+a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A21E8206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XxFJOI4nsK0FVSxq+hU8svOxlil6JcQAmDLm8+dk7kw=; b=QM0650C5mxxwt+
	uASARRvGOlh/2o7Z2Z8GpJG6bLyiYV0t+l8hYIIJxEMsB1WZOT8JypQtms/eahEjMY9lSu7Z3g4yv
	O63VLUYDZNmRa3m23f1EQReY+556O3ShQNVxJEoQp0WhkCml/ldhPRqAHvgTxa2QaMvX5VwG6zLmi
	hZEKCZBcwchFmCbgohQ8/6qX1MMEWttgssjaoRDGAB0kP2C7ics10jmat4iSLACf6DT/iTwlGxDKF
	oIDztIslrVCAbHTsVOKX0yOikc5OHsgQwY5i0YDjZjgKQSrs3/nKu5kdgnUcD7BT9/8+70GpR2Iul
	C0KSu9gTSaBIm0LvzTUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ie4it-0005Gy-Pa; Sun, 08 Dec 2019 22:08:15 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ie4iq-0005Fy-AA; Sun, 08 Dec 2019 22:08:13 +0000
Received: by mail-oi1-x243.google.com with SMTP id v140so4692002oie.0;
 Sun, 08 Dec 2019 14:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6LcpecxJCuptWnky/wBInRHW7dBWZyoNDO8ejqGqya4=;
 b=JiUPaF+aLz6TU175q9IIuAWCfbj1Dp34A44ajwK6wWjJuU4qAW6BB4WFznxCnlrz+m
 11aV+yzG5hho4KnFOHqZ4MdNh0vO5men3cU1qp5cZ4yKlf8NYCo/WlL3zH/9Us1l56E2
 zaiUI5IFBXi84lF7T6fkfCSTwUxRB+6DMpcPrFgw+839cVtn7VvEd/tz1YJlMGKUMrFv
 cMVvpXHbsEhI+l1VNNoyP/3w2xVFStHfFJ1IDsQzMBaQj74boPcUBmJpW+MuWdDWAp4S
 z91RVykEF70X975kRocmzBBOXgC3eOuH0yxBwNCsUrxB0bkqd2TIjaIXJztFPi8M4KID
 6zPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6LcpecxJCuptWnky/wBInRHW7dBWZyoNDO8ejqGqya4=;
 b=uaFykxfGiG5E12oMyXtvOoXLtWs/1IHPIRJOIsbR6NElyF4PRJtYfal/riu3STgjt2
 mkkwR3rw2NXb3J+5NilxtQEz/JUhqZ2F9ALCdu7RfLWk6Kd1HsrAazj1mcpEUuVAXoqA
 TZgcMw3GpUibNwt3RqpsayYltDjQjMtw5F3U+kRHq4kzXSjg+a9ToI7T2GXNGlVH4VZD
 MmP0nByy1oTSsdJoMJVo+G/0LLN28NDslSD1UlGXHPJRp2HPEgljY5xhhShLl0RntPhe
 ZvcYMEOtNkbnJRL1GjuqcTJl9koS2C+1LS1W3rS7HjObwOCvwZQ5AGVN01cBuErcEQDn
 BhNg==
X-Gm-Message-State: APjAAAWzdrNQRxs1K1KQlPjRZnrW4qe52WB4a3EDgoZpmVB5JFSaSu7a
 M7FHdhvLm5hmX0Z3Fqy2eSc0PNFW1QC0klEIEXU=
X-Google-Smtp-Source: APXvYqyhNhm0JNicy/loq8RdAT4DHahKdfAG1UNTU2pTEGoRTXZgPhgK9yLqIJ8epqm1nERlorhDJkru2+6iVkzYho0=
X-Received: by 2002:a54:401a:: with SMTP id x26mr21795889oie.15.1575842888488; 
 Sun, 08 Dec 2019 14:08:08 -0800 (PST)
MIME-Version: 1.0
References: <20191208210320.15539-1-repk@triplefau.lt>
 <20191208210320.15539-2-repk@triplefau.lt>
In-Reply-To: <20191208210320.15539-2-repk@triplefau.lt>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 8 Dec 2019 23:07:57 +0100
Message-ID: <CAFBinCA7Tnc2M=4jxYYS_RuoLnGNprUOFDrZG_G6fhQCyb3Cig@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: meson: axg: add pcie pll cml gating
To: Remi Pommarel <repk@triplefau.lt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191208_140812_377015_89A962F3 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
 Yue Wang <yue.wang@amlogic.com>, linux-pci@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Remi,

On Sun, Dec 8, 2019 at 9:56 PM Remi Pommarel <repk@triplefau.lt> wrote:
[...]
> +static MESON_GATE(axg_pcie_pll_cml_enable, HHI_MIPI_CNTL0, 26);
we already have CLKID_PCIE_CML_EN0
do you know how this new one is related (in terms of clock hierarchy)
to the existing one?

[...]
> --- a/include/dt-bindings/clock/axg-clkc.h
> +++ b/include/dt-bindings/clock/axg-clkc.h
> @@ -72,5 +72,6 @@
>  #define CLKID_PCIE_CML_EN1                     80
>  #define CLKID_MIPI_ENABLE                      81
>  #define CLKID_GEN_CLK                          84
> +#define CLKID_PCIE_PLL_CML_ENABLE              91
this has to be a separate patch if you want the .dts patch to go into
the same cycle
the .dts change depends on this one. what we typically do is to apply
the dt-bindings patches to a separate clock branch, create an
immutable tag and then Kevin pulls that into his dt64 branch.
the clock controller changes go into a separate patch in the
clk-meson/drivers branch to avoid conflicts with other driver changes


Martin

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

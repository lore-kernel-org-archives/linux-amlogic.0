Return-Path: <SRS0=0688=YB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53215C4360C
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 07:35:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22D1D206C2
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Oct 2019 07:35:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQy15Prs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tXD04oUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22D1D206C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mmonSd7o7x7HHruQDt64iV6jE2wPzy57ByAOEe44NxM=; b=IQy15PrsIghm2hCq5hhW29/WrI
	PTvcU2LRPwvEt18sPqJiGhwwTTgtiLkP2GKbJXioUZ5T4ZDPF3+DjTPGEMr7tbnFX9z//i5o/JKgu
	l/oKeosXp50kpsCi78sCUpZDpH7DElr0yf1iEs1CVZvgRuEZSuOrrRTfy+Vx2DqWuUc19a2kpHYpn
	NEJ0l+TqIrf1MUmgryqvzjY59yAoGiJ4XX4aOcK3IrvRw2YDEm2SVl+Z8hebwGU2RshS2M77gX5hO
	bfQNrX977b/YxlyVKNzTdcl4B29EK8DRy17hByg3Fl2Yrh9+2hvV1pcff4Q8LLLqMRO88ulMTkfon
	Ravc1bsg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHk1w-0007ha-FN; Tue, 08 Oct 2019 07:35:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHk1u-0007hA-6p
 for linux-amlogic@lists.infradead.org; Tue, 08 Oct 2019 07:35:35 +0000
Received: by mail-wm1-x341.google.com with SMTP id f22so1960697wmc.2
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Oct 2019 00:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=IAmY8wSJYHaq63xMZva0VKaV5IVa+dPtYZ22qWpusgQ=;
 b=tXD04oUorVrs0Qr7NDaaV+exszVTijzDCYUoP9Ms1NDNT3RP+sGbtWKme17UL9nLDM
 wfleeOhDMFndnn6Ibt/NC7858hF0bYBMuPuN43nKNUdSQ0rxVWEUfr9taI867ECAMoDh
 vavOEblsWJ07b32QMbyfz+dnz9hauio5xvvL/YARcRjQv3WK+wjZ5UUR//3CSGviWPHJ
 3HgxkZGnXuA3zA+h8HdU3UtRPKGgynNXG1cTO3OiLyXgRllUroAMqG+34CXAn2UBUh1u
 e7bh4EeY19LMEbLBNluvbmvPU6bPxHRsnUYGCkgNMaaD0q3AiSQQE+5knOH7nWTIp0uc
 ZQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=IAmY8wSJYHaq63xMZva0VKaV5IVa+dPtYZ22qWpusgQ=;
 b=A/uSKHy8vDUYInHTfYR9fz/OPfoA+hekD8+wRhgn2kcdOTtGco61rmbB6L7At3WjXY
 zP4eihBJSvljYqGrfxJVQipud5SU0wW9gfbQoIL0zOdC6Z+65uKc3POvBi8bnvvLJwhO
 WVejVApf00SEfRc7i2Lz+89mNEKwLx2jle7mMXi9Jnv8svfQY/Cytc/DOmTFUCRdt17I
 EYZNGVBtZmErYQABpzOyWmBFtPPJn9DOsrIndMRIR7vl7BmRxjfktXpef4WCr0TQhgc/
 O9rVNIf/Ik/MBN2fTSLU4WNX/s6d3/4VJ3yvaOaSQ/DkX0P74ltNF2l7zX54PqUPiX99
 sFWA==
X-Gm-Message-State: APjAAAXcJbZyVCvhVWon+JYU7QT8t96VifZr0yTttEif9hDDdODAuOYg
 qkMlChiQmkSOcrlS8yobzGOGSiKhaa0=
X-Google-Smtp-Source: APXvYqwRMSviP1Knn31C1pXBRZyBjj63INxAWbiTXlW4xrXz3uzxk1cbGwFf4t+dOfZyyQ6CJw5kcw==
X-Received: by 2002:a1c:444:: with SMTP id 65mr2563758wme.73.1570520132541;
 Tue, 08 Oct 2019 00:35:32 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y18sm44366082wro.36.2019.10.08.00.35.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 00:35:31 -0700 (PDT)
References: <20191002091529.17112-1-jbrunet@baylibre.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v3 0/7] clk: meson: axg-audio: add sm1 support
In-reply-to: <20191002091529.17112-1-jbrunet@baylibre.com>
Date: Tue, 08 Oct 2019 09:35:30 +0200
Message-ID: <1jy2xvadvh.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_003534_251272_060A2714 
X-CRM114-Status: GOOD (  13.99  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed 02 Oct 2019 at 11:15, Jerome Brunet <jbrunet@baylibre.com> wrote:

> The purpose of this patchset is to add the sm1 support to the amlogic audio
> clock controller. The line count is lot higher than what I hoped for. Even
> if extremely similar, there is a shift in the register address on the sm1
> which makes a bit of a mess.
>
> I could have patched the address on the fly if running on sm1 but the end
> result did not save much lines and would have been a pain to maintain and
> scale in the future
>
> Instead I choose to re-arrange the driver to share the macros and declare
> separate clocks for the clock which have changed.
>
> Changes since v2 [1]:
>  - Add missing gate ops for
>   * sm1_clk81_en
>   * sm1_sysclk_a_en
>   * sm1_sysclk_b_en
>
> Changes since v1 [0]:
>  - Fix newline in the last patch
>
> [0]: https://lkml.kernel.org/r/20190924153356.24103-1-jbrunet@baylibre.com
> [1]: https://lkml.kernel.org/r/20191001115511.17357-1-jbrunet@baylibre.com>
>
> Jerome Brunet (7):
>   dt-bindings: clk: axg-audio: add sm1 bindings
>   dt-bindings: clock: meson: add sm1 resets to the axg-audio controller
>   clk: meson: axg-audio: remove useless defines
>   clk: meson: axg-audio: fix regmap last register
>   clk: meson: axg-audio: prepare sm1 addition
>   clk: meson: axg-audio: provide clk top signal name
>   clk: meson: axg_audio: add sm1 support
>
>  .../bindings/clock/amlogic,axg-audio-clkc.txt |    3 +-
>  drivers/clk/meson/axg-audio.c                 | 2021 +++++++++++------
>  drivers/clk/meson/axg-audio.h                 |   21 +-
>  include/dt-bindings/clock/axg-audio-clkc.h    |   10 +
>  .../reset/amlogic,meson-g12a-audio-reset.h    |   15 +
>  5 files changed, 1373 insertions(+), 697 deletions(-)

Applied

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

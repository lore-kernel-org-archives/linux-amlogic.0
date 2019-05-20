Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 958DEC04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 11:27:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B6212081C
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 11:27:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="updfp/g8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xaIpOWBo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B6212081C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0ryFgEWGnAQ3z2kUpctIBvR9AqhONlYLvuqZGU03dE=; b=updfp/g8xBlZyR
	cXLChOL75Pm1kalAuxVkeMskdUyvPTDoZvffju7MGltsqk2ZqEGSJDbKA+X7qoCI4081PxbAFW9vt
	D0jPRVfWbrw3PmcMVY1SgMotxsoZp3dk4Gl2m2r0AbvzIAAlbfmU+bhf2dlP8dw3unz1/kWcWBk5e
	vWu1yi53FBHxvft839u+yldsbXxHdZfznukxeK+iYamKvbhfFnVHAl6VNgeA74fSMgQGGYaLoNsda
	N0k/nsR0eawpvAOPRDT8RrXSERziy8pPjYv95Fpz8OhGen0wlW/oyc2FbTF7P3liMAWj61xpfgbSB
	eC8kirbUV4ZwZ/rf2Udg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSgRU-0007G7-1m; Mon, 20 May 2019 11:26:56 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSgRQ-0007FD-56
 for linux-amlogic@lists.infradead.org; Mon, 20 May 2019 11:26:53 +0000
Received: by mail-wr1-x441.google.com with SMTP id w8so14177389wrl.6
 for <linux-amlogic@lists.infradead.org>; Mon, 20 May 2019 04:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=HtfyxUMJLQAcq0KfWDawQoWqIdIlp3vHf/VikFApqLs=;
 b=xaIpOWBoT4uKzuJxww+snLRcZXPpym7ybsnPLh8k0BHxj71Mc2lVJUqyOmhK6qVS2Y
 ndzvMHayaScDIlQ5fdNuZ584x6OcvfVcu81AX4PMOswoJyRRL8W2Jr6CYt62YZQqn4Bg
 kOgEfppb3tw2j1n7jjFRqRoZyUHxPFbpQkSFbPdD73vduod3SlLfE8x7bzaFmhBvuVLe
 Pz34zll8AqvGPghWpF+vslF4MwrLhgteqOAwtzaKFljOvo9yGK0zXr04onSF1TcCKtl/
 c3m0zVGWXfsma2qdqGgpM170t9e7inYjpYbPIRCi52XBA7FukoxGGz29oEBOAyoPUrXI
 mlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=HtfyxUMJLQAcq0KfWDawQoWqIdIlp3vHf/VikFApqLs=;
 b=fyoUKMNYCxW6XBFMBdi9nM8kn0ElSlL7Dg+JX49nQVbneJiar+sxGIBGbNDfl7vu3j
 XjsqDg52Tu9dV9S9pG82sP6eu4Ou+s0CQRayRzj5+4qeQvWGhLjx3OZe8DmDevuXqa+F
 x4alP4EJOdHjmxGJh/u3+j4mQ7X5WriQbFN0f+DL81nj4/XJ1UWeRgm2W03FphGjzkN3
 JrhCkDsDusIGf2i7uRDAzdz9iCZmbYjiXUXZn9v3j/LfqZJwtUqmEg4rMngtPqUrANnZ
 wZvUtyYggUChyOAmakaIbKzON//qc/VJj2x5oTW3mT4KSc7hqC9qLY9olYZdA/mdasSq
 ID+w==
X-Gm-Message-State: APjAAAXfCE61zliZDwNPPIC1H7jbLyhbphA5xU4R1i+vnjhIHHqZrBhE
 J4Z+pL+Y7AguYfPSJcoP7LyzMQ==
X-Google-Smtp-Source: APXvYqw4UiCpX3rKI6633yiMqqQyEYhGUUtxX+2oz4H6tQ9iVRuwKYecsWkeZ8CFqwdWHbMKMBd44g==
X-Received: by 2002:a5d:6610:: with SMTP id n16mr36510123wru.250.1558351610484; 
 Mon, 20 May 2019 04:26:50 -0700 (PDT)
Received: from boomer.baylibre.com
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s18sm15016292wmc.41.2019.05.20.04.26.49
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 20 May 2019 04:26:49 -0700 (PDT)
Message-ID: <b754893eef91aacb309f257beba977610348b9fb.camel@baylibre.com>
Subject: Re: [PATCH v2 0/7] clk: meson: fix mpll jitter
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Date: Mon, 20 May 2019 13:26:48 +0200
In-Reply-To: <20190513123115.18145-1-jbrunet@baylibre.com>
References: <20190513123115.18145-1-jbrunet@baylibre.com>
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_042652_207446_2DF15753 
X-CRM114-Status: GOOD (  18.99  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 2019-05-13 at 14:31 +0200, Jerome Brunet wrote:
> This patchset is a squash of these previous patchsets [0], [1] without
> modification, beside a re-ordering of the changes to facilitate backports
> 
> We are observing a lot of jitter on the MPLL outputs of the g12a.
> No such jitter is seen on gx family. On the axg family, only MPLL2
> seems affected. This was not a problem so far since this MPLL output
> is not used.
> 
> The jitter can be as high as +/- 4%.
> 
> This is a problem for audio application. This may cause distortion on
> i2s and completely break SPDIF.
> 
> After exchanging with Amlogic, it seems we have activated (by mistake)
> the 'spread spectrum' feature.
> 
> The 3 first patches properly set the bit responsible for the spread
> spectrum in the mpll driver and add the required correction in the
> related clock controllers.
> 
> When the g12a support has been initially submitted, the MPLL appeared
> (overall) fine. At the time, the board I used was flashed with Amlogic
> vendor u-boot. Since then, I moved to an early version on mainline
> u-boot, which is likely to initialize the clock differently.
> 
> While debugging audio support, I noticed that MPLL based clocks were way
> above target. It appeared the fractional part of the divider was not
> working.
> 
> To work properly, the MPLLs each needs an initial setting in addition to
> a common one. No one likes those register sequences but sometimes, like
> here for PLL clocks, there is no way around it.
> 
> The last 4 patches add the possibility to set initial register sequence
> for the ee clock controller and the MPLL driver. It is then used to enable
> the fractional part of the g12a MPLL.
> 
> As agreed with the clock maintainers, I'll submit a series to CCF to
> remove the .init() callbacks and introduce register()/deregister()
> callbacks later on (pinky swear).
> 
> Jerome Brunet (7):
>   clk: meson: mpll: properly handle spread spectrum
>   clk: meson: gxbb: no spread spectrum on mpll0
>   clk: meson: axg: spread spectrum is on mpll2
>   clk: meson: mpll: add init callback and regs
>   clk: meson: g12a: add mpll register init sequences
>   clk: meson: eeclk: add init regs
>   clk: meson: g12a: add controller register init
> 
>  drivers/clk/meson/axg.c         | 10 ++++-----
>  drivers/clk/meson/clk-mpll.c    | 36 ++++++++++++++++++++++++---------
>  drivers/clk/meson/clk-mpll.h    |  3 +++
>  drivers/clk/meson/g12a.c        | 32 ++++++++++++++++++++++++++++-
>  drivers/clk/meson/gxbb.c        |  5 -----
>  drivers/clk/meson/meson-eeclk.c |  3 +++
>  drivers/clk/meson/meson-eeclk.h |  2 ++
>  7 files changed, 70 insertions(+), 21 deletions(-)
> 

series applied to v5.3/drivers



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

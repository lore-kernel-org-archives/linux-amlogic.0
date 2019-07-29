Return-Path: <SRS0=fUxg=V2=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EC32C433FF
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 10:54:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B1FF2070D
	for <linux-amlogic@archiver.kernel.org>; Mon, 29 Jul 2019 10:54:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gND5joS1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="JN7vSXEF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B1FF2070D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tl6QeSLStqXpSSC7WbLRdNU11vhYVadFeKbDDrB2UFg=; b=gND5joS1NHp3TL
	EYPElpVIsb4ysRFNrH1hABWgCvD0ueIE1dyZFGYE2wug/rl25jKnHpzO1sAUHvVfo0I0NHhvQNTDg
	L2ybgM4aICueH5Eo4NvsKoj94Nq7DoMEyUzFp44VTXE4CQfsbqw2f2iqeXMk9hFbcplxIGHLrkudM
	O/rLwLlFUVz9bgAII+lttnqiKMokd0CSrIM9BjycclSk1cYZ5zW70Z+dhAjSlHFlP6b1GtC3KQL43
	dSN6wFjA2VSHgQH5z/ky9VRUw05Xr8A0U5/9rdblOaVYq8yRPpzI39wbex837JN1orpenyEJYg4EQ
	TrLXnIndnkhnNJi+HuGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hs3Ii-0000gV-In; Mon, 29 Jul 2019 10:54:44 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hs3If-0000fp-IQ
 for linux-amlogic@lists.infradead.org; Mon, 29 Jul 2019 10:54:42 +0000
Received: by mail-wm1-x341.google.com with SMTP id v15so53427760wml.0
 for <linux-amlogic@lists.infradead.org>; Mon, 29 Jul 2019 03:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=eqfg5Eacmy1+/MhOFkxqCtwYHlycdYQaxotBimNO4tM=;
 b=JN7vSXEF75Oelp0EyviFYoaWimsb5xVHwKIwNhCJKpemuYt2P19a659u41EmU9aChL
 yODZRtKntrTQMkND9VKWTh3/CWtbDhCgXSNZPBByMpRkb1wveyF2ziL8brQWucZM09Df
 h5DY8xv6kItvcWN4idyU/uw91bzFa0QZ0n6k/oKQktSeoni48jh1f6qcI8HfNX85cXr5
 D5G7Yq9PLAH7WxozX1uhTTOUU/PU1ixyPhaP34lykwEOlQOgkWwwZeXfrBxXDYFfCzt7
 wW0mGlJsjhJHLsP7cdo3Dmlm6xKep00TNMIc5OQMZeS1dOW26fPzBTKTQuXk+pxI5om+
 vwpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=eqfg5Eacmy1+/MhOFkxqCtwYHlycdYQaxotBimNO4tM=;
 b=Q6a5RygRODKaEWk9/MML7kkUm+ZvpVyCBm0cPTNF+3qVD0Wj1kQfV8h8p9Gy1L6e2e
 R5r6Qf8E5YpGhcIkj+oZlmq5ck5ydJpxi7DgDVyvTYT1snYrP8xktiBZ38/juAs7YS/V
 ZKacPDvUcv4EIJn/jzXdJcTDrYDanbFSDULu92qB/lSdZhccnzMSLXnKpcCvYIXZ6Kis
 CrwS+ZlLYsfkjszm7A1SXgzRHicQP0w7ZHvXK2ZRdXbUjW+Tolb963aD2wVYRvF1Yn9b
 hPviNEki4es94F9u97kucFNTV2wR6DY1SyJwSdEAZKQqWMqCpJBGmYn1cWwoQdUi4acM
 RIvw==
X-Gm-Message-State: APjAAAUmLcfn14ubBhUnMMPKT+7/H6xqGT86KzjUscJSNe8RGbuCmFpU
 tp30AkJOlJZ+446UUkth6QbkLQ==
X-Google-Smtp-Source: APXvYqwIfLdaKYHkYVTTbNZVS5iy+6EEZOZyCe/3q44b3hbfmzHduJ3sHM2CB1fUjblr88CN7uiAjQ==
X-Received: by 2002:a05:600c:23d2:: with SMTP id
 p18mr93463026wmb.160.1564397680266; 
 Mon, 29 Jul 2019 03:54:40 -0700 (PDT)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id o26sm126645461wro.53.2019.07.29.03.54.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 29 Jul 2019 03:54:39 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH v2 0/8] clk: meson: ee: use the new parent description
 method
In-Reply-To: <20190725164238.27991-1-amergnat@baylibre.com>
References: <20190725164238.27991-1-amergnat@baylibre.com>
Date: Mon, 29 Jul 2019 12:54:38 +0200
Message-ID: <1jzhkx861d.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_035441_607585_AD03744A 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: narmstrong@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
 Alexandre Mergnat <amergnat@baylibre.com>, linux-kernel@vger.kernel.org,
 baylibre-upstreaming@groups.io, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu 25 Jul 2019 at 18:42, Alexandre Mergnat <amergnat@baylibre.com> wrote:

> Meson SoCs clock controllers use the string comparison method to describe
> parent relation between the clocks, which is not optimized.
>
> Its also use bypass clock made from device-tree clock to provide an input
> clock which can be access through global name, but it still not optimal.
>
> A recent patch [0] allows parents to be directly specified with
> device-tree clock name or without string names from localy declared clocks.
>
> This patchset replaces clock string names by clock pointers (as possible),
> removes bypass clocks and uses directly device-tree clock names in parent
> assignment.
>
> Tested on GXL, GXBB, Meson8b, AXG SoCs by comparing the clock summary
> (orphan too) before and after migration.
>
> [0] commit fc0c209c147f ("clk: Allow parents to be specified without string names")
>
> Change since v1:
> - Improve comments in gxbb, g12a and meson8b files
>
> Alexandre Mergnat (8):
>   clk: meson: g12a: move clock declaration to dependency order
>   clk: meson: g12a: migrate to the new parent description method
>   clk: meson: gxbb: migrate to the new parent description method
>   clk: meson: axg: migrate to the new parent description method
>   clk: meson: meson8b: migrate to the new parent description method
>   clk: meson: clk-regmap: migrate to new parent description method
>   clk: meson: remove ee input bypass clocks
>   clk: meson: remove clk input helper

Squashed patch 1 and 2
Applied

Thanks !

>
>  drivers/clk/meson/Kconfig       |    4 -
>  drivers/clk/meson/Makefile      |    1 -
>  drivers/clk/meson/axg.c         |  207 ++++--
>  drivers/clk/meson/clk-input.c   |   49 --
>  drivers/clk/meson/clk-input.h   |   19 -
>  drivers/clk/meson/clk-regmap.h  |   12 +-
>  drivers/clk/meson/g12a.c        | 1093 ++++++++++++++++++++-----------
>  drivers/clk/meson/gxbb.c        |  657 +++++++++++++------
>  drivers/clk/meson/meson-eeclk.c |   10 -
>  drivers/clk/meson/meson-eeclk.h |    2 -
>  drivers/clk/meson/meson8b.c     |  710 ++++++++++++++------
>  11 files changed, 1805 insertions(+), 959 deletions(-)
>  delete mode 100644 drivers/clk/meson/clk-input.c
>  delete mode 100644 drivers/clk/meson/clk-input.h
>
> -- 
> 2.17.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

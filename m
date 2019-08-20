Return-Path: <SRS0=f3iC=WQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCFA2C3A589
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 09:53:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC9422CF4
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Aug 2019 09:53:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jS/2JR97";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="XwojiHFv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC9422CF4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUDiOHOcKU8IqKyyxtL6TZWkArmYJccPbvNdWEP7kvI=; b=jS/2JR97GlKBfQ
	PKCGmUbaCXqjNr2QLPP+MlOkiZQ2EjIWzu14I5fRAvOiD1Fx022z5HT/8K0UiVrCtLSbunHm/1vqz
	IxIQCxA1s3KkIZzUMzgODVIX15PBomI5MqYUydA1jIfd4bCfwqMD5NJujuWo+Xq6CcifRFX7/DRBz
	diMJJPBvab9JSt4oG9n/GM9GIlAYxaOPQI6vPo2eh3C73SBA3EMX/Fp/Za3wBVFZmrbA7CWYM5YYU
	4iOuaYsHgc4CVq5RvFlYCxM+e9iLanmW2dENpUQTPA/JlUmaeQFAsDS2wZFFlYJ6lMHM48K74M4SH
	TobcpN18dZQazsEg51Sw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i00p9-0006E4-TG; Tue, 20 Aug 2019 09:53:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i00p7-0006DY-2p
 for linux-amlogic@lists.infradead.org; Tue, 20 Aug 2019 09:53:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id u16so11705662wrr.0
 for <linux-amlogic@lists.infradead.org>; Tue, 20 Aug 2019 02:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=SUnSrbdwUP8RoleAa79FxmS5FX/ZRHJTHopnWunm290=;
 b=XwojiHFvgChsTh2dvDaY4v1fd4rzKiMOeb06+6P/nop9JtcLZQ97K5GuFcraIWPFpM
 Y9G3AWa6uppMxg4cWeFGEcSSfWCpibuEPYQf0WHSgTHd5ciGIV03aelOJWJAP/ut5CFq
 W5MlfmD4VfiGZ2ZLyLE7pO9PstqRS9COV+FcTOnkeNpL508l0VygYktYHz257McLoQW9
 6gfQKbuwoTxH7mdlgjEYGfTyXXfsKa1bM0IHmDFh+KAyBmOlP+5j/IH1xtm+M49R41I8
 TX1eOzN7ljfBAYiUdwRnnkZnWD0S8V1G43aaoZeYBLCOlOWA5gfDGZM2XPu2vZ5W7DsU
 yefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=SUnSrbdwUP8RoleAa79FxmS5FX/ZRHJTHopnWunm290=;
 b=deaJcjlqKz7nzQyovZ6Zz0FI8jEq0fx3LVTZIU0v+gwuGLQYZBOxcfzK1ZW24Nvo7q
 90ni2U//L7547oSuHbh9QBosgNXhUFy7QyeZYCiYp31KryVJk86wNdGdJ7DtGMVAOSZo
 UUCPTES9K5SgCD/49iYnPCaaoWmGeFXnVf5mNDdIx0JR1kW8qBxOcDFBXHzYNFgeR5EP
 LcY3EDiqbfQFALBDbtDbMMyedbeU2D7DEs7OAgsFCdvYiaeahWsVTLnEEirrwL8yy8zo
 WfppQCYsqfvh9/+PYpVGp5T6MJzB9g6T700PdUvJptw6JhCLkoI87F0OABYdqSBpDX6b
 Pshw==
X-Gm-Message-State: APjAAAWNQsfnx/I3ymuRyoeV00i9w2hHpbXx8F9nBGdwTWGVNtn35adj
 y6nIjz8eVq1RaMm+iPYMr3ZYsw==
X-Google-Smtp-Source: APXvYqzXCBNehS2ApNhjVFm+GWBL4RnL+aylPxPFwqoRpssS1hbtu+YxZ1n2O/rnzC708on9ZtJdYg==
X-Received: by 2002:a5d:4d4c:: with SMTP id a12mr34029723wru.343.1566294783750; 
 Tue, 20 Aug 2019 02:53:03 -0700 (PDT)
Received: from localhost (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f6sm38642001wrh.30.2019.08.20.02.53.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2019 02:53:03 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 0/2] clk: meson: axg-audio: add reset support
In-Reply-To: <20190812123253.4734-1-jbrunet@baylibre.com>
References: <20190812123253.4734-1-jbrunet@baylibre.com>
Date: Tue, 20 Aug 2019 11:53:02 +0200
Message-ID: <1jpnl0noxt.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190820_025305_129069_5382FECC 
X-CRM114-Status: UNSURE (   8.51  )
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
Cc: Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon 12 Aug 2019 at 14:32, Jerome Brunet <jbrunet@baylibre.com> wrote:

> This patchset adds support for the reset provided in the register space
> of the g12a audio clock controller
>
> Changes since v1 [0]:
> * Fix typo reported by Stephen
>
> [0]: https://lkml.kernel.org/r/20190703122614.3579-1-jbrunet@baylibre.com
>
> Jerome Brunet (2):
>   dt-bindings: clock: meson: add resets to the audio clock controller
>   clk: meson: axg-audio: add g12a reset support
>
>  .../bindings/clock/amlogic,axg-audio-clkc.txt |   1 +
>  drivers/clk/meson/axg-audio.c                 | 107 +++++++++++++++++-
>  drivers/clk/meson/axg-audio.h                 |   1 +
>  .../reset/amlogic,meson-g12a-audio-reset.h    |  38 +++++++
>  4 files changed, 145 insertions(+), 2 deletions(-)
>  create mode 100644 include/dt-bindings/reset/amlogic,meson-g12a-audio-reset.h
>

Applied

> -- 
> 2.21.0

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

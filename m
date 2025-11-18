Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3855DCEE328
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Nov 2025 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YdYsghG1zqZrSJNum2TogE1enQo9vj0DQdgnbTUBAx0=; b=WmBdLa3+kWVLP2
	6VRMPQbx5Expikr3SXFmUiM1D39eto+4QOJpqAQogI1SMrS66pxtWRmAfBOATLQyjcqHltVDVIRiG
	sLdpYL9iNJgfblwh9Ount+sBkdsHFrxgPIqBL7rnS/f9zx/i/CZ0HOGCQGNINsl0Sh5XcR6Poc6tk
	LEyFW9RPAD/C4ZReNtVyuNQh2kNczHL2mGzJ4Qv0It/MgXGFu4WN9Pq0/stqWjxMVoACzazov63a9
	TqFtDxxDoboVyhUtOKwGhYj8Lav9Geqxwpjudygf5DCoMHnwGwxsnWSO3ZXDY3HnMhn3bLI0pSlCH
	zRsILxvhb/WZ8bISS9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNgd-00000000dAK-3Fi6;
	Tue, 18 Nov 2025 15:32:07 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLNga-00000000d9T-31zA
	for linux-amlogic@lists.infradead.org;
	Tue, 18 Nov 2025 15:32:06 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-789314f0920so39267567b3.1
        for <linux-amlogic@lists.infradead.org>; Tue, 18 Nov 2025 07:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763479923; x=1764084723; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Sa6na3P/P/GNM8Iujs64ZSVR7QHzowjsSYVDRpzcN3E=;
        b=SILUHtTs6VAaYhTEzWMMK8Sz7gNoNUfz3rVpjEllga4N+c2x9sPkkuUMTGk6ycpDiQ
         au0GLCwe2uizcJetftcw1ICNoo072qxn6VU3+br4eznrgEu3E4+rkENQJes1rX3bL8z2
         UfZi7GYz5ejbZRosMv44f2M08De1ZLbqO9UenGFkQJYFNTb2xrglsOBjnW/0TuYKkQUA
         6QeO5815EPLItuYrqsnoIn9tTF0vcqZEt1yCnwXvClohjnQYL0abx1VQ3BVVnZuxwa3O
         1zksuUIV0VF2vF6agqJgG/pN0js6zTFMnaeEGFvWr8q0yx+k5z59EbbjghrgOnEx5gVj
         MQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479923; x=1764084723;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sa6na3P/P/GNM8Iujs64ZSVR7QHzowjsSYVDRpzcN3E=;
        b=AscGcJmSeO/3GRiCbaGYdp8BKNCAOPutmp0sy9bidR30quRkgfMIJhBl4ZnJIvYhJl
         LQ7xVzyDy9wsu5rYTwrqv4HgrkY+bDdYKoGis4E4aBYlZETMMXJgmAxiW7bEISAyH5Bz
         L2KWaf7XMeym3EEkmv5lpEYQUdNpUKfoFbF2XOEYR40npoEhn25L0UcWIX2LMltS926H
         PK3lOnUR1lCrN01R1BaJd6BjYjYms57TUV0ZK1zp9niuRIMjlttPYYgY7AWPi9WcmizQ
         tNl2O7+c4XU4koa+tn3bKX8Mwi+JfAwiVq7F5YLNLcIoo5c7bub1d57qjjJu4Rxn5CQT
         STlQ==
X-Gm-Message-State: AOJu0YweV0uI9f3HIRd46/+f+IrBKbM4g/G71x7TIqpDV/lCR1alhBfn
	5ymeyq7GVV+vijsTC+EspPJWbcz+ZBKd3fIQmiODuTwAcsLeyuUdH11zLHKXbD2ym5BRTJGHtHA
	FGsvbD0M+YxDWxOrV01CTUGc3dANA1eBhoRhxytdbww==
X-Gm-Gg: ASbGncs5LLLRmbOSU850jcOY4LUaVvdRhNHxbdfhc+FBlG66nOme8W0AeRZzJk2MlVU
	0KkLa4ISI+7bi/yOaFYqoipSRiiJr6XmVTQJgobuIGv/Sa0iVSBUsnF8YgBMXEVsPIwRULGfUm/
	S3R8LuX9dPRNNkN3iDgsxoeziFn1UKwRGWhEtJDUsThBucb4BpUbZp+zGSl1whYq8Vtr6ws/Unj
	mUpLPK2D0d7ekf+gLu1yDmPLDEcOgOM5FvksgtlExwF0UkVhi7rMpcl7hgQEcBJJXwswu0MWGYw
	/1RpnbM=
X-Google-Smtp-Source: AGHT+IEfuIFqkRCXfZDQ1m2D7snzbjj18Mf6UeMcI+k5jw5cpI8JySnnaOmrmzg5DmorahHQyDmg0Mg7N8R6Vf/3bcQ=
X-Received: by 2002:a05:690c:4b09:b0:786:56ec:e3cf with SMTP id
 00721157ae682-78929f13f18mr148209687b3.61.1763479923209; Tue, 18 Nov 2025
 07:32:03 -0800 (PST)
MIME-Version: 1.0
References: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20251108231253.1641927-1-martin.blumenstingl@googlemail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 18 Nov 2025 16:31:27 +0100
X-Gm-Features: AWmQ_bnsDQPC1FPCE55p78otrm27YbzfdllVOUQUin0JOvD-o9IddmtmqNNalEc
Message-ID: <CAPDyKFqF+yh0X6f5YZ0yePGqCpPWQOauQTZaeE88Fgv2HAxv-g@mail.gmail.com>
Subject: Re: [PATCH v1 0/7] mmc: meson-mx-sdio: Various driver improvements
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_073204_797237_89A62D97 
X-CRM114-Status: GOOD (  13.42  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 9 Nov 2025 at 00:13, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> This series contains patches to improve / simplify the code of the
> meson-mx-sdio driver by:
> - using regmap for simplifying register access (patch 1)
> - switching to modern clock functions/helpers (patches 2, 3) and
>   make the clock code not interfere when switching to
>   devm_mmc_alloc_host() (patch 3)
> - making use of the devm_mmc_alloc_host (patch 4)
> - using modern dev_err_probe() for better error handling (patch 5)
> - indentation fix (patch 6)
> - ignoring disabled mmc-slot device-tree nodes to allow describing
>   all slots in device-tree, even though the driver only uses the
>   first enabled slot (patch 7)
>
>
> Binbin Zhou (1):
>   mmc: meson-mx-sdio: Use devm_mmc_alloc_host() helper
>
> Martin Blumenstingl (6):
>   mmc: meson-mx-sdio: Switch to regmap for register access
>   mmc: meson-mx-sdio: Use devm_clk_get_enabled()
>   mmc: meson-mx-sdio: Refactor internal clock initialization
>   mmc: meson-mx-sdio: Use dev_err_probe() where appropriate
>   mmc: meson-mx-sdio: Fix indentation in meson_mx_mmc_irq_thread()
>   mmc: meson-mx-sdio: Ignore disabled "mmc-slot" child-nodes
>
>  drivers/mmc/host/Kconfig         |   1 +
>  drivers/mmc/host/meson-mx-sdio.c | 339 +++++++++++++++----------------
>  2 files changed, 170 insertions(+), 170 deletions(-)
>
> --
> 2.51.2
>

The series applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

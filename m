Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C67EC2BB85
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 10:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE012192A
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 10:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dNo6DeeR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="y283zphW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE012192A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=25f1F5jS41cjPE6f3rXgOvwIDR7yLMp18MLfaVIeIDo=; b=dNo6DeeRnSfZfyH8CYrgJdGM6i
	jc5ZS+hqTHdgml/FBItdK2bdKRbFy3shwx4Tg1jet78Fy8GkTkRWGsAWvyeYyZ9JcPaxQuQn5g1WR
	12SANP8PGVEwrLCZnH/UpBAOterszSAOBWaTm1HPAiXsNMHpxsDAOm3xChGXfYn5JTEn8Ldmx0/VE
	zRRLU9RT8vURQLiBTSaYB4pRSDo3/T6Oauf/fmzq3IDoNCK65dD6T4GXOFyZQfoxmAa5Rruzc+Cp1
	I7+jv4U6L6NXb9vXHB6zhIBrQ/gc0bgX3VXWiaXCMp+qtgnDMUWpZS8jzPoT6zBTlgKanTqjX1doe
	3y4WRljg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP1jr-0001jg-H5; Thu, 16 Apr 2020 10:27:19 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP1jZ-0001Tm-P6
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 10:27:06 +0000
Received: by mail-wr1-x442.google.com with SMTP id k11so4199929wrp.5
 for <linux-amlogic@lists.infradead.org>; Thu, 16 Apr 2020 03:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=ytcr4DNGsM/t7kd6jXgpKOZ/wK7hRn1NK12HxIXMRKE=;
 b=y283zphWTaRIHsqXboEQebyUcsf1x9LJ0OAGOqpxQTdsNtsjus/FsAB4jcOrbwQRmU
 ovPNF7Uil97R6r1wi7otHb+HEG0ZivE/3Mal3+mMpWMpsqPOwJBWmUWk0JsYvYbtgPOz
 xB2hC0AxW7bx/I9t4+kspS3NGqOmYzdltktQ1ic+DzL2O/t8O8tatfU4vxj77lCP1rf6
 STIzdzowht1EWGVfD39Z2Aogi27qNWUcCQ2LIEVA6eJ0YMMEx8XGsgiilp69jV55p5Mz
 MnUmmXnQXYlZXExyVCIqsI8j2WrJ9PcuiniGJdjht0BiqboZC/SX3qGiwcre7vT/LzJe
 rLCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=ytcr4DNGsM/t7kd6jXgpKOZ/wK7hRn1NK12HxIXMRKE=;
 b=b4O5ohpmSNlROBvMpq7U0+IdvFQ+LJf0qwsyQUrCwdGurCFKSEJMpVKZWB3sI76Ilp
 EApEwAdyodvGqVzKXH+f3SIlOnCg6Wt+KDE0Xx20hbc4KvkOxUUPIXvmoBr+PtRGCHlK
 KXM5zroQ5RBucucZns1extftPOKKMdqn0x9A9GBSu45jXZRhk5Xq9h1kfyVFCgv4eNtd
 cfrE21GyWmZBQMkDJ9EYsJmGVlYbPXPCrVNEtuXMg266gp5xXY6DG7v5Y4PicuxXBtdW
 s4/REB7ZQVIq+6br2Bxifzr716PYsO35OA/J+DxDzNOn1Tev+IyiP0IaPaIjCIsYda7e
 8XBg==
X-Gm-Message-State: AGi0PuY1jE4AoRrWt77nGP6x0w/xXrhwCqC1FiBmO6JzeJ+C4WnMomlJ
 Anaz4TcWMITfidZYabrAO5cIYg==
X-Google-Smtp-Source: APiQypLHefjPm8Xgjdu6ICpgrvUDFrLOqOiQNSaKWVEHJV0E00xqUmBJ6qCW31i21zKvv/bei5YhbA==
X-Received: by 2002:adf:e54c:: with SMTP id z12mr23478210wrm.276.1587032818803; 
 Thu, 16 Apr 2020 03:26:58 -0700 (PDT)
Received: from localhost (cag06-3-82-243-161-21.fbx.proxad.net.
 [82.243.161.21])
 by smtp.gmail.com with ESMTPSA id h137sm3760755wme.0.2020.04.16.03.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2020 03:26:58 -0700 (PDT)
References: <20200414195031.224021-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 0/2] clk: meson: prepare GX and G12 for GPU DVFS
In-reply-to: <20200414195031.224021-1-martin.blumenstingl@googlemail.com>
Date: Thu, 16 Apr 2020 12:26:56 +0200
Message-ID: <1jd087bua7.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_032701_909991_A59F488B 
X-CRM114-Status: UNSURE (   7.52  )
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
Cc: sboyd@kernel.org, mturquette@baylibre.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue 14 Apr 2020 at 21:50, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> This contains only the clock driver updates from my other series titled
> "GPU DVFS for Meson GXBB/GXL/GXM/G12A/G12B/SM1" from [0]
>
>
> Changes since v1 at [0]:
> - update the patch descriptions to indicate that we explicitly don't
>   want CLK_SET_RATE_PARENT on the muxes
> - split into clock driver (this series) and .dts changes (future
>   series, waiting for testing feedback on v1 from [0])
>
>
> [0] https://patchwork.kernel.org/cover/11466399/
>
>
> Martin Blumenstingl (2):
>   clk: meson: gxbb: Prepare the GPU clock tree to change at runtime
>   clk: meson: g12a: Prepare the GPU clock tree to change at runtime
>
>  drivers/clk/meson/g12a.c | 30 ++++++++++++++++++++++--------
>  drivers/clk/meson/gxbb.c | 40 ++++++++++++++++++++++------------------
>  2 files changed, 44 insertions(+), 26 deletions(-)

Applied, Thx

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

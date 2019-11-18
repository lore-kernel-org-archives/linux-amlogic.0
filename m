Return-Path: <SRS0=GMFV=ZK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D887C432C0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 09:55:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00AA420692
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Nov 2019 09:55:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BiUPN7Jr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="GUqxG6CL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00AA420692
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:
	In-reply-to:Subject:To:From:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uo6yfaBzBJ+k5wx6ywMDos2+mBxG2VMTMnZly76vP2E=; b=BiUPN7Jr7ng/ZfGRZwvZZCGD77
	FTPCQyInaCro0DKC0g/iuGwQAeGymXww7jvLcGtY9ZWAKdGZAVmgOeUY4AoaEeH1nlXfiHU9BixUg
	pWHeQsCYCltSk+0S6ZXA3iNWW1WHxGSvLFl9zbbtfva9mqCKELgHSXzFym98Wbn4/2mn0cYo8LOWc
	vieYi4EopEQiob8I6gnDng66iIOOHk24kGS232QxwTJdGZVP17vzQZub9bj6IOkQYJntETFfbuHRk
	UGISmv4fO8wuKNIvJKgFSX3imFyf4mBd+PLy+IUyucv/NQRvR3h5SkbIgFwhFemEwXxDeECyq+I3o
	/1dg5XCQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWdl3-0004rr-7i; Mon, 18 Nov 2019 09:55:45 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWdko-0004g0-VG
 for linux-amlogic@lists.infradead.org; Mon, 18 Nov 2019 09:55:33 +0000
Received: by mail-wm1-x341.google.com with SMTP id b11so16630874wmb.5
 for <linux-amlogic@lists.infradead.org>; Mon, 18 Nov 2019 01:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version;
 bh=PgGBXNN0Jirm20pqBP2alAmny4JZsXPFHK67g56bQ0w=;
 b=GUqxG6CLejc6KGV040NaZ4pursegloLrR/ifPEW5TMnYTJN40jTwfTDcoPyHl++AYH
 7hDIjGeJs7/35Jcr3FMbYzv8jczm/IjAVdmFufSTHr+KbQDxIlzz1fFOP9rEPt9H0fYi
 C/0COGPKR46Q/kAu9c2Db+OGR2LoRA5af1KdmcLpaA18ymFFLoneezHQbBk0iF3z6Z+2
 V5qu0n5zE8uOBPZCrOuSW6lF3GziCSS0CJiebQ/UorvBuSDkTyaVQsSs9ob5+HFgGA8O
 YdLUl+AuVNp/TpadiKD69zNPJfoxDGwOW1K6v535KB67jnYfaN70laGOpM+pbhCWGWT3
 Rp6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=PgGBXNN0Jirm20pqBP2alAmny4JZsXPFHK67g56bQ0w=;
 b=pE46jN6obkKa8QNjroyzysDziTK9TOmGZesBR/ywi3mhyRDbm6Z3M0YTWelRPj6xeM
 2WIILEbl9ncSuywO8B+6Z1u/ii1SB5B4qRWZYL02ABZ8t6+Ay0iIoNLocVqnQUzQ9Esu
 Im7U1XnNPdRY04LOPvmkW9fRnmMck0vIfdiX2La77cjQmAavKUwSW4NydMvDa1YUvZrA
 WCs7BATF02Xbg4JNbt6rXy/dSNqwYsF4+MhnkLAJo7Bqzt/LCxhTVw/xK3fWuh22f92F
 kGmzBG9T9IrkPD5eYnB7h0QdH74Puw1G53K/OzKHKx+gV9AUp1Smn1XkiqEvgLSQerNZ
 /Hag==
X-Gm-Message-State: APjAAAX3Kpg87gVcuo8kfT/18EVHQHlwlMRqSehoMr4zPMjwHLDba249
 GPpsUS45r7uL09EhoTD0ktJEfg==
X-Google-Smtp-Source: APXvYqyHTu9Hx3fhpKYkJTLr1HNLDFQ01pm20kXFjw2y/6FC4VNE3s2de/14tyIsevI46o9k72VsZg==
X-Received: by 2002:a1c:39c2:: with SMTP id g185mr27162171wma.88.1574070928635; 
 Mon, 18 Nov 2019 01:55:28 -0800 (PST)
Received: from localhost ([2a01:e34:eeb6:4690:ecfa:1144:aa53:4a82])
 by smtp.gmail.com with ESMTPSA id a11sm20052731wmh.40.2019.11.18.01.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 01:55:27 -0800 (PST)
References: <20191117140731.137378-1-martin.blumenstingl@googlemail.com>
User-agent: mu4e 1.3.3; emacs 26.2
From: Jerome Brunet <jbrunet@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 narmstrong@baylibre.com, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 0/2] add the DDR clock controller on Meson8 and Meson8b
In-reply-to: <20191117140731.137378-1-martin.blumenstingl@googlemail.com>
Date: Mon, 18 Nov 2019 10:55:26 +0100
Message-ID: <1j7e3xpkz5.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_015531_006828_8A6955BF 
X-CRM114-Status: GOOD (  16.02  )
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
Cc: sboyd@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Sun 17 Nov 2019 at 15:07, Martin Blumenstingl <martin.blumenstingl@googlemail.com> wrote:

> Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
> registers. This series:
> - adds support for this DDR clock controller (patches 0 and 1)
> - wires up the DDR PLL as input for two audio clocks (patches 2 and 3)
> - adds the DDR clock controller to meson8.dtsi and meson8b.dtsi
>
> Special thanks go out to Alexandre Mergnat for switching the Amlogic
> clock drivers over to parent_hws and parent_data. That made this series
> a lot easier for me!
>
> This series depends on v3 my other series from [0]:
> "provide the XTAL clock via OF on Meson8/8b/8m2"
>
>
> Changes since v2 at [2]:
> - add #include <linux/clk-provider.h> as suggested by Stephen Boyd
> - drop unused includes
> - use devm_platform_ioremap_resource instead of open-coding it as
>   suggested by Stephen Boyd
> - drop trailing comma after sentinel element as suggested by Stephen
>   Boyd
> - dropped patch #3 "clk: meson: meson8b: use of_clk_hw_register to
>   register the clocks" because it's now moved to my other series at
>   [0]
> - dropped dts changes so this series exclusively targets clk-meson
>
> Changes since v1 at [1]:
> - fixed the license of the .yaml binding and added Rob's Reviewed-by
> - drop unused syscon.h include (spotted by Jerome - thanks)
> - drop fast_io from regmap_config and add max_register as suggested
>   by Jerome
> - dropped original patch #4 "clk: meson: meson8b: add the ddr_pll
>   input for the audio clocks" because I could not test that yet (that
>   patch was a forward-port from Amlogic's 3.10 BSP kernel)
>
>
> [0] https://patchwork.kernel.org/cover/11248377/
> [1] https://patchwork.kernel.org/cover/11155553/
> [2] https://patchwork.kernel.org/cover/11214227/
>
>
> Martin Blumenstingl (2):
>   dt-bindings: clock: add the Amlogic Meson8 DDR clock controller
>     binding
>   clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller
>
>  .../clock/amlogic,meson8-ddr-clkc.yaml        |  50 ++++++
>  drivers/clk/meson/Makefile                    |   2 +-
>  drivers/clk/meson/meson8-ddr.c                | 149 ++++++++++++++++++
>  include/dt-bindings/clock/meson8-ddr-clkc.h   |   4 +
>  4 files changed, 204 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
>  create mode 100644 drivers/clk/meson/meson8-ddr.c
>  create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

Applied for v5.6
Please note this will get rebased once v5.5-rc1 is out


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

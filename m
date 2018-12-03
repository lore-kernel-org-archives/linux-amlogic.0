Return-Path: <SRS0=94bh=OM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1BE9C04EB9
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 22:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9363720864
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Dec 2018 22:45:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F1gvyxXY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="N5duhuq8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9363720864
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Message-ID:References:
	In-Reply-To:From:To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dyj/bKnbNbToogUmS7kSdI6/5VKW2FSNjQpNSyiPedc=; b=F1gvyxXYEO5Olv
	64P3IwgoZq6dj3+dMYRZECWtTbx8ozd2Qfbmu9Q1no+bJC/oxQsFyaZiuthNp/saA/Os6BuJ7jD3X
	TxHfc8pFCMG5qPoBDtP9GVJwh3d3d7TBxbwsCwWUajpB/H4BWXTdUK3oRl2Jea/CTbX2dz7nXvNTs
	GMl3EilM2osUFuUkHV963vL790v6fPm/l9N6fYsB1hk/iJ1fl73031WNMacesca9aMSDw1nGRqkDT
	FgKH36HwvUHayCh6oAcwFPMIccNMNO1LrjFiK7ETfPPAE647CV6BRV4CBtfGfrg9zRYf7LVyvWWBY
	7wWPSaN16z4rKa7mhdQA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gTwyJ-0007S7-SR; Mon, 03 Dec 2018 22:45:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTwyG-0007RP-W0; Mon, 03 Dec 2018 22:45:46 +0000
Received: from localhost (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 62BD820864;
 Mon,  3 Dec 2018 22:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1543877134;
 bh=Tv5xntpOFZLjgLVDbFFAyXgVlC5/NfqIbqNPTujsV6s=;
 h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
 b=N5duhuq8ug/rks25GN9PUAoJdOlqrnzTa+pX1SIe/aqRJS0NZTFEnc4EA7MHs8lph
 FrYw7DT3kBUrXltShu+tqZbY0NSRwu0Em5TGTFkzSVpkAdl94GMvciZLU13NuyHxp5
 GGPymSABAW/MEs37wqnu/pX9HIviK+vUgWinA9aQ=
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1542284312-55418-3-git-send-email-jianxin.pan@amlogic.com>
References: <1542284312-55418-1-git-send-email-jianxin.pan@amlogic.com>
 <1542284312-55418-3-git-send-email-jianxin.pan@amlogic.com>
Message-ID: <154387713374.88331.16436869339024592009@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [PATCH v7 2/4] clk: meson: add DT documentation for emmc clock
 controller
Date: Mon, 03 Dec 2018 14:45:33 -0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181203_144545_043647_65E2C293 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Yixun Lan <yixun.lan@amlogic.com>,
 linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@bootlin.com>,
 Liang Yang <liang.yang@amlogic.com>, Jian Hu <jian.hu@amlogic.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Qiufang Dai <qiufang.dai@amlogic.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Quoting Jianxin Pan (2018-11-15 04:18:30)
> diff --git a/include/dt-bindings/clock/amlogic,mmc-clkc.h b/include/dt-bindings/clock/amlogic,mmc-clkc.h
> new file mode 100644
> index 0000000..162b949
> --- /dev/null
> +++ b/include/dt-bindings/clock/amlogic,mmc-clkc.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: (GPL-2.0+ OR MIT) */
> +/*
> + * Meson MMC sub clock tree IDs
> + *
> + * Copyright (c) 2018 Amlogic, Inc. All rights reserved.
> + * Author: Yixun Lan <yixun.lan@amlogic.com>
> + */
> +
> +#ifndef __MMC_CLKC_H
> +#define __MMC_CLKC_H
> +
> +#define CLKID_MMC_DIV                          1

Why does the define numbering start with 1 instead of 0?

> +#define CLKID_MMC_PHASE_CORE                   2
> +#define CLKID_MMC_PHASE_TX                     3
> +#define CLKID_MMC_PHASE_RX                     4
> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

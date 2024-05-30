Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0961DC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu, 30 May 2024 01:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6FD9x/wfGgX1cjGmh5p/IcksOsrJGLmnUX1oY81ZlA=; b=vM8cG8N38AeTzj
	TY8WJp5LRYOYdctd0T9BnfvZcAfpfagsOHUQUlA84l+0ZAdwpDYjMDYgtz9lyv3gPPQsgmbYHARP+
	YbdHqfS2z3aV8jyXA2v5s7vQs+5spL0rFoC6/lsfh7EClTpu0C0eMABOO2fUfrXB5BFrcxlICXFpT
	DC3DDk7ktcll+AccWtc9AIq0vv28ib4Dk7nfQQ+DJCddJPB1c5kp6pC6r+vvFGgemBfrak/JW/wyC
	oHk5gUdqKhLvI1WzQii6g7qRExVV4jdrNix9+yK+NLh3zKFj5Tbof114IpG/0BR/9UvjQyCEPfb5e
	hyJDP08aIecLJkc948Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCUAz-00000005x6m-2qiU;
	Thu, 30 May 2024 01:01:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCUAx-00000005x6M-1XcA
	for linux-amlogic@lists.infradead.org;
	Thu, 30 May 2024 01:01:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24CFF61177;
	Thu, 30 May 2024 01:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB83FC113CC;
	Thu, 30 May 2024 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717030909;
	bh=cJmlKGOTHQ+BuDd8duP8qVpIxhVbfAXEM3GOcqyoUNM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UAU4jijRZ/Fq/r8kmyA+N+BqLvcBIjDf3ftlLK35kx2DX0kVbKcs2+p+rpGdy95Uy
	 vKiGifkrQ7mrTj9+gzKxHWt9ILNfGCLcQJkW2eSN+n7m8jqWDVOuRzJrAgcWyM7ofr
	 iYNy293DqaDz/XA0Q0oJrDWvOwP55jPNxcXn5KYyOaeAhxjWeYEi//kRwrCD5Cawf6
	 qPovzCywNwNnJ1hNSU6KXMs9ieNwBYzy3yYWId/d5+cHYXNRXaTaJ9puKJmbMTDbDj
	 0KPA9h/B+fFTjnr/8PmakSWOJpdvjjF8GIu8v4/EpUhXxCFULUVUxZEv2ZoI+6DZ9Y
	 9zL1LABWQTbbQ==
Message-ID: <68518f93af68cbc0153c8bd765dc885f.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240516150842.705844-9-jbrunet@baylibre.com>
References: <20240516150842.705844-1-jbrunet@baylibre.com> <20240516150842.705844-9-jbrunet@baylibre.com>
Subject: Re: [RFC PATCH 8/9] clk: meson: add auxiliary reset helper driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Wed, 29 May 2024 18:01:47 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_180151_568913_CA4E3C51 
X-CRM114-Status: GOOD (  15.12  )
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

Quoting Jerome Brunet (2024-05-16 08:08:38)
> Add an helper module to register auxiliary reset drivers from
> Amlogic clock controller.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/Kconfig             |  5 ++
>  drivers/clk/meson/Makefile            |  1 +
>  drivers/clk/meson/meson-clk-rst-aux.c | 84 +++++++++++++++++++++++++++
>  drivers/clk/meson/meson-clk-rst-aux.h | 14 +++++
>  4 files changed, 104 insertions(+)
>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.c
>  create mode 100644 drivers/clk/meson/meson-clk-rst-aux.h
> 
> diff --git a/drivers/clk/meson/meson-clk-rst-aux.h b/drivers/clk/meson/meson-clk-rst-aux.h
> new file mode 100644
> index 000000000000..386a55a36cd9
> --- /dev/null
> +++ b/drivers/clk/meson/meson-clk-rst-aux.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2024 BayLibre, SAS.
> + * Author: Jerome Brunet <jbrunet@baylibre.com>
> + */
> +
> +#ifndef __MESON_CLK_RST_AUX_H
> +#define __MESON_CLK_RST_AUX_H
> +
> +int devm_meson_clk_rst_aux_register(struct device *dev,
> +                                   struct regmap *map,
> +                                   const char *adev_name);

I'd prefer we move the device creation and registration logic to
drivers/reset as well. See commit 098c290a490d ("clock, reset:
microchip: move all mpfs reset code to the reset subsystem") for some
inspiration.

One thing I haven't really thought about too much is if they're two
different modules. One for clk and one for reset. If the device
registration API is a symbol the clk module depends on then maybe that
is better because it means both modules are loaded, avoiding a
round-trip through modprobe. It also makes sure that the drivers are
either both builtin or both modular.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

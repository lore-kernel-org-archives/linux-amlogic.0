Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5D6C54E5D
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 Mar 2024 14:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xnifm9q6NMLrbRTO86E2tkuwwockwFLyAvQ0picVXbg=; b=E/+qj9h5DenhNZ
	glfPQZu/Ujq7qPCX63hvWrG7FZ7uwGX2H2JIK6Sg3TAxeiB8Dy2O2UkoOyRmb/7ZVtLXC6SQpoYga
	DvVBIN1mXBi36qAuOw9gZ8+HwscrO4WtSfPWi/dHF8G1TFNb0NS5qnKrxq5TXF0ov0qganTzDLaKX
	OSisiQOwNpq2//3eFsugjey0/ee+FB9CmuxhS+IaT7kTbi0CuYOEwA1K8A/MEeEV1sJ9vyu/zPKFM
	LjzCom4H8SJidhyp0mIcAT9NAxI/TQvQKx7wlD0Biglj9fYdoNdUp7YjTOJV5egHm4xwjJmCAMo7w
	hvUqa/XlUzsXqw4vdDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmENj-00000008sMi-3k3p;
	Mon, 18 Mar 2024 14:54:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmENg-00000008sLl-2b6M;
	Mon, 18 Mar 2024 14:54:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DC2CECE09CF;
	Mon, 18 Mar 2024 14:54:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D660CC433F1;
	Mon, 18 Mar 2024 14:54:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710773666;
	bh=ywjXIx6HmklPsjIr1i1IzyaHa8odZGdCDM27OSINcmM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdxMXb2iz+7JsM/SUAYZYz1a0za5xAhxZOCC3lmz+q98zXps0G46eAz43LPzBoHsn
	 67j2U2E6WOpFWw9gsmMa4RPICEsQH7XpodOIBhZfCOPZRDZQrlL4oFPQatyssd2sPw
	 BH/mzt6eQXw1JFkZzOkzubzdLiWh2/M7CM+Ka8ye+662wrxuwr8SCxxrygrKl4Gsg1
	 /G3P/Ru1sNH+HD/YJe0O9YGY2xeuCbVL8NqM/64UstD292013btVgoFU+JyBbJQyZB
	 HorS0tvkqpI3CtDmcIzAMY3ZbVd907Gnr7iPnj4t/Cq6r+usfMMJRdpoVPAfltgbVS
	 cQDML6T2f56HA==
Date: Mon, 18 Mar 2024 09:54:23 -0500
From: Rob Herring <robh@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: Xianwei Zhao <xianwei.zhao@amlogic.com>, Yu Tu <yu.tu@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [RFC][PATCH 1/2] clk: meson: T7: add support for Amlogic T7 SoC
 PLL clock driver
Message-ID: <20240318145423.GA3993342-robh@kernel.org>
References: <20240318114346.112935-1-tanure@linux.com>
 <20240318114346.112935-2-tanure@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240318114346.112935-2-tanure@linux.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_075428_860925_4F5F39FC 
X-CRM114-Status: GOOD (  14.95  )
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

On Mon, Mar 18, 2024 at 11:43:45AM +0000, Lucas Tanure wrote:
> Add the T7 PLL clock controller driver in the T7 SoC family.
> 
> This is RFC patch that enables SDCard, Ethernet and Clocking
> for Amlogic T7 soc.
> In this current state the patch doesn't work and gives a kernel
> panic when probing the meson-axg-mmc for the SDCard.
> DO NOT MERGE.
> 
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  drivers/clk/meson/Kconfig                     |   25 +
>  drivers/clk/meson/Makefile                    |    2 +
>  drivers/clk/meson/t7-peripherals.c            | 6368 +++++++++++++++++
>  drivers/clk/meson/t7-peripherals.h            |  131 +
>  drivers/clk/meson/t7-pll.c                    | 1543 ++++
>  drivers/clk/meson/t7-pll.h                    |   83 +
>  .../clock/amlogic,t7-peripherals-clkc.h       |  410 ++
>  .../dt-bindings/clock/amlogic,t7-pll-clkc.h   |   69 +
>  8 files changed, 8631 insertions(+)
>  create mode 100644 drivers/clk/meson/t7-peripherals.c
>  create mode 100644 drivers/clk/meson/t7-peripherals.h
>  create mode 100644 drivers/clk/meson/t7-pll.c
>  create mode 100644 drivers/clk/meson/t7-pll.h

>  create mode 100644 include/dt-bindings/clock/amlogic,t7-peripherals-clkc.h
>  create mode 100644 include/dt-bindings/clock/amlogic,t7-pll-clkc.h

I'm assuming since this is an RFC you know these go in a separate patch 
with the DT binding schema which is missing.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

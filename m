Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1831DE936E7
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Oct 2023 21:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qE+8fQ/WRYdcPzS146Fv1rc/yU9iA8LqIEwiJvuGh7w=; b=M0l4tKh7R/wlrR
	3bcWCq0DyexETVQ1tGPle2s0wSbqAlYaTKU5PhJu2QrDBe58iD+Ny5PMurWFWP+2KiLEBXUGsQ6Qz
	eLE6Q88SlG6cyLvcfIaWt3PGVgpas5AYQLiEdTpKiq9CPm7JsREV68NoslWI2DIT0eocbrZ5gmOGJ
	We/r2JhX9tygx+MZkic8X85rrrp4JxF/fpdCjc5sRQXwkj+oLRDp0ew5a1aUuwYw9KsjM6mrwnIuf
	H6vLUn3CsMZHHymBksqqeF3FMoxUCp9c7tZjIOHwrGCULGuRFllNTnvx85OlaXEnE1d29MlYxY3EW
	PpOibvSiK3adZuOfcuiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo9HQ-000vBz-2T;
	Wed, 04 Oct 2023 21:19:40 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo9HN-000vBK-1d;
	Wed, 04 Oct 2023 21:19:38 +0000
Received: from i53875a3c.versanet.de ([83.135.90.60] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1qo9GZ-0005NJ-Hp; Wed, 04 Oct 2023 23:18:47 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: broonie@kernel.org, chin-ting_kuo@aspeedtech.com, clg@kaod.org,
 joel@jms.id.au, andrew@aj.id.au, florian.fainelli@broadcom.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, fancer.lancer@gmail.com,
 olteanv@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 conor.dooley@microchip.com, daire.mcnamara@microchip.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com,
 venture@google.com, yuenn@google.com, benjaminfair@google.com,
 linus.walleij@linaro.org, Li Zetao <lizetao1@huawei.com>
Cc: lizetao1@huawei.com, linux-spi@vger.kernel.org,
 linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH -next 25/25] spi: rockchip: Use helper function
 devm_clk_get_enabled()
Date: Wed, 04 Oct 2023 23:18:45 +0200
Message-ID: <16634210.geO5KgaWL5@diego>
In-Reply-To: <20230822131237.1022815-26-lizetao1@huawei.com>
References: <20230822131237.1022815-1-lizetao1@huawei.com>
 <20230822131237.1022815-26-lizetao1@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_141937_548318_AF9EE659 
X-CRM114-Status: UNSURE (   9.05  )
X-CRM114-Notice: Please train this message.
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

Am Dienstag, 22. August 2023, 15:12:37 CEST schrieb Li Zetao:
> Since commit 7ef9651e9792 ("clk: Provide new devm_clk helpers for prepared
> and enabled clocks"), devm_clk_get() and clk_prepare_enable() can now be
> replaced by devm_clk_get_enabled() when driver enables (and possibly
> prepares) the clocks for the whole lifetime of the device. Moreover, it is
> no longer necessary to unprepare and disable the clocks explicitly.
> 
> Signed-off-by: Li Zetao <lizetao1@huawei.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

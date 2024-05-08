Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104FFC04FFE
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 May 2024 17:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMaPwYYO/IykZfhAwUWPPzU5APr/RaoLjII7pnqW8M0=; b=bsGCzOqn49Hch4
	xtbGG5vIGSyUWdeTRNto2mHdhG+9gba1s8diMGUHLaiQ7/cvPJHtNM1KNtMha8K2s1w8U4g3EEc6L
	+/egIz703pgpV/23ELp9DWvFNI7Xof31x1wVHD50wPDBSOegvnRmW/COBTRVbKWCtODtyM7XcWkKl
	nMr9R4+YZ8bDMu1CkMlY/OS2g9Tf/SUDmf4XiEctLpanTVL7KwELp1PFkhPyoU3ZzFcT3xous9r2a
	RVK11FWk2D4vxdvxWMSHIM4Pts4HZcaYbZD+qMnKPdBbsEcpKo0w+lCk+/raq1ogsIg0SLYdeQcoq
	qzodWlcSdFUoXXxiL+xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lQs-0000000GRcr-2etF;
	Wed, 08 May 2024 17:50:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lQl-0000000GRan-3ChF;
	Wed, 08 May 2024 17:50:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 412D860AEF;
	Wed,  8 May 2024 17:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2F2C113CC;
	Wed,  8 May 2024 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715190614;
	bh=O7Iu+gfiqdTrJ5Xezid8yKZhJ+FRommTaNGfEwrOI4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rla7ceu3BrmVcpFdRGNn0AW4gfXOO8LADVNVvrR3LyWGxP8tus/4nJsxlUDdrt7GV
	 z+pEWZlWgrStd0c13TYNY7Srhyrf4OaxBvpZr1Rj21qyBbR2TSVAUhgRSBOaLLJnUX
	 MmxCRGMZqAWDDLykIjLGUyqfUOpatzkat2PuyGDOX4V9+phJ8EmDkvsgNmzTQSRw9l
	 vy4o+oEQPZMKyhXbzTX5jGkDqxdhnO5jgmlWlo3lOxL5HOz3+z48mvMjW2z9UXC7UZ
	 44PXuLMukcEAPC/Y1Nr6SrhOaw39O4rHg/E2ZA/NE7rBCwy3grmUF/HvHNiFNyuMqV
	 HcIrvNEhdhuoQ==
Date: Wed, 8 May 2024 12:50:13 -0500
From: Rob Herring <robh@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [APPROACH 2 1/2] arm64: dts: amlogic: list all slave clocks for
 audio clock controller
Message-ID: <20240508175013.GA2244257-robh@kernel.org>
References: <20240508144259.191843-1-jan.dakinevich@salutedevices.com>
 <20240508144259.191843-3-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240508144259.191843-3-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_105015_869327_BB598FD2 
X-CRM114-Status: GOOD (  12.06  )
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

On Wed, May 08, 2024 at 05:42:58PM +0300, Jan Dakinevich wrote:
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 27 ++++++++++++++++++++--
>  arch/arm64/boot/dts/amlogic/meson-g12.dtsi | 26 +++++++++++++++++++--
>  arch/arm64/boot/dts/amlogic/meson-sm1.dtsi | 26 +++++++++++++++++++--
>  3 files changed, 73 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> index 6d12b760b90f..28f4ec5f39b0 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
> @@ -1342,7 +1342,9 @@ clkc_audio: clock-controller@0 {
>  					 <&clkc CLKID_HIFI_PLL>,
>  					 <&clkc CLKID_FCLK_DIV3>,
>  					 <&clkc CLKID_FCLK_DIV4>,
> -					 <&clkc CLKID_GP0_PLL>;
> +					 <&clkc CLKID_GP0_PLL>,
> +					 <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>,
> +					 <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>, <0>;

All 3 cases are just unused clocks on the end. I suppose that's not 
always the case. You could just set 'minItems' in the binding to 
avoid needing to pad the end and the dts changes.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

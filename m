Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7366ED6A249
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Nov 2024 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ecBwY8R/bbZHF78lEC1la/en1q2/1bHUFwOBJgwIBow=; b=h2vb9mNhR5D3Hm/SHep02dnTXz
	36lw4QsQdlHBZ7Kj4M6iksleB3gq+/ioP+7KwLpyP0Iu0rms5bXIeUMuSuVYJXrfZzm+fjWytLgEV
	I592hpYQlSZmBHX1+dy52FtJxk2OM1oymohQcV/hc0gsVu85h5uSIwCBxMrF0nBTZg567iKlokPDg
	pU0FxCwYYDSuLvYCZCCY3pc8GY4gIUWVEmotbc3Gvyb8pfm/keZkFyCQlZdZIoprJvBxcZf7yW04G
	MHGmQi3LFPV6bpFc6Txbbl9gJ2DnJW3fT/EUaweHYG1UuZFI99pNXO6nA1Cn33C1JIDT56OBIBBVA
	weZjbudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiXi-000000010o3-328m;
	Thu, 14 Nov 2024 22:42:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBiVo-000000010VC-2z0E;
	Thu, 14 Nov 2024 22:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C019F5C1127;
	Thu, 14 Nov 2024 22:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A196AC4CECD;
	Thu, 14 Nov 2024 22:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731624027;
	bh=q+dgoQrtOgKVilV2nVsbgAYQbJrn9GgLDKGPgYV2pDc=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=jtVWwzYFOpJ/mB2Fa/mloq4oMS5Ir56qJWbEJZ9Twwar0LaFkh95AowpZF8iCrCQd
	 F5pEAvNrhBpZmWIiS9ptJQYx5LjZq7iKb4UjO8kmCw6QIIqjaypemN3Rc6Rk7mlQ3K
	 uFPAqZKNYEcdi7+rUvWEbkcDzA2wS9GN0tGhBzJ06RpzBBFug/XhkfcNfhbGTip3Re
	 g7xzzMprUniwI5qruvRrKGr/+ZKV6JhwuQjQzv8l6tzyzgMZUl8luQwsEGt2wuMkcM
	 NQ3MBC6axxq99EM16xbEjn4nDTWvX4pccd/uNsaznxIm9rF29zcN3fg0rmcJepAVo3
	 anI0qsoPILy4A==
Message-ID: <b473d92cc353b1cf58169410236e4c51.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20241112230443.1406460-4-jan.dakinevich@salutedevices.com>
References: <20241112230443.1406460-1-jan.dakinevich@salutedevices.com> <20241112230443.1406460-4-jan.dakinevich@salutedevices.com>
Subject: Re: [PATCH v5 3/3] clk: meson: a1: add the audio clock controller driver
From: Stephen Boyd <sboyd@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Jan Dakinevich <jan.dakinevich@salutedevices.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 14 Nov 2024 14:40:25 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_144028_794543_1279E7E9 
X-CRM114-Status: UNSURE (   8.66  )
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

Quoting Jan Dakinevich (2024-11-12 15:04:43)
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 7cb21fc223b0..49f2086bc773 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -133,6 +133,20 @@ config COMMON_CLK_A1_PERIPHERALS
>           device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>           controller to work.
>  
> +config COMMON_CLK_A1_AUDIO
> +       tristate "Amlogic A1 SoC Audio clock controller support"
> +       depends on ARM64
> +       select COMMON_CLK_MESON_REGMAP
> +       select COMMON_CLK_MESON_PHASE
> +       select COMMON_CLK_MESON_SCLK_DIV
> +       select COMMON_CLK_MESON_CLKC_UTILS
> +       select REGMAP_MMIO
> +       imply RESET_MESON_AUX

Should be 'depends on RESET_MESON_AUX'

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD847CDB482
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 Oct 2023 23:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uss6cPw9tlgwtk2GEfX1Gk7MY22Dfc6wdyBJk4o19rw=; b=3/hcpYrpEbaNXp
	789+ZMrKVBJqDWqLju6l/Fx9u+bZ84/1yuePGJ9kw2H+eckFIbrGQPPLo8WUWtAKsvw8LGLUW7kyo
	8Hdw6r52yXUlBWnp1+oDU1RXH6hEGTdudjSo0CT5P5tRXaUqWVL/w9x1XqvFuafNnrI0R3/4ehS1a
	Dw0OQX825qNPASng0YNJOdGuZh9hqREs8xJ6wrWFjeQ8JZe7kMPOXqvOg1RaQQgrbH+pXz1actXNb
	up9Jekupz92k0ko+Q20ore3uXQbPhf3UTK5s7vlUYFIe2KNg2EBhKcTR39RfaFa9VeV4s4DM886qy
	Qx7p8xWsVBhnqlCDiMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qr5TA-0028yN-1y;
	Thu, 12 Oct 2023 23:51:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qr5T6-0028x4-33;
	Thu, 12 Oct 2023 23:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 36B71CE2C7C;
	Thu, 12 Oct 2023 23:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BFFDC433C7;
	Thu, 12 Oct 2023 23:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697154708;
	bh=7ci+m7+x7XXxdQsME2tkoDD8RgVXYZGHP0UltC3GUjk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ULBz4pFZ8+loGkL1DAGx8tp/a1sgOMFS1Vd65ppgTiHyt5v6y7xrxc+ARZx4h+OX0
	 FCMuS4Dq11+teVUo/2d30vo7lUcIlN94VGlhao2iXD/Zl7qY/6UjTDhuQ2DrGgpMp3
	 IjHaK02zo6QQg7brR+0FakpeqdpqB24DuvEvrFR7FHhMOtebZq3tZPeRpsgiMpOEvX
	 F53EfpzVH+ERjrG/3hf3cRXAB07vniyOzos6tZxdezzL1l+ENItPPS4/ZzEyNF1yE0
	 ygOeJpPjJd46aGe5L1Jsg6CnE83kbTK4VFm9lXgnFrWjzeKHvtSaU2QyP9x4jcW/oW
	 X4tFweO6hr15A==
Message-ID: <5e0bd4bba88701dd1a7a3e89d18412f0.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231010062917.3624223-5-xianwei.zhao@amlogic.com>
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com> <20231010062917.3624223-5-xianwei.zhao@amlogic.com>
Subject: Re: [PATCH V2 4/4] clk: meson: c3: add c3 clock peripherals controller driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Chuan Liu <chuan.liu@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Oct 2023 16:51:44 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_165153_158290_A768685C 
X-CRM114-Status: UNSURE (   9.21  )
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

Quoting Xianwei Zhao (2023-10-09 23:29:17)
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 76be4bbd2afb..c8d59d28c8ff 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -140,6 +140,19 @@ config COMMON_CLK_C3_PLL
>           Say Y if you want the board to work, because PLLs are the parent of most
>           peripherals.
>  
> +config COMMON_CLK_C3_PERIPHERALS
> +       tristate "Amlogic C3 peripherals clock controller"
> +       default y

Why are these default y? They should depend on something like ARM64 and
even then I don't see why we want to enable them by default if we're
building the ARM64 kernel.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FADC71155
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Jun 2025 07:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dLhhIbscVwlalcqw8XKim8GQZT1Xhr0SYF3gDLiyrE8=; b=KAprQFwnzaLUE2
	ZHKtkriuKkxOjOVVbLGRdgn74SJduqMhzpC/dZAOrZb9Pm3GLrVtZ1E4+K1V+5rrJddZcByZ8I/9c
	uNA5Zba7u7/1bVQPFtHIrxdm8FrkUmjHYcu76erBshcu68gI0c49DJMyRoABYE+pomI1VD/Tj6DPn
	2caHv9WD/WOoAlyoccyhnGe2ng04owDVktYhX9vixjNbRD4vX21Wr3HKdOYZDs+XwCu88HPgljnIE
	gWXtVq28PO6Kgs6d3KXIcHhWLYFtQir+YGiS3IIXgSIUoAPtzQ6h3ZpPmVkIPpAh+mZBNl10/MkJD
	9xrxqtHvEeIMyMKprCRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSW3y-0000000Ew4b-37ji;
	Fri, 20 Jun 2025 07:21:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSW3w-0000000Ew4F-2lXu;
	Fri, 20 Jun 2025 07:21:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 674175C537D;
	Fri, 20 Jun 2025 07:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 480B4C4CEE3;
	Fri, 20 Jun 2025 07:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750404083;
	bh=FSM2izM9vl5e3Hqb+oIj0xlTknp96G+HXI6ROxmh4SA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UoRRXQiLO+R0p4ZlmRLdszbRQ3CXGasmrKwf0KJAtOE1m1aqiOcZyZsaIRvWQ0pe2
	 MGK4ZpAvNswj+g4TDkFL74RdrdwXEHDGiGJ5GutrNTSYny0w/xp1YBHBFqW0TQ4vV5
	 2598p67FYgF/tkW5qSsuJVOJky9F/iaivYRZPf5Mj8TrNvU/f2SYzG0/Cll171zt1F
	 /1mexlZS5/AwibSZ16WWqdJ1jIqKHZF8CGTeMrZLsjA9QtNdPbE3kDRYzCJ3L4JEuu
	 G+vrC0+S2bM1j4RUdvuWezHWIcPv//+lNBM4SW1c1E1ojLb1BOk6V+0nH1tcvzPs0Q
	 4TUEO7h88wtLw==
MIME-Version: 1.0
In-Reply-To: <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
References: <20250404-kconfig-defaults-clk-v1-0-4d2df5603332@linaro.org> <20250404-kconfig-defaults-clk-v1-2-4d2df5603332@linaro.org>
Subject: Re: [PATCH 2/5] clk: nuvoton: Do not enable by default during compile testing
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Emilio =?utf-8?q?L=C3=B3pez?= <emilio@elopez.com.ar>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, Samuel Holland <samuel@sholland.org>
Date: Fri, 20 Jun 2025 00:21:21 -0700
Message-ID: <175040408188.4372.10647064030431437175@lazor>
User-Agent: alot/0.11
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_002124_757788_DE161AEC 
X-CRM114-Status: UNSURE (   6.31  )
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

Quoting Krzysztof Kozlowski (2025-04-04 04:56:58)
> Enabling the compile test should not cause automatic enabling of all
> drivers.  Restrict the default to ARCH also for individual driver, even
> though its choice is not visible without selecting parent Kconfig
> symbol, because otherwise selecting parent would select the child during
> compile testing.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

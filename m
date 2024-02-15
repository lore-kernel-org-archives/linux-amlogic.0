Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF1CC48BC4
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Feb 2024 23:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t9haywrBvLQ6zpy9zQfG0kUDPHwW5D2WJbKte7CMotQ=; b=hXy5PvItKX1QUtb8mTRAFXV+cr
	YS6U6/oc3O1k0U+SeOnKvqcjcUqzGWbcA77VJ7c46Yg3fULcTjNtI2+FEe33eB+hVF465sxRSFdHR
	q5Oq1JYe9cZVsSE3wS0auf/LmFOmuI6n2ruYgwzJlacPlGTocpDJYNKM7pTtPiRYaA4Di4O/Tjp54
	zSoxnRDJaSv6NtE1IRMKBf2sFiRXiysF36x8Pn7Ei1xp6Pr+2iDXKZiJg5LuUfO3yEv6G3GRMA3Lo
	t+5nDAQJREu/XegQJKS7lVuZ2QKQ9Aho+MTBnfR3XRrWa3+hZPT7CtjFoMVaNDahtbXDG81wHh5wX
	DcpSGNSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raktw-00000000Q7a-27pl;
	Thu, 15 Feb 2024 23:12:20 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raktu-00000000Q6i-29ZQ;
	Thu, 15 Feb 2024 23:12:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id AAF86CE291F;
	Thu, 15 Feb 2024 23:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8FE2C433C7;
	Thu, 15 Feb 2024 23:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708038734;
	bh=Eb/9YuG1ExOw9aKA1oqZbr3X02sG3sH9UxVJp/eMEdU=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=VKWARMnYNviJPXiOtKuoccPiteYKCHSVFRLfobnKgCAmFe3rC2z0Wd3jsy6VvnDNO
	 LU9halfyBb8j8Gtgt3x3Yl2qjLDsAaN4XWZY7vP2J42INqR9FJQbRW1OHvIkeGQQFp
	 uBCYksmhH7HE6OaG4D9ym/b893RmduQl4SpP0JiZwyMF3BNC3fvmpvB1RmIpvsXepi
	 DfFkHY0/gR6aJRNCjSdzlugiIA0yQlY7txVukxSAYJg5oBs5tW432Y/k7zJ3C35m36
	 +j4EikR/4v5vFeyHEmEG7BhaHzvhhTsPRPWFIm8wrAx8nLp781+VxGDyfk8VT7NiAg
	 cIy678urUpZjg==
Message-ID: <38e7e80f61f7c67c984735cf55c3dfb3.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of of_clk_provider
From: Stephen Boyd <sboyd@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Turquette <mturquette@baylibre.com>, NXP Linux Team <linux-imx@nxp.com>, Nishanth Menon <nm@ti.com>, Peng Fan <peng.fan@nxp.com>, Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>, Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-phy@lists.infradead.org, linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-tegra@vger.kernel.org, patches@opensource.cirrus.com
Date: Thu, 15 Feb 2024 15:12:12 -0800
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_151218_733643_3110E1E4 
X-CRM114-Status: UNSURE (   9.74  )
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

Quoting Krzysztof Kozlowski (2024-02-08 08:37:10)
> None of the implementations of the get() and get_hw() callbacks of
> "struct of_clk_provider" modify the contents of received of_phandle_args
> pointer.  They treat it as read-only variable used to find the clock to
> return.  Make obvious that implementations are not supposed to modify
> the of_phandle_args, by making it a pointer to const.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

This will almost certainly break the build once it is merged to
linux-next. What's your plan to merge this?

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

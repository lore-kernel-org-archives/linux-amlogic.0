Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613BAC6FD18
	for <linux-amlogic@archiver.kernel.org>; Thu, 20 Apr 2023 01:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RXi6HU4+itye+tHAJBzdH9OvWP9xtMRLspgSoUSozVI=; b=ZB3AhEQEKJFMey
	c5h04c0XE2j7PTwCwvl71jh7vtztEP41wmf5ReF8XupI8HJXXCRtcFPyxXG3kobAt9pXmIQDCYjZz
	7zJMRBMhdpB+6W+9v15xTYCVgKQXusMrqmicRRZfj+z3Vkn0pF9Cxjdo9pW0t+4keK0pvSzrZcANl
	lj11MqbgCpHcqfpFimjGe9SuM9t0qltfEqN2dJRitmq/mwQ538NTtz+7peMEdWI7FGAXc/Lt7PElG
	8K9rgbptr8NdzB9umOlZq6MolnLkcJy5oP3cy1EkoJX6kO25PWVqZC2pVvPTh+ZyLc+gdYRyhpSus
	b5gc0jUtvdEwBtd+yFxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppJRH-006qQp-0I;
	Thu, 20 Apr 2023 01:50:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppJRE-006qQG-1d;
	Thu, 20 Apr 2023 01:50:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 14F3564457;
	Thu, 20 Apr 2023 01:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F449C433EF;
	Thu, 20 Apr 2023 01:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681955419;
	bh=Cu26XDuyq5lcZoz0ShVQmRachFypR8wCCTGfVCRr0kc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=AeNMQfvQL0xUGhQZuwBID+Vfg1KL01GzIazg36wgQpBQjLeyr+EbHsqyuEsqCwNvB
	 wlp97j9vNEzaL7Qn2704lFswH4gETlVdMKGuHbSetDGAK0f1P9BYp6+/0UDr0uLLBe
	 ua6FVCIWByeAwuQApHRNpRtnsgtjVr7FFXNa24+SHe7QzRUpt4yTanuc/NHODMWw5O
	 aAD17rUpoJm5XVDvWLsge1PAa9mCObK91qvVPBTB9RlgVxuzP8+kR263Tuyluuc7dC
	 K1q/MYWu0E0vPLRCP874RTsEMCBYEK1sC57HRDuv5qfrBIh2Kmp+jIeHokZZ/dzXY+
	 HI7qyXJrRmvOg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4D301E4D033;
	Thu, 20 Apr 2023 01:50:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: stmmac: dwmac-meson8b: Avoid cast to
 incompatible function type
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168195541930.13596.18249490996446633117.git-patchwork-notify@kernel.org>
Date: Thu, 20 Apr 2023 01:50:19 +0000
References: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
In-Reply-To: <20230418-dwmac-meson8b-clk-cb-cast-v1-1-e892b670cbbb@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, neil.armstrong@linaro.org, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 mcoquelin.stm32@gmail.com, nathan@kernel.org, ndesaulniers@google.com,
 trix@redhat.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_185020_607513_B7EBB6A9 
X-CRM114-Status: GOOD (  10.49  )
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

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Tue, 18 Apr 2023 13:07:33 +0200 you wrote:
> Rather than casting clk_disable_unprepare to an incompatible function
> type provide a trivial wrapper with the correct signature for the
> use-case.
> 
> Reported by clang-16 with W=1:
> 
>  drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c:276:6: error: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Werror,-Wcast-function-type-strict]
>                                         (void(*)(void *))clk_disable_unprepare,
>                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> No functional change intended.
> Compile tested only.
> 
> [...]

Here is the summary with links:
  - [net-next] net: stmmac: dwmac-meson8b: Avoid cast to incompatible function type
    https://git.kernel.org/netdev/net-next/c/43bb6100d8d5

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

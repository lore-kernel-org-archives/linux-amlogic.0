Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F896C7EE22
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 May 2023 03:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Su75tkwpV1kCLXUXYHdm136WgorR4fi0ioYGjiAc0U=; b=KoOF6udI3nVnwf
	XtwGIiPjwaAL5IDwT08DgoOyZxNOL3XmCM3DVJoH+4q503HSpnTKmO05J0PAIQDxymx1PtsKza2pN
	jUmBMRmPRaACO9EMDTr9kFiI695/9T4kF0vDtxGyPhAxRVOy0eW+AmDZGIqZ4BLl3OkqiCdY4nPlj
	z1ECKBhHgTlFX0G0hJbEVTlyEXYCVF54xM0QE2fm1XaoT9vTe1dsz06kf1eg1MJfcUfUC+kUW6Fv0
	vyfoPdd5buz/bCxq8EquGJFdnbIHPTLpSwFDOa5twu16Pwa/5qFyfBHtph218Ma8o8HdE74NphNf8
	ey0wnghd+Ma/6n6gbzBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwa45-004pAh-1e;
	Wed, 10 May 2023 03:00:29 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwa42-004pAB-1h;
	Wed, 10 May 2023 03:00:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 808DC638FF;
	Wed, 10 May 2023 03:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5C7CC4339B;
	Wed, 10 May 2023 03:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683687624;
	bh=7LO/nm+SvO2zUJm9O7tKkRrwmKO+jJgciV/tuTaQgEI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=RTOVU+VB5lVL3KuGZFTpoKDpYjJRZaFEG2sQHTVRB003U8JjjD5mssizr5+LQvmxS
	 FiRe09LS1LVd1YWnDEJh5qAL8JXede7MYdp/xXZvK/GdzrksCN2HWYx2Yl6T6VU0FJ
	 9JyyJlSaOGUYos/Lyy9six7qob5Gkj21W/akStnMjymLUTb5PyAM8M1Wbf3N951mzV
	 Eg6NfnYrqIYGWQtpMzg4W3Sk8GzvYYx+hlaSlCIHcLFyllWUB3ydom5VLPkfJdMfc6
	 YNs6Y4Xid5qDf/PpW1q5ZniGiemNLv2Btm+78JH6TJxiVI7ORNqyekAAsAcCAtY5+p
	 +unEdK3RS/REg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 8C0E5C39562;
	Wed, 10 May 2023 03:00:24 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 00/11] net: stmmac: Convert to platform remove
 callback returning void
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168368762456.27124.17176817660933091864.git-patchwork-notify@kernel.org>
Date: Wed, 10 May 2023 03:00:24 +0000
References: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230508142637.1449363-1-u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
Cc: peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, vz@mleia.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, vkoul@kernel.org,
 kernel@esmil.dk, samin.guo@starfivetech.com, wens@csie.org,
 jernej.skrabec@gmail.com, samuel@sholland.org,
 nobuhiro1.iwamatsu@toshiba.co.jp, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, jonathanh@nvidia.com, festevam@gmail.com,
 linux-imx@nxp.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 bhupesh.sharma@linaro.org, angelogioacchino.delregno@collabora.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-sunxi@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_200026_674613_A5B378B2 
X-CRM114-Status: UNSURE (   9.57  )
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

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon,  8 May 2023 16:26:26 +0200 you wrote:
> Hello,
> 
> (implicit) v1 of this series is available at
> https://lore.kernel.org/netdev/20230402143025.2524443-1-u.kleine-koenig@pengutronix.de
> .
> 
> Changes since then:
> 
> [...]

Here is the summary with links:
  - [net-next,v2,01/11] net: stmmac: Make stmmac_pltfr_remove() return void
    https://git.kernel.org/netdev/net-next/c/3246627f11c5
  - [net-next,v2,02/11] net: stmmac: dwmac-visconti: Make visconti_eth_clock_remove() return void
    https://git.kernel.org/netdev/net-next/c/b9bc44fe068d
  - [net-next,v2,03/11] net: stmmac: dwmac-qcom-ethqos: Drop an if with an always false condition
    https://git.kernel.org/netdev/net-next/c/c5f3ffe35cc9
  - [net-next,v2,04/11] net: stmmac: dwmac-visconti: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/f4d05c419761
  - [net-next,v2,05/11] net: stmmac: dwmac-dwc-qos-eth: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/360cd89064b6
  - [net-next,v2,06/11] net: stmmac: dwmac-qcom-ethqos: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/5580b559a80a
  - [net-next,v2,07/11] net: stmmac: dwmac-rk: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/903cc461c901
  - [net-next,v2,08/11] net: stmmac: dwmac-sti: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/b394982a10d9
  - [net-next,v2,09/11] net: stmmac: dwmac-stm32: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/fec3f552140e
  - [net-next,v2,10/11] net: stmmac: dwmac-sun8i: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/cc708d4ed7b3
  - [net-next,v2,11/11] net: stmmac: dwmac-tegra: Convert to platform remove callback returning void
    https://git.kernel.org/netdev/net-next/c/a86f8601c8f0

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

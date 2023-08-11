Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4605C001DE
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Aug 2023 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M9N5Mwd3/nTaLaeHvHZf/fLd+uQdmBGTW3T25haHj9Y=; b=Ka9tBpyaxIEzTN
	0XHicQSkqSxEiBJuYSIlabRPp7PwN2TfBsV8Vj4xa4/CgzOa+vdga4G08tFwh1T2UZPEM2aOAhNdk
	NGpz/2Y0ril6nVDv0r67G2+yYRFpNEfGgQkH81KlfKaAmfen0RB4vHleoz+iXHG3t+oygUFYcgJod
	rhJfAq5dITsk8CWUxVvQvGry4IBJ2lgweTZYNK7DALADlvghCw12NniLhxEnYKyjLs3eK0S3rpEFe
	zolAnnG0spUac24Bw4vaulYz/x9/7YNjfwm+ks3zeW0BLcPtSJ5vnO/qzQan/rSaJZ2e5eNivKC7j
	cNdpHfcdJXM5bzdpPXug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUG2s-008z5O-0g;
	Fri, 11 Aug 2023 00:30:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUG2p-008z4s-21;
	Fri, 11 Aug 2023 00:30:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9BE9964DCB;
	Fri, 11 Aug 2023 00:30:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 001F6C433CA;
	Fri, 11 Aug 2023 00:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691713822;
	bh=VTdqDcF8RsP1Tx5iHwaXGP1sG1BJp3vTg2yHLtubAGY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=c1cvUsLVvbNOxrcxKegdBTWgRa317/WWR1Oi1n6cAFjOaCcxZsBiY53OcJg1fS7Ev
	 G89XIHnIu8dqylZvu+OMJMiBDLSZ4Rt7losPpISfhl3+FG02roRQxO9UCWBiKBOi7A
	 fs3ku7qcm6EWDUA4kU/beALERnma4vRJb3x/bB1oztNxINbjIXS/IiRtzJGXVj1gXY
	 YF7+XOdu/pbCTHWoV6Cm7VAkb87fSc0QPrkCdzQ4itEgwZzfsyQKTF0vOQpKCba7Ie
	 dStQ0fBtVtYEhiK6Q4diHYrkE9LtkSbtCIQs/yQnGO3Od3b0l4WKqlK8ZLnvDWcnkY
	 m6dFswKw9/Q9g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D498FC595D0;
	Fri, 11 Aug 2023 00:30:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 net-next 0/2] update stmmac fix_mac_speed
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <169171382186.19672.4297213896256628885.git-patchwork-notify@kernel.org>
Date: Fri, 11 Aug 2023 00:30:21 +0000
References: <20230807160716.259072-1-shenwei.wang@nxp.com>
In-Reply-To: <20230807160716.259072-1-shenwei.wang@nxp.com>
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: mkl@pengutronix.de, linux@armlinux.org.uk, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 neil.armstrong@linaro.org, khilman@baylibre.com, vkoul@kernel.org,
 wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 bhupesh.sharma@linaro.org, nobuhiro1.iwamatsu@toshiba.co.jp,
 simon.horman@corigine.com, ahalaney@redhat.com,
 bartosz.golaszewski@linaro.org, veekhee@apple.com, ruppala@nvidia.com,
 jh@henneberg-systemdesign.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_173023_703821_28FDDA22 
X-CRM114-Status: GOOD (  10.62  )
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

On Mon,  7 Aug 2023 11:07:14 -0500 you wrote:
> Changes in V5:
>   - fixed the typo in if condition reported by Russell.
>   - fixed the build errors in dwmac-sti.c reported by 'kernel test robot'.
> 
> Changes in V4:
>   - Keep the 'unsigned int' type specifier in the fix_mac_speed
>     function declarations.
>   - Move imx93_dwmac_fix_mac_speed into the SoC specific ops.
>   - Use a read back to replace the wmb() instruction.
>   - Correct the target to 'net-next'.
> 
> [...]

Here is the summary with links:
  - [v5,net-next,1/2] net: stmmac: add new mode parameter for fix_mac_speed
    https://git.kernel.org/netdev/net-next/c/1fc04a0b9733
  - [v5,net-next,2/2] net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
    https://git.kernel.org/netdev/net-next/c/4fa6c976158b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

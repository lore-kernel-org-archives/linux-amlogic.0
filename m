Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57A1D606A325
	for <linux-amlogic@archiver.kernel.org>; Fri, 20 Nov 2026 03:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FwZNHHWV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A+NYSCYz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gxAIv6f17u4zzdJBscuns1vPmfrmCNOtUH73bhNLruo=; b=FwZNHHWVvRo8SM2G3fg+ujygT1
	gOpOgDzNcdplv+Ie8A9UknoY77OH5rdcXIlAkc9siyU4jjoGoqI2A0Wo7+VCAUO0yYDDsC8v3xr+w
	YPXpd6NOi2PfidOcLfFmK5g3tQ6Ow2xOtCZdsr1U3HbWEN6vTdzXiKMx15ayP+v4kcwvPWBKLk9yl
	heC3EfoZfuE/C5VSJeAuiOIH+K2LhNjLf3AzYqu/bATiWZ4jRWvBOP0QQWWhrFIl0fBMDa9GRbCNO
	MWlf+pm62HZEcF8I7TmRT8ry6tnVRUytf9QO0CYzYo7fxVal8G4GMzd1xw8wv0DsB0/FAw8T8Gdvd
	FBzeCtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF0t-0000000DvdX-0Vcm;
	Fri, 20 Nov 2026 03:10:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUF0r-0000000DvdO-0ybw;
	Fri, 20 Nov 2026 03:10:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E097943701;
	Fri, 20 Nov 2026 03:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BED4A1F000C6;
	Fri, 20 Nov 2026 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795144207;
	bh=ukKJgUBAL20jCzTZgargorWA+q45FyRreSUu86drbqA=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=A+NYSCYzxpFujYYuRndjloCnPVEaFUrzzOY+sPGtiCaNkfQMZL4RW5J7zlE8h/8Wo
	 YY2xfK2Nb8RE03jG/M5FkNbQJvhGsim0HM9jwxdEBopzfjMVPVwXpN0HsNkY45YHQV
	 2Wx7Jk9oJCdPhX9itaSw308WYP2UNknHUdN6B1SWOfuEd/mJZRitPCNPCFJGKRhQdX
	 KNW7JzubPKk7mchgpWFRM39CBp/YbZbhUts7n4OFI84ZZB0JDiJCVwh0U5s4H0eDPd
	 1qrYVdUZipHul8Q9zaGp331aIvvPOaULtLIa1hKKyaNtl4zbQBL8+d5ebVDrJRCw0l
	 8QrB0Oa3WimGQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B44333808209;
	Fri, 20 Nov 2026 03:10:07 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v7 0/7] Add ethernet support for the Amlogic T7
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179514420653.3998775.15150461070796128263.git-patchwork-notify@kernel.org>
Date: Fri, 20 Nov 2026 03:10:06 +0000
References: <20261113121852.334604-1-tanure@linux.com>
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 13 Nov 2026 12:18:45 +0000 you wrote:
> The T7 has the same ethernet glue as the G12A. This adds the binding,
> the driver support and the device tree nodes, and enables the port on
> the Khadas VIM4.
> 
> Two clocks are new. The pipeline stage between the controller and the
> DRAM has its own gate, which nothing else claims. The glue registers
> sit in a block gated by sys_ethphy, so far claimed only by the MDIO
> mux, which probes after the glue is programmed: every write to
> PRG_ETH0/1 was lost. The T7 node lists that clock as "pclk".
> 
> [...]

Here is the summary with links:
  - [v7,1/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
    https://git.kernel.org/netdev/net-next/c/2297f88ce0b8
  - [v7,2/7] dt-bindings: net: add amlogic,t7-dwmac
    https://git.kernel.org/netdev/net-next/c/18029931478b
  - [v7,3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
    https://git.kernel.org/netdev/net-next/c/c4c851a3325e
  - [v7,4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
    https://git.kernel.org/netdev/net-next/c/4fdc7da7e13d
  - [v7,5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
    (no matching commit)
  - [v7,6/7] arm64: dts: amlogic: t7: add the ethernet controller
    (no matching commit)
  - [v7,7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

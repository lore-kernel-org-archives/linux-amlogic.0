Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F131C38142
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 05:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1WwkpvQLz63J9b/5jFYq6EwUm7I1WrMGaQpDE8HMXAk=; b=1yKH/L0qIGuTjA
	gJ5W/5aAI40pDSa0df0ZBjlnO+P3tYEdIEC8PMXVvzUVJNUG8n89tbonaFS+2+IWqfdwSsSwMHhW8
	WOjxSs9Rz/hijvHfg9HLqX0yrH3o453f7dRkGsurZTImwTD2A6GiDPuHc3gHyVvnrQKcPRc1BWU1L
	jhDV4Ca6C5t+0GqBosYEMkCwgw3I3nMBGkGlsDg4O2PynEUhmfBRqw7SKNV8pxrAGzodsb78+L4YE
	N1m3GSiS2JKlXeFwnKqvw0fCe/r9IV1ZbSxGSxWptKAjgx3ooWbqHCA8wplaX4uIRsoVDYrdoN2cO
	WB2pEX2Uc51+GTvI+C9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5O5-00AGiU-EJ; Wed, 01 Feb 2023 05:10:25 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN5O2-00AGhp-La
	for linux-amlogic@lists.infradead.org; Wed, 01 Feb 2023 05:10:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2BE39B8205E;
	Wed,  1 Feb 2023 05:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFA43C4339B;
	Wed,  1 Feb 2023 05:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675228219;
	bh=/NjIkaljrd3Egap7rXJKp0TJO/lsHoW6pjZpsK9ELA8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Eqhtt4prr3LI7abi3PZIw/8+neQOiGGO3grYXPi7pmiV//qqpJcMEBaWSKYcUDpQg
	 VRkr2DD5+MgIBp4GwxXXEN9zSZNX72GjYLW8Sp1iY2EFj150iRKFGzlCtrwKlmVMJk
	 CRUQcLfRXc15nlX3+oDqEV35sMBIjAYvpuypKNa5D9Dax6okU6r6Xr3Pm+sqxlyJoG
	 uvRhKGEnL/cgjIzpog8Jpqlv1jSlD4MrNPm0FgnRP5B6dZn8OKT7mXjWIFsocEPSnX
	 usLAj0fHx4m6e6fD01sCuilXobzscsDjEscho0PEs5ymZ56OVskepvi3+ir/ld9CBm
	 WOCpm6PvUJGkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CA72FE21EEC;
	Wed,  1 Feb 2023 05:10:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 net-next 0/2] net: mdio: add amlogic gxl mdio mux support
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167522821982.27789.12071351228778814707.git-patchwork-notify@kernel.org>
Date: Wed, 01 Feb 2023 05:10:19 +0000
References: <20230130151616.375168-1-jbrunet@baylibre.com>
In-Reply-To: <20230130151616.375168-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com,
 neil.armstrong@linaro.org, da@lessconfused.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_211022_866650_8688901F 
X-CRM114-Status: GOOD (  11.34  )
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

This series was applied to netdev/net-next.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 30 Jan 2023 16:16:14 +0100 you wrote:
> Add support for the MDIO multiplexer found in the Amlogic GXL SoC family.
> This multiplexer allows to choose between the external (SoC pins) MDIO bus,
> or the internal one leading to the integrated 10/100M PHY.
> 
> This multiplexer has been handled with the mdio-mux-mmioreg generic driver
> so far. When it was added, it was thought the logic was handled by a
> single register.
> 
> [...]

Here is the summary with links:
  - [v2,net-next,1/2] dt-bindings: net: add amlogic gxl mdio multiplexer
    https://git.kernel.org/netdev/net-next/c/cc732d235126
  - [v2,net-next,2/2] net: mdio: add amlogic gxl mdio mux support
    https://git.kernel.org/netdev/net-next/c/9a24e1ff4326

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

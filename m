Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7939AC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat,  5 Mar 2022 05:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LtiaWL2aZOgN+sEXePmuD2Y58gAB6nwjIy/EIYsojEE=; b=LFrTdMeSPhbl+O
	qcw/jg1LSVywIXbngeR60Vahbn1r9JTwBY8IvFtM7nYtrY712jS0Dak/MjWvqXDhJjbEQDSzCYrU2
	0qM/+K7eqiXYG11/nGNfaVZoLuF9ycN+d7xncWTOIId369RUQMkaNPWTS9H/YRJXEvUYZZTzjf11W
	iQXZsZDTH0+f1QTO7uTQfrZJRVF3MBOmh3It4qm5h76Xvx385T/F3qMapMUgzgTx/bNjWm/peWCK3
	bhmwPwMF/zW4DZrTbjcN594v1HX0XjP5rKLgyubnrvt9S+0dgNiEbr4eU7mraZ4IXHO/XlmZKcf5m
	str/zLcspQZWwbO7dhHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQMq6-00CmNG-AL; Sat, 05 Mar 2022 05:20:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQMpz-00CmKw-0n; Sat, 05 Mar 2022 05:20:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8F0E1B8015B;
 Sat,  5 Mar 2022 05:20:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38C19C340EE;
 Sat,  5 Mar 2022 05:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646457612;
 bh=+TASiKADxHjFKy0cAGlR9FVBWi06G1UcgDaT1qJtd+g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=GJNQ9jmeuLR9U0fPWXOZs7S/0k6TYEn2DZsS2eFnGRpYgb7+SsnWCKgb7HmhGEJrH
 q+diqk/HYt5s5CeLCCd6zNSyx//xmsyr/OqAmaVc2Ai29QlvX9qxSHPu9dWfv/V+/S
 GJgxVZeOgcl/4INR16egXbdoYE8chxVOuD4AeRlJ8ligebDWyNg6CqZvIsJ1rxN7iR
 /+w3UYN3TsMZ1/Jb7qlDhOfqGEEjYxDgiWqYDljr9x/d+BmnBZWS4cDsEpEs2aYQr5
 qW0/Q+I+CXO1JrnpUEro1KL9eTJEE3M5iWbRXefK5/cyifchU4DnK1MZlRjfBPJXKD
 CUjzhQ0upYXMQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 1A880F0383A; Sat,  5 Mar 2022 05:20:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net] net: phy: meson-gxl: fix interrupt handling in forced
 mode
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164645761210.14498.11372584157805822100.git-patchwork-notify@kernel.org>
Date: Sat, 05 Mar 2022 05:20:12 +0000
References: <04cac530-ea1b-850e-6cfa-144a55c4d75d@gmail.com>
In-Reply-To: <04cac530-ea1b-850e-6cfa-144a55c4d75d@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew@lunn.ch, linux@armlinux.org.uk, davem@davemloft.net,
 kuba@kernel.org, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_212019_933853_F332861E 
X-CRM114-Status: GOOD (  11.81  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 3 Mar 2022 08:54:15 +0100 you wrote:
> This PHY doesn't support a link-up interrupt source. If aneg is enabled
> we use the "aneg complete" interrupt for this purpose, but if aneg is
> disabled link-up isn't signaled currently.
> According to a vendor driver there's an additional "energy detect"
> interrupt source that can be used to signal link-up if aneg is disabled.
> We can safely ignore this interrupt source if aneg is enabled.
> 
> [...]

Here is the summary with links:
  - [net] net: phy: meson-gxl: fix interrupt handling in forced mode
    https://git.kernel.org/netdev/net/c/a502a8f04097

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

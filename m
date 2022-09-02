Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02D27C6FA81
	for <linux-amlogic@archiver.kernel.org>; Fri,  2 Sep 2022 04:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R364KVs9y6aKA3IEFfsX2rKsXMp44AyxzyfVLvKrewc=; b=HI+Tj+cMmd1uQq
	adhVXoJitf2SBJIiFEBvLMU2uIWlNa7g4GLprMlE7jSNO8yjiOcDHG+7ut2WBuUEOtgVJlg/VOTNk
	ZjKqycfkvAtEThUr1l7nD06aSY70EJ6hOrHrFEX5Xm5GHDFV+KWtTe8S3FBx8rEhdzmfqJQbWGWu5
	85FwyBMfqM49zs+ZrlAZJZMwqOiYI7raLvUa60LlUJ0iJOUUa4yFx1D7F7n9yKGp5KOuqUG7iSoYp
	fuBCJciWbuhF1PoGBAtbqoS95IP2xiv95NEYJ+XX0aCoFvdAvp+wL5xyr+3ende4kmgwuyX+PTX4+
	4SV4EDHMIGw2gfk4/9fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTy0c-0001us-Rb; Fri, 02 Sep 2022 04:10:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTy0Z-0001rr-Sz; Fri, 02 Sep 2022 04:10:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2AA68B829B5;
	Fri,  2 Sep 2022 04:10:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B5ED8C433B5;
	Fri,  2 Sep 2022 04:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662091814;
	bh=X6Sh1GLGzcjf5HWKApYGwzk9soYOj7EmNjdAbMqcZPY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p4w5aRnBPArvF0i9Fm9aCMxhFms+bGwwIpLDaCO2TardEyK0pQQEjKHr6ixmHwLZM
	 hSiwXq8SbwJVEGT2SAXUwdyS4Yzz8b+UhUn32cWdHmT02jud0Lc+44pcyfQiXW5wTb
	 bK2LcW+1ZzRbkB7SgG6xsTL4lNV7cTKWlofdK8kuK/nHWpL60dnzJp6qlYZkMBZB5C
	 a/g1dt5M4s3lbTB4qWAnOYPBft9dshGEeUgXHV9ScjitRYbYKhUbwJ85X337/ek/3x
	 xzaeSFamgkaFmntJCYCtwKYxNJfAT8YAkJFyxlB4+bMeIkN9DybROQ4Av3ibA9lUXz
	 bSDCA81gfD8MQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 977CEE924D6;
	Fri,  2 Sep 2022 04:10:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net] Revert "net: phy: meson-gxl: improve link-up behavior"
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <166209181460.19149.17976066584717562078.git-patchwork-notify@kernel.org>
Date: Fri, 02 Sep 2022 04:10:14 +0000
References: <8deeeddc-6b71-129b-1918-495a12dc11e3@gmail.com>
In-Reply-To: <8deeeddc-6b71-129b-1918-495a12dc11e3@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, andrew@lunn.ch, linux@armlinux.org.uk,
 narmstrong@baylibre.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_211020_102941_6E6A11BD 
X-CRM114-Status: GOOD (  11.84  )
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

On Wed, 31 Aug 2022 21:20:49 +0200 you wrote:
> This reverts commit 2c87c6f9fbddc5b84d67b2fa3f432fcac6d99d93.
> Meanwhile it turned out that the following commit is the proper
> workaround for the issue that 2c87c6f9fbdd tries to address.
> a3a57bf07de2 ("net: stmmac: work around sporadic tx issue on link-up")
> It's nor clear why the to be reverted commit helped for one user,
> for others it didn't make a difference.
> 
> [...]

Here is the summary with links:
  - [net] Revert "net: phy: meson-gxl: improve link-up behavior"
    https://git.kernel.org/netdev/net/c/7fdc77665f3d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

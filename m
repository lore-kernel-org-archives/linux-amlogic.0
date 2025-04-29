Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8C3C3ABA5
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Apr 2025 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sib0WuSnqdN0BoZm5DnxyRdNTlDuXJztBaaLX9W9LsI=; b=tzcOFLlER+5X2z
	lByg5SMkjcIA3ASnmMYry1ztDhEPBzPUNxmLt+8WGf32QyrWWvFzPxIk4Pg8T0Vvy0o/arihwmM8J
	mM9om/LrogIIV0DsiIghnG+J9k6tjv3fZMvZmLlT5HNQIs0R5Bk2amwrS6Sq3qsAe3bUxgrPFrDQo
	v51HCAHy7G7TEXdCYMVTsvg9iHFMCjBvT6hr26Zps0LCeKI26K18QSl3cLXdC5ZpzFRwlc1h7D5+5
	8jK4scFyu6D1E/hmpEZMJ10tr64RleEZH/+3x7hQGGtfXmZ0uTF7my/KaHZafrrPYVtEQVbPJNRB1
	FxYSm9Na8UrPtCGKkAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qL3-0000000AdBL-1cUs;
	Tue, 29 Apr 2025 19:09:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9qL2-0000000AdAq-14FH;
	Tue, 29 Apr 2025 19:09:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 252E568469;
	Tue, 29 Apr 2025 19:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C66BC4CEE3;
	Tue, 29 Apr 2025 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745953791;
	bh=Fj8Qwh7Oglt89U7CUjfhi1ViJF/tP8Mruv6gVmeBzPg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=lryuYrrmUsoDN64rRhIQZsAD/VNGrOdczSxzGkxhMeKAlUiAGK8QTadyyTpuXb/TV
	 tfHZpwOJEobn/m2qv16SIwL3YLt5dVEkh7eCUBKl0eACtBxTM1KsaYTrTwx81Q7ktA
	 9IpA6PZfZ6LenIINM7J19yOwCyKMQDXiGRUfYOZ8ZKZEufpr0yCBke2XkxMt5omi8I
	 vATm2tXosgQ2gAG2HiRnmitKo/xOPHDCreA9Rtk93suM/W44p626R/NgXbqswfftZC
	 hPu8bV+Wy9dseac/ADH9Q8cFMzjCT7YkGAdtuqg0GAhxZYd6MBvEtbaOiSw+AmMvej
	 xriR+W6ABymlA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 33C623822D4C;
	Tue, 29 Apr 2025 19:10:31 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v3] net: mdio: mux-meson-gxl: set reversed bit when using
 internal phy
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <174595383001.1770515.9085640338016632104.git-patchwork-notify@kernel.org>
Date: Tue, 29 Apr 2025 19:10:30 +0000
References: <20250425192009.1439508-1-da@libre.computer>
In-Reply-To: <20250425192009.1439508-1-da@libre.computer>
To: Da Xue <da@libre.computer>
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
Cc: andrew@lunn.ch, neil.armstrong@linaro.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, linux@armlinux.org.uk, stable@vger.kernel.org, linux-kernel@vger.kernel.org, edumazet@google.com, netdev@vger.kernel.org, jbrunet@baylibre.com, kuba@kernel.org, linux-amlogic@lists.infradead.org, pabeni@redhat.com, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, hkallweit1@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 25 Apr 2025 15:20:09 -0400 you wrote:
> This bit is necessary to receive packets from the internal PHY.
> Without this bit set, no activity occurs on the interface.
> 
> Normally u-boot sets this bit, but if u-boot is compiled without
> net support, the interface will be up but without any activity.
> 
> The vendor SDK sets this bit along with the PHY_ID bits.
> 
> [...]

Here is the summary with links:
  - [v3] net: mdio: mux-meson-gxl: set reversed bit when using internal phy
    https://git.kernel.org/netdev/net/c/b23285e93bef

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA598C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 10 Mar 2022 23:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCVYpqCHRXEdR8XM5KNPPPP7V8roMbrvEzOdS9L6Dlc=; b=YAl+Cj18xAGbgj
	fme9i4PGxGJM8P/nr7l3Rq1xvQNXMxHMZzks2y9M/eKhOaIRJdxORXX/u78p/+S6o9bPrFz+zdjVz
	RpFFovOR8YpVNqUz/eoXebN4Eu9ZTQZJt/rsc32su/eyRGY22he5ok166LsLA2XNud6sftcGXPUge
	KKY6nGeEE3lwndEFhd+faEREhdl7ZDl/VfOMqe9Bhahz/B+6dLiquv7gNcSSzr+Qvxd+j9ZeOCJCe
	+hhTjYvZuDiqWc6779EoEd9fyVbwjKtkj3j3SZEXtGiiBFpAPw5i5pIjjZOD5wwOhNcSp03d8eMmL
	ndgZpgDYQUAY2SOUq3ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSRvM-00EFTU-5Q; Thu, 10 Mar 2022 23:10:24 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSRvI-00EFS4-IL; Thu, 10 Mar 2022 23:10:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1A4BDCE268F;
 Thu, 10 Mar 2022 23:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FF0DC340E9;
 Thu, 10 Mar 2022 23:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646953810;
 bh=1qM945DEoHBJCZkfAmfsJ7HSNwT1lx07N9oZtbr+NAU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=EBFKKoCv4uXexdTmV1a/Tg3Bhspwdbrm8Ni+2QVyJ4v7FcNwbII4mWtOa7apTGpra
 CcTpS2RDWO4BqvAuvTS0dFYHGWeMSvvmJBfmEC0XJhO+x1z95BxTsu2KsmXi8C17FA
 GSkj6cto3WYO60SYdwfFTEKOjfq4kfqnB66Gr9GEVJTIMZDgKCJc2gxMEgaXq/2H+r
 zcTzt5WG0h+pifxaRyivxJCdX/SzpyUYoF0C2vvV7X5AuJWpeF1jSibqCDWaR0xpdL
 KPqa6B02qZArN1l7qPewB+HJpsahM6FMTqeVOof6zgKSCXGoLPhPKN75iD/PVUr+dz
 FHhUSclOxypTQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 42A32E5D087; Thu, 10 Mar 2022 23:10:10 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net] net: phy: meson-gxl: improve link-up behavior
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <164695381026.10760.7389598651371976837.git-patchwork-notify@kernel.org>
Date: Thu, 10 Mar 2022 23:10:10 +0000
References: <e3473452-a1f9-efcf-5fdd-02b6f44c3fcd@gmail.com>
In-Reply-To: <e3473452-a1f9-efcf-5fdd-02b6f44c3fcd@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew@lunn.ch, linux@armlinux.org.uk, kuba@kernel.org,
 davem@davemloft.net, narmstrong@baylibre.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_151020_792263_CDF7BE01 
X-CRM114-Status: GOOD (  11.17  )
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

On Wed, 9 Mar 2022 22:04:47 +0100 you wrote:
> Sometimes the link comes up but no data flows. This patch fixes
> this behavior. It's not clear what's the root cause of the issue.
> 
> According to the tests one other link-up issue remains.
> In very rare cases the link isn't even reported as up.
> 
> Fixes: 84c8f773d2dc ("net: phy: meson-gxl: remove the use of .ack_callback()")
> Tested-by: Erico Nunes <nunes.erico@gmail.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> [...]

Here is the summary with links:
  - [net] net: phy: meson-gxl: improve link-up behavior
    https://git.kernel.org/netdev/net/c/2c87c6f9fbdd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

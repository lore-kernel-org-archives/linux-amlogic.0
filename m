Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C36C636D3
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Feb 2023 04:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyGcigwTchY8XqmDNsgRPBNvwTuG8K5/aLaaF6dEsJY=; b=v8g3I0MzuTXaLC
	Of4Leufe+Y99pBqhD36qapLZPmvxT35j2jvKk4rsGBG/MKtiDpqPQ9Hs6pEJdw0ao9WfWHPQQXVh0
	13P265N9fgm3Feyb9GEPxI1sYDuZcCClQPzqxzAUYRYBraCzsNC0b8Rjj2Jy8Hd6ZBmPzFTKLBtSQ
	qXjn/PAlbMa3n1dEu0AD4fAyUdaJpnqAdWHsuwIovjiq7WfIq4F6ZznhmOWBieJ23pRB9zKV+T/IU
	DAJU56Tk7vFtQpaajoZjlwu6T+ptN1xSWcOMDtIwO4yL+ch83yOW1N2AO11TEPD/9mdSmi0jSZyZh
	w0FA5KnBb7FVOGy2Iwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO9j2-004OGS-Ti; Sat, 04 Feb 2023 04:00:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO9iy-004OFc-0J; Sat, 04 Feb 2023 04:00:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAC6C6204F;
	Sat,  4 Feb 2023 04:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FF2BC433EF;
	Sat,  4 Feb 2023 04:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675483222;
	bh=YdmMhCeHwAMADoMWYg8CsSTrkCSqJAZkVYBjk1kua5s=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=p7g66MZg22TiUwvuTzlUU9GNnYSrf+mQHzPXS45aWsjQSjl6hsqpf3qnQ61soazTW
	 fDGvgY3z17uEDQalv38f/LgBv0JVt+axZevHHrHS61S3Rlq1P1YVOfvlEi8hREaVpZ
	 QA84i4CrKlQPU5CdkjUpe7GZHvpxMwCUocwu+I1yhG1UVetCI0oVh/KuvUhtQsqm7+
	 pkXt478SfRzB090bG/1knNWpTyBLvXaKg3fzNjeRB7R8YEm1hULyiXguPmNcZTO3UI
	 5Q9mD8aDBBoC9etqznzJF2eIYsn79ANVgKC4bbPqI6Rr3sm5jX82nlTsxAt5eotSSw
	 f5ZJfYKyK9vQg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id CB526C0C40E;
	Sat,  4 Feb 2023 04:00:21 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 net] net: phy: meson-gxl: use MMD access dummy stubs for
 GXL, internal PHY
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167548322182.10981.1983902175330966920.git-patchwork-notify@kernel.org>
Date: Sat, 04 Feb 2023 04:00:21 +0000
References: <84432fe4-0be4-bc82-4e5c-557206b40f56@gmail.com>
In-Reply-To: <84432fe4-0be4-bc82-4e5c-557206b40f56@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: andrew@lunn.ch, linux@armlinux.org.uk, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, edumazet@google.com,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 cphealy@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_200024_127201_7222AA3B 
X-CRM114-Status: UNSURE (   9.65  )
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

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Thu, 2 Feb 2023 21:45:36 +0100 you wrote:
> Jerome provided the information that also the GXL internal PHY doesn't
> support MMD register access and EEE. MMD reads return 0xffff, what
> results in e.g. completely wrong ethtool --show-eee output.
> Therefore use the MMD dummy stubs.
> 
> v2:
> - Change Fixes tag to the actually offending commit. As 4.9 is EOL
>   this fix will apply on all stable versions.
> 
> [...]

Here is the summary with links:
  - [v2,net] net: phy: meson-gxl: use MMD access dummy stubs for GXL, internal PHY
    https://git.kernel.org/netdev/net/c/69ff53e4a4c9

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

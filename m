Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7DEC6FD1D
	for <linux-amlogic@archiver.kernel.org>; Wed,  5 Apr 2023 02:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EcI95mShMIopV4NdhiHsbzZlYjOrJczeaXK5ntDj6lM=; b=qqmfLNoeWYdMfy
	ekja0JdHasSBaidTYxjcc9Dl6JWJJaOXNEB4rVh9dI8gP/S3Vpe80Xrp96cjrlq3ANbTwP9ug1QV2
	uvW/tQWG7bARmVTSAdmkQWWpK3bq4r2TarBldhOp5AXMbdcCkw7usquJJPT2TpuErvLbY0wyMEw2s
	Nm6R549OG9X9T0jVAvI5YVXQEjYjoKC57ZKb67mbWx0K5zLqml2BximqvT/i9v/jcFPjlvLAjraqM
	FEv19hNvkp9eHVOm5CwHbWW6ansM9IG44I7VLk/wDKU636rZOU0WsduIWfnQWj1mYwMq4rmzTK1bM
	eacWGv6aKzuNjs0lZYQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjsRk-0038YQ-1V;
	Wed, 05 Apr 2023 02:00:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjsRh-0038Y0-36;
	Wed, 05 Apr 2023 02:00:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6E9663AE8;
	Wed,  5 Apr 2023 02:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 926A1C433AC;
	Wed,  5 Apr 2023 02:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680660019;
	bh=RK9bt7Z5bMks1Ua7ZnIYZG6hlsr1VoZDBPGx7qNfVO8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=usX8yZddPiDACzpGQuAt74Zpa2bO10kZk+Ix9cdcnt+QVXVocQG8fu34Qg+b/M3Dv
	 Irj35zXk78Jm7Ne7D/oOv31wVpfBF7mtfTOMi6wDMgBQkz2WHXFi34m8vIiFRitsBp
	 gdE9g7QRtwUrKiDNYMRj4W52uNnQR+TbDoT4GCpJ9t3VsZRUVOxQdT+rJhWUwDwUwL
	 zNzSamTwDxvG5nx1pfy5WAsPlwHOd6XTdNrfRYpKIMZe1aK0fgzU+kG8hihbNrxm4T
	 mx0jmTqCCrJtZCIqsuT+oWHxvLxUcuyS6gLfz9Or6AqANdNYo+eOk4rWExII33mjN0
	 Mc3yEeI8Eu6tA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6F883E524E4;
	Wed,  5 Apr 2023 02:00:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: phy: meson-gxl: enable edpd tunable support for
 G12A internal PHY
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <168066001945.10193.5507736918462128877.git-patchwork-notify@kernel.org>
Date: Wed, 05 Apr 2023 02:00:19 +0000
References: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
In-Reply-To: <8d309575-067c-7321-33cf-6ffac11f7c8d@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, pabeni@redhat.com,
 edumazet@google.com, andrew@lunn.ch, linux@armlinux.org.uk,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 jbrunet@baylibre.com, neil.armstrong@linaro.org, cphealy@gmail.com,
 netdev@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_190022_042343_3C5ED7AE 
X-CRM114-Status: GOOD (  10.60  )
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

On Mon, 3 Apr 2023 21:35:46 +0200 you wrote:
> Enable EDPD PHY tunable support for the G12A internal PHY, reusing the
> recently added tunable support in the smsc driver.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/net/phy/meson-gxl.c | 4 ++++
>  1 file changed, 4 insertions(+)

Here is the summary with links:
  - [net-next] net: phy: meson-gxl: enable edpd tunable support for G12A internal PHY
    https://git.kernel.org/netdev/net-next/c/992e76908e92

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

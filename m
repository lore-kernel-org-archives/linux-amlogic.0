Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA825C6FD1D
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Mar 2023 10:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbey5+gbl0CW2mVKm3hU2wVytM7Iy51BK6HMw+GIo94=; b=bZswPtaqRW1unf
	KPyrLbT9IGL0KXitIB5vKqFKAn5swC7xDKHcTv0vH/g1tjYWzpfjsCBGvhdBJZFwvq9seB1lBlAKE
	9BkUINHADMnVLWozBEbrdUjz7ysCnTjroGKJiizjPHC3noGchzv3bO6JSbHzOQuQUhx+8wJ/jKo1W
	S32a0mqVLoL+KUODo9Vpli9x+CwcypgKVIB8n9Us/9X1pBq64QJTqFWczEPwJruczwMe5sDilukT4
	F6+WDcUM4yuDGRQns5bkynKwt7mHrnHfoL6N5oVduiTmk2d9Gy8QIq1mY4xEbW73lHZ1hUmEFpejp
	cXXMA85SavXk7TgpggZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peCmg-008cxo-31;
	Mon, 20 Mar 2023 10:30:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peCme-008ctC-12;
	Mon, 20 Mar 2023 10:30:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9964561362;
	Mon, 20 Mar 2023 10:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60881C433D2;
	Mon, 20 Mar 2023 10:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679308219;
	bh=rXuSKwVwxX8rt7Sqws0Z+AcbgMjTP+lu21XR3bzS4Mo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BGrZzpodkdWz3pEVV71RiWhM1hhb8kEixc3CpWkxdgROOzfTHmeM277lNs6xl5jlw
	 m8h8yizg8/NDMkWsiylK5HJTJpfV80MbZAjWdSSla4IPyjGI3IltuNUjlXn8XEY2J9
	 MntGP7XiB/HGvrTL4909168OfwLMGBlrKO4+GXO27YlJPMcsI9K5WX3RqyTxx/8HTc
	 8uSKeW7c8xPu5dccJNtAC4JD3qZJS438HLgKaGyvGckwwjdCQeGu+pxHbw3D6lvRi/
	 iCXc/z5QoLefn10XipPhbkDPpo4AkieUxA4GHvADDTLJhmtOLq3ioLn8k/56g1PHPN
	 T8U3ocfIkrN8w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 4B6E8C395F4;
	Mon, 20 Mar 2023 10:30:19 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next 0/2] net: phy: reuse SMSC PHY driver functionality in
 the meson-gxl PHY driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167930821930.19842.15095220443783373763.git-patchwork-notify@kernel.org>
Date: Mon, 20 Mar 2023 10:30:19 +0000
References: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com>
In-Reply-To: <683422c6-c1e1-90b9-59ed-75d0f264f354@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux@armlinux.org.uk, andrew@lunn.ch, neil.armstrong@linaro.org,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, edumazet@google.com, netdev@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 cphealy@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_033032_395648_D613F8D8 
X-CRM114-Status: GOOD (  10.42  )
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
by David S. Miller <davem@davemloft.net>:

On Sat, 18 Mar 2023 21:30:01 +0100 you wrote:
> The Amlogic Meson internal PHY's have the same register layout as
> certain SMSC PHY's (also for non-c22-standard registers). This seems
> to be more than just coincidence. Apparently they also need the same
> workaround for EDPD mode (energy detect power down). Therefore let's
> reuse SMSC PHY driver functionality in the meson-gxl PHY driver.
> 
> Heiner Kallweit (2):
>   net: phy: smsc: export functions for use by meson-gxl PHY driver
>   net: phy: meson-gxl: reuse functionality of the SMSC PHY driver
> 
> [...]

Here is the summary with links:
  - [net-next,1/2] net: phy: smsc: export functions for use by meson-gxl PHY driver
    https://git.kernel.org/netdev/net-next/c/a69e332b4ef9
  - [net-next,2/2] net: phy: meson-gxl: reuse functionality of the SMSC PHY driver
    https://git.kernel.org/netdev/net-next/c/be66fcc16ce6

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

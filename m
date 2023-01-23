Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8537C38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tDdSpRpoxz8zQqB1gUR/ilaGWE4NYSKKbbyQZKgUjjY=; b=FLjk+jGBVncIwY
	RlGpmNaCIUJSjKffKvRaGCEIDeP/XGg/eaxhIf/YUKrlCRp0v2FlgJu0+nMajNMS8bdVDOIXfFegA
	BbjuvUHsdg5X+axFVAIPGFx8I2/nQBPeN6Kg6IvhBnEyRovgrQuePs2D4557ZhkhP8ZU79fbN4ChL
	C3DXmDtwisCaW6FAYZReIquQiijW/eyFJm2g44KQw6E4t8KyTnoGszB6XIAsMCBKV9tsv0sWsxqWX
	w3PXfyd8m+x0zvRAlPdLOp7d1aKYlU+oqTrtnmXzURg3Oo3ywzExeHu6bZIFQg5iuvWnC9P+ek73B
	Hom/mCtNuSxzRY9cwS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJy9z-00029f-T9; Mon, 23 Jan 2023 14:51:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJy9w-00028r-D3; Mon, 23 Jan 2023 14:50:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A2258CE131A;
	Mon, 23 Jan 2023 14:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5288C4339B;
	Mon, 23 Jan 2023 14:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674485451;
	bh=GDFlJBCp4R7wNXZzSusORkrCJogcFMOl2Bv5yVHKGN8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IOg60Obh5vfEpEeOc6WJfV3YVdsqgOcPQq6tpOfT4y+vsQswk3XQ53WMqv6YFj1W8
	 1rmRswK8ToMLfgPzVRw9StksPVup68+fQjl7mlDQN7A7F/Da8ROxsloABvoFlH9Mdy
	 e261ZbsDJEgwJPdGbrtWqHnnXcnPtdotr5wc4tHSnFjUwThl2LImXIzsXwMahZcezA
	 s3vzcRkWfvXcapp0i8LLCp4VTAIQaNZNZo4DKiJvfGaU4693NOgv0v3bioZJny0nhb
	 l0W7FqzyKlgM8nXfVGVr3bfX5LqV3dgvpjBgsfIFHuwpa0UHKiRnVVXLMT/fbqnz5x
	 sfUKYvPLNtlaA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B71C5C395CA;
	Mon, 23 Jan 2023 14:50:51 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: mdio: mux-meson-g12a: use devm_clk_get_enabled
 to simplify the code
From: patchwork-bot+netdevbpf@kernel.org
Message-Id:  <167448545174.25704.8698383130212261654.git-patchwork-notify@kernel.org>
Date: Mon, 23 Jan 2023 14:50:51 +0000
References: <84871cc7-2f96-7252-768f-5f869208045b@gmail.com>
In-Reply-To: <84871cc7-2f96-7252-768f-5f869208045b@gmail.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: neil.armstrong@linaro.org, andrew@lunn.ch, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 khilman@baylibre.com, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_065056_667608_93955763 
X-CRM114-Status: GOOD (  10.86  )
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

This patch was applied to netdev/net-next.git (master)
by David S. Miller <davem@davemloft.net>:

On Thu, 19 Jan 2023 23:56:37 +0100 you wrote:
> Use devm_clk_get_enabled() to simplify the code.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/net/mdio/mdio-mux-meson-g12a.c | 27 ++++++--------------------
>  1 file changed, 6 insertions(+), 21 deletions(-)

Here is the summary with links:
  - [net-next] net: mdio: mux-meson-g12a: use devm_clk_get_enabled to simplify the code
    https://git.kernel.org/netdev/net-next/c/32e54254bab8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=Rg5T=F3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECBA8C433DB
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 02:50:16 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA32022955
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Dec 2020 02:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA32022955
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5egcXdNMHlGtBtCRAh+4tKgCtmMawIs63+Qmrm7b2SM=; b=fxlN8UJVHia7CTDmtzZ9yVk/e
	ELsxmnJC5hhglEivYAz8TcBoKnaHejaDsPV/x7kQDnT/A4bbngUNicT7ztvfGK8TBY30KlqnyqLw5
	HgAXdlztbCS499sUkK2KAMwOSUccqJNOhck4bpCONWZfN+sWBCNxTq/6u6MaDrntHWoJ7pbzu/nne
	KGWTgbKi6A0T/q2p8JsghReEhDWn/S4e+S4EhEo93fR7mdG1rkp5XozZVNXCsIb/JJOUQziJLRtz3
	bJ5OmDOB7yEaaFsDtTTej6K9M2nWdbL2BALf/0J5E3Bl2ffLiv7HNpTX3219bxK/otLYM3VFQYa7v
	1vx1sUQ0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kruE7-0004zA-1B; Wed, 23 Dec 2020 02:50:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kruE4-0004y9-Md; Wed, 23 Dec 2020 02:50:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F959225AB;
 Wed, 23 Dec 2020 02:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608691807;
 bh=8qn6oO4m18MYx8BZVHIur5nTRJHrKGVkSGxnlj5DQUY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=elD3VaoiwBpVozYCRaItCmshf+dgCOFoU114tkYu/7NBcju+CbBc11kLw3jIU31W2
 ue6xSHqImxW7L5npMacpPKvCyK4jKzhyIoFqiKQJWfc9vDX1QjPBbOwtNTuORnoT8D
 Q3GtJmRm+eHpIJnzYFhn0AxIxclEg9bjm80dGYQbh8PkmwbNpAWhVe4Vn3Jy5qAIl5
 pkmTlW5jz6OCtJy7/lDB3xBAt8ta/qCyJjIX+8v08YDmfVjDhp6iWt4SaM9PPi19nt
 AtbkVSrp5QJltF2p9l3Bvta6TYTJbW36Kgm3jCYPPDnh40OLo3q322aK1h8hQah/SV
 eougoqBzMXSGw==
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: ignore the second clock input
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <160869180719.29227.9509776224388013090.git-patchwork-notify@kernel.org>
Date: Wed, 23 Dec 2020 02:50:07 +0000
References: <20201219135036.3216017-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20201219135036.3216017-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_215008_814596_DC749571 
X-CRM114-Status: UNSURE (   9.36  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: thomas.graichen@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com, kuba@kernel.org,
 linux-amlogic@lists.infradead.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Sat, 19 Dec 2020 14:50:36 +0100 you wrote:
> The dwmac glue registers on Amlogic Meson8b and newer SoCs has two clock
> inputs:
> - Meson8b and Meson8m2: MPLL2 and MPLL2 (the same parent is wired to
>   both inputs)
> - GXBB, GXL, GXM, AXG, G12A, G12B, SM1: FCLK_DIV2 and MPLL2
> 
> All known vendor kernels and u-boots are using the first input only. We
> let the common clock framework automatically choose the "right" parent.
> For some boards this causes a problem though, specificially with G12A and
> newer SoCs. The clock input is used for generating the 125MHz RGMII TX
> clock. For the two input clocks this means on G12A:
> - FCLK_DIV2: 999999985Hz / 8 = 124999998.125Hz
> - MPLL2: 499999993Hz / 4 = 124999998.25Hz
> 
> [...]

Here is the summary with links:
  - net: stmmac: dwmac-meson8b: ignore the second clock input
    https://git.kernel.org/netdev/net/c/f87777a3c30c

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

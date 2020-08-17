Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D70C433DF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D3E72067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ps/irkbF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1vJyRmnJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D3E72067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=k+9Xg+Swb9WyogBux3VELfXF64UsK6Yzxm88ZQsZWmo=; b=ps/irkbFNMtvWqB9uIakLRr2V
	O+hxRiNF5wE8l7fWhewNDw0Pjk69KUu3Ow7tI3FmIZtqlTiwC1oO6WYloqK30eDir57qSudpLc9R3
	N05mSmlALrl0XQEfcWQzq2I+lo42/7frXWhHtIbSASHiXFy9dpLSwRgzEP/IyXw1AyU/c+twgy2Gv
	SVW/0C5SQy+zK7+xb7VdsqyVXmx3p0Y7vxVyMnUk2J6dDtM1055Tgk4+hud1sJuyc97QVXmRlB9kJ
	pziuq9WnpH9ZFj7YEF8jrnJYvj+CXOhybk+Wnx4xyTDdAsTSQ1mdZl+3hJSGoK4AN3Zz8ah3Ll0ZM
	+G5gLhofg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFn-00024U-Iv; Mon, 17 Aug 2020 17:49:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFe-0001zB-OE
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686532;
 bh=wK+Cq8UT12TOrSr+9HMMfdYElTgcjAK3Sm7GyWkscfI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=1vJyRmnJ6Mxw2oz7kAdoHaeojxAXf0t3bBzANLC0uzybrC9vV2s5K/zanVppxdVS7
 CcfSdVH8GF2G6hKfvreqp1fCdUqWRuaebw+1QWE75oga10B82qvLcMbGKCU9qsyCT5
 +LrfvzGDmJw248xTJruhPXdfkpsS21T+CJBZ73I4=
MIME-Version: 1.0
Subject: Re: [PATCH] net: stmmac: dwmac-meson8b: use clk_parent_data for clock
 registration
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653239.32160.3934267678823635798.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:52 +0000
References: <20200625182142.1673053-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200625182142.1673053-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134854_920532_B793ECAF 
X-CRM114-Status: UNSURE (   6.74  )
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
Cc: linux-amlogic@lists.infradead.org, khilman@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hello:

This patch was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Thu, 25 Jun 2020 20:21:42 +0200 you wrote:
> Simplify meson8b_init_rgmii_tx_clk() by using struct clk_parent_data to
> initialize the clock parents. No functional changes intended.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 49 +++++++------------
>  1 file changed, 17 insertions(+), 32 deletions(-)


Here is a summary with links:
  - net: stmmac: dwmac-meson8b: use clk_parent_data for clock registration
    https://git.kernel.org/khilman/linux-amlogic/c/52660c0ec9e4ec26934ad9eb6f73857ad12fb4e9

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6E4C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83E2F206E9
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EgI+Ou8Z";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CspFvXD1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83E2F206E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5rHajppqe7Jq0rvZRtOBAzWAQbcQufYFjgGrVB96FWU=; b=EgI+Ou8Z/PLWBkqwFGGKbmnyp
	I9+lHl3b7iqDxFJNd4VryN58tAaMSU0vFghjQDYDBZUEnrmsccPFo4YxKKIMNC3+ocyGUc+qpwodu
	xlsDcsGaKcR3HaGH36QWiHAEgrhjDmnQbC4GlB10xdpNSPCOd8QWJjXbnQJvq92QFaCh7E9GbTCG7
	TccRtqMCjXCeHUrLRndwpS9AtmE63lbP+iwZi30e710CO4/bCZalIewJXZywWmMHc9mGddRrzASaZ
	KqEcqwTfml+rpRIrtv+vHC6heniCxhbJmKL9qIHwEAZfaXh2umvQlS6y8lVjZZ4yVUOtLI2Qb4guD
	+ysIRgg3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgi-0003RU-QR; Tue, 07 Jul 2020 18:51:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgV-0003Ib-FZ
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147873;
 bh=pXuaUDlnkTgXOVtZS5+tYF6d+qKXZnvj37OiYjmomks=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=CspFvXD1omRZXFBHIi7FNZQ8A2qjHu3YTvE+D5j09XIBT2anaGzo9b3TEymNbc8rS
 rC/+0cS1hrGCiBWt/WM9wXjdG69YvVpE7NyO0exFJYLG9+Xv+OQkbNg5ezrLk+9usJ
 xNjg1Q6dlCZKxqg7teEgWXopr92GC7BJLeZQuSW8=
MIME-Version: 1.0
Subject: Re: [PATCH 1/1] spi: dt-bindings: amlogic,
 meson-gx-spicc: Fix schema for meson-g12a
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787310.3387.15626311492565257275.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:13 +0000
References: <20200609165527.55183-1-alexander.stein@mailbox.org>
In-Reply-To: <20200609165527.55183-1-alexander.stein@mailbox.org>
To: Alexander Stein <alexander.stein@mailbox.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145115_638491_431EF197 
X-CRM114-Status: UNSURE (   3.56  )
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

On Tue,  9 Jun 2020 18:55:27 +0200 you wrote:
> This fixes the following warning during dtbs_check:
> ---
> spi@13000: clock-names: Additional items are not allowed ('pclk' was unexpected)
> spi@13000: clock-names: ['core', 'pclk'] is too long
> spi@13000: clocks: [[2, 23], [2, 258]] is too long
> spi@15000: clock-names: Additional items are not allowed ('pclk' was unexpected)
> spi@15000: clock-names: ['core', 'pclk'] is too long
> spi@15000: clocks: [[2, 29], [2, 261]] is too long
> 
> [...]


Here is a summary with links:
  - [1/1] spi: dt-bindings: amlogic, meson-gx-spicc: Fix schema for meson-g12a
    https://git.kernel.org/khilman/linux-amlogic/c/a575357b6435c6dd988b8194c59eec83f6e5d5af

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36646C352BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C75E322240
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="otM0q4XA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXa0AJuo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C75E322240
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HeXVftTe/FB+aoyjjNdskRkoiVMDAkPrjBTHBTTg40=; b=otM0q4XACaFeWa
	untK9O9azX6G/gDT1Q7zrhc0aZpiE2lTl/LQGuZgIItYaj+YQjWc799ZCZxSEYkCFWp9aR95kIppX
	2ylX0tMYU513qTnG5+cXHOY5TsKX/1xVBEqJt1MaX69mpQz33QtF8saTOfprD6ZwbyX/W6u7/PNWi
	y5G9w6ykgPIwrQiYFXPNJybHWldCFcFelEUA9c9v+Tm9BGJXp58Alkd8CMGTlCu3WNqxC7udFgcG7
	tFJx7gMSs7cYpsP/KFI/PrGjvEYMSO+/VftvivUkfAvzjA/tNkDr42uhRGHqYXhtiPllbByEnA6sE
	gHmj5fzpwBnogmpkYcvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP73b-00080I-7o; Thu, 16 Apr 2020 16:08:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73X-0007uL-Bk
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053278;
 bh=WcTSUeng90I73uoIsuE3XYbqxCOQAQZkhDYnzwdrfO8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=NXa0AJuo5Y8lN9vLHpnnt3MnZBrZfQpMYHlsMo/9SyiCJMtKnETx27ESVB/SRlu69
 uk6QiAPq0mkhOB7ebvZCm7jwQ8tEzAh9leNWsG/vXMvaBbz2XnDNKJgTyWwijRQk+o
 ay90IEGi+vr9Zc57om2dj5ypy7Ms0h9TpjZNwSjU=
MIME-Version: 1.0
Subject: Re: [PATCH 0/9] ASoC: meson: gx: add audio output support
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705327869.8629.1708403114868511667.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:07:58 +0000
References: <20200213155159.3235792-1-jbrunet@baylibre.com>
In-Reply-To: <20200213155159.3235792-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090759_423510_0B38F7A1 
X-CRM114-Status: UNSURE (   5.24  )
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

This series was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Thu, 13 Feb 2020 16:51:50 +0100 you wrote:
> This patchset adds support for the i2s and spdif audio outputs of the
> amlogic GX SoC family, such the S905, S905X/D, S912 and S805X. These SoCs
> are used by a fair amount of boards actively maintained upstream.
> 
> This was tested on:
>  * amlogic s912 q200
>  * libretech s805x-ac (frite)
>  * libretech s905x-cc (potato)
>  * libretech s905d-pc (tartiflette)
> 
> [...]


Here is a summary with links:
  - [1/9] ASoC: core: allow a dt node to provide several components
    https://git.kernel.org/khilman/linux-amlogic/c/1dfa5a5ab34560fd9647083f623d19705be2e706
  - [2/9] ASoC: meson: g12a: extract codec-to-codec utils
    https://git.kernel.org/khilman/linux-amlogic/c/9c29fd9bdf92900dc0cc5c2d8f58951a7bdc0f41
  - [3/9] ASoC: meson: aiu: add audio output dt-bindings
    https://git.kernel.org/khilman/linux-amlogic/c/06b72824386795bf6f0a6ac0f0cfef6b7f0165c1
  - [4/9] ASoC: meson: aiu: add i2s and spdif support
    https://git.kernel.org/khilman/linux-amlogic/c/6ae9ca9ce986bffe71fd0fbf9595de8500891b52
  - [5/9] ASoC: meson: aiu: add hdmi codec control support
    https://git.kernel.org/khilman/linux-amlogic/c/b82b734c0e9a75e1b956214ac523a8eb590f51f3
  - [6/9] ASoC: meson: aiu: add internal dac codec control support
    https://git.kernel.org/khilman/linux-amlogic/c/65816025d46169973d308d83fbcf5c3981ed5621
  - [7/9] ASoC: meson: axg: extract sound card utils
    https://git.kernel.org/khilman/linux-amlogic/c/aa9c3b7273a58b5d9b2c1161b76b5fc8ea8c159b
  - [8/9] ASoC: meson: gx: add sound card dt-binding documentation
    https://git.kernel.org/khilman/linux-amlogic/c/fd00366b8e4125d29e32d49053a702ddf77430f6
  - [9/9] ASoC: meson: gx: add sound card support
    https://git.kernel.org/khilman/linux-amlogic/c/e37a0c313a0f8ba0b8de9c30db98fbc77bd8d446

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

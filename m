Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09391C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D293320716
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mB2OzAnk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="yIy58e8M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D293320716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S4rV1MDhvef8kiGvan+Aj2Wgpy/qK2sGhc1cD0omkSQ=; b=mB2OzAnkbAIjFns4s14uh1Fzk
	3SFs8l6om0ft02d7yK5zJp5iv8rEZP5TsQ/BAgfGlidY/3Q1Xg+VooN3KmC++6nRSATJmY4UIKLLg
	8rnO2fRH0ISpsb9cX0isfRfuCaaCKxZKmQkD657qIpcNF+9R9Y/LRNYrf1uF8HLvTmNZwNvOi7B2/
	g67bDUvTUeyQK7WRODHg3AyGBfpJz8uKHEAZsniOjgswWVsFyQVAwAJoWg2bAlJbMasOYGR4e9vZt
	dfub6IsEelJR9yzhADpwsQkHd3kyLlNtrCaE1FrDQxS3JAF89Vwdw/0u3yEeeNm/RdVSCFr5nkxAp
	yPjJq7dcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFv-0002Ab-9k; Mon, 17 Aug 2020 17:49:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFg-00020y-Mz
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686534;
 bh=C6VxPJcBh0v7bSqYuXXd80QZF0drItdWM8iiKfaT/BI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=yIy58e8MW3qM+hDjyCbVzzYEQZyPksWxWgD6EaOmGCWRXsqM78KTvVbztRy2IEf76
 7r2eJw+WZroRbk4T3OfjitTdoz8mxEhtbA0Zgab/Sx5oE36Fl/qoZmbXNG/jn+cRye
 AHlCj1V0DhNC+AL1eOqw10unL8/O5tGxydxEVhRo=
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: meson: cards: deal dpcm flag change
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653409.32160.9526240707883997652.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:54 +0000
References: <20200731120603.2243261-1-jbrunet@baylibre.com>
In-Reply-To: <20200731120603.2243261-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134856_866773_7A6FCCAB 
X-CRM114-Status: UNSURE (   5.55  )
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

On Fri, 31 Jul 2020 14:06:03 +0200 you wrote:
> Commit b73287f0b074 ("ASoC: soc-pcm: dpcm: fix playback/capture checks")
> changed the meaning of dpcm_playback/dpcm_capture and now requires the
> CPU DAI BE to aligned with those flags.
> 
> This broke all Amlogic cards with uni-directional backends (All gx and
> most axg cards).
> 
> [...]


Here is a summary with links:
  - ASoC: meson: cards: deal dpcm flag change
    https://git.kernel.org/khilman/linux-amlogic/c/da3f23fde9d7b4a7e0ca9a9a096cec3104df1b82

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

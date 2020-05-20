Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919D6C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541D320709
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rOrC3/PT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xSw+LOY/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541D320709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63Q8a2qgNoz3qAiMPBg2zDA9RZ6VqZv6a6St9ULLFWc=; b=rOrC3/PTgS+OXL
	9sCzGg+Btj38T1uj8wF23l6gQiNe9OC11HnUiDFdZuDdieAEEDcofX/sjjGMFHxhaQyFCM7edSDvl
	p9baweEvSOx11Ol+hrlXVWQWnTtspjlMQ3H7WyQ0P9xKJZ40iLCz/E8UA2GNLCCqQ1dpMUCqLqBE+
	FHe80HYnWFJY8m6Emi74IWuYPZb4n8S2s39BMGbqAYvWJcBdUElUbDw59J8ezGAp934XO7l8k0wQ1
	O+/XKHFu2IiffxPrhlLKrR7oe0PS3nAI0jcTzOOgAl2rkniz/AFo38HxH2H+McO+M41g/dp9+GXGI
	IXwPHy3aQF5QOHibbjAg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCB1-0005ah-7d; Wed, 20 May 2020 00:01:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCAs-0005RR-E0
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 00:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589932890;
 bh=t0G+gxGQxZNHKnASuwESBj0aBemGLX69ZuoQQIH+klE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=xSw+LOY/TnsaAEByqFqV4d8EkgxEK+iOIWH4lr3nEU0kNgzLsdoWzJlj6zFXLYb7h
 si4JqHFAEEOTo2b1U9urgDTS6VtxatSEIFi73I4P7WqfrQ7xA3IyXmQWsHz/3si6I1
 xMMlioRrFiyJqQJq2PBosOl2v9C24Yua6VWABpRY=
MIME-Version: 1.0
Subject: Re: [PATCH 0/7] arm64: dts: meson: add internal audio DAC support
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158993289010.29142.17512269596780364398.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2020 00:01:30 +0000
References: <20200506221656.477379-1-jbrunet@baylibre.com>
In-Reply-To: <20200506221656.477379-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_170130_489068_AD658B9C 
X-CRM114-Status: UNSURE (   6.86  )
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

On Thu,  7 May 2020 00:16:49 +0200 you wrote:
> This patchset adds support for the internal audio DAC found on the gxl,
> g12 and sm1 SoC family.
> 
> It was mainly tested on the gxl libretech-cc and g12a u200.
> 
> /!\
> This series (patches 1 in particular) depends on this reset binding [0].
> Philipp has provided an immutable with it here [1]
> 
> [...]


Here is a summary with links:
  - [1/7] arm64: dts: meson: gxl: add acodec support
    https://git.kernel.org/khilman/linux-amlogic/c/a66d4ae3144a18476626dd8de8b8dff5f523daee
  - [2/7] arm64: dts: meson: p230-q200: add internal DAC support
    https://git.kernel.org/khilman/linux-amlogic/c/f3c35382259f67c2ae878de2142fb58b94df0525
  - [3/7] arm64: dts: meson: libretech-cc: add internal DAC support
    https://git.kernel.org/khilman/linux-amlogic/c/249ce3777c25b383702e91a6547ffc676dc004a5
  - [4/7] arm64: dts: meson: libretech-ac: add internal DAC support
    https://git.kernel.org/khilman/linux-amlogic/c/451323f8bc9e9b701b87b4598ec1cac8eff82d15
  - [5/7] arm64: dts: meson: libretech-pc: add internal DAC support
    https://git.kernel.org/khilman/linux-amlogic/c/2989a2d6c7f36da2bddffdb293bdf123e735d5f7
  - [6/7] arm64: dts: meson: g12: add internal DAC
    https://git.kernel.org/khilman/linux-amlogic/c/457fa78771a23ecedf3bcd9ce9946a5183472ff6
  - [7/7] arm64: dts: meson: g12: add internal DAC glue
    https://git.kernel.org/khilman/linux-amlogic/c/dbffd7f9bdb463437d3c3f7c3e1bd4379a785fe4

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

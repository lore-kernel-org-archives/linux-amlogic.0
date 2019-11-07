Return-Path: <SRS0=QqPF=Y7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CC2C5DF60
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Nov 2019 07:41:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45BDE21882
	for <linux-amlogic@archiver.kernel.org>; Thu,  7 Nov 2019 07:41:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efAO12IR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fz3ZRWKG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45BDE21882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7yOMTCla2tR7/l8W0W0ewOu63yFGTBgDriG6EIK4niA=; b=efAO12IRhrXlEw
	R1LzkAVvxSBTQzv1UltnRBEJLfx9TbfXNJ0iw76FBtUjytjCSlDwUfg4OZupF/P2k5bFc7zF7zpmq
	vABzrOalqyj/gW5OL3reKf+xYPgnyhyBWZUdnCu0vNSk5Atok5SWlWDLP3QOiNP10WVGiWH56nfhD
	xTTgeIgJn4RBBnhL0Mj2GvEsevP91+VQVWLaXkF8P8uwrQPKahIrXpR7HmNQ7ZiRw9fWeQVFDCatS
	l5jfU50uAqRaou6FLz3Ent2e+4g2YC2r4ZohSuUOSfQ61xWllig7pNvYMpOrjuU1sT3LIiheCK2Wp
	fJVcs0rg1ZUo9/dALM4w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iScPs-0000UC-Cf; Thu, 07 Nov 2019 07:41:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iScPp-0000TG-Du
 for linux-amlogic@lists.infradead.org; Thu, 07 Nov 2019 07:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573112472;
 bh=+vZr5adDcCVPb/8DMAO9BNB42tXJtmo6J3epZFrQ+Jc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=fz3ZRWKGYoM1IGTCKXpjGwvXXgZDauWIVR6caprVyCsFumQCUQsmDKCJA2kFgGViz
 QYA/MVVB2sOXDBYBDcH1ZgEAU5+/Tlg0I/n3HzribkDhk/O2IUsmbN50tJE61XaQ4m
 p8qeekaraXmercrPKAKMgwAt+zMbxCDNybVksLtk=
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] arm64: dts: meson: new fixes following YAML bindings
 schemas conversion
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157311247280.12479.8688474676070364516.git-patchwork-notify@kernel.org>
Date: Thu, 07 Nov 2019 07:41:12 +0000
References: <20191021142904.12401-1-narmstrong@baylibre.com>
In-Reply-To: <20191021142904.12401-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_234113_494165_67133E92 
X-CRM114-Status: UNSURE (   4.65  )
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

On Mon, 21 Oct 2019 16:28:59 +0200 you wrote:
> This is the first set of DT fixes following the first YAML bindings conversion
> at [1], [2], [3] and [4] and v5.4-rc1 bindings changes.
> 
> These are only cosmetic changes, and should not break drivers implementation
> following the bindings.
> 
> [1] https://patchwork.kernel.org/patch/11202077/
> [2] https://patchwork.kernel.org/patch/11202183/
> [3] https://patchwork.kernel.org/patch/11202207/
> [4] https://patchwork.kernel.org/patch/11202265/
> 
> [...]


Here is a summary with links:
  - [1/5] arm64: dts: meson-g12a: fix gpu irq order
    https://git.kernel.org/khilman/linux-amlogic/c/711f9cb1f13aff940cd0a469dcb1a041330af019
  - [2/5] arm64: dts: meson-gxm: fix gpu irq order
    https://git.kernel.org/khilman/linux-amlogic/c/69fb3f21f865ef110cb94a59bbf84adc2c376d9a
  - [3/5] arm64: dts: meson-g12b-odroid-n2: add missing amlogic, s922x compatible
    https://git.kernel.org/khilman/linux-amlogic/c/409a0daa72f6fc1652e17cfea7ea1055e9c483c9
  - [4/5] arm64: dts: meson-gx: cec node should be disabled by default
    https://git.kernel.org/khilman/linux-amlogic/c/b485a6a4e889f406b38038027557b78f33b571fe
  - [5/5] arm64: dts: meson-gx: fix i2c compatible
    https://git.kernel.org/khilman/linux-amlogic/c/87297878b5b7c2fc4cecd66fc96b3061d04b6b3b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

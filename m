Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641BEC433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35681206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vh5uf9YO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtHknQPm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35681206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UE5fDyGcDz26ILZ5RR8ypyPCeOdFpHPp1Brxp2tiDOc=; b=vh5uf9YO87pArstj5DX/Vcu2a
	k/02B7el2c40bVBfyIEeJ5nsh8j3qh1hFi9vlWke0To1FPCaOM7SA+7HzaW+lKJVh+vB/1kXqfXmA
	GbfoWMwkHvWxNcAJvOBI9h1uFXHhMzRN4FLsVzbbATtd31OyD+4a0OZtH0eDiyob127tjGaiGyop9
	FXf7y1WdFVIf8iR8JtQi5quo5YGJkOGvYDMyuMX5lhIiaiv+zkIJmctivJFHYdrzKCuYsxwmCIW4N
	KoWT6eErwXhcgUjFYMmacja94pTEaxOMYEUj0ckjv5x+Sv691utOtn1r56aQiKtEiPAQQX/OWmbRq
	6v0QjKbOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgb-0003Me-NM; Tue, 07 Jul 2020 18:51:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgT-0003HK-T1
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147871;
 bh=ynq1DXneji/k2ak0WYk0YcIRDZ0eqF3HTKIvPnTKmkU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=DtHknQPmGpYG0W1MOSHSttrLiKK/sw2JMWKAbECuEszxuBC0wzMkheXebptXj2pZq
 ubcu9mDVEP5Z7pmMZq0UD3QcUxBEGnOUCGFrFJ6fvPK38b/WKjDhxEWNlsrxEf00rO
 0WXf2n8pM5Fx45wGhRYuQ1w8e3tE4xq27kpryr10=
MIME-Version: 1.0
Subject: Re: [PATCH] clk: meson: meson8b: Don't rely on u-boot to init all
 GP_PLL registers
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787165.3387.1089835438770121770.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:11 +0000
References: <20200501215717.735393-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200501215717.735393-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145114_137771_28DC2792 
X-CRM114-Status: UNSURE (   4.84  )
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

On Fri,  1 May 2020 23:57:17 +0200 you wrote:
> Not all u-boot versions initialize the HHI_GP_PLL_CNTL[2-5] registers.
> In that case all HHI_GPLL_PLL_CNTL[1-5] registers are 0x0 and when
> booting Linux the PLL fails to lock.
> The initialization sequence from u-boot is:
> - put the PLL into reset
> - write 0x59C88000 to HHI_GP_PLL_CNTL2
> - write 0xCA463823 to HHI_GP_PLL_CNTL3
> - write 0x0286A027 to HHI_GP_PLL_CNTL4
> - write 0x00003000 to HHI_GP_PLL_CNTL5
> - set M, N, OD and the enable bit
> - take the PLL out of reset
> - check if it has locked
> - disable the PLL
> 
> [...]


Here is a summary with links:
  - clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers
    https://git.kernel.org/khilman/linux-amlogic/c/a29ae8600d50ece1856b062a39ed296b8b952259

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

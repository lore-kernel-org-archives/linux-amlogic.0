Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4259C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88D50206CD
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B6cUyX5O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="U1Muhr+e"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88D50206CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rriExoG1L5kNhPv3EBaW09EWNTgLVcjJfwFR6kfCTD8=; b=B6cUyX5OQ7dcLaVy4Idg5iIBf
	O2KEhnY+0UapFAILV7n4AYVzAC8mplzCC003Dnmi8wTze0daNsPesOZgLF0HKUvw2y4tDEZdd9fPD
	GcG01A37d1rtdaKn6t2Rr/GAhBVWX7muCemoiH3NMtu7FH++AhZAt9YzOOx2qZrqpzhZ8DJES9Ov9
	f8Li3L4hXTdlfklepRDqfyDC9UDYuxtkzHNJlfIcPJFFuqR5TA6NBOePsYLBC2dAF4wGgvxX1EtXJ
	Wu17iIVQCYcItO1ft2HyD6HutM8zfvUpMmCfcZouSGZJDUMJAVJipXCpKeXcM9ewbp2llr77sOpuN
	HZtQcU5tQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssge-0003Oh-Ge; Tue, 07 Jul 2020 18:51:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgV-0003IM-7F
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147872;
 bh=PRoc2w2oXZ9WM5+IyfsDL+OWKeE3yLuK9oWoOcdbPvg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=U1Muhr+et7EvQ0o9nJOIswunu+pGmvz/9AAf7soRioqealVd1PvpYOgA3WD5dGL7z
 twvDcpum5RaG2/XQNMjQfmysnObIgX5NDfgLSbNvBe9BLrmeu4uRj+CVPY0/ThPSlY
 fthGFHB/v0ZVkdPukAnpMLgxZxL9UXAyIGU87NdQ=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-gxl-s805x: reduce initial Mali450 core
 frequency
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787256.3387.13934205810343256432.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:12 +0000
References: <20200618132737.14243-1-narmstrong@baylibre.com>
In-Reply-To: <20200618132737.14243-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145115_515294_05DFA963 
X-CRM114-Status: UNSURE (   5.17  )
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

On Thu, 18 Jun 2020 15:27:37 +0200 you wrote:
> When starting at 744MHz, the Mali 450 core crashes on S805X based boards:
>  lima d00c0000.gpu: IRQ ppmmu3 not found
>  lima d00c0000.gpu: IRQ ppmmu4 not found
>  lima d00c0000.gpu: IRQ ppmmu5 not found
>  lima d00c0000.gpu: IRQ ppmmu6 not found
>  lima d00c0000.gpu: IRQ ppmmu7 not found
>  Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
>  Modules linked in:
>  CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.7.2+ #492
>  Hardware name: Libre Computer AML-S805X-AC (DT)
>  pstate: 40000005 (nZcv daif -PAN -UAO)
>  pc : lima_gp_init+0x28/0x188
>  ...
>  Call trace:
>   lima_gp_init+0x28/0x188
>   lima_device_init+0x334/0x534
>   lima_pdev_probe+0xa4/0xe4
>  ...
>  Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson-gxl-s805x: reduce initial Mali450 core frequency
    https://git.kernel.org/khilman/linux-amlogic/c/b2037dafcf082cd24b88ae9283af628235df36e1

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

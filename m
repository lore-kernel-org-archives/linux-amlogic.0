Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEB97C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F28920663
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CyVNouHH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4Q6Id91"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F28920663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MFXU7uRNLZPmN+nqoBFKzexMCsITLRLo2TqawCky0pk=; b=CyVNouHHqfGkEdKxMP4GN5QUs
	ncmYTz91EvPyTacpKUin5BKoKfcMj3VK2V1M4/NaLxCJg6973RxaTvG8LMNWuNVzPhPj2Lp86p78n
	L+DQQeAgDno6f2pnMF4WerL7e7UUoicfBpU73fRZGRGScnN8HadL0dPZ1It5b2vBmncyDY/Ly1I+e
	HwHhY2RPfqbmoyW3/9EpA38PxMBe5knKH6RyCO/Zu2m1pYchLivlqge5snmGAGtEcRkOZ5YU/AxVt
	FLr9Z6yV2zLxKbJ4KOKchlIFngD0Mi7nUg/NZ6CEF9QA2s1HxlQNIEEPBlEP4L6eevvANgdh/PvKk
	uOYdkkj8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv41J-0005Y7-HR; Mon, 13 Jul 2020 19:21:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv41F-0005Vk-CE
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594668100;
 bh=wP155b10UEQkXW90MpdXqs/qO4t4L18Z0epIbl/8/I4=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=E4Q6Id91BOnJuZapK8pUTJF9R+mcjci9L7pEOBtN6m7BrATuKvhSLT5vkSu64v3iA
 i4yLbzq7rE1H4xkuZ2kA1Gw4L1csnI4RtpjlmIIeLca8/hziapnU1vXlb1KjF+JKOr
 D9uxyeqI9J7aIQyyptBEcZfHLjXQbKyYK/7k4B9o=
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] ARM: dts: wire up the power domains on Meson8/8b/8m2
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159466810027.23057.14767482992300363024.git-patchwork-notify@kernel.org>
Date: Mon, 13 Jul 2020 19:21:40 +0000
References: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_152141_672128_F665A875 
X-CRM114-Status: UNSURE (   6.51  )
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

On Sat, 20 Jun 2020 18:10:07 +0200 you wrote:
> Now that the meson-ee-pwrc driver has gained support for the power
> domains on Meson8/Meson8b/Meson8m2 we can add it to the corresponding
> .dtsi files.
> 
> So far this doesn't fix (or break) anything for me (probably because all
> vendor u-boots are enabling the Ethernet power domains unconditionally).
> But at least it's one preparation step which is needed for video output
> in the future.
> 
> [...]


Here is a summary with links:
  - [1/3] ARM: dts: meson8: add power domain controller
    https://git.kernel.org/khilman/linux-amlogic/c/aecc72b14d11327804f7ca1fc76ca88a22cc1136
  - [2/3] ARM: dts: meson8m2: add resets for the power domain controller
    https://git.kernel.org/khilman/linux-amlogic/c/c5d3d3cf00d5ed74359e71f7b5d003cf34ba014c
  - [3/3] ARM: dts: meson8b: add power domain controller
    https://git.kernel.org/khilman/linux-amlogic/c/9960cacbaeb1ccc1b2d9840cadb18844d48a337b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

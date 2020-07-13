Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EE3C433E8
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E4B820663
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fVA52Bfv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jK7qGkGC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E4B820663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Iq21M/Lz6Vd7NEUWN7pIh9lOXeNupdpwLnkKvgKMaUM=; b=fVA52BfvYLVO0sjxi4uvtjFFv
	U4+Qbm3slhmFTWq79+9Jy8SKdC2hAIlbpxfYW+mwLDj3KtaoTl0MdX7vZcrxve0TGAC8ReRiZJAqQ
	9DIqNlDV3uEiLValckpIovJ5ZRhUb2isdn/5NYUlg0DZDct2l3bhK8xuWIgPhJO03xaGo2z6n4PX9
	I+dGhH2uqe6nnFv7//MvDVD1kY5LUOkgUyjz6ekVleOHClZ+s42jKxtPQjFWMWWS/L1NvmCDOxLGi
	kMLba5gTuuBQKh9/ibefJqyyrT+q7qBheO/t6y5Zh2JXRckbNGTde1p51PFnqm9Ichetr32KLKsgn
	Ha9LDfcog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv41I-0005Xw-T9; Mon, 13 Jul 2020 19:21:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv41F-0005Vj-8A
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594668100;
 bh=Hd2M9RJ4dPiGQhHxOH9zTnWb2CFIyoojFzVZpaufhCA=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=jK7qGkGC0hPaczr9vIvYjfdJ9tmYrxhbqKUGGOGJ2575fvCGG70rIa363VxyggxnY
 Op3A4wa7sYzFskphSGZ+tlwZ4y2aB0v3dDRCGpnUBDpjHlHIzvIQLVNzW+MCz+0wF6
 J7w5yx66b+k1JcEThdIeLuCfcRoLSftuRQnq+oG8=
MIME-Version: 1.0
Subject: Re: [PATCH v2] arm64: dts: amlogic: Add the Ethernet
 "timing-adjustment" clock
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159466810008.23057.14604476766905624046.git-patchwork-notify@kernel.org>
Date: Mon, 13 Jul 2020 19:21:40 +0000
References: <20200620162347.26159-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200620162347.26159-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_152141_497377_241EF7CF 
X-CRM114-Status: UNSURE (   6.69  )
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

On Sat, 20 Jun 2020 18:23:47 +0200 you wrote:
> Add the "timing-adjustment" clock now that we know how it is connected
> to the PRG_ETHERNET registers. It is used internally to generate the
> RGMII RX delay on the MAC side (if needed).
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Changes since v1 at [0]:
> - fixed all typos in the commit message (hopefully...). Thanks to Andrew
>   for spotting the first ("no" -> "on") one and shame on me for having
>   to find two more ("adjusment" -> "adjustment", "now" -> "know")
> 
> [...]


Here is a summary with links:
  - [v2] arm64: dts: amlogic: Add the Ethernet "timing-adjustment" clock
    https://git.kernel.org/khilman/linux-amlogic/c/32b5f4b63487a24712c3bfa1d6a8eb9257beb8bd

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

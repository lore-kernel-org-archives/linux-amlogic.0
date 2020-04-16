Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F7B0C2BB85
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F5B22054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qlbT3jTW";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0VdlDYBn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F5B22054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AROd604DHYEH5DqDIHP0ZDpvNq6JuRXTr8V7MFall8Y=; b=qlbT3jTWZiAdZp
	b5h+BO5vPsquRW2X/dzsFYldJwq8bSshrOcv/SOFS7d6QUdXVM0oJzW9XgZhVtixKE0Roy+IIjwlM
	bqHjvk6LDHEJZSQfwVjFkpPokS9N1fNMJi4bGZoIqrRb5lBygfL6YVepzs3iAhG6lJ+W8rt/3Bwal
	iGT0K1ou1PzQC/InsfifWmnp8mHjJIWDk+Ot3GsW/PWf4ww4TJefNf/XeyBtJdc1SNyojC0aOgav4
	nJWRqcVLiD3/anOxnYd0kWTF48BghPu7SSki8R/aHx9kBP1+9Ir1Lrjtvv8Q3gdHRxaIeyU+0YkqV
	S5QwKB0XUZB8vj0Ya07Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP73z-0008VR-5d; Thu, 16 Apr 2020 16:08:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73Z-0007yt-CK
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053280;
 bh=C0XR3RpEizu27S5anUKwdguSd5OQhjVwT579HNoXr/0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=0VdlDYBnKMeoffCdekeoXCVXdhkfSXU2rx1DuxhC2zv9+KneqQyLuW91xPKEqep6Q
 xxTnm3XUtnOVhVv2Vt24JqVQvqNCU8Jhpr6igw/fPAgc9Ph/pyc/s20QWaBcM1bHka
 hO6YjnCtDWHSu97lH0CmvHzk3oObp/xHCVQ0IDMY=
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] ASoC: meson: aiu: fixups
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705328033.8629.7886905729639193237.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:08:00 +0000
References: <20200214131350.337968-1-jbrunet@baylibre.com>
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090801_478380_88193E44 
X-CRM114-Status: UNSURE (   3.60  )
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

On Fri, 14 Feb 2020 14:13:45 +0100 you wrote:
> This patchset fixes some mistakes which slipped through my initial
> submission.
> 
> Most of these issues have been reported by coccinelle and sparse.
> 
> Jerome Brunet (5):
>   ASoC: meson: aiu: remove unused encoder structure
>   ASoC: meson: aiu: fix clk bulk size allocation
>   ASoC: meson: aiu: fix irq registration
>   ASoC: meson: aiu: fix acodec dai input name init
>   ASoC: meson: codec-glue: fix pcm format cast warning
> 
> [...]


Here is a summary with links:
  - [1/5] ASoC: meson: aiu: remove unused encoder structure
    https://git.kernel.org/khilman/linux-amlogic/c/51c366e38aaa6b298ba1e6ceef0f2c3de1180b29
  - [2/5] ASoC: meson: aiu: fix clk bulk size allocation
    https://git.kernel.org/khilman/linux-amlogic/c/269f00171273e47eebc915cc6ee8ceececa37a3a
  - [3/5] ASoC: meson: aiu: fix irq registration
    https://git.kernel.org/khilman/linux-amlogic/c/6e700f0672199f773ad645c2b7e886c1d2e2046e
  - [4/5] ASoC: meson: aiu: fix acodec dai input name init
    https://git.kernel.org/khilman/linux-amlogic/c/74a56f2a4a9ec72ef1daceeb2dda8b41370c1419
  - [5/5] ASoC: meson: codec-glue: fix pcm format cast warning
    https://git.kernel.org/khilman/linux-amlogic/c/3cd23f021e2e5f3350125abcb39f12430df87d06

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

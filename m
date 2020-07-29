Return-Path: <SRS0=TJbE=BI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A16C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 19:21:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E75542068F
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Jul 2020 19:21:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T+EvWJj7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KxA0gnDD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E75542068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G5WomjOiV+9yh7Li8bIlxtH47ibYKXL8qoPoqW1YZjM=; b=T+EvWJj7JmNy8lx4DOvXT0LsV
	BqzEbrjN05JjarWxJL5zVsujMFCztf2RncTdhSHCnfOJpl+pIlG3z12MryFC9rgRa4xefPCnV0Ok7
	oPtEycBY07ZAV45ABhj1u1zWGc72ROZKElMUlGaJwrciKUJ+ZqLLeYPy/9rBeR0cH2HA+0QFbUcHu
	j7fG69zpUaFoQc9eRRZ5s0zlXJWx8XeejkUI4geo8/jM4uOaCwD9sK3ZnFmMbFKx5dLMaXDpphegA
	b+9cFpJKyZ/JJSpjPCy352VzAjKoFXq07M7F6MFmgXCNKkAMGubEeAb5YSs0CJ7VTYW3OsxsAq+V9
	hZ/y6+bhg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0rdq-0005Vi-DR; Wed, 29 Jul 2020 19:21:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0rdn-0005Ut-Ms
 for linux-amlogic@lists.infradead.org; Wed, 29 Jul 2020 19:21:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596050486;
 bh=CdvBM0AVHUoQWkF2mmAtDWgnMr3C9VGRY40oLlYc69E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=KxA0gnDD5v4dpCyi0odh+mJ9p4/9VPizPHjd4HYlsb/bkl2U2MEZgI62uO6DCvjiy
 a7aDG0tmEcOyW1tAlqB2fNFWnMBvAxuxA3Hb2Iy7SnjAtukhCdgvbLOQNQAcAAWaXK
 M1Y4m7ExuflEgNnwUo55E3DC0ZFURQ7B5vcwD/a8=
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] arm64: dts: meson: odroid-n2: update sound card
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159605048623.3225.5115347111294590462.git-patchwork-notify@kernel.org>
Date: Wed, 29 Jul 2020 19:21:26 +0000
References: <20200701094556.194498-1-jbrunet@baylibre.com>
In-Reply-To: <20200701094556.194498-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_152127_845418_ECB73991 
X-CRM114-Status: UNSURE (   6.57  )
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

On Wed,  1 Jul 2020 11:45:54 +0200 you wrote:
> This patchset adds the support for the TDM loopback and audio on the jack
> output using the internal codec.
> 
> Jerome Brunet (2):
>   arm64: dts: meson: odroid-n2: enable audio loopback
>   arm64: dts: meson: odroid-n2: add jack audio output support
> 
> [...]


Here is a summary with links:
  - [1/2] arm64: dts: meson: odroid-n2: enable audio loopback
    https://git.kernel.org/khilman/linux-amlogic/c/a7a80474069842c27282a5e991704a0a1f26f243
  - [2/2] arm64: dts: meson: odroid-n2: add jack audio output support
    https://git.kernel.org/khilman/linux-amlogic/c/67d141c1f8e604a9c02d6a60f7827443d7f44762

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

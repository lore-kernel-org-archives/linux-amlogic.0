Return-Path: <SRS0=5tHY=YK=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6140ECE58E
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 15:41:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E572089C
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Oct 2019 15:41:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLxmIH1L";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YcxUWkQe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E572089C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FmG/tzB231BX/DdvraxtmB00jYeTe8gAymbfHlmzlas=; b=hLxmIH1LCh+CA6
	i10Hsw05TmdAZhUFjyWzeu/9Pzsvsk84HGkQHXJpxsS1QisT36PW4W7wP9QVcXdgkQyQ/MeCl4r5k
	uH+A4kIa8yH2WyvfviEuBdz2xD1PJmBCgv7ZUeJZd1MoN9oJOGaA5igbrzxVc8vi9r0y0xGeYw4Q+
	QWmUcQizWwUJeW2UwahzOYUDNejfvxNmd7DHRRw/KlRYO+3dHJdO/mtdKFEF2qtQ93cU3gmz6xQQx
	3USInVLB8XjmBoJ3FFmgWnvPUlBEris6M91MR7p0pkF/IZ5eRLZVF70iBvHTLlvVMmkGEtoaHt9NV
	BWR+26chZFntgBHgw93Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iL7tV-00057Z-DZ; Thu, 17 Oct 2019 15:40:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iL7tS-000578-BP
 for linux-amlogic@lists.infradead.org; Thu, 17 Oct 2019 15:40:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571326849;
 bh=Se/nFJ/WXiRmlux1kszm0HIY180uTtf1BOy9+ON+ASE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=YcxUWkQeJq5vhLdDen43ZgL0dI6QVshzSEVqBy5LzV2busHY8qQ/btzGNiQHf5yVj
 1b00g4TozCWyEtBNb5rjN4UP6MLH49wGcenLw3YkpFHnG8quo6ryqZQqlSPCqWCZIl
 cLtZfHBc8hYiqK+I3Z10o8HkAPuSiaVWdtf3LfOk=
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] arm64: dts: meson: sm1: add audio support
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157132684918.28748.18424491768645390796.git-patchwork-notify@kernel.org>
Date: Thu, 17 Oct 2019 15:40:49 +0000
References: <20191009082708.6337-1-jbrunet@baylibre.com>
In-Reply-To: <20191009082708.6337-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191017_084050_412433_B1FCF040 
X-CRM114-Status: UNSURE (   5.46  )
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

On Wed,  9 Oct 2019 10:27:06 +0200 you wrote:
> This patchset adds audio support on the sm1 SoC family and the
> sei610 platform
> 
> Kevin, The patchset depends on:
>  - The ARB binding merged by Philipp [0]
>  - The audio clock controller bindings I just applied. A tag is
>    available for you here [1]
> 
> [...]


Here is a summary with links:
  - [1/2] arm64: dts: meson: sm1: add audio devices
    https://git.kernel.org/khilman/linux-amlogic/c/147b1efe69824f9896b39d71bca1a64c73cee4f3
  - [2/2] arm64: dts: meson: sei610: enable audio
    https://git.kernel.org/khilman/linux-amlogic/c/c787f17672c118d4ad3ee35d88b64044233637d5

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

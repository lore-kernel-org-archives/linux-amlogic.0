Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78112C433E2
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5011F20738
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WWsmP+HH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="14X4572P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5011F20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yy9YRHJfJn4ZbPW1/aKr+9YxizNZfCkoXiQyg/9d1P4=; b=WWsmP+HHCis4mvAW3B6m/FZxn
	YaK+vaXaRtAagtaUq/3+fydxIlGxpHibvKPcRwCuCL/4Qn/cLDP8l7GMkVVHpifm3tZ6Gs0htwfQ2
	/0Dn7KxkZ++qxIDFpw0v1q5zHzuA7BZOLSFse1q7LFti/fRdUUucm+UwkLrK6OBOHMWV4qzP/0ArF
	jfefK9V1SzWZOqRGksq0AosRyaeMQn/pnG1kRz7ZT2+eaCE2ynFNsw4ECzX9Z24tOT3Kzzi1sgvTD
	8QnTn44MdQU93uCLF4L8tkopEfZXtSxRGTMEB0bk+PVBKU8tuvonZrp5YxtTGUAFItDIIYmUmxbB8
	LdPQpcsEA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgU-0003IC-G5; Tue, 07 Jul 2020 18:51:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgS-0003Fp-6W
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147870;
 bh=lvP+KZEguC3u9DYye7RW0A4rK/1InHZZUg2czP2UOEk=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=14X4572PQVdcOd9RRW0Bbiw0xNPHZkD48OJ0N6EONMXNtAFgKYNG07iH6sRybe7dv
 0mLFrIOfObu2SuA17abDauhdszI6qKmUpZKo3onFp+Ik8SyZLeVA8aeuLdC2+qIj62
 ycsU5e1ZxglMK60PAv5X+qSRcvRIEWLy+AqnIEnw=
MIME-Version: 1.0
Subject: Re: [PATCH v7 0/2] Amlogic 32-bit Meson SoC SDHC MMC controller driver
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787076.3387.14564569085536520902.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:10 +0000
References: <20200512204147.504087-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200512204147.504087-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145112_341512_39644FA8 
X-CRM114-Status: UNSURE (   5.65  )
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

On Tue, 12 May 2020 22:41:45 +0200 you wrote:
> Hello,
> 
> this is the patchset for a driver for the Amlogic "SDHC" MMC controller
> found on Meson6, Meson8, Meson8b and Meson8m2 SoCs.
> 
> The public S805 (Meson8b) datasheet has some documentation starting on
> page 74: [0]
> 
> [...]


Here is a summary with links:
  - [v7,1/2] dt-bindings: mmc: Document the Amlogic Meson SDHC MMC host controller
    https://git.kernel.org/khilman/linux-amlogic/c/e5f31378862e5d0e879809bd50a84790ea14a0bc
  - [v7,2/2] mmc: host: meson-mx-sdhc: new driver for the Amlogic Meson SDHC host
    https://git.kernel.org/khilman/linux-amlogic/c/e4bf1b0970ef96135c78c7dcf4e14484ce3b9804

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

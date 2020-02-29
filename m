Return-Path: <SRS0=pdBZ=4R=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41AD1C3F2CD
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 18:22:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1503624677
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Feb 2020 18:22:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N7q68LRz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TITSqzdV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1503624677
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCN6k+c1dUxZ70hl5bLU/0Oi2vaC4UYHO6sU2IjIy+U=; b=N7q68LRzwJSbX7
	wtj3ZNiggniDwxfr+5Q4GBsrop0RDO+WNkXOzMQmIHbY454jmdhCnpIdjnRA2lxih+3rBqBIxE/LI
	c2gXvyTgpuAtKBvSakkDwgDhkCgUXOj1oO7hc+o4of+7j9MagWhTGkf74jVxU/i9KDKjDPjj5FcZU
	i2E8YYVSbZ7HxhJCPbGphQ4QSTRhwbd+a69NEBzVK37KUuwpnZJoHD8FKU9xEoD/FDJl+B0jc4NN3
	CcfoXKF7EgCg+pd2UQ3iUT4lO4CuWfb2rMXHIu/qQ/HWcd9mKVLA46AuXLVNwm8yVkEmXW3eklF/W
	o3vAqO4J8eQMzJs9mv7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j86kJ-0007sN-Q3; Sat, 29 Feb 2020 18:21:51 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j86kH-0007r0-Pa
 for linux-amlogic@lists.infradead.org; Sat, 29 Feb 2020 18:21:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583000508;
 bh=PMO6nmWaCWwT6IRQe7W988hbFu5+CrqAkPCuhH+By3E=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=TITSqzdVZqrAkcBHZRhkvyaxrZ8EUiJ2awYHOsDGJbzGZrQuQBYnvj3x7v2ua3LEE
 LYXz4HSMiOlylJMxeh3ZT8fwU2yvWbhRHBeyuNYTeki3WBWVWRD/5yDAAczcImUtWb
 uUE/2PTrR0JeidVGJcyEE4Jxdhm9umyU+9HOtCXQ=
MIME-Version: 1.0
Subject: Re: [PATCH] soc: amlogic: fix compile failure with
 MESON_SECURE_PM_DOMAINS & !MESON_SM
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158300050888.2726.12421973865801415332.git-patchwork-notify@kernel.org>
Date: Sat, 29 Feb 2020 18:21:48 +0000
References: <1581955933-69832-1-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1581955933-69832-1-git-send-email-jianxin.pan@amlogic.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200229_102149_863329_F7205C00 
X-CRM114-Status: UNSURE (   5.02  )
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

On Tue, 18 Feb 2020 00:12:13 +0800 you wrote:
> When MESON_SECURE_PM_DOMAINS & !MESON_SM, there will be compile failure:
> .../meson-secure-pwrc.o: In function `meson_secure_pwrc_on':
> .../meson-secure-pwrc.c:76: undefined reference to `meson_sm_call'
> 
> Fix this by adding depends on MESON_SM for MESON_SECURE_PM_DOMAINS.
> 
> Fixes: b3dde5013e13 ("soc: amlogic: Add support for Secure power domains controller")
> 
> [...]


Here is a summary with links:
  - soc: amlogic: fix compile failure with MESON_SECURE_PM_DOMAINS & !MESON_SM
    https://git.kernel.org/khilman/linux-amlogic/c/9ef7a7920678b10431d88635f9a4a49bd23ca3a7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

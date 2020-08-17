Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EF91C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D12B2067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CPLSkY3y";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="YzhV8eik"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D12B2067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PvCtyhfwfaL7buv5bRbTO/u5Sq6eCvbUFC3ikaXAhFM=; b=CPLSkY3yhv+0ZRuRtxBcA6JHI
	ARmNw9TooXoxvkjNb0+7Zm87I5uJJH5/sckJ1XtQp1htc8sk50mCRTev3yqcrn4WcHroGeT8+paGD
	SKkt16oNDLyvNYHg91YWEtx7DAzc1DzCDy3wL1uejBKEZ5UGj6I6BBmczuy/+1AHlY3ROCHPlJW30
	lZdL4B2HVIQOtuM5sEHQOMfuQSB9HpmWQRo1yYU/nhq9wTEdb2vPL/P8t7pAy7p3np+S6nCvur9y3
	0T+BU4CQOsXOLE1A7HdqsfVMq+byFnXekvoBMQ+PTSZ4DEYQ0T8CIReY+FTsDlmVgkMyC05Ll9iV7
	TH7e7epcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFo-00025W-Sq; Mon, 17 Aug 2020 17:49:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFe-0001zJ-U2
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686533;
 bh=su6m2KpJhyizWI15S8QUfxkoSLr2w/gVQY3yGVEbBfI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=YzhV8eikAwiE7lehfKzv7yKkOTMtQ3PAGkhKkkyeUvyVGE6uUfKG0U92hMeRPDNs4
 Rbmne3k3lvQIMEoYb8df1WvGy8dXo3E6vCMPSPgvXAyHlrWFwodhcfwLY+k5OYAZbf
 zN3K4x0HmNz3vaSmBBuQApgsYS5BAM8Wut6kpflA=
MIME-Version: 1.0
Subject: Re: [PATCH v2] ASoC: meson: fixes the missed kfree() for
 axg_card_add_tdm_loopback
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653295.32160.11525321956420152528.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:52 +0000
References: <20200717082242.130627-1-jingxiangfeng@huawei.com>
In-Reply-To: <20200717082242.130627-1-jingxiangfeng@huawei.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134855_139554_BBDBAB61 
X-CRM114-Status: UNSURE (   6.84  )
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

On Fri, 17 Jul 2020 16:22:42 +0800 you wrote:
> axg_card_add_tdm_loopback() misses to call kfree() in an error path. We
> can use devm_kasprintf() to fix the issue, also improve maintainability.
> So use it instead.
> 
> Fixes: c84836d7f650 ("ASoC: meson: axg-card: use modern dai_link style")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> 
> [...]


Here is a summary with links:
  - [v2] ASoC: meson: fixes the missed kfree() for axg_card_add_tdm_loopback
    https://git.kernel.org/khilman/linux-amlogic/c/bd054ece7d9cdd88e900df6625e951a01d9f655e

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67557C433E3
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31D762067C
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vGtqcU7H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="svPqadyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31D762067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iPwlcjM0eRTmXRcZQISr5JaQhEeG58yqLnGu9UbfVdM=; b=vGtqcU7H0tVuaHlYRLOKXyAU1
	HJP1R6ML8JgMESAXyDLn+BO7Gb3UiYC45rVMvTVCro8Co0QIfa6SgMkReEijOQljzvmcHCL+y1vQv
	xnxhJojjXiUPgEAMJWAuDGYVBDfaxRCPBpi+iD/sx4HMvleUNwOK3LLsJUbrp5xY+qfYLGjPW3BeU
	Sz+3o4RT3qW4OHA0+asa2GHJrQsmjfLkuWksTy02P/MrAho2yXPT2BXU4KDcBIAGqEjKp9YVm3k/Z
	cv7Rhpo18zW9extLyHPsRo82TjQSteZDweZZMfD++tppwfYpsFRUKhoz/AJQYiGDabP+mq4dpQq9X
	e8XQdlV5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFp-00026F-T5; Mon, 17 Aug 2020 17:49:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFf-0001zM-0f
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686533;
 bh=vTKaSFp2abXmBZkNaJ8M7Cfyl1hbuskLq/i37fV2LK8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=svPqadyVHlCugm75ScTZQe/6unsjlIMxyZJtO4l2qBsP08F7d5C87C1cWUETGT+kW
 54PkD7PEWXMs2mr3Ti8d+WzAjA4TQ6tXJdaS557MCNhS7SU213k6MOymkRvGh4Y9O8
 0FwHknNQKDeq6i1vMAQZ6fm6N3y5exMfHi51OXAE=
MIME-Version: 1.0
Subject: Re: [PATCH] ASoC: meson: imply acodec glue on axg sound card
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653332.32160.70584435876415605.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:53 +0000
References: <20200617155047.1187256-1-jbrunet@baylibre.com>
In-Reply-To: <20200617155047.1187256-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134855_247500_1FC36503 
X-CRM114-Status: UNSURE (   7.36  )
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

On Wed, 17 Jun 2020 17:50:47 +0200 you wrote:
> When axg card driver support is enabled, lets enable the related
> internal DAC glue by default.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  sound/soc/meson/Kconfig | 1 +
>  1 file changed, 1 insertion(+)


Here is a summary with links:
  - ASoC: meson: imply acodec glue on axg sound card
    https://git.kernel.org/khilman/linux-amlogic/c/e50186e1dae67e070d4725b1f0b35b131969141d

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

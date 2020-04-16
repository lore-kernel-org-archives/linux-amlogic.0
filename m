Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A98C2BB55
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2422223F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TBMW1oea";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EX0zGfID"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2422223F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vOi83KGda82rzTnwl8J/+/9Ggzjy+NAn701fGPMMlkM=; b=TBMW1oeacPnVn1
	1R1zJ7eY6/gc1jQDyo41jK2P5dGhwMXnHOeEmjLhr7GkQNr0+YOguZn5pf2KlZOuUfE2OcZDdiwuH
	UcYjo8zCYaaTXPiSzFUHXbNUawgVolmaYnW5oz4j3vpfTslB02z1Fs14RZT99Qs65LSFGHDV7X/V8
	pHI7lsMjFiqsy8X1UZNfi6QDEFFLacrCP4hmRe6JTNzVsBaWOdUQRrYb2xkeOwE0Tv5WtVH0vl7Yt
	EXayNphp0C9QFGAPvuZSmj6CMKYlNrmZokFo7dCjJVTuDh9wJRzWAfnRXJ16C15Jb5N5BUAkIhvbJ
	ebMZ/tYpwQgZs5hLBX1g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP73t-0008O8-PS; Thu, 16 Apr 2020 16:08:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73a-000801-Jd
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053280;
 bh=GkFS8vpm3gwz2VgmEbcWyObtXD10apbu+GWSER5cdm8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=EX0zGfIDsds3s9tCYY35mUhHB40j84jBQM3bxMPwHXPmEUSc9um8FLsbcSwlQ3RJ0
 O60cRhMGKPsh/sCagasu7p1HAOzfDifYM9FVfz7raWSALJ9WeNmboUv1I64JE+xZOM
 FD/1VqhHMuK0VbJridNSpsNtLUBo6W9+t/Z62Ya0=
MIME-Version: 1.0
Subject: Re: [PATCH v4] clocksource/drivers/timer-cs5535: request irq with
 non-NULL dev_id
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705328070.8629.18096498875728864482.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:08:00 +0000
References: <20200312064817.19000-1-afzal.mohd.ma@gmail.com>
In-Reply-To: <20200312064817.19000-1-afzal.mohd.ma@gmail.com>
To: afzal mohammed <afzal.mohd.ma@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090802_679581_2489C8C3 
X-CRM114-Status: UNSURE (   4.76  )
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

On Thu, 12 Mar 2020 12:18:17 +0530 you wrote:
> Recently all usages of setup_irq() was replaced by request_irq().
> request_irq() does a few sanity checks that were not done in
> setup_irq(), if they fail irq registration will fail. One of the check
> is to ensure that non-NULL dev_id is passed in the case of shared irq.
> 
> Fix it by passing non-NULL dev_id while registering the shared irq.
> 
> [...]


Here is a summary with links:
  - [v4] clocksource/drivers/timer-cs5535: request irq with non-NULL dev_id
    https://git.kernel.org/khilman/linux-amlogic/c/470cf1c28d2f601ea666a96d676c10b09b2321ab

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

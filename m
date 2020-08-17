Return-Path: <SRS0=3lRj=B3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2195C433E1
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DB4620716
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Aug 2020 17:49:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="POc3QUEE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NUVvy4Hn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DB4620716
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MY9M1xDoAP6U6MB7UbMATZVbT+Al13/pws6njZbimdk=; b=POc3QUEEcpGqycMTes//QVbBT
	XV3VoILbeYJqMXQnOKNpEqYz+C9I4f49XUH6++1KDSukxjtzv3/4JCyEhV2z4Y18g2N9HW3Avg2w6
	uMI0K0x0Kz1PcwI2gXXsId/wDcWJEtqVaG+vdP/Dbd8fjRadLWlFF5M+n9/pxpXePL3kJ3UZ5dq73
	MUIoauYNO3K5ohdtdwrs3yKH4Ra7qQ5pcLTOBqwjHHtb635zIj4VBnEHXdjhDwPEiy/ASateuYf23
	cXLxC8GA6TRraXLuDFrC+vlhmufqHcBl+ndIadc1OH4Pa33+ZcK23aE788mW+riuKy9fAhc5+DJoH
	Cf0JGkveA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7jFg-00020q-8G; Mon, 17 Aug 2020 17:48:56 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7jFc-0001xP-Sd
 for linux-amlogic@lists.infradead.org; Mon, 17 Aug 2020 17:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597686531;
 bh=zBDjgZ8zX1vXjHYk6HOV0ZJUbL3GitVVi6aGxI9gobU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=NUVvy4Hn8DBvITfLrQ8+MrhbkJs82uJIChgxfneerapjdc1E5qh3VnlkHkU1lEmDr
 sPxur3UkGM8XBvxHltbAelIZ0kSXJus+NnrytT8uoooUUZYKVWTbnGMXVCtcQX2lOU
 EFcjaABIGFLgE2CeUG9Y6zkU9PDS8qJjStg3r1FQ=
MIME-Version: 1.0
Subject: Re: [PATCH] [v2] pinctrl: meson: fix drive strength register and bit
 calculation
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159768653144.32160.10350237872763117083.git-patchwork-notify@kernel.org>
Date: Mon, 17 Aug 2020 17:48:51 +0000
References: <20200618025916.GA19368@home-desktop>
In-Reply-To: <20200618025916.GA19368@home-desktop>
To: Hyeonki Hong <hhk7734@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_134853_018883_29874E94 
X-CRM114-Status: GOOD (  10.81  )
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

On Thu, 18 Jun 2020 11:59:22 +0900 you wrote:
> If a GPIO bank has greater than 16 pins, PAD_DS_REG is split into two
> or more registers. However, when register and bit were calculated, the
> first register defined in the bank was used, and the bit was calculated
> based on the first pin. This causes problems in setting the driving
> strength.
> 
> The following method was used to solve this problem:
> A bit is calculated first using predefined strides. Then, If the bit is
> 32 or more, the register is changed by the quotient of the bit divided
> by 32. And the bit is set to the remainder.
> 
> [...]


Here is a summary with links:
  - [v2] pinctrl: meson: fix drive strength register and bit calculation
    https://git.kernel.org/khilman/linux-amlogic/c/f088ab6d4f4ce49d422c220074b7e605f54e2299

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

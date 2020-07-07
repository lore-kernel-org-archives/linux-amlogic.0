Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837F9C433E6
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D5492077D
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z1QTe9mc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZMqNXD5q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D5492077D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2MVQuSJnSR/Hfc1eRhXxVH20L4CHwSboUVUmdoJVibg=; b=Z1QTe9mchj+Cl+cV9YtdTW+KP
	BfyTz09gvqbE+coc8T8zag+pi9eyhMsh+IPnKF34+14XcMVygrwsdcat4PDzDhcz/ovzU1M7m039U
	lEtKJPOAoIetvxzcS3Vow9VV/k38CHh0+Qf7sx/zTAyu1B1z+Tk4NxrgTqfoT43iRHH/kUtMv/HF4
	Guoi43IyoDnia/BYXPSmdCxdNPWFXD3+ZOxHFqlZ1cMADmI7XenxrMEvWLf9TNAThuI4wBg+1+iE5
	TGuFbzOiI8HWGdj+Gt507xzVhtQKvWul02JBZ9cylG2nBvNudtMzDDsWfe5sgF2+D35YonkmaCDyn
	Lw9nbTSPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgZ-0003LA-3G; Tue, 07 Jul 2020 18:51:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgS-0003Fu-EZ
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147871;
 bh=R33oTxUysn6gMkAvBlcBEH8U5Ie3Senv7A/vIoIMRp8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=ZMqNXD5qDE+ebjRcmY8W/Ln+cXXglas8FMENjiIaWRTzBWZnqTXoSJQs8wK58irJS
 7rg890XGAPsEoCSAwLwFPB4WA8oM6ssGmHoPyiZnsfJ8jUVyyR5OURp1nALcfuzQ1R
 zlKCggc2eTPiUClEgTjWdFJ5AqIVV+sR7ToQlpn4=
MIME-Version: 1.0
Subject: Re: [PATCH] soc/meson: add missing free_irq() in error path
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787130.3387.10143674301757185414.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:11 +0000
References: <20200606153103.GA17905@amd>
In-Reply-To: <20200606153103.GA17905@amd>
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145112_586772_A762FD84 
X-CRM114-Status: UNSURE (   4.00  )
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

On Sat, 6 Jun 2020 17:31:03 +0200 you wrote:
> free_irq() is missing in case of error, fix that.
> 
> Signed-off-by: Pavel Machek (CIP) <pavel@denx.de>


Here is a summary with links:
  - soc/meson: add missing free_irq() in error path
    https://git.kernel.org/khilman/linux-amlogic/c/3b8a299a58b2afce464ae11324b59dcf0f1d10a7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=TbEC=5B=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16C3CC0044D
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 17:01:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0D822051A
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Mar 2020 17:01:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="opEIKn28";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="L/s6c5+s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0D822051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VO+xB2Y/DYXGipRSnVHcVkPphjkkjyBRzGRD1jkpow=; b=opEIKn28epk0Pe
	lOGI+wffzrtAtuNzVGRTJHzSfxPCJePzWbWYtS7IRJwgpDa8CTJKIH8G2PivItzHFsHYpCRbF1rii
	zMlkP70NoyryBVka40NRBfFB13BGJS0zsCkDOnqO2rd4dsZMNICtah5jAQosP3tmgnEFWXtJAMhxF
	Z6AEN0mIHPRk+D6vygAdDzLQFgcWHiNafhWGljJdZtCztXoRLfsozqzgKOeeDsdmIQGA/YN/WEUJ7
	00yJi877nCjRY/sbOaECRsBeA0R364UN2s7MTJLiwLfioI82NlBzSZjXqcwBb5g0Oz2pBhRF/1rZq
	reUSjcFUWksPRFtXr9oA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDt7M-0004iN-UH; Mon, 16 Mar 2020 17:01:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDt7F-0004a2-Df
 for linux-amlogic@lists.infradead.org; Mon, 16 Mar 2020 17:01:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1584378084;
 bh=JCiTstb0VZnCAxPCqyNtYtlZ2s+ICQalYyW7IpJ7Als=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=L/s6c5+se3hy4QwR05gIQX7TBJwxFMVWsMvoseKMVZAuPRu9l+slKeP0L7nw5zVID
 k/jgvtyNcqtGz+rpdSQjgfOh/7PE7P5KQZpVmWf05sUHrML6zxxwoddYoGl+6/lKYt
 Hc4B47x6zowACpIslw7YLfY5cWhRBA9mFHtoFApQ=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: add thermal zones to meson gx devices
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158437808472.6061.1206265096028871062.git-patchwork-notify@kernel.org>
Date: Mon, 16 Mar 2020 17:01:24 +0000
References: <1584328854-28575-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1584328854-28575-1-git-send-email-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_100125_500488_E8D4CC3A 
X-CRM114-Status: UNSURE (   5.49  )
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

On Mon, 16 Mar 2020 07:20:54 +0400 you wrote:
> Adapt and update current VIM2 thermal zones support so that zones are
> available on all meson GXBB/GXL/GXM devices - similar to changes made
> for G12A/G12B/SM1 devices.
> 
> Suggested-by: Nick Xie <nick@khadas.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson: add thermal zones to meson gx devices
    https://git.kernel.org/khilman/linux-amlogic/c/cd13d5f115f91065319c7604132d14db7048391e

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

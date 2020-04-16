Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2890AC352BE
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E67AB2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u7Rw19tJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="XIo6Ru5r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E67AB2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AdmRsI6fIzs1MrppKG8kbla1WTDtCT24/kYNbLB76E=; b=u7Rw19tJlxwcQq
	O+9jyrpJckD5AEmLvn3cSP4vTZoSUVffdoEppcZyhKS/C0nrHoLluaETPGoDqBfJIJkpppu+L+VFN
	Y0iW1fXY1w2uLbHDKfjW5X51Paw/tKftK0ufGUrvg23YDB1CbcoQGtQYhHJ4yEnMKMcBDIkAA804z
	DE8C/Nrt3MU1tYKvHEb/TnxP0MleS4IE4WUFyklg2doVos4/xLPMkpc0JRd0jtp69e/ebXA1nDH2I
	HpJQhQyyO6nVi/H3tZJE45Ez+JtbIZMwnjaIZGah6OW3p8SUmMiSAIT1BO4Fi8TAVrQDEV6zXFcPe
	sPW5QdJihkq+d8dVgoKg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP748-0000Fr-PU; Thu, 16 Apr 2020 16:08:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73a-00080c-Vg
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053281;
 bh=+TeO7/vSiNuskt76zVMA/NjLLF/zuYvcvtMXtff0aOU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=XIo6Ru5rsCdFanIEefidhfuwYf0IN7UMggB3Ew5/mhvpsQT7ewKl7Z2F2e3npdV/C
 x5Pyvx01zOmSGLU4AzKb9VVuuHFt4BZJr8sDP+4hICs5LKP4IM50UXVm3paTT1oUm4
 spjNv4pOVyWtxjaJemqXdIACFfONTaOzinTs0K+I=
MIME-Version: 1.0
Subject: Re: [PATCH] pwm: meson: Fix confusing indentation
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705328193.8629.8373147774155980332.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:08:01 +0000
References: <20200314113524.23031-1-krzk@kernel.org>
In-Reply-To: <20200314113524.23031-1-krzk@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090803_101302_6BEFCC0A 
X-CRM114-Status: UNSURE (   5.01  )
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

On Sat, 14 Mar 2020 12:35:24 +0100 you wrote:
> Fix indentation of return block.  Smatch warning:
>     drivers/pwm/pwm-meson.c:139 meson_pwm_request() warn: inconsistent indenting
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/pwm/pwm-meson.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - pwm: meson: Fix confusing indentation
    https://git.kernel.org/khilman/linux-amlogic/c/b33d232e6112aa175f08e8105de0a4da14f5dcbb

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

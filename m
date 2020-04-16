Return-Path: <SRS0=I4qu=6A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AD6BC2BB85
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED7DB2054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Apr 2020 16:08:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="swMw9jMM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="bk9442uy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED7DB2054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apPJZ7Q4RvE2k3IiEyfjL4mZA+ZmCT2KQHW16ZGWk1Y=; b=swMw9jMMd544No
	BKMY99MlBGtHhgxB3HDbOBf0rjOw9Turq7xVM3X5qqUZ8KK9xiPx2pg1NEBG2UCiI2W7eQt1JBVRF
	PkXdWFcjAHyR2zL9xgShWp/aSjJ5gMfZXSJMOJBJmr914yCxehJkkrv1SJasAuN9f/+1WRn0Q6dzS
	vaM3d7iBmSeKcQWUt1ZEX97fPDLLCthFn63/ioKbf0oa9rvwWMuyyLnPFbCA6vkOUmD7F2qkK1aLZ
	geT5kJUSpOILUuSUDTX25FJSpGq2UTdvbhKqdwiO039jsJ8IaMTEGR69ncGfqKMjPSl6NIEbzKHCr
	kp5v9mIsgUF5RxGijy9g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jP74A-0000Hr-3b; Thu, 16 Apr 2020 16:08:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jP73b-00080p-At
 for linux-amlogic@lists.infradead.org; Thu, 16 Apr 2020 16:08:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587053282;
 bh=oaJIqHMZqvc1engVyg6G6VTOCVD2R0ywue3b3yU4V7g=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=bk9442uy7ADepsCcJfpbcAhC6tGtEGO8PFEvyofoFo8MctcG2T5UplgwR05sxbS5r
 OZyK9GZmT+3mmq2apqyfyaQUQnbX5mVkLVKlvS+EvDouSoqW43jH4PwMAjV+NSR6Mg
 Pg3QcZxdw5UuKJ/3fYHlaD2flyEw+W9FpL4i4P/Q=
MIME-Version: 1.0
Subject: Re: [PATCH] dt-bindings: display: meson-vpu: fix indentation of
 reg-names' "items"
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158705328229.8629.13597607288536223329.git-patchwork-notify@kernel.org>
Date: Thu, 16 Apr 2020 16:08:02 +0000
References: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200328004157.1259385-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200416_090803_409377_45E15136 
X-CRM114-Status: UNSURE (   5.68  )
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

On Sat, 28 Mar 2020 01:41:57 +0100 you wrote:
> Use two spaces for indentation instead of one to be consistent with the
> rest of the file. No functional changes.
> 
> Fixes: 6b9ebf1e0e678b ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../devicetree/bindings/display/amlogic,meson-vpu.yaml      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)


Here is a summary with links:
  - dt-bindings: display: meson-vpu: fix indentation of reg-names' "items"
    https://git.kernel.org/khilman/linux-amlogic/c/33b0cb370f97ebc5a722c2cf50821e8322267261

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

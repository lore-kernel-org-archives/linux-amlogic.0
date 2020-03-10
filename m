Return-Path: <SRS0=sHZR=43=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96198C10F25
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 00:41:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 598BB2465A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 00:41:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVhCY+Wk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="KssrSe55"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 598BB2465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mj4KK5exObKM+JrNHv89ooH915guxr5ctXfOL7Tq2lw=; b=mVhCY+Wk1f3PRj
	ZxN1Z42hgMLCMRo0YHlbtLnUqDjE5XgugXEPVXBAUnF8aEvrkXs31zXekjHxfmkzTXVJkg2ZldZon
	+dPzOQLJWxByqHJNdQ24UKPs0gAq6jE8JHb5vRHGY3SoVgofKBfVxjKQU+cEQQdrw5OtNpn01M3dQ
	UDGsxlq7XNSDuex8Ar8gbUc577binO4Z6MY8t6aK+mDOApCCzHqzT83XVlxAMyNmFd0KOSweiqUnI
	NjfHS5FO4810kI6oFFoD5ic3ckI6BSaQahMqR6I95/WTTvoNpsBwnSPAanpPSf9DAS+7RJ0edc8Ky
	4LEjfYtuPzYMIr6Gyvyw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBSxi-0005Fg-31; Tue, 10 Mar 2020 00:41:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBSxf-0005Eq-7i
 for linux-amlogic@lists.infradead.org; Tue, 10 Mar 2020 00:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583800889;
 bh=g2UHlmekT5PjoisKWFyQoTbMh/4310qawpnph6dlphs=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=KssrSe55egqoHbic8a9mVpDjfS7bVXEBEXme5YWgLZyKsatYiqSrfWSPSBR71T26k
 n0RzXfRFauY781yg6w90rpVF4h7RUpzQSgMBYmgcZRwfyain+D2u3AaDOG2UFAJt53
 yeMnRdtYRCXNpldA/JAvcHReAtL1BP5Vhl5O2+J8=
MIME-Version: 1.0
Subject: Re: [PATCH v2] dt-bindings: power: Fix dt_binding_check error
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158380088899.28846.16980509823249057799.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2020 00:41:28 +0000
References: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
In-Reply-To: <1583164448-83438-1-git-send-email-jianxin.pan@amlogic.com>
To: Jianxin Pan <jianxin.pan@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_174131_302310_40202F60 
X-CRM114-Status: UNSURE (   5.75  )
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

On Mon, 2 Mar 2020 23:54:08 +0800 you wrote:
> Missing ';' in the end of secure-monitor example node.
> 
> Fixes: 165b5fb294e8 ("dt-bindings: power: add Amlogic secure power domains bindings")
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
> ---
>  Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - [v2] dt-bindings: power: Fix dt_binding_check error
    https://git.kernel.org/khilman/linux-amlogic/c/d85eed038ef4919933b7f4f9d3b4f49ede4092aa

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

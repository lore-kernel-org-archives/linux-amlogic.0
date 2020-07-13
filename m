Return-Path: <SRS0=9eFL=AY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C6FC433ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 412BB20663
	for <linux-amlogic@archiver.kernel.org>; Mon, 13 Jul 2020 19:21:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gvh3m/dC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="xOsM4Ntf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 412BB20663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8AUjJXaQdiorydE/5XrcbeWEoCDd59ncgPDQJTv4SAI=; b=Gvh3m/dC330T61bpejtVu6oZZ
	Hs/Rm4W4rXV2yOgKHPp5+aGhvcikYwTYvhh1LsnnITd7QXm31VqKt8wazpm/hSZV+dkedNKXoUYEn
	K5MPNCt/zvCV4qkRd0FsYAIr5d/SqhkuvwzAuFuJX2Xr0IrGslI4MmB+hspslrJ5MwACxWdIrlxvJ
	fW+pAgg/7YcSyYM7js+gBHtaPk9Nl2VajEhcIYsk3VkEPuw8YuO7Jy06/MNNlHxm7x/smK0xg9R9s
	C1TfFCuiX16udE9Y3pkfuvwLA5caXqsxwNgxVXFzzG1CC6Gq3Si7Rlu/4Lfq3rcfTcr8kXtf58Ljt
	M59EYocWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv41N-0005Zo-4z; Mon, 13 Jul 2020 19:21:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv41G-0005Wx-Uf
 for linux-amlogic@lists.infradead.org; Mon, 13 Jul 2020 19:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594668100;
 bh=nnbX+na1OSWyTWKsGYkB81mpv0e/hT89VndkBbsJzMI=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=xOsM4Ntfn5LwD9RisyhW4vqBLkI+5PLeBj8RsbbzyIqTPIbsveMvL6Osw5haAjD8V
 Hi2dbo6ZQ4SddBJXrG1WYtApX+KnV4lrCJDwgn+7pvttBqNT7M7vMV7VQpiSHCg5It
 Bj8buJcczr/i5NYuA0ShrMWyDV423zZ3Dopey4vQ=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159466810081.23057.15311593036082416157.git-patchwork-notify@kernel.org>
Date: Mon, 13 Jul 2020 19:21:40 +0000
References: <20200620161211.23685-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200620161211.23685-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_152143_088465_1DF121CC 
X-CRM114-Status: UNSURE (   4.36  )
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

On Sat, 20 Jun 2020 18:12:11 +0200 you wrote:
> The "amlogic,meson-gx-pwrc-vpu" binding only supports the VPU power
> domain, while actually there are more power domains behind that set of
> registers. Switch to the new bindings so we can add more power domains
> as needed.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson-gx: Switch to the meson-ee-pwrc bindings
    https://git.kernel.org/khilman/linux-amlogic/c/5273d6cacc067e7a8552e29cabddb4934f4e05b7

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

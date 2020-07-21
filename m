Return-Path: <SRS0=nSb1=BA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4558C433E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:21:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D85520717
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 Jul 2020 21:21:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p6veOp6T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zYXSip/J"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D85520717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YSlGLbGXKIj0EDbAjErp7dPjOUWCrzlfSuhn6LN8ZQg=; b=p6veOp6TE+aGvTmoIVuXnRIFs
	LzUiNWLG7JK5cQSHXZ2svTCeJaEn1W++U7DeqrcpbXSMa4HXxvm9T60R4ZxdFNl7CvFXTppJ6bKux
	ipvxfQC09MaWF7HQnWILsk3LG8QTpPAntPm5MR1/da0SYmEcIomMase3lW5JeWSdUDbnstBbhK1ML
	qjWShjDF2VJcNW/q41uQjs5L7JDGDLEwQMy1XlWR5uvzSAqI1eTfH4xyhuuQcpisIli8dPwxEns9x
	JK3b/gJJ96g4J/KoyStz4mvgci8P88K2NBOn1X1fsQwFPpINDWjxq1NtmpSwAqzwU8j5bTTwscb0u
	lgESXXsvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxzhZ-0004Pq-Cw; Tue, 21 Jul 2020 21:21:29 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxzhW-0004OR-2p
 for linux-amlogic@lists.infradead.org; Tue, 21 Jul 2020 21:21:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595366484;
 bh=sv7gtsfgA7493APmu5Nh3EFEVYImpy2N9oYVLpi8ZGc=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=zYXSip/JuR6JWFfJqpETi+FLXhO4B2dSm296xWttsHM74OncUUPafHrp4+UfRIvta
 Uc2UmoPauSHTBUNexjs+F587e3E6w6EIFbrSQHYOw2BOdh4Dsqwr0HTqwjGmAjn3sW
 f8vXMUQqrHrKUrfdZFAfwsrs5VSPmXXhnKItJZeg=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson: update spifc node name on Khadas
 VIM3/VIM3L
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159536648487.12155.2101451718778097710.git-patchwork-notify@kernel.org>
Date: Tue, 21 Jul 2020 21:21:24 +0000
References: <20200718054505.4165-1-christianshewitt@gmail.com>
In-Reply-To: <20200718054505.4165-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_172126_210105_B38FD77A 
X-CRM114-Status: UNSURE (   7.78  )
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

On Sat, 18 Jul 2020 05:45:05 +0000 you wrote:
> The VIM3/VIM3L Boards use w25q128 not w25q32 - this is a cosmetic change
> only - the device probes fine with the current device-tree.
> 
> Fixes: 0e1610e726d3 ("arm64: dts: khadas-vim3: add SPIFC controller node")
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)


Here is a summary with links:
  - arm64: dts: meson: update spifc node name on Khadas VIM3/VIM3L
    https://git.kernel.org/khilman/linux-amlogic/c/d57c69ca6d4ab890e8edac5c8e10c7c2b54d500c

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

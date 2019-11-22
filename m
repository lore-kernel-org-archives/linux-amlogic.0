Return-Path: <SRS0=YewT=ZO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66726C432C0
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Nov 2019 00:01:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 328D42068D
	for <linux-amlogic@archiver.kernel.org>; Fri, 22 Nov 2019 00:01:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QaWCN9dm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVIIl18H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 328D42068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hm0JH3+P2wxy43h0RZro9fe6eNWOps1SNffNEXbjp68=; b=QaWCN9dmkq03Cw
	iL29gFLI7LCaud2+i4AWXVo2Z8Won1tgzB8ytZAUQX7FpJwSqXf+KvQqaTkQK5vdWHxavWFR7eDm3
	BsGB2bKuxZfctqpvvzviW7yTB6WPBq7x0gHTSC9DYD2d7pdsKvJ2wEYTVT/zPaTyczU6k491Bdg73
	IPZ79058rpoGUqXFVfJm9leRXZY/93j8V0F1v9hwQENedNoJZQgxhFa7oLiVZOU4gJ9jP6GPJotwl
	J1d50zCVtDlLeIynC2lKIi2SpSYnJVewg3AfkSozUHNCbJlkKFS/woRx85DhV8gQz0QM5zHz+3+I1
	fxQa1Y7xXwlGNmTIywDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXwNp-0002Z2-2s; Fri, 22 Nov 2019 00:01:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXwNm-0002Yh-TE
 for linux-amlogic@lists.infradead.org; Fri, 22 Nov 2019 00:01:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574380865;
 bh=9V/xvFDO9A+9OROmaWx1hR780DwqaTjtrD3UMe3N4wg=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=iVIIl18Hty7+FmBoP1FaX0O73+diHRiFpPxcDWT/Fx1gKfOe2AiSOLr8fUnr7DAZX
 TVR0CWECMtyyS9SEDk+2kT9dBR5Iho+6XnTwmKXWKc3Ik7o9+WJuIxzG4Qa47ZI8U2
 HQ+I1gsXhDro5dWXDKP8eHqZyAuUUxdu21NrMatw=
MIME-Version: 1.0
Subject: Re: [PATCH] ARM: dts: meson8: fix the size of the PMU registers
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157438086581.29665.3104406348109026380.git-patchwork-notify@kernel.org>
Date: Fri, 22 Nov 2019 00:01:05 +0000
References: <20191117154154.170960-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20191117154154.170960-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_160106_967647_F70F0AEC 
X-CRM114-Status: UNSURE (   6.07  )
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

On Sun, 17 Nov 2019 16:41:54 +0100 you wrote:
> The PMU registers are at least 0x18 bytes wide. Meson8b already uses a
> size of 0x18. The structure of the PMU registers on Meson8 and Meson8b
> is similar but not identical.
> 
> Meson8 and Meson8b have the following registers in common (starting at
> AOBUS + 0xe0):
>   #define AO_RTI_PWR_A9_CNTL0 0xe0 (0x38 << 2)
>   #define AO_RTI_PWR_A9_CNTL1 0xe4 (0x39 << 2)
>   #define AO_RTI_GEN_PWR_SLEEP0 0xe8 (0x3a << 2)
>   #define AO_RTI_GEN_PWR_ISO0 0x4c (0x3b << 2)
> 
> [...]


Here is a summary with links:
  - ARM: dts: meson8: fix the size of the PMU registers
    https://git.kernel.org/khilman/linux-amlogic/c/edc0da604b716951a83c75464f793e0329a0f87a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

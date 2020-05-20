Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADECC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F1F620823
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kgy+17DU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="nYbBH5nL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F1F620823
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aHtqO8HWOFUvBYpsiErBTCIS/9T/uf6EbO0saZElBPg=; b=kgy+17DUGoBGia
	LmN2eROI4IK+iCO2DqABXdBHpBdXtC4d60hBY2OQ2r5iZMi/rCnTj+YxlI1uKBFpg4LLSnQCO1j0g
	S8OYi9NMzvOrPg697fqr0FLPVOLWbJ/qX4YUN3pKZ2mgmNgurRIo5P9rrBDwlwL+Sjb9A7YYYb1cJ
	eV68L84Mn1RuzdtaDdco+YkNyyXJhj1tbBeUUqjOFsuCOvHU60RUJZNW1uBakmm7YvUNI2IJGmwX9
	300AVVJfEU48mp+pEPWIIRglI1v2h+aL5+oULjimFRNO//AFCZVZ7DNkIwEAtDTUCzsZEd5oHtCJP
	WJJDS8K70kbUiTV2GgEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCAy-0005Xl-GW; Wed, 20 May 2020 00:01:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCAt-0005SG-MO
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 00:01:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589932890;
 bh=0PY4KFegd0cSa6am+eK1kKKnl3TR1uOJyIHSv1GJlS0=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=nYbBH5nLu1TlNpRq2kvHm1KBU+WuriQezUuzUFI2aCFm/fFerIUgTSQmT+vo/XSBK
 sRjpgQIz6agve1fXBi9I/pA2W29/lFbTGmadZXDpmHj7I9c0Xj4sccG8WQoDdv55L+
 tiUQoH+NwKLN4Gyl4q9Gv6Kr1AVgD/KuDCk3M3zg=
MIME-Version: 1.0
Subject: Re: [PATCH for-5.8 v1 1/1] ARM: dts: meson8m2: Use the Meson8m2
 specific USB2 PHY compatible
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158993289051.29142.16695186705748994313.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2020 00:01:30 +0000
References: <20200515202520.1487514-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200515202520.1487514-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_170131_778235_1A5B26E9 
X-CRM114-Status: UNSURE (   7.10  )
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

On Fri, 15 May 2020 22:25:20 +0200 you wrote:
> Use the Meson8m2 specific USB2 PHY compatible string. The 3.10 vendor
> kernel has at least one known difference between Meson8 and Meson8m2:
> Meson8m2 sets the ACA_ENABLE bit while Meson8 doesn't.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> This has a runtime dependency on the meson8b-usb2 PHY series from [0].
> That one is queued for v5.8 so it would be great if this could make it
> into v5.8 as well.
> 
> [...]


Here is a summary with links:
  - [for-5.8,v1,1/1] ARM: dts: meson8m2: Use the Meson8m2 specific USB2 PHY compatible
    https://git.kernel.org/khilman/linux-amlogic/c/f5a7382d6f176e29e4fd9d733b93d5b93771a7e4

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

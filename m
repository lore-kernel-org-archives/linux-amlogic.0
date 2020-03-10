Return-Path: <SRS0=sHZR=43=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88808C10F27
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 00:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A0672465A
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Mar 2020 00:41:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BAgr+aKw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZjwB45u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A0672465A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdTUv53AXx3J3MAVwoQyoiFwTTOjO5AP7gLNeCi672A=; b=BAgr+aKwmN9Bnr
	nZxOu/37PQZl+AAhMveFxgIR2jD/rdIBevfx+5NJocGmDCdVl8/Jcj+ILm7GZtXeNdRy/s9s2YZDa
	T89T8JQ7Ar9tQXhb6eUZL9W8RNGr9z4EXe9eCfU0/4/vXu+OSM+j9AQvW4Mrg4mWWVB7gq95Xyp64
	yDetIa09IZHRYB/CY8KL3nvUJFC1Dob9iiNWi7BwbgoCHBRjd6L6c5uwWQEhVRSWzugXWaAYTemP8
	K7dCq9CRpJsYky3jZLYMVDJGDCH5OmnwNXfr2nxSbhkelweQayrjZH86R96GTqKCWGvRVvt34hOD5
	zdMuEllzjyQsNQ6FjnsQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jBSxi-0005GA-Jz; Tue, 10 Mar 2020 00:41:34 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jBSxf-0005Ec-7j
 for linux-amlogic@lists.infradead.org; Tue, 10 Mar 2020 00:41:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1583800888;
 bh=rm3lAajHPv9+wNcJDjueQym09wrxuyM/RVyhaWSx0bw=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=QZjwB45ulKOtCXTNTkFziHb3TCixp2lVtA/tgHS2Elyf1j2HDrm0ZhDVHSb20zi5c
 Q7XxUf68I+cXepJCfVz6aEqoluBvNYZBCqe5NBiI1IBRrZmBuDBHRfSmFcrARD2JhD
 T51RmVQPixNiRdFjLsM2h3J0g3IJqC6QyeaRzlQ8=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-g12b: fix N2/VIM3 audio card model names
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158380088881.28846.15862825585539997467.git-patchwork-notify@kernel.org>
Date: Tue, 10 Mar 2020 00:41:28 +0000
References: <1583135051-95529-1-git-send-email-christianshewitt@gmail.com>
In-Reply-To: <1583135051-95529-1-git-send-email-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200309_174131_302514_28BF89CE 
X-CRM114-Status: UNSURE (   5.27  )
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

On Mon,  2 Mar 2020 11:44:11 +0400 you wrote:
> This is largely cosmetic, but Odroid N2 and Khadas VIM3 are G12B devices so
> correct the card model names to reflect this.
> 
> Fixes: aa7d5873bf6e ("arm64: dts: meson-g12b-odroid-n2: add sound card")
> Fixes: c6d29c66e582 ("arm64: dts: meson-g12b-khadas-vim3: add initial device-tree")
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson-g12b: fix N2/VIM3 audio card model names
    https://git.kernel.org/khilman/linux-amlogic/c/57b57ebc3f338a7c5cfc41d6577ff72aa3677e38

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

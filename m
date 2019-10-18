Return-Path: <SRS0=E9O4=YL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECEE2CA9EA9
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 18:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C46A820820
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Oct 2019 18:21:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iR1VsLL6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UK3H76VZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C46A820820
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+NXf6uaURr/sKrMWR+F384OZffLmS8rLNijed803PHI=; b=iR1VsLL6pvuwsb
	GYW1eA/lqdJA9LDFOHmXcL8VJU54Mz26vh/RTQiJFkJ8T/HJiLIwjclvnvTrOul9kUHlplRiUx/DO
	vxdLv2kbiEV4NrPce87lgXtSWpaCoErFOt9QdtvGO6L7sExsfA2y4TyUDNspFrEu3jot7mmmsH/ur
	m/kRWMcvxVhMLIqT1sKh5qnS4DPavREFap0BplxEFFQKPifcthd+GVyU9FCBDHR2jbCMCl+39X+vW
	2QVO2nY32SgtvwOPs55RbKK0LaMJf9ov7/BoRcP78WBaIN8+ZtSAbXUrVErvKK/b6nNOTY4ZuuHMe
	lbbE792KD9hfQd0Zp8KA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLWsK-00037e-TH; Fri, 18 Oct 2019 18:21:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLWsH-00036v-Ug
 for linux-amlogic@lists.infradead.org; Fri, 18 Oct 2019 18:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571422876;
 bh=4kvAoHuIv/D5xFeTZ0woSuZDfT43MvHg9yaFs4dgOdU=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=UK3H76VZUEOstQHD3ozBKzd7SW4YjIUbTZahmBMnPozz7b2EXNq6Ro2GdhSp/44Ot
 HnQ5OwPNMhL3rArNveIOZOk/CKL+eTSST5/u3SuTvTkpPqIuXRe0b1yjpGtPIb2e5j
 BKJhQ8s9DqIjY4BGALB4nQO37/dT6s/JDwIFbg/g=
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: meson-g12b-khadas-vim3: add missing frddr_a
 status property
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157142287693.4978.3071363286518113740.git-patchwork-notify@kernel.org>
Date: Fri, 18 Oct 2019 18:21:16 +0000
References: <20191018140216.4257-1-narmstrong@baylibre.com>
In-Reply-To: <20191018140216.4257-1-narmstrong@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_112118_007493_A1C43332 
X-CRM114-Status: UNSURE (   6.65  )
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

On Fri, 18 Oct 2019 14:02:16 +0000 you wrote:
> In the process of moving the VIM3 audio nodes to a G12B specific dtsi
> for enabling the SM1 based VIM3L, the frddr_a status = "okay" property
> got dropped.
> This re-enables the frddr_a node to fix audio support.
> 
> Fixes: 4f26cc1c96c9 ("arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi")
> Reported-by: Christian Hewitt <christianshewitt@gmail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> 
> [...]


Here is a summary with links:
  - arm64: dts: meson-g12b-khadas-vim3: add missing frddr_a status property
    https://git.kernel.org/khilman/linux-amlogic/c/d5ad6db3742bbfb6d224704040ceab3a4efcdc6d

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

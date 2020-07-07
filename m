Return-Path: <SRS0=38i7=AS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F691C433E5
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A27420773
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2020 18:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mUs2dxoi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JdeyNi9G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A27420773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:Message-Id:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mJIJmfEdlgvlUOsMRsjLcDeAsKtRjJBzvJMLbF4H3Sk=; b=mUs2dxoixhaymctaxRGb/+R0f
	PRtMjR2t058gxGWj6J3CBr1EwlOmYdkBYo3QzLM+r93Xgf8FFAyFJ9g4DsYgZz32DsindUr7rDVez
	Jt1ZoWVDmEtAII4yfT2t5JCvkx079h/2WosEsKkSta03QuKAxxUEOH5Db4mrvsa1MJaS22Jc5zySA
	BPaPkmArl4GvutlpS1ab56oo434k/dFUYNmrwqcSs5yjcdUY5JdJEoON3llP7p1QJdgcsIYtpmpD8
	8Xgv1Vu6tairRutDn+vd1u9oISiZe2NmoGRLq1+g88j39k1kpZv1bKuiR9f2zaCKUiz8DNZi5O/g/
	/reM3z/TQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jssgV-0003Ir-TF; Tue, 07 Jul 2020 18:51:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jssgS-0003Fr-7Z
 for linux-amlogic@lists.infradead.org; Tue, 07 Jul 2020 18:51:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594147871;
 bh=uH8W8L97sjGc4IDKqXvf1VAOL2GTyGSSjnFTycUayV8=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=JdeyNi9GoDd/8A4w8kxpiEdcCvSyzNCgC/1nhSGJKm4ToVaWiuYA+VV5Y5y0SBQUR
 Ohu0LXTKVdNSqojveYKylvzkAmRv1yAsEzBrWg9q6XdFFTbrdxuqoGeVjdOlRNCpxD
 HR69cCusxOCR/DJK+FbYRiRj+XZRcYBXQfCUw/YE=
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/6] phy: meson8b-usb2: small fixes and improvements
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159414787111.3387.14781528815301767448.git-patchwork-notify@kernel.org>
Date: Tue, 07 Jul 2020 18:51:11 +0000
References: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
In-Reply-To: <20200512222424.549351-1-martin.blumenstingl@googlemail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_145112_381155_0B9F314F 
X-CRM114-Status: UNSURE (   7.35  )
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

This series was applied to khilman/linux-amlogic.git (refs/heads/for-next).

On Wed, 13 May 2020 00:24:18 +0200 you wrote:
> This is a batch of fixes and improvements for the phy-meson8b-usb2
> driver:
> - convert the existing dt-bindings to json-schema and add a fallback
>   compatible string which is already in existing .dtsi files
> - differentiate between Meson8 and Meson8m2 using a new compatible
>   string for the latter
> - simplify the code by using a MMIO regmap
> - set / unset the IDDQ and ACA enable bits depending on the operating
>   mode (and for the latter also the compatible string)
> 
> [...]


Here is a summary with links:
  - [v2,1/6] dt-bindings: phy: meson8b-usb2: Convert to json-schema
    https://git.kernel.org/khilman/linux-amlogic/c/41e291904a10233a8f42364ec3f18116de026ab6
  - [v2,2/6] dt-bindings: phy: meson8b-usb2: Add compatible string for Meson8m2
    https://git.kernel.org/khilman/linux-amlogic/c/2c0dd8440312b77b42f8e27fd751015dc8f519ff
  - [v2,3/6] phy: amlogic: meson8b-usb2: Use a MMIO regmap
    https://git.kernel.org/khilman/linux-amlogic/c/de143a40fa7d0acae4295c3b312ec96cc8dd9cd0
  - [v2,4/6] phy: amlogic: meson8b-usb2: Don't set REG_ADP_BC_ACA_ENABLE on Meson8
    https://git.kernel.org/khilman/linux-amlogic/c/6b99262fd2f210284b4d17928fd03bee2f5a4fe1
  - [v2,5/6] phy: amlogic: meson8b-usb2: unset the IDDQ bit during PHY power-on
    https://git.kernel.org/khilman/linux-amlogic/c/7cafc01744067cfaac2d5c0342e6f5deb377100a
  - [v2,6/6] phy: amlogic: meson8b-usb2: Add a compatible string for Meson8m2
    https://git.kernel.org/khilman/linux-amlogic/c/f004be596c28f90fbcc50e1b0f4b29ebab56bfca

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

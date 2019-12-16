Return-Path: <SRS0=UcGz=2G=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B2FC43603
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 20:01:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 986A02146E
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Dec 2019 20:01:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mRI4lbAv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I5D7g7xx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 986A02146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZdUHYSte0PmMw3i+A4mUDqhMqJrSkfX3DO3sipwnkwQ=; b=mRI4lbAvpd4Jq5
	lFCjbqqeW/HXOhGq6rUxgslkFozWezxw0jCVy3rCMu7WEAJo/3ZLKetTiy/B0/MoEVYIzAw6DpDr0
	gxG12sqXhPXYMkgwTHY3cLWBDkESvUBORfxMgXslwwsF3gvh3qaFT4sOMOPc5vPHhXcS/3gtCJasH
	03hUJ2qUh/5iXKHiV/jksMMPid/YFOtpk2/gmA+NSlKGDAhb1UT45Qhyo4vkfWg2OyXQJgmkfFBNL
	fueSe9nycPTf57PtLiCzG/AFQHilzxBWFA/rGj+P7RLUdC9yevMgpnVbXjsqxzgngUnKc+ghlJh3X
	gwQklh2+WBjlOJKPCBGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igwYQ-0003bO-FM; Mon, 16 Dec 2019 20:01:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igwYN-0003ak-Rv
 for linux-amlogic@lists.infradead.org; Mon, 16 Dec 2019 20:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576526474;
 bh=8PNqzoX+ChuTQulyWqr+t6n8rsBOtDWGn1J26MIVQiY=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=I5D7g7xxEJEPtmDsGbXPoxsyCjhioMpCGUmLN/0rHAYZdna564reD8Ib00xIzzaKO
 QdEVnt73sZ+Rqh4hGUTkUGeBX/3XbKEnI14ooyClbByv2L0Rnb+bLi/GFC259GvXh5
 0EYXSrkOsxgon56UJRwBK/wrPyUhq3iicMHb8/W8=
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/4] arm64: dts: meson: add libretech-pc support
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <157652647459.23523.17721417672154667443.git-patchwork-notify@kernel.org>
Date: Mon, 16 Dec 2019 20:01:14 +0000
References: <20191209143836.825990-1-jbrunet@baylibre.com>
In-Reply-To: <20191209143836.825990-1-jbrunet@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_120115_925970_4972B995 
X-CRM114-Status: UNSURE (   5.26  )
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

On Mon,  9 Dec 2019 15:38:32 +0100 you wrote:
> This patchset adds support the new libretech PC platform, aka tartiflette.
> There is two variants of this platform, one with the S905D and another
> with the S912.
> 
> Changes since v1 [0]:
>  * update adc keys
>  * add phy irq pinctrl configuration
>  * update leds description
> 
> [...]


Here is a summary with links:
  - [v2,1/4] arm64: dts: meson: gxl: add i2c C pins
    https://git.kernel.org/khilman/linux-amlogic/c/4e11697528ebb0b6abdbd23e41ce64638739e5a3
  - [v2,2/4] arm64: defconfig: enable FUSB302 as module
    https://git.kernel.org/khilman/linux-amlogic/c/afa7fb9cc222d301e51f967a26743b9076474c92
  - [v2,3/4] dt-bindings: arm: amlogic: add libretech-pc bindings
    https://git.kernel.org/khilman/linux-amlogic/c/727d01cb17c8a8e593ace9d136cb382a2c0d9e94
  - [v2,4/4] arm64: dts: meson: add libretech-pc boards support
    https://git.kernel.org/khilman/linux-amlogic/c/865a0d06f870ea1ffccdb2b2d0acf7e2a0deb9a3

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

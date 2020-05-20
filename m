Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03365C433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 23:01:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C026520873
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 23:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HlL8Z8Z1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="T6LUGJ5K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C026520873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjqFB2sq+7GJ6hVIV12kaoX9SccJrng2zNfKPyTYmNA=; b=HlL8Z8Z19LMQNY
	L/2/FLV++mopNQPW8etCs1pmum8z1VffwCamYkntUhI9FVw36wmquHlCzNpepIobGmhUPAgQU6ANV
	fCN/WnQHvyI+eVkPcPFRxL8Os83ji9jm+Z5nn6bX23IFbD0p0IJAlOanlFblmKPLwMzbYkWSKCv+S
	2ZmVkyGv5X03W5i5EGGQ0w4U9Mi3gOYE/KWePBJqViHXKoRfXL+uN5PjPluwV4sxnL68eW/HM2eCM
	6UpbIT+oLWR8WlYGptNYJHqP8Q2dyuFOeYq5EDWv2EwapS8lisfyM6+VgtH2cOSOfjRuAR/oHIKd5
	JEfIIrSrr78uJewE1YFw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbXiK-0007Ht-EZ; Wed, 20 May 2020 23:01:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbXi4-00073u-UV
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 23:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590015671;
 bh=LvEv0fooo/P1ThDhCO2Cg10Aj8E7a6v0E3eUIY8vUig=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=T6LUGJ5KMstS7NnYjOklixQVAgGreP0do/F5zq+qnvVeWTDzY8ngIWmLZe+9Sw/Xm
 Q14Ds8BLyVfgF/NfbgCm/pkOqX/IVAFlR+f2vR/t/18kIFknUPqkNc8kirCrGcSjTd
 aGiYJLf+dx18IfLOcSKaapAjo4Oa+5++fsdc5s6U=
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/5] arm64: dts: meson: add W400 dtsi and GT-King/Pro
 devices
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <159001567153.22936.9218155925699663707.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2020 23:01:11 +0000
References: <20200520014329.12469-1-christianshewitt@gmail.com>
In-Reply-To: <20200520014329.12469-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_160113_022889_84686B22 
X-CRM114-Status: UNSURE (   5.50  )
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

On Wed, 20 May 2020 01:43:24 +0000 you wrote:
> This series combines patch 2 from [1] which converts the existing Ugoos
> AM6 device-tree to a common W400 dtsi and dts, and then reworks the
> Beelink GT-King/GT-King Pro series from [2] to use the dtsi, but this
> time without the offending common audio dtsi approach. I've carried
> forwards acks on bindings from Rob as these did not change.
> 
> v4 - rebased against Kevin's v5.8/dt64 branch
> 
> [...]


Here is a summary with links:
  - [v4,1/5] arm64: dts: meson: convert ugoos-am6 to common w400 dtsi
    https://git.kernel.org/khilman/linux-amlogic/c/3cb74db9b2561a25701b9024b9d5c0077c43e214
  - [v4,2/5] dt-bindings: arm: amlogic: add support for the Beelink GT-King
    https://git.kernel.org/khilman/linux-amlogic/c/3a90ef281f852db9900024116e8ea93a49115df9
  - [v4,3/5] arm64: dts: meson-g12b-gtking: add initial device-tree
    https://git.kernel.org/khilman/linux-amlogic/c/c5522ff9c7299f9845df3fd521d51a1ef7617ac7
  - [v4,4/5] dt-bindings: arm: amlogic: add support for the Beelink GT-King Pro
    https://git.kernel.org/khilman/linux-amlogic/c/8d4b8772296f88e0b6bf5d091ebf25a54e51882c
  - [v4,5/5] arm64: dts: meson-g12b-gtking-pro: add initial device-tree
    https://git.kernel.org/khilman/linux-amlogic/c/0b928e4e412b1eb9e79e02cf3580b9254d338aae

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

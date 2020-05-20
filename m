Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6338EC433DF
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8DC20709
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 00:01:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gHCC52SG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="vsA+B45d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8DC20709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NTZrznXY8J6AXLPtgydbWZNthj/i9uBlgqmuhEUpScI=; b=gHCC52SGZSw5Hb
	9Zk2yLTBRH+cLD2JZv63UHFiu8JDCFS/7+nlPSxCStms/GSbJITQwmjh/JzpKo6WvpY1XuoKA76Gk
	rLQ+Zc0Q5sZAqYPgFubPScb7WITTjP/M/wBOH8jClPrdF3yAudjMXvQP0CNHa3NAwRiabPMeLgV2C
	L/up/02OqfVXM5wn6/g6HL78rVfelrTcJsa1hXipnyteuIGPDkETvFy+/rg2xrXft3np7dEKhJwX5
	gu7/04eUI8bKehphUIxqOwQbjii3Am4zTWW1K0f1FRdYCtW2s4y651Y9kNS1dRccyfsyP2sAObGxy
	BgZduPKrujoXtmaJrRew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbCAv-0005Ud-Qz; Wed, 20 May 2020 00:01:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbCAs-0005RC-6x
 for linux-amlogic@lists.infradead.org; Wed, 20 May 2020 00:01:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589932889;
 bh=IrqJ9McbJp8oyjqziKP2x4IgVR52g9lj4xKOieVzgmE=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:Cc:From;
 b=vsA+B45dxeRNWS0hwxxKjkmTFsrCCdNm5ulZ5n2sjbB4cZoKaiqRmUT6goxCGfkPG
 hX3vtMpBJXAze8B88sId6A0UCoZflWa3zTCbzsPl7kvxi1xww2s8cXYh2F4/U9C7ON
 Js2jo2xrUdSewwyoDVJBuY8x4DwPjZ+/YJuhhOwQ=
MIME-Version: 1.0
Subject: Re: [PATCH v8 0/3] arm64: dts: meson: add dts/bindings for SmartLabs
 SML-5442TW
From: patchwork-bot+linux-amlogic@kernel.org
Message-Id: <158993288991.29142.7736902852766247459.git-patchwork-notify@kernel.org>
Date: Wed, 20 May 2020 00:01:29 +0000
References: <20200510124129.31575-1-christianshewitt@gmail.com>
In-Reply-To: <20200510124129.31575-1-christianshewitt@gmail.com>
To: Christian Hewitt <christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_170130_270976_8143635C 
X-CRM114-Status: UNSURE (   6.34  )
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

On Sun, 10 May 2020 12:41:26 +0000 you wrote:
> This series adds new bindings and a device-tree file for the Smartlabs
> SML-5442TW set-top box which is based on the P231 reference design.
> 
> As requested, I have reworked the device-tree on the p23x-q20x dtsi. I
> have also re-added the BT device with new bindings that have now  been
> merged in bluetooth-next for inclusion in Linux 5.8. See [1].
> 
> [...]


Here is a summary with links:
  - [v8,1/3] dt-bindings: add vendor prefix for Smartlabs LLC
    https://git.kernel.org/khilman/linux-amlogic/c/bc15895e142396fed5ebf1f60139d9ca9a56a4e4
  - [v8,2/3] dt-bindings: arm: amlogic: add support for the Smartlabs SML-5442TW
    https://git.kernel.org/khilman/linux-amlogic/c/341e85047bdbc0196c91ccb4612ffab87bae9cfe
  - [v8,3/3] arm64: dts: meson: add support for the Smartlabs SML-5442TW
    https://git.kernel.org/khilman/linux-amlogic/c/1d6ece87b750cf26fed4eb794ea0b2fc7ff2be10

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

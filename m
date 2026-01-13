Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936C0D2D11E
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 14:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:MIME-Version:Date:From:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xfQ0Guq7DDFsehJ0oAllnHzVYgMgEERRG109VIm/ecg=; b=Ca6lDoAFP/gXfO
	qbXlC0z859vP8oJzlGMxGMm5HiLlBucjuI23PXo0HrVWiOix8Y5yRCAIZsihlsLfxnACiQ1+/VKUZ
	+HekOcCCoBwCQreohisUDJdQFS/VYODbGGDVkPFdg51QnEp6hLXpQmjbnvgVFYVVh6s8fFYMhDXGy
	TH2A3OlSgn0B2BoChgDpNKiEP9w/toGupatDVQ6J1PShcZDM/dWXKci5I87x7q9UUbbI4gaSd/1Fq
	pH6RA2fAclcVAJrxz0qoNL7bVImDMYk0w+g/8a4RJstKmjmn+VSNNvtsCQB8DpEfnBs6tZgprWAfO
	nl8fYGS0f7IB6R08X45Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffkd-00000007I6f-2OQt;
	Tue, 13 Jan 2026 14:52:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vffkY-00000007I64-3q5f;
	Tue, 13 Jan 2026 14:52:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6CFF4439C8;
	Tue, 13 Jan 2026 14:52:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2383CC116C6;
	Tue, 13 Jan 2026 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768315922;
	bh=F0CxKKbdK40SFtktNtyMvlAbkTcorF87w45vHgqvGMQ=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Lg2BWOGMjvWVicHAWO0FntNtKDF1FjSt65hgvxdiOmfFCfBj13LId5GWVSsFRRhxn
	 oglqSvb2/Y6oHj4ebuwFkNEcuS3btxjDzMqs+FI+O2F9RFH1C2QsdeOHTMLu6wqo8A
	 tHYBdFuaALsfeSCI/27e9jcxev3eiaTPsqhNjCZGoLXik0ld3ziHwE62NMDEwwenlL
	 z4GzUzw/c6ZXFT4KuNUn8GO07r2fuJXy9rNvdzQWsSPmudOJjm8LZx9KxxeHemiOP7
	 PbtfV8Dhofw7HvukgTYZ9dw9Xnd7TvRzGVvkgCCndHfmK+uN5Se/QmO8PBEUCpfXH9
	 FKZugNEYW16Uw==
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jan 2026 08:52:00 -0600
MIME-Version: 1.0
To: Nick Xie <xieqinick@gmail.com>
In-Reply-To: <20260113090951.35928-1-nick@khadas.com>
References: <20260113090951.35928-1-nick@khadas.com>
Message-Id: <176831569012.3744370.1114303217469901788.robh@kernel.org>
Subject: Re: [PATCH v1 0/2] arm64: dts: meson-s4: add support for Khadas
 VIM1S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_065204_773736_53C73461 
X-CRM114-Status: GOOD (  17.31  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, martin.blumenstingl@googlemail.com, khilman@baylibre.com, linux-kernel@vger.kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, linux-amlogic@lists.infradead.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Tue, 13 Jan 2026 17:09:49 +0800, Nick Xie wrote:
> This series adds initial support for the Khadas VIM1S single board computer.
> 
> The Khadas VIM1S is based on the Amlogic S905Y4 (S4 family) SoC.
> It features:
>  - 2GB LPDDR4 RAM
>  - 16GB eMMC 5.1 storage
>  - 32MB SPI flash
>  - 100 Base-T Ethernet
>  - AP6256 Wireless (802.11 a/b/g/n/ac, BT5.0)
>  - HDMI 2.1 video
>  - 2x USB 2.0 ports
>  - 1x USB-C (power) with USB 2.0 OTG
>  - 2x LED's (1x red, 1x white)
>  - 3x buttons (power, function, reset)
>  - IR receiver
>  - 40pin GPIO Header
>  - 1x micro SD card slot
> 
> The first patch adds the devicetree binding, and the second patch adds
> the board device tree.
> 
> Nick Xie (2):
>   dt-bindings: arm: amlogic: add Khadas VIM1S binding
>   arm64: dts: add initial device-tree for Khadas VIM1S
> 
>  .../devicetree/bindings/arm/amlogic.yaml      |   6 +
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../amlogic/meson-s4-s905y4-khadas-vim1s.dts  | 191 ++++++++++++++++++
>  3 files changed, 198 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
> 
> --
> 2.34.1
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/next-20260113 (exact match)
 Base: tags/next-20260113 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20260113090951.35928-1-nick@khadas.com:

arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: regulator-sdcard (regulator-fixed): Unevaluated properties are not allowed ('enable-active-low' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/fixed-regulator.yaml






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

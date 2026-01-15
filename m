Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36B9D46606
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Jan 2026 18:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:MIME-Version:Date:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mv0dUvv9xsYrYppL2v4I8h3jgEmrQNO15bYBcO0cmMA=; b=EM7BIOMCc032RaP9VUmX40n9/Q
	40G+bMpg4HMbJRVmjTBr6DRploSrEDCCZyk3e24tXtaWj35OjIEz+W6wiMSIfapPJnlPrBK/wLmOb
	04ohjNYVQz6HHL6XLheem3aONWUGcUSqRT19dydkX1bK4V4qihEd1oKPEXv4dbsEbSzKGVqiWwEo2
	EX9+kYGsSqRV402mJlyuUlwfgV8We/3nDduU0mr69lf0pRZrqKhJlYo7Q9o7z3SzHbFLaBX2Xv4TL
	nq5PF9O2HES8swCB8QR3SrvRHwxvNi7mr+vqwetB6WAQRoEIOEF+3GVnmEYbC/MGpgIZt54kl3iZb
	AiLWhOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSIw-0000000CzUO-11Pk;
	Thu, 15 Jan 2026 18:42:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgSIt-0000000CzTs-02C7;
	Thu, 15 Jan 2026 18:42:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 31EE543AE1;
	Thu, 15 Jan 2026 18:42:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0808C116D0;
	Thu, 15 Jan 2026 18:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768502562;
	bh=k0lbEC8vrTHNjsPX5hPqfBo8B6pyhjIjvsVG82jVXzA=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=UEl2a6yqC6q7lsev4vTKZHuWH0Q3y5VlF18wJIHDOct4OyGNfEBaWrDGJ8tDGND9l
	 M3WKYLlidKM0c6vX4kdPDDyk1Mgzjh20l9EwqEt4o5Ok0iNs0vRayo2i8jdrEkuddv
	 /CmZhzqPVmGThrnLoMdZ+hOApL0Sx3M2PVdiBKKc1rObtP46BhO7rV9s/60KuhyTN+
	 bGpUemP5VOS6PM0X1bvlFzqrxChr9ba10ZIwl3ZaiWTimiqTOC0v3VD10iJeUkiLmd
	 6BcCZ+viIsiZQMXSN1Or6iEESf902tcvO6b3Xr0N0t7R6qXd4gccVJPGee8KxBDPc1
	 EmGF3lIpdcXQg==
From: Rob Herring <robh@kernel.org>
Date: Thu, 15 Jan 2026 12:42:40 -0600
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Ricardo Pardini <ricardo@pardini.net>
In-Reply-To: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
References: <20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net>
Message-Id: <176849861782.929997.11384143044965902956.robh@kernel.org>
Subject: Re: [PATCH 0/2] NPU and i2c3 + FUSB302 addition for Radxa Zero 2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_104243_064859_66D42540 
X-CRM114-Status: GOOD (  15.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On Wed, 14 Jan 2026 23:48:35 +0100, Ricardo Pardini wrote:
> This series adds a few things missing from the Radxa Zero 2:
> 
> 1) NPU (etnaviv), just enable the node, similar to what was done for VIM3
> 2) i2c3 (also exposed on the 40-pin header) and the FUSB302 at 0x22
> 
> Signed-off-by: Ricardo Pardini <ricardo@pardini.net>
> ---
> Ricardo Pardini (2):
>       arm64: dts: amlogic: Enable the npu node on Radxa Zero 2
>       arm64: dts: amlogic: add the type-c controller on Radxa Zero 2
> 
>  .../boot/dts/amlogic/meson-g12b-radxa-zero2.dts    | 36 ++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260114-arm64-dts-amlogic-radxa-zero2-additions-905549fbed3e
> 
> Best regards,
> --
> Ricardo Pardini <ricardo@pardini.net>
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
 Base: 0f61b1860cc3f52aef9036d7235ed1f017632193 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20260114-arm64-dts-amlogic-radxa-zero2-additions-v1-0-8b5cdf328fde@pardini.net:

arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dtb: fusb302@22 (fcs,fusb302): 'connector' is a required property
	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml






_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

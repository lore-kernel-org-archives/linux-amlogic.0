Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935E4C02196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2025 17:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w3cs2gufeMCIg413hJFz2g3a4l8ROdHyQVGyTVmV3r8=; b=mB8qBpqA6ZCWUx
	UlfaBxiXTbcq05uXI3tlvGjK5OsCuJoeS/U1KHHJ+DEpMo2rQyrCoVBPKe2RcxDmTa+wDomHB39s7
	6zevZ5E6wZvANe04wiJhEKF4l6N5x9zySStZsHj/o89WEfV6qpjMABx+lktNFwjZo+GIj6DlqgJt4
	c2Iqp6I0VXGOG57Pp3kmNOyqDwGJi9mk4xvRlYqc4geW39zMpNW3pn1z0w+fd7XVygqW1pel3FQt6
	xbfcBbWbjEn0d/Ou0Mk5/uXmPiJKr4RKBjyxHfUjz+dIbRCe2/70PWflIeV6m8FlX0dw1AJK0XmB/
	ATehwfqbCEHPEeLLuPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0Xk-0000000GAc9-1E8b;
	Mon, 03 Feb 2025 17:47:32 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0VD-0000000GAF5-0JwP
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Feb 2025 17:44:56 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738604678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6Ox82t1s1wudEYSJtMWxiXluTW0Eijn+XKKN4GdXC50=;
	b=Qu0SnKJgk+fFUz3JPKuQKnCna/ZQ/U5UqRFT9m2amROG/u9Nz4V3gz8riHMqsbAHx28DAN
	lTejMbb7ZQvQdHj3uSu6lHooLCUw05pJXfz6Ajm3hG9ogdvHGQhgT4koyZrywXskXQkbcy
	PTR+lvRxaJUpgCQXD/EGfkVhwt4yG22LlCA7TZbyZ3e8si2GXX0rOI6NMo1ZVublS14Dwh
	8ndDmvTZ8eCBRA3BahfZL449niK8GznyqY0T4mE+npxcLg6wNx+Zg0sEf1Eq0K8TNEMz3P
	vRJsqwq0aeKKYotpIw9cG2w3pVE9u6LlgbLPMvN9SMOqfTsMO0u4+WFNeUzM/A==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v4 0/2] Add support for Xiaomi Mi TV Stick
Date: Mon,  3 Feb 2025 17:43:44 +0000
Message-ID: <20250203174346.13737-1-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_094455_274254_8C5A9AF6 
X-CRM114-Status: GOOD (  13.98  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, funderscore@postmarketos.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch series aims to add initial support for the Xiaomi Mi TV
Stick.

Xiaomi Mi TV Stick is a small Amlogic-based Android TV stick released in 
2020, and known as `xiaomi-aquaman` internally (in the downstream kernel,
u-boot, ...)
Its specifications are as follows:
 * Amlogic S805Y SoC (believed to be mostly identical to S805X)
 * 8 GB eMMC
 * 1 GB of RAM
 * Android TV 9, upgradable to Android TV 10

There are multiple variants:
 * 1. Green PCB, manufactured in 2020, known UART pinout (helpfully 
   labeled on the board)
 * 2. Blue PCB, not much documentation about it, presumably manufactured
   between 2021 and 2023
 * 3. Green PCB, manufactured in 2023, known UART pinout, some layout
   changes compared to the 2020 variant

Among these variants, there are many boards using multiple different
Wi-Fi chips.  Supporting all of them is out of scope for this patch
series.

As of the time of writing this has only been tested on the 3rd variant.
It is believed that software-wise all three work mostly the same (if we 
don't count Wi-Fi), but testing on the other variants would still be
appreciated.

The devicetree is based on the Amlogic P241 DTS.

Changes since v3 [1]:
 * typo fix (`vbus-supply` in `&usb`)

Changes since v2 [2]:
 * fix SoB/From mismatch

Changes since v1 [3]:
 * remove useless nodes: cvbs-connector, ethmac, internal_phy, ir
 * add `amlogic,s805y` DT binding section
 * add S805Y dtsi: meson-gxl-s805y.dtsi
 * adjust DT `model` to "Xiaomi Mi TV Stick (Aquaman)"
 * explain the changes being done a bit more in the commit message for
   the DT patch
 * drop `clocks` and `clock-names` from pwm_ef (background: [4])
 * change sound `model` to "XIAOMI-AQUAMAN"

[1]: https://lore.kernel.org/all/20250203091453.15751-1-funderscore@postmarketos.org/
[2]: https://lore.kernel.org/all/20250201193044.28856-1-funderscore@postmarketos.org/
[3]: https://lore.kernel.org/all/20250131200319.19996-1-funderscore@postmarketos.org/
[4]: https://lore.kernel.org/linux-amlogic/20241227212514.1376682-1-martin.blumenstingl@googlemail.com/

Ferass El Hafidi (2):
  dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
  arm64: dts: amlogic: add support for xiaomi-aquaman/Mi TV Stick

 .../devicetree/bindings/arm/amlogic.yaml      |   7 +
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../meson-gxl-s805y-xiaomi-aquaman.dts        | 285 ++++++++++++++++++
 .../boot/dts/amlogic/meson-gxl-s805y.dtsi     |  10 +
 4 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y-xiaomi-aquaman.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-gxl-s805y.dtsi

-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

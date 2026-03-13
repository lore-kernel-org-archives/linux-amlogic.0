Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF7B106FD92
	for <linux-amlogic@archiver.kernel.org>; Fri, 13 Mar 2026 07:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AfwfGNYHB+OYcjO6UZdjrLSShfIcpES+DcK86uftOOs=; b=fotjvc1zzGBlW3
	6XM5Te26iTpJbKrmUspprqVuJ5GdDeS5DgxApQzX7Inq+PCNJJJnvEU7ZZZMkzMYomxvy/jDpNZb7
	ebBm31W6ta2Xlp7v3WizeWFS008PvfblxnApIVOIJoO6b9luBI7Dq2C3YLf/L1dovS5JO1Xs63cvM
	JDxJhoKSxLSll/GgRyGKWeqDRuxIXFA/fX+D+pNomh1SxkDSrOb/cD3/XGQVIGDVQVXVPMIKTcTWN
	i6XrWgCJHA+fylC/URuRLaGtQehiOIecCR5mI/tW+9O4iJ6PB/PE8con7iWuCRv3GEXMFWN6YW4NC
	ZTf4JDoF86ZfvI0JtBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wVn-0000000GwE5-0zkJ;
	Fri, 13 Mar 2026 07:00:43 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wVj-0000000GwCt-04qJ;
	Fri, 13 Mar 2026 07:00:40 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 12 Mar
 2026 23:59:36 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, devicetree <devicetree@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ronald Claveau
	<linux-kernel-dev@aliel.fr>, Ferass El Hafidi <funderscore@postmarketos.org>
Subject: [PATCH v2 0/3] Add the missing mpll3 clock and clock controller nodes
Date: Fri, 13 Mar 2026 15:00:19 +0800
Message-ID: <20260313070022.700437-1-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.121]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_000039_072950_A7FD8F13 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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

- Fix redundant hyphen in for gp1 pll
- Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
- Add Amlogic T7 SoC clock controller nodes

Changes in v2 since v1 at [1]:

- Add Ronald Claveau's Signed-off-by to the first and third patches
- Fix compilation error for amlogic-peripherals-clkc.yaml
- Update commit message for amlogic-peripherals-clkc.yaml
- Add Fixes tag
- Remove the blank line in the watchdog node of meson-t7.dtsi
- Add 'reg' property to sram node
- Add a space after the clock controller label

[1]: https://lore.kernel.org/all/20260305074328.639993-1-jian.hu@amlogic.com

Jian Hu (3):
  dt-bindings: clock: amlogic: Fix redundant hyphen in
    "amlogic,t7-gp1--pll" string.
  dt-bindings: clock: amlogic: t7: Add missing mpll3 parent clock
  arm64: dts: amlogic: t7: Add clock controller nodes

 .../clock/amlogic,t7-peripherals-clkc.yaml    |  12 +-
 .../bindings/clock/amlogic,t7-pll-clkc.yaml   |   2 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   | 125 ++++++++++++++++++
 3 files changed, 134 insertions(+), 5 deletions(-)

-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

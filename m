Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44ACBEDE983
	for <linux-amlogic@archiver.kernel.org>; Thu, 14 Sep 2023 06:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xRg9cQXTthiKTab4DtiVUBfbAet3nX1TwnxS7fJKyhQ=; b=Hrip0Zjz50jlsb
	pdXhrn/+n4uFPqFjICAa0fGPs6pyA/t//V1yUHZMYrLFkSGaghqSf6CsmIbbsn+Z05/UFtNJ/ctDY
	jk33sGaihqUCxLicQnSrwk9Edb2gcLrCSL+2dVm2Hf5hiadd9zQ32v5SEFDC9KkjVweQeLrJU+5+Z
	z/6WGH5hZRDU23hKRqZUtbNPj++llugiO8rJJY6SJFWxAFex4PdS6Bg+fpJiZPUx8u0T/IY29nSt9
	8gluXNcrXniviIVWiQvGQO2DwJ4pZ6VVWS9dooGkT5RpXbUWJtdoFSD+o+fw2uS9ZM14mcYpy4U0g
	bsNRJFlkrzLN+ahQZDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgg1f-007XF3-14;
	Thu, 14 Sep 2023 06:40:31 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgg1b-007XDH-29;
	Thu, 14 Sep 2023 06:40:29 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 14 Sep 2023
 14:40:21 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<yonghui.yu@amlogic.com>, <kelvin.zhang@amlogic.com>, Zelong Dong
	<zelong.dong@amlogic.com>
Subject: [PATCH v4 0/3] reset: amlogic-c3: add reset driver
Date: Thu, 14 Sep 2023 14:40:15 +0800
Message-ID: <20230914064018.18790-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_234027_722870_85848900 
X-CRM114-Status: UNSURE (   7.24  )
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

From: Zelong Dong <zelong.dong@amlogic.com>

This patchset adds Reset controller driver support for Amlogic C3 SoC.
The RESET registers count and offset for C3 Soc are same as S4 Soc.

Changes since v1:
- remove Change-ID
- run scripts/checkpatch.pl and fix reported warnings
- sort dts node by base reg offset

Changes since v2:
- replace keyword "meson" with "amlogic"

Changes since v3:
- rebase on v6.6-rc1

---
v1:https://lore.kernel.org/all/20230630121059.28748-1-zelong.dong@amlogic.com/
v2:https://lore.kernel.org/all/20230718123550.13712-1-zelong.dong@amlogic.com/
v3:https://lore.kernel.org/all/20230719060954.14864-1-zelong.dong@amlogic.com/

Zelong Dong (3):
  dt-bindings: reset: Add compatible and DT bindings for Amlogic C3
    Reset Controller
  reset: reset-meson: add support for Amlogic C3 SoC Reset Controller
  arm64: dts: amlogic: add reset controller for Amlogic C3 SoC

 .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   |   7 ++
 drivers/reset/reset-meson.c                   |   1 +
 include/dt-bindings/reset/amlogic,c3-reset.h  | 119 ++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,c3-reset.h

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D462EB64D7
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Jun 2023 12:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vXTvf+pDFO7n3eGApWV0Mxd5Av7LaujUQUPp/AblJms=; b=l28tK6LH1E9xDx
	/bcCMGvpO1YnM0EDFZr3ToU8bmr0x9lHxGjj+ufJ8h92FUUcKdsAzkO2n/7PrU+5iZRdD5FmmOkfp
	w//jrQQ9eSTU9kmVo4E0llgwc8OyId0m7uX19hyUyxH32V/VQ8Zk9Fvy5wlKSwUsBsQoxCzHx0oBM
	jYtpEeeDALibkTgZLf7s28+y0Iw1k/Y0lEhb+uUveuUn0KU7OTO+Hiax5MRZDFPFRIHA8KB9wwwep
	DBqXgisByxcO54Q0PiUi1X48OcNiLRA58Bszop9zEoDO/2xtsZGji02U4OO1vDO7hxN2C+LYSeH+M
	aJRirW+O+toaAmtYx9cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCy9-003fa3-04;
	Fri, 30 Jun 2023 12:11:21 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCy5-003fZG-2U;
	Fri, 30 Jun 2023 12:11:18 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 30 Jun 2023
 20:11:06 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: <narmstrong@baylibre.com>, <p.zabel@pengutronix.de>,
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
	<martin.blumenstingl@googlemail.com>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <jbrunet@baylibre.com>,
	<devicetree@vger.kernel.org>, <kelvin.zhang@amlogic.com>, Zelong Dong
	<zelong.dong@amlogic.com>
Subject: [PATCH 0/3] reset: meson-c3: add reset driver
Date: Fri, 30 Jun 2023 20:10:56 +0800
Message-ID: <20230630121059.28748-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_051117_825851_5258AB47 
X-CRM114-Status: UNSURE (   6.55  )
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

This patchset adds Reset controller driver support for Meson-C3 SoC.
The RESET registers count and offset for C3 Soc are same as S4 Soc.


Zelong Dong (3):
  dt-bindings: reset: Add compatible and DT bindings for Meson-C3 Reset
    Controller
  reset: reset-meson: add support for the Meson-C3 SoC Reset Controller
  arm64: dts: meson: add reset controller for Meson-C3 SoC

 .../bindings/reset/amlogic,meson-reset.yaml   |   1 +
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   |   7 ++
 drivers/reset/reset-meson.c                   |   1 +
 .../reset/amlogic,meson-c3-reset.h            | 119 ++++++++++++++++++
 4 files changed, 128 insertions(+)
 create mode 100644 include/dt-bindings/reset/amlogic,meson-c3-reset.h

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

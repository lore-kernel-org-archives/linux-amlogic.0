Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAD9EB64DA
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jul 2023 05:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uIpCFhBa4c/thJ1BCELcHsROTKkGb8LjKfoGEncUJQw=; b=UtAX2V2OBoPIrp
	J3uIJFPS3yPOnSFvh/ZOptcH2/W9aeOwvdbMDUYD+9ANLglXfCUw0eOMgjLFN6++tEX+90LOpMWoQ
	VXlYqsx2CtgacHBRcy7ATdwfJVEUHxUX+incdlFGdXvlzV8SGSV0f0q4CoSyaSM6cbXdTbNEhzznc
	1wlzL17mQ6Wi7gDgJkjKYWkMGXM907uCEbp/PlCqKmAEx9dDJN/kAQZF1FWMtvVfPmHYw4kYphfXN
	TraQ/SX/vepwmhENeHAKeKIZnfA6g5+vKVf4+Igc7cz1P9yMFF1e84bZZTHXko2YjZer/cUreJniw
	q7eyxhxizcVSnzBVyaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzLy-0058Pf-3B;
	Wed, 19 Jul 2023 05:03:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzLw-0058OY-2a;
	Wed, 19 Jul 2023 05:03:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=39mx1IJOhIwMv5GydHtbZ2UmUB1INMt8WGoE9jHCNZs=; b=l0iHebIqRwQb+b0uGPUFUYdsiR
	iO+Jfck0Ph4HKO2MrZ36mtZv1xI7czS0U4FiHGg6qTRhQhAcsypYmimIgj3uCyp+nL8IRlp4hf+/I
	osdBEofxtpT3a5hLxz5VX99ZLmqoJsJWxEUqWOBh595uk520HvUKfJ53pC1W8LsAeiSBOnkSYU8II
	t+YWw3nATlySAF2UzQEL/F8roLCOCW3U0kVY/wI19AcwPeZygtsQ9au5W86dNP4CwqiBEDho4a3qs
	sOqX7ZzOQtGNx6nL+So3LQIVl717DtLhcSl92vLvp/ylX6DIA5QFh0oneDJNOcf2KXDb5hJl8l2jK
	xjERmY6Q==;
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLjw2-00BWIw-2W;
	Tue, 18 Jul 2023 12:36:12 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 18 Jul 2023
 20:35:41 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
	<robh+dt@kernel.org>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Jerome Brunet <jbrunet@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v2 0/3] reset: meson-c3: add reset driver
Date: Tue, 18 Jul 2023 20:35:47 +0800
Message-ID: <20230718123550.13712-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_133610_991523_2522865F 
X-CRM114-Status: UNSURE (   7.61  )
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

Changes since v1:
- remove Change-ID
- run scripts/checkpatch.pl and fix reported warnings
- sort dts node by base reg offset

---
v1:https://lore.kernel.org/all/20230630121059.28748-1-zelong.dong@amlogic.com/

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

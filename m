Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80564D5E145
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2024 08:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=w+3O5PvkpXKCvTsjztIoB8PclqE37UCAFOS0WpG17Co=; b=DHDIxmbsozUfvY
	XA4Gp2UOKzDdxpg7oVcxS+OZ7T2g1Szb2ZQwoGColMXawYbzEi/sQV0Q70MVlfSp8c5YUmTdUO5l2
	K+t485LRhTmgp8Vy6yAT+acTcAiPgHJwc4CkxiWmj+iXmUW+mTYN5mKrL1wzju0jT7Q51ifyt6/9d
	Kj68hV4Mh/w3NlCr7txV5bT94HB0z/7a/AzNjt76CzXnss4ecIlImlP+g2CanmPyAEtnKpSj3aMt2
	lj2iNFprYpp2WFYEelNxTYMSFDW5XqEbv+EeTMVS9QIFvSElFRNuVMm+ai9yHHPtXP/zvArZPR/l1
	4wze/cXxVO+3zfgCXCdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KHH-00000009l9V-13P3;
	Fri, 08 Nov 2024 08:23:35 +0000
Received: from [58.32.228.46] (helo=mail-sh.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KHE-00000009l7n-39E8;
	Fri, 08 Nov 2024 08:23:34 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.39; Fri, 8 Nov 2024
 16:23:07 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, Rob Herring
	<robh@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH v3 0/3 RESEND] reset: amlogic-a4/a5: add reset driver
Date: Fri, 8 Nov 2024 16:23:00 +0800
Message-ID: <20241108082303.25207-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_002332_833522_B2B58591 
X-CRM114-Status: UNSURE (   7.78  )
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

This patchset adds Reset controller driver support for
Amlogic A4/A5 SoC. The RESET registers count and offset
for A4/A5 Soc are same as S4 Soc.

Changes since v2:
- rebase on 'amlogic,t7-reset' patchset

Changes since v1:
- remove 'amlogic,t7-reset'
- move 'amlogic,c3-reset' to the other enum list
- move reset node from amlogic-a4-common.dtsi to
  amlogic-a4.dtsi/amlogic-a5.dtsi

---
v1:https://lore.kernel.org/all/20240703061610.37217-1-zelong.dong@amlogic.com/
v2:https://lore.kernel.org/all/20240715051217.5286-1-zelong.dong@amlogic.com/

Zelong Dong (3):
  dt-bindings: reset: Add compatible for Amlogic A4/A5 Reset Controller
  arm64: dts: amlogic: Add Amlogic A4 reset controller
  arm64: dts: amlogic: Add Amlogic A5 reset controller

 .../bindings/reset/amlogic,meson-reset.yaml   | 23 +++--
 .../arm64/boot/dts/amlogic/amlogic-a4-reset.h | 93 ++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi   | 10 ++
 .../arm64/boot/dts/amlogic/amlogic-a5-reset.h | 95 +++++++++++++++++++
 arch/arm64/boot/dts/amlogic/amlogic-a5.dtsi   | 10 ++
 5 files changed, 223 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a4-reset.h
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-a5-reset.h

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

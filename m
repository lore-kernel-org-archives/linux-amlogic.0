Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABE0C7EE2C
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Aug 2023 11:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LL5PSRFtz4NhOKJMHjHewfUNlRrFyeSgbW0B0/s6uyQ=; b=BEvDgiG7957vqp
	iIQOfpewh9AfwLom6Wp0yetPFbe0rihPC+wPGbPGi3UXDp7D3aO6I9FnRxFCk5D+/dXmjxCf4vtY1
	BIcNHTsnnpGMLwf/BCSwv4PVbJi6w4EoYEzdG8RKqreHea7tBcQVrVGO5cvoPqNKtMXGtC7p8C1t4
	immtw+XyNZf/GlwbIrQng29uHkSOdm6p8Phd63SyeSMIxD2tP3+3iKY4jjQyHXlsynryROem7oA8h
	TGUNJwO3igq93wBkfQ8U/qNekeoVbGL9NEdyUT/aP9OXeejrB2oxmlUppLApFx3FTgJoLjXxCGCQB
	da/sWBYH/DhniRiUfnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVNc-005Jep-12;
	Fri, 25 Aug 2023 11:53:32 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZVNZ-005Jbx-0h;
	Fri, 25 Aug 2023 11:53:30 +0000
Received: from droid10-sz.amlogic.com (10.28.11.69) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 25 Aug 2023
 19:53:13 +0800
From: zelong dong <zelong.dong@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, Sean Young <sean@mess.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>
CC: <linux-media@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Qianggui.Song@amlogic.com>, <Yonghui.Yu@amlogic.com>,
	<kelvin.zhang@amlogic.com>, Zelong Dong <zelong.dong@amlogic.com>
Subject: [PATCH 0/3] This patchset adds IR controller driver support for
Date: Fri, 25 Aug 2023 19:53:07 +0800
Message-ID: <20230825115310.39993-1-zelong.dong@amlogic.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Originating-IP: [10.28.11.69]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_045329_274942_36326388 
X-CRM114-Status: UNSURE (   5.87  )
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

Meson IR Controller supports hardware decoder in Meson-S4 and later
SoC. So far, protocol NEC could be decoded by hardware decoder.

Zelong Dong (3):
  media: rc: meson-ir: support rc driver type RC_DRIVER_SCANCODE
  dt-bindings: media: Add compatible for Meson-S4 IR Controller
  arm64: dts: meson: add IR controller for Meson-S4 SoC

 .../bindings/media/amlogic,meson6-ir.yaml     |   1 +
 .../dts/amlogic/meson-s4-s805x2-aq222.dts     |   6 +
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi     |  15 +
 drivers/media/rc/meson-ir.c                   | 522 +++++++++++++++---
 4 files changed, 473 insertions(+), 71 deletions(-)

-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

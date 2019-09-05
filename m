Return-Path: <SRS0=+PkE=XA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A41AC3A5A5
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 07:08:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EBE92168B
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Sep 2019 07:08:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YL5E4koJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EBE92168B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amlogic.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TG0fu9xawFNprgVyd7vzJqofQj6dy/w2ZEQOaSGYJ9A=; b=YL5E4koJP5Mm7I
	yZTdEWcyvC3xDH9XbIjK22n+HugGNigM9iSyH4798q9eILn/wc42V7C9JlLuqN04o2blVCK4iTroU
	s9VnDz5itt7Jr/QGXQNaDfIzMxf92iLTXj+NnFNKU1I1WWSc86lmKOsQkBLPBJFzv1n3fCe5M2n2C
	/b30NepbxZLZtS2gp/evM7TGYEXcx6E0ZFk6hTRfIQs7B6qqtBr3ibWGCTz7nc2QiSmUXzRyeZx2n
	IdCdDohvbhg9sMyQS+wOXS0mr+i0zCwpSWQ9r6/w1YjhHe0BceQuEolvSjOld2eiftkeOazIKevB7
	svrqA4W4wv/pjs+4VJ/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5lsW-0002oF-EK; Thu, 05 Sep 2019 07:08:24 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5lsF-0002ZD-Ip; Thu, 05 Sep 2019 07:08:08 +0000
Received: from droid13.amlogic.com (116.236.93.172) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.1591.10; Thu, 5 Sep 2019
 15:08:52 +0800
From: Jianxin Pan <jianxin.pan@amlogic.com>
To: Kevin Hilman <khilman@baylibre.com>, <linux-amlogic@lists.infradead.org>
Subject: [PATCH v2 0/4] arm64: Add basic support for Amlogic A1 SoC Family
Date: Thu, 5 Sep 2019 03:07:26 -0400
Message-ID: <1567667251-33466-1-git-send-email-jianxin.pan@amlogic.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [116.236.93.172]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190905_000807_625133_A59FBC26 
X-CRM114-Status: UNSURE (   7.58  )
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
Cc: devicetree@vger.kernel.org, Hanjie Lin <hanjie.lin@amlogic.com>,
 Victor Wan <victor.wan@amlogic.com>, Jianxin Pan <jianxin.pan@amlogic.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, Qiufang Dai <qiufang.dai@amlogic.com>,
 Rob Herring <robh+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>,
 Xingyu Chen <xingyu.chen@amlogic.com>, Carlo Caione <carlo@caione.org>,
 Tao Zeng <tao.zeng@amlogic.com>, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

A1 is an application processor designed for smart audio and IoT applications,
with Dual core ARM Cortex-A35 CPU. Unlike the previous GXL and G12 series,
there is no Cortex-M3 AO CPU in it.

This serial add basic support for the Amlogic A1 based Amlogic AD401 board:
which describe components as follows: Reserve Memory, CPU, GIC, IRQ,
Timer, UART. It's capable of booting up into the serial console.

The pclk for uart_AO_B need to be fixed once A1 clock driver is merged.
In this version, it rely on bootloader to enable the pclk gate

Changes since v1 [0]:
 - fix coding style
 - collect Reviewed-by

[0] https://lore.kernel.org/linux-amlogic/1567493475-75451-1-git-send-email-jianxin.pan@amlogic.com/

Jianxin Pan (4):
  soc: amlogic: meson-gx-socinfo: Add A1 and A113L IDs
  dt-bindings: arm: amlogic: add A1 bindings
  dt-bindings: arm: amlogic: add Amlogic AD401 bindings
  arm64: dts: add support for A1 based Amlogic AD401

 Documentation/devicetree/bindings/arm/amlogic.yaml |   6 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts     |  31 ++++++
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi          | 122 +++++++++++++++++++++
 drivers/soc/amlogic/meson-gx-socinfo.c             |   2 +
 5 files changed, 162 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1-ad401.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-a1.dtsi

-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

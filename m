Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C973C77B78
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 07:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xCjaO9Gls5Zilo8ZTGwNmTF2hwn1acuyoBtFDYNvFLw=; b=DhsV1oEA4RomVb
	3qbyjGtFyjIneuVdDHwAezHIZktxCDrufm/mf5X9gG0CuRzG/EWs/ua/d1ULujTMckjEnjOvBv5f1
	LA+TY36mEs31BBFdgo5KXYZC9PjisnCKUny5S3ombHm7k3XpCBF9HjDwldgWZalHFjE1ZhRF7tkJs
	nwlIN8b5LxEypGyQYkEHFWMexVM5b/Br3QUcqloQ0NGD+QdWH2G6Ye1ysRRlwalIStEA88CslGLA5
	xf2yAizfd2Af1XsqlSTqGnDeKjBK7LLzewd0ldz+jVF8dxP9Pi7XgnpLF5MkQTCH4jB/ApFm76h4o
	PYRwC2+X1UmXhXUYyoCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Ox-004RA1-0J;
	Wed, 19 Apr 2023 07:38:51 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp2Ot-004R7b-2K;
	Wed, 19 Apr 2023 07:38:48 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Wed, 19 Apr 2023
 15:39:56 +0800
From: =Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [RFC PATCH 0/2] Baisc devicetree support for Amlogic C3
Date: Wed, 19 Apr 2023 15:38:32 +0800
Message-ID: <20230419073834.972273-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_003847_776674_80CAB7ED 
X-CRM114-Status: UNSURE (   8.51  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Amlogic C3 is an advanced edge AI processor designed for smart IP camera
applications.

Add ARCH_AMLIPC for the new series.

Add basic devicetree support for the C3 based Amlogic AW409 board,
which describes the following components: CPU, GIC, IRQ, Timer, UART.
It's capable of booting up into the serial console.

Xianwei Zhao (2):
  arm64: amlogic: add new ARCH_AMLIPC for IPC SoC
  arm64: dts: add support for C3 based Amlogic AW409

 arch/arm64/Kconfig.platforms                  | 12 +++
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../amlogic/amlogic-c3-c302x-aw409-256m.dts   | 30 +++++++
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   | 87 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  2 +
 5 files changed, 132 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409-256m.dts
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi


base-commit: ae68fb187b59bc8645974320808ab2d7c41b1833
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

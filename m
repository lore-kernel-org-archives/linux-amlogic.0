Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F05C71153
	for <linux-amlogic@archiver.kernel.org>; Tue, 29 Aug 2023 02:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6WcSa5iq2TRt+MXE7sfWizt7eaEBR5sIsl1Mo9lDLcc=; b=3zyNMbfWbJPt+P
	FguGtclvTSYnt9VPMawik2iL77dNnwLwAAa64DCBf31D7L4iSuz18oq/9aI+SBQK8BQezj5vGfSRH
	TFsKu1hVrH4xVqwTnathyWt748C/XM9eXWaUbttO41hsu5PYRGjTGl24zfiia0DlWrMp51V0qd9DA
	mPKYpirFzhzVlgNcJle0K94b5wN4z3hZn2CFeMBTWe+tAMkN1F5MhjfmVHV5tnSB6wQ65PdWa5tSp
	3ITGRwks8aJMFkNBFZIntBLHaQrIF3DN6CTtQAocX3woeDJ7LoYg/UPbsNYDnIotvOK3xQEZN0Ogf
	xbT6NAfGt0qRh9Ug7X3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qao5h-00AaTV-17;
	Tue, 29 Aug 2023 02:04:25 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qao5d-00AaSh-2i;
	Tue, 29 Aug 2023 02:04:23 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Tue, 29 Aug 2023
 10:04:07 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V3 0/6] Power: T7: add  power domain driver
Date: Tue, 29 Aug 2023 10:03:58 +0800
Message-ID: <20230829020404.4058677-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_190421_901223_AD67F19C 
X-CRM114-Status: UNSURE (   7.20  )
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

First patch is that remove C3 some power domain ALWAYS_ON property.
Second patch is that add driver to support power parent node. 
Third patch is that turn on power if initial power domain with
"AWAY_ON" property state is off.

Other patchs adds power controller driver support for Amlogic T7 SoC.

Changes Since v2:
 -Modify subject.
 -Define PWRC_NO_PARENT UINT_MAX
 -Remove modification that transform is_off into 1 or 0 using !!

Changes Since v1:
 -Fix license from "GPL-2.0-only OR .*" to "GPL-2.0-only OR MIT".
 -Modify T7_NIC flag  "ALWAYS_ON"

xianwei.zhao (6):
  genpd: amlogic: modify some power domains property
  genpd: amlogic: add driver to support power parent node
  genpd: amlogic: init power domain state
  dt-bindings: power: add Amlogic T7 power domains
  genpd: amlogic: Add support for T7 power domains controller
  arm64: dts: amlogic: t7: add power domain controller node

 .../power/amlogic,meson-sec-pwrc.yaml         |   3 +-
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi   |   6 +
 drivers/genpd/amlogic/meson-secure-pwrc.c     | 127 ++++++++++++++++--
 include/dt-bindings/power/amlogic,t7-pwrc.h   |  63 +++++++++
 4 files changed, 185 insertions(+), 14 deletions(-)
 create mode 100644 include/dt-bindings/power/amlogic,t7-pwrc.h


base-commit: 413f5c02929bb33042bbc4ee233166550a5fca70
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B10AEEB57D
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Sep 2023 02:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6WcSa5iq2TRt+MXE7sfWizt7eaEBR5sIsl1Mo9lDLcc=; b=QQEAtUa9E9ES/d
	aTN9iFMwCdrO52yAICyWZkvt90W+EuqWHOdNihGmXWnwlLD/nWu4GG9GtrE0IW6N0japl2FogJQnH
	pOWqqjhLM6larpLSBFMr8kXo1MxnPaJjN+tbrJygz+JJ4YU6EIkBeb8h4SRNeR2rrb5yw1RqdobQC
	d8b38D3i7xx490mMaLFtsRD8kaq5HMMczn3f+KGRr1FnU1BEH00bAqMbjR6VLOFPtSNckuI+BLxSU
	5bCIOaAbQOEXj0FrVGn7rvHvPf9I/2ptXmUWhaUcycnHunI/r9tbO6yIiAerTGHTmzzDISQbavj3S
	7ieQ070Ahqq5oui/vpUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfX2l-00H7gO-2r;
	Mon, 11 Sep 2023 02:52:55 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfX2h-00H7bA-0N;
	Mon, 11 Sep 2023 02:52:53 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Mon, 11 Sep 2023
 10:52:26 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-pm@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Ulf Hansson <ulf.hansson@linaro.org>, Xianwei Zhao
	<xianwei.zhao@amlogic.com>
Subject: [PATCH V3 RESEND 0/6] Power: T7: add  power domain driver
Date: Mon, 11 Sep 2023 10:52:17 +0800
Message-ID: <20230911025223.3433776-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230910_195251_157452_8FEA498C 
X-CRM114-Status: UNSURE (   7.44  )
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

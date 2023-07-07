Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A509EB64DC
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Jul 2023 00:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5s/5JhXo3psUp6wSRysKb8xWox7Pmvx44Xq0KaZhi2c=; b=H5ZNPgr2/pUXPI
	+jiPE8xmUVVZJZqwWgl2Tzbv2Qx0UOegKhdEuS1LAY7S4HPlo6KMZ31p/fCCWKwTwREMlk3nikdri
	8f65KwAy3CrlBU4mUDoexSSck+GNjWbr6CNCh4Cnz7HXL5FakLOP/EU4OCaKGYvi5QHP15Anleq5O
	NVKqKYDaZq5tB8lslF98413Zn2wQa9AV+YxXK8X6UB5laKFPd/1xzzsotXne5RzwpPfpsONnMEDtE
	+/LzhyllU9dh4LvRveqZ+VsUxP8eI2qC+gXLFrr7C8vNhgYQsN4RaD+mUlr0S+PlHQeUBSBxAUrQL
	l8fj2pBF6reIXYJhahXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZTN-0034Ha-2v;
	Fri, 07 Jul 2023 00:37:21 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHZTK-0034GF-27;
	Fri, 07 Jul 2023 00:37:19 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Fri, 7 Jul 2023
 08:37:04 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 0/4] Power: C3: add  power domain driver
Date: Fri, 7 Jul 2023 08:37:06 +0800
Message-ID: <20230707003710.2667989-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_173718_694970_C03836BE 
X-CRM114-Status: UNSURE (   8.45  )
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

First patch is that Use 'name' instead of 'index' as criterion.
The  variate 'index' could be equal to zero in some SoCs. Such as C3 SoC,
PWRC_C3_NNA_ID be defined zero.

Other patchs adds power controller driver support for Amlogic C3 SoC.
The power domains registers can be accessed in the secure world only.

Changes Since v1:
 -Add a new patch for change that use 'name' instead of 'index'.
 -Mofiy filename  matching compatibles
 -Delete unnecessary blank line.
 -Fixed some formatting.
 -Delete status,use "okay" status by default.

Xianwei Zhao (4):
  soc: amlogic: use name instead of index as criterion
  dt-bindings: power: add Amlogic C3 power domains
  soc: c3: Add support for power domains controller
  arm64: dts: add support for C3 power domain controller

 .../power/amlogic,meson-sec-pwrc.yaml         |  3 +-
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi   |  9 ++++++
 drivers/soc/amlogic/meson-secure-pwrc.c       | 28 ++++++++++++++++++-
 include/dt-bindings/power/amlogic,c3-pwrc.h   | 25 +++++++++++++++++
 4 files changed, 63 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/power/amlogic,c3-pwrc.h


base-commit: 057889cb4244096ea5abcbe76ffd4d311c3078fe
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

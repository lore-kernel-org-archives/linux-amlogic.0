Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 375B3EB64DD
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jul 2023 09:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=53Mo8YtaTSvQBIdSyUjlS2ZlaI4LESiLkLG7LyW2/B4=; b=WwS2KwHppkVpCa
	eK0f/EAOVkQZllx2qVxSrgLRo47piFf+J/FdSc0hOfe2IhWPjR+wCGy0xKb7GXWPvk5FFWcV00z/j
	bwSS6D4iDxtHWFQqu0Dmuvjo7Iu//N1N3LN69L2hDPchIdg/MkDqQDbV3Us5z/lZmefIJIeUB+jQ+
	7cnuBBN2U/6Tvcb4z0pM9QJKj0xfYiN7UOT3vmtB9OxzJwIoJYwvUrauCzQAdGqC02bdDDxB8QtyT
	FMVJVB0RYBnk4pFV2llbcHiaWl5TQIet35A69oVCYzbVkRRdxfJWa/bDgIx1lGdC3cX6eZ8QZz1P9
	I0zNMMzCtBKIZ04y/Z7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHL9m-00140s-1v;
	Thu, 06 Jul 2023 09:20:10 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHL9k-0013zU-19;
	Thu, 06 Jul 2023 09:20:09 +0000
Received: from droid01-cd.amlogic.com (10.98.11.200) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server id 15.1.2507.13; Thu, 6 Jul 2023
 17:19:49 +0800
From: Xianwei Zhao <xianwei.zhao@amlogic.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-amlogic@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>
Subject: [PATCH V2 0/2] Devicetree for board AN400 based Amlogic T7 SoC
Date: Thu, 6 Jul 2023 17:19:51 +0800
Message-ID: <20230706091954.3301224-1-xianwei.zhao@amlogic.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-Originating-IP: [10.98.11.200]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_022008_395732_BFB25357 
X-CRM114-Status: UNSURE (   5.32  )
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

Add the board AN400 tree bindings based Amloigc T7 SoC.

Add devicetree support for Amlogic AN400  board based T7 SoC.

Changes Since v1:
 -in memory node use properties "reg" instead of "linux,usable-memory" 

Xianwei Zhao (2):
  dt-bindings: arm: amlogic: add board AN400
  arm64: dts: add board AN400

 .../devicetree/bindings/arm/amlogic.yaml      |  1 +
 arch/arm64/boot/dts/amlogic/Makefile          |  1 +
 .../dts/amlogic/amlogic-t7-a311d2-an400.dts   | 39 +++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-an400.dts


base-commit: 76483eaf2109fc3d94f29c68ff9dee6579e95ccf
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

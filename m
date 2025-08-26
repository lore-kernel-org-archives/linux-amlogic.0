Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B356DCA0FF1
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Aug 2025 02:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2AbUd5V++GfwXtKdF9fc7bqmmv21me2fRvqvilWkLLM=; b=gHnlPSj5jHGuvT
	xygCju/6zJX2i9pW6u0E4pa+/aWxupWa8/jGxEfZgl6w41MaJhmKDVzYCtgv9vDOHI25L8g24CzQg
	sW1nVRDheydf/8I9Q3PBLHCCoZ4r5feBWL/J8//np7bduIINg0/mk330EYp41CIlLOJ+J1bmI6iCO
	xoSVL70RAN9ZW0iFuZMvVYGeVbR0AOmrgDOBnkaKZtTmPdxtMnxKG7fm8B+yF/N57ck2stRFBVzUZ
	+GzwUQCuN0OV9ZwuJSD0NkRIUqsWtX6YSwozKp+1sXSJLJ5HABiUYmhWpzKujEf50ie7rF3xCIGdQ
	KsZKjxeRzoAf+a5N7NRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqjAd-0000000AKkA-3ZOo;
	Tue, 26 Aug 2025 02:12:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqj8W-0000000AKTZ-2rKT
	for linux-amlogic@lists.infradead.org;
	Tue, 26 Aug 2025 02:10:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAEFD44704;
	Tue, 26 Aug 2025 02:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85782C4CEED;
	Tue, 26 Aug 2025 02:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756174211;
	bh=0ZhDCvNeyZHdraVAF+JAqgTlwwrIyBAkGodg6u0wvUA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=fZuOUcx2q6h1iCxzrNMUQL0lonRgF5qYCxzdeIRXOejR2NdRobcnlA1tuFpbtDP2F
	 PR28vfT64msDEu8XPkG4RwMq4D/YG7q3lsVQ4x3ekOg/lJNZ1nNAj8YyCdFNI5ikri
	 5n1T0O3zRCUneXhdyoL19MDpVS07fzdqp8MHyLuQ/rDDmjqu4IdUOuOTBmecVSa8KA
	 LapmeK5+4ypLxeyeiKyURUn5vDZsBkzkl6h4jAVyT6gv6/D1EX7ysCjnmz4YrC5CWM
	 97Ea1Tl3IousamtPsYVcIg0un+rTKpgK7PXIhFkmSG4HUfq178FswQuO0lQLDodLKQ
	 8bwDf/6D1/nWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4F9CA0EFA;
	Tue, 26 Aug 2025 02:10:11 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v3 0/3] support for Amlogic SPI Flash Controller IP
Date: Tue, 26 Aug 2025 10:10:08 +0800
Message-Id: <20250826-spifc-v3-0-7e926041d7f6@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIAXrWgC/1WMwQ6CMBAFf4Xs2Zq20Aqe/A/jgdYtbCKUtKbRE
 P7dQiTR47y8mRkiBsII52KGgIki+TFDeSjA9u3YIaN7ZpBcKl7zisWJnGXqpAWWyhkUDvJ3Cuj
 otXWut8w9xacP7y2bxLruhfpbSIJx5lyFJUepW20u7fDwHdmj9QOsjSR/PCl2T2bPCNE4XRlle
 fPvLcvyAbqGCwjUAAAA
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756174209; l=1621;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=0ZhDCvNeyZHdraVAF+JAqgTlwwrIyBAkGodg6u0wvUA=;
 b=WqzjJ1o4w2CJM/Xelv4MpMLD0YDe780ru8Sk78CgDKc/OJSmr4X3uP8OFjAy/nGkOkc+cP27Q
 kSr91M6OrF/Ac9tKU2W0ZsOYUYoXaQpQshLXCoNSl/7FRwRNoDFtzyR
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_191012_770518_D4154484 
X-CRM114-Status: UNSURE (   9.45  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This Flash Controller is derived by adding an SPI path to the original
raw NAND controller. This controller supports two modes: raw mode and
SPI mode. The raw mode has already been implemented in the community
(drivers/mtd/nand/raw/meson_nand.c).
This submission supports the SPI mode.

Add the drivers and bindings corresponding to the SPI Flash Controller.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v3:
- Restore message description and modify subject [1/3] that was omitted in v2. 
- Link to v2: https://lore.kernel.org/r/20250821-spifc-v2-0-b119f64b5c09@amlogic.com

Changes in v2:
- Remove clock reg descriptor and get clock from common clk.
- Remove ecc and ramdom descriptor in bindings.
- Modify the format and message description.
- Link to v1: https://lore.kernel.org/r/20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com

---
Feng Chen (2):
      spi: dt-bindings: add Amlogic A113L2 SFC
      spi: amlogic: add driver for Amlogic SPI Flash Controller

Xianwei Zhao (1):
      MAINTAINERS: Add an entry for Amlogic spifc driver

 .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  |   82 ++
 MAINTAINERS                                        |   10 +
 drivers/spi/Kconfig                                |   10 +
 drivers/spi/Makefile                               |    1 +
 drivers/spi/spi-amlogic-spifc-a4.c                 | 1224 ++++++++++++++++++++
 5 files changed, 1327 insertions(+)
---
base-commit: f8b3f0d7b2a91ba84d06343c3ca4522e35a65f56
change-id: 20250804-spifc-5761e35fbe1f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09C4CA0EEB
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Aug 2025 05:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t628WhUCk12adsOL3VoFRCv+kxTqoj7KyDinpmiEKmY=; b=Tk/QTcDwKsb/Zc
	b3RJdbAtft/lJ1QTtwcT0IYmQfvRCbi9HSqBo6bGJzGVSG4Xih5K3/zpnahshZVGxpWyg5rm3NMDl
	JOe/RuaPpA+/V2n9bcTf9asrCTObIeIhIskffQhYyT5DWnH6XVPCuQ5/oy9M5VSDhuuiHYogVzJsL
	kVQCbdl32+mQMbfuSsOC6xuqWRU8l8qGU7AgLdlJqlbzs59tflcyMmCVn4KCoZFP2Wz4mNBnL4yHT
	EwCDg+a7C8bjV0EkPTlS+8lotVpFUN8aEIAfjjsr9efeH56N3K40gE+OHESn0tSZMwwhj9mg4nJm3
	/nQQr3EZc3eTydphS/Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxnz-0000000FsQ6-2mzz;
	Thu, 21 Aug 2025 05:25:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxft-0000000Fraj-3yia
	for linux-amlogic@lists.infradead.org;
	Thu, 21 Aug 2025 05:17:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9625CA55872;
	Thu, 21 Aug 2025 05:17:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39B84C4CEED;
	Thu, 21 Aug 2025 05:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755753440;
	bh=lgQDiZb0DulClOgWmp02Qm9x5FANbERY8z36HeeKjY0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LWOw1CM0mSeh9LnE4EMguyfD2RqAFFJLfIvFo8UCMsACBpMF1uJdD2cgQYbgpohyF
	 j3p1hlTvCfx0Du9KWUQEGVs1KMkQoWPn74L0RgzCxLPSjhGLpZmSH2jy9EHsa0W4E3
	 b6FLItZPhg51Y5b8eixVYqIaL31i5Q6fANR1sFP25UspFoZxdF9TlJi59Gra0+rbtq
	 WRU05iQG6WZ/u6agK9Oilcj1wknrP2PwGRpUJP7XK+rskOzb413/La0fSZNK+GgCBy
	 OEI/XWV3TxdsQNPAudUyPireuEd27TPSc23Qne8CgWymFOVvAJYIffZLEnW097Ae/V
	 IxrNPuGh97VSg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24450CA0EDC;
	Thu, 21 Aug 2025 05:17:20 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] support for Amlogic SPI Flash Controller IP
Date: Thu, 21 Aug 2025 13:17:14 +0800
Message-Id: <20250821-spifc-v2-0-b119f64b5c09@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANqrpmgC/zXMQQ6CMBCF4auQWVvTFlqJK+5hWECdgUmEktY0G
 tK7W4ku/5eXb4eIgTHCtdohYOLIfi2hTxW4eVgnFHwvDVpqI1vZiLgxOWEuVmFtaERFUL5bQOL
 X4dz60jPHpw/vg03qu/6F9ickJaQgarCWqO1gx25YHn5id3Z+gT7n/AHK10B2nAAAAA==
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755753436; l=1444;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=lgQDiZb0DulClOgWmp02Qm9x5FANbERY8z36HeeKjY0=;
 b=W5vglRBMS++ooBheJlBd00l+epbkQ75pXcWPZlHKO0zWWV5VrVLumigzlXRbPxKKhdcloJmfi
 Cr4bCBYMfSHDSCoG3yqk92DvcWB7SEPkc1YNKiexWvXg2SqBUjOz4+S
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_221722_126205_F239D98B 
X-CRM114-Status: UNSURE (   9.06  )
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
Changes in v2:
- Remove clock reg descriptor and get clock from common clk.
- Remove ecc and ramdom descriptor in bindings.
- Modify the format and message description.
- Link to v1: https://lore.kernel.org/r/20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com

---
Feng Chen (2):
      spi: dt-bindings: add doc for Amlogic A113L2 SFC
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
base-commit: 8e13f0500222e187a82dd3c93c0ea8cd2a4d46a6
change-id: 20250804-spifc-5761e35fbe1f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

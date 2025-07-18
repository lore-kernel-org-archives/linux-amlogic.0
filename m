Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4709CC83F3C
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Jul 2025 02:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zNxdn2fgZX2aXVzGfjvxeQgswhZyx2VI1m0w4tSAf3E=; b=RIVRjs4+QO55Nb
	ti7qzd4RElulwgREhstgMLatMFNUHDy/u1EpuvCkdlCKqGtArcWa247WrV6eBuNGEjt2AZyK+WUIB
	sBd24X22ZjO4HIfNYCH4987FwkL4xTzstX2Y7/vScbhJPJFlBXhdXQI5myhmaNWyeSi0/EqrY9DcD
	jQAr/1SjKZynrUCwETNX1q5IlWI1etHxgCfrquG15IlpLAUBVpXPHn2p/7642OBMsfKzzV/e2Ld/h
	egm4ECvZyWgJHumHHSBmczvBYFu46Pmj4jIqaFTr+oqx5xcxNvvaIb49d2vLT8TJq2iGQpXOHdH2W
	v0LN/SsoRsDiY/PLfB0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaWG-0000000BW0f-0xyY;
	Fri, 18 Jul 2025 02:08:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucaGr-0000000BUBW-0YYQ
	for linux-amlogic@lists.infradead.org;
	Fri, 18 Jul 2025 01:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05C9FA57919;
	Fri, 18 Jul 2025 01:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F330C4CEE3;
	Fri, 18 Jul 2025 01:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752803539;
	bh=T8ojarsyUU3VdRkPNIjPH+hMXuJfPiLhUJlGAKELHag=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=J4vIJ27ucyYSoQEfQeynNX2zuRsnmDUzQBbU0pxzcm08a0xg6CLc5OOV3MzCIpmPn
	 RMvTMDB/zDPPXrlsgpwFXxe+LASf1DF4xJlwQmL53fV/HIWww2E9DufdYileRAjDaI
	 KNljkw0hU8axRLMr1r51PBiNu0xAMNEGX6XSUDoS6L8qVkOiVecBEuGDFmt9BjxgT2
	 WFxupPiuLmHCf4/POeaL0aTSjbsEyzZKKaXxWT7Y2yEXXu7IkgkxjwGqmzGtXIP6FB
	 3d2SDBhzFlSkEesBz6fHNDt5AzVjv2ncP5ee6+0c0apoRpe4jt/hkEwSYue2XncKdW
	 9NRRYyYg0fjJw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B1ECC83F22;
	Fri, 18 Jul 2025 01:52:19 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] support for amlogic the new SPI IP
Date: Fri, 18 Jul 2025 09:52:15 +0800
Message-Id: <20250718-spisg-v5-0-b8f0f1eb93a2@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAM+oeWgC/2XOyQrCMBSF4VeRrI1kaIa68j3ERYbbNqCmNBIU6
 bubFouVLk/I93PfKMEQIKHj7o0GyCGFeC9D7HfIdebeAg6+bMQIE0QSjlMfUouVbhiVmoE1DpW
 //QBNeM6d86XsLqRHHF5zNtPpdSlU30KmmGCha+4t1L4W/GRu19gGd3DxhqZGZitH1eLY5KiRR
 BhdWS+2jq8cWy7OvDinOG2EAqZrt3XVz6nfnVVx0hboGwuSkn83juMHG2hVM0QBAAA=
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752803537; l=2119;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=T8ojarsyUU3VdRkPNIjPH+hMXuJfPiLhUJlGAKELHag=;
 b=Hw+zDiRsCmR+NB0r3zy0ptubSX5gfKCJ+VfAzYdlVxGanxFEZQbe9kezOWqTaE13KNUo+5uq3
 T2KAn61MQ+3BmQgtZcypOcX9fJNXM/+80R+skSaIE4pZxgg4iERjMrO
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_185221_320135_7DC9C736 
X-CRM114-Status: UNSURE (   9.19  )
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

Introduced support for the new SPI IP (SPISG). The SPISG is
a communication-oriented SPI controller from Amlogic,supporting
three operation modes: PIO, block DMA, and scatter-gather DMA.

Add the drivers and device tree bindings corresponding to the SPISG.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Changes in v5:
- The location for interrupting registration has been adjusted.
- Unexpected interrupt return IRQ_NONE.
- Modify div clk register and process reset_dev return value.
- Link to v4: https://lore.kernel.org/r/20250704-spisg-v4-0-6b731dfbe610@amlogic.com

Changes in v4:
- Add resets prop and modify some formats for bindings.
- Remove irrelevant headers files and fix some issues.
- Link to v3: https://lore.kernel.org/r/20250623-spisg-v3-0-c731f57e289c@amlogic.com

Changes in v3:
- Rename of bit definition and fix some issues.
- Enable runtime_suspend function.
- Link to v2: https://lore.kernel.org/r/20250617-spisg-v2-0-51a605a84bd5@amlogic.com

Changes in v2:
- Use regmap to operation register and drop bitfied define.
- Use "SPISG" prefix intead of "SPICC", and declare clock div table in the spisg_device. 
- Delete other power operation functions except for runtime_supspend and runtime_resume.
- Fix some format corrections.
- Link to v1: https://lore.kernel.org/r/20250604-spisg-v1-0-5893dbe9d953@amlogic.com

---
Sunny Luo (2):
      spi: dt-bindings: Add binding document of Amlogic SPISG controller
      spi: Add Amlogic SPISG driver

Xianwei Zhao (1):
      MAINTAINERS: Add an entry for Amlogic spi driver

 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  |  59 ++
 MAINTAINERS                                        |   9 +
 drivers/spi/Kconfig                                |   9 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-amlogic-spisg.c                    | 888 +++++++++++++++++++++
 5 files changed, 966 insertions(+)
---
base-commit: bd30b995df8fd053e13d10f78dbc7b2fa5ed1aae
change-id: 20250603-spisg-78f21682ebac

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

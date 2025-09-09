Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98538CA0FED
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Sep 2025 06:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=21iimOJblDQ+cxdPNv2KOw5u8Z1/CoR1aj2TQGPvNw0=; b=go/3kXLgdYe9mG
	7nQs3UD1dAqbxOQqgFWFQWALtHRD2LexSj6VQLiKV9xz6wb+PSOdxHmFrbLnALM+7qoJznZ21fam9
	p4a8PCvuB6Dcpwqxv+pvBW2tT4SXAoM09coxqpEC6r+kubNubq/X95mPq3W+41dEtEz8JEpJdyDmW
	l/R8M0Wo8hQMwLxGIdjNRYRT5dU03FssMvo0/sqwabG4Jr9QDxC7azdSznzCW4Jdhmsa087iX3iPH
	syOWFfG9wVBQFKWYQ0w/Tr3fBnqjuZmnsSQnGUhvLxPvsw0+OtSg2NbG7yidk5hw70MeugE7rdJu3
	M4x7ido+H2VNnov37xCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsJ8-00000004yZ2-0cmX;
	Tue, 09 Sep 2025 06:58:26 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvqfZ-00000004NFo-2dZD
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Sep 2025 05:13:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AA87840572;
	Tue,  9 Sep 2025 05:13:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 766DEC4CEF4;
	Tue,  9 Sep 2025 05:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757394808;
	bh=6PX2e7dGJjwC4zwK2oyfFNmBAEYYwMR+WepuRDhd+V4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=W6RU8K+Uemim/kU+/rw2eH/pm0g/HObi2e5hZiuInqe9cSWMO4+BTczCHfjQ3iBHG
	 /v+2WVXTs5P03GMZBV3XClwKuz88IZcZHO17FK78IcOAGrEVINqg7abJws+45bBgmU
	 86avdnXw7vmeQ58U5Q4yfv5x83Gy7w5uyw3UtRTUjYzQVJRpo2jH0LPrlF84UZZOPE
	 yjZiY5hNyfdyY12CL+VLz7BK29cbaNKW5BX4Q3ZBSpWJcf7eeSYOXfAgUbIRQqx4bo
	 Vzd0lQgVkjgiQweZU6X6rpnsPhJoGZsms7qYu3D4Yu56n5zkrvxFbQNg3mHotmjUyc
	 ZEjygHURAFHhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62394CAC585;
	Tue,  9 Sep 2025 05:13:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v5 0/3] support for Amlogic SPI Flash Controller IP
Date: Tue, 09 Sep 2025 13:13:24 +0800
Message-Id: <20250909-spifc-v5-0-962bc147d17f@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHW3v2gC/2XMTQrCMBCG4atI1kYy+WvjynuIizadaQNqSiNFk
 d7dWCxUuvyGed43SzgETOy4e7MBx5BCvOdh9jvmu+reIg9N3kwKaUQpNE99IM9NYQGVoRqBWP7
 tB6TwnDvnS95dSI84vObsCN/rUih/hRG44EQalUBpK1ufqts1tsEffLyxb2OUKydhcTK7GsCR1
 bXxwm2dWju7OJVdgU5aoaEpyG6dXju3OJ0doCmoUY5Mqf/dNE0fbW3wR0QBAAA=
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757394806; l=1969;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=6PX2e7dGJjwC4zwK2oyfFNmBAEYYwMR+WepuRDhd+V4=;
 b=YzPNsHeKO+ldWi+RFRj6miT15/ZHAsvByjJbWR4va/heDq/6NXdgIbfh69kdvVWpqEYDVfvmI
 fU3RXriUQ+vD1izrpa/k1j+6WQDPKhYuOS+kNFzBWoplEEb9tRl8KT1
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_221329_719949_878B69C6 
X-CRM114-Status: UNSURE (   9.49  )
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
Changes in v5:
- Initialize local variables and handle exceptions solve compilation error problems.
- Link to v4: https://lore.kernel.org/r/20250829-spifc-v4-0-1e57fd39f584@amlogic.com

Changes in v4:
- Reword desc of 'amlogic, rx-adj' in bingding file.
- Link to v3: https://lore.kernel.org/r/20250826-spifc-v3-0-7e926041d7f6@amlogic.com

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
 drivers/spi/spi-amlogic-spifc-a4.c                 | 1222 ++++++++++++++++++++
 5 files changed, 1325 insertions(+)
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

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E12C83F09
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jul 2025 03:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wBej7u9hbIrsn13h16ROjl2IsKpO1IlwLhtmzBzL2Es=; b=mTxcspV0SfIPMa
	WXB1OTm3wXPHDRd3lX/W7Ab1rRop77CTg3jn+3Ol3++VYpsH4KdWoLXZkvao+tx3ypyqpEgcuIdyd
	4fGQNpSpYuhOMq+nod8NhRaKuYee8qE7Or6r7ZQl9eI/5S6QvE2WYnDtJY7F7PL7ZOOP+oNJQjPYB
	zw+Rtp5QYEnRKb/ZrqZPUew4W0+w8YfDy2MN8LQPZBUUzW6UuoIM/zCWMIqgH0Iw8KwRt6zMwydxm
	RZnPhw9zLwZKbB3mb4IX+NJdxtzomZXShUpUeIZGxNH7CnGg/MQxZSdsV4gL7RpjhFmkpIocY93fb
	/WqEZzUoDU1E9LnKB5gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWlq-0000000D89r-1g5r;
	Fri, 04 Jul 2025 03:07:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWeH-0000000D7Mn-134R
	for linux-amlogic@lists.infradead.org;
	Fri, 04 Jul 2025 02:59:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 59A2661450;
	Fri,  4 Jul 2025 02:59:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06EB4C4CEE3;
	Fri,  4 Jul 2025 02:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751597974;
	bh=AN3zYOg/SC8p0HEnNd2sFLzv/mQYAsIfsucNFSrf+Ac=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=hLoyU2wa2vxnTXkRBu8+xSYKzeOYv6xj9kpTusX9MBr+0w3hJd6K7mbZ52hOwHqpS
	 cMO970JsYFT28MsqlQj4m8wgHhZ4p4wrgU6vYQzlx8ogMrYCqIhRF6Qo+M/G1layyJ
	 PoY2o2XUQjSk6gngJIWYNVHKqDk6dUWE2LknRejdPJJ0Fvx/MryDHk1GhgBO+eRCVr
	 Qpe4RnK2/RI2XE/oWQD70ifKmSTeIbbTpgwNmLPNHveAiQFkfYamU70smQHK/NViZz
	 5hLWkjXceobD9RgBVfCxKmBHuJ/mmCPiUlF6Og3QD9+qLZbhm7TV/SRa1mHRwl56yx
	 8F+pevcpKCCsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB148C83F07;
	Fri,  4 Jul 2025 02:59:33 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v4 0/3] support for amlogic the new SPI IP
Date: Fri, 04 Jul 2025 10:59:31 +0800
Message-Id: <20250704-spisg-v4-0-6b731dfbe610@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJNDZ2gC/2XO3wqDIBiH4VsJj+fwT6btaPcxdmD6VcLK0CEb0
 b3PYkFjh78PnxdnFCE4iOhSzChActH5MY/yVCDT67ED7GzeiBEmSEU4jpOLHZaqZbRSDBptUH4
 7BWjda+vc7nn3Lj59eG/ZRNfrXii/hUQxwULV3DZQ21rwqx4evnPmbPyA1kZiB0fl7tjqqK6I0
 KpsrPh3/ODY/uPEszOS01ZIYKo2v25Zlg+IQNAaDAEAAA==
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751597972; l=1846;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=AN3zYOg/SC8p0HEnNd2sFLzv/mQYAsIfsucNFSrf+Ac=;
 b=YOtuMj0B9H0vJgflB6YDqgr4DZR8xDKRQE+zqr8EJGDkPns+8Wx77xxiHz6G5IWKC70LWsVFx
 SjJfINMCWdxDlZ4ZFu0uZcOT2TMP9aDOFCIZ4t90KAKctq0KAI8cb+d
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
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
 drivers/spi/spi-amlogic-spisg.c                    | 871 +++++++++++++++++++++
 5 files changed, 949 insertions(+)
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

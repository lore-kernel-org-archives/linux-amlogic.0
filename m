Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE976C71155
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jun 2025 02:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NTSehgzT4+nU+93C4Rg1Z28QBsiVXwB6mdPFfO5SR4k=; b=VsXlF3m0G5J2QL
	uwHKOHKCqUT6DgRo6tnniAUOv8ZQJG687mbJGaQefAbIKsODyWT1zuB+UoYk7FHu2MVpZvMFMObwE
	ncklLYFelQHPXyJsilXCfUpSkjnPfCcCxgwljylLiMsKp6ZfNAEzGdu/fcUGY+OAo3UfIAc2z9kQ9
	Fo4p5wPI9YR//2oBVUUg+pG2QgwpObwRvNuDl9bbgSLR/eFEhWLlnGoTroU/3cyJhv5YQgsntDGjS
	F6TkMpEKanlM6SQ3i8g2FXBzTILK1n5G7kscTtucDXL1SJ745eKlbC6Ffg1MkLBHSFnexAqGqq3Dg
	yWjN24awLszUtMVJW3hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMNT-000000063sx-38Wx;
	Tue, 17 Jun 2025 02:48:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRMNQ-000000063rc-2aLU
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Jun 2025 02:48:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D83585C4D91;
	Tue, 17 Jun 2025 02:46:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1410FC4CEEA;
	Tue, 17 Jun 2025 02:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750128523;
	bh=DklztjJ2Mw4DZTzCJXFIusPWDE6iqwE0hRAVc+zb/5M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=RXAdnN/VH4whkEDHi0WhWsgK0TD7IDzbqiegcOr8PAe/4GJk+joOalb9pVGxfU9W8
	 vzRlHw2yZ9Y3UzN5eZkuCRmU/GV/Uj3OvEZRx0zow+BdXW+jLfvEDF3o7r8+QEH+/X
	 WlwW9rnX/FR09001rWLFG8GucBxi64Yc0JZanNOWuq+f/8nC4NE1nVM58O1LbIcPtr
	 Nv6HAJCQ7SE5N99mdASgfCpoIAGvR8PghnVFgSrZLGB0ZM55r8BFCXXCfjKEbCIaSY
	 ZmJtjLPb3sRjnj5ep7Ji4LLWzUFJK8++bzt8FnVLgxNsw/Gs7Rv6GqvZ2Ty4kYuMwm
	 bX8YIABlGxAWw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F41F2C71155;
	Tue, 17 Jun 2025 02:48:42 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH v2 0/3] support for amlogic the new SPI IP
Date: Tue, 17 Jun 2025 10:48:35 +0800
Message-Id: <20250617-spisg-v2-0-51a605a84bd5@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIPXUGgC/zXMQQ6DIBCF4auYWZcGsFh11Xs0LhBGnKSKgYa0M
 dy91LTL/+Xl2yFiIIzQVzsETBTJryXkqQIz69UhI1saJJeKN7xmcaPo2LWdpGhaiaM2UL5bwIl
 eh3MfSs8Unz68DzaJ7/oXLj8hCcaZarvajtjZTtU3vTy8I3M2foEh5/wBvye3UZwAAAA=
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750128521; l=1440;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=DklztjJ2Mw4DZTzCJXFIusPWDE6iqwE0hRAVc+zb/5M=;
 b=8h9iC9im/B3MsOYxsjoF/SsNde6GwLGzHa0m3zbNfwkanuyQJc2YiiDB/4mkEiGbxoWFHVw3a
 mrUv4z5DSneBIlVg5e9geBhXGLt5rG9DeNZfOReOCIDhe1z5P9+zp4m
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_194844_778353_7DBC52D1 
X-CRM114-Status: UNSURE (   8.60  )
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
Changes in v2:
- Use regmap to operation register and drop bitfied define.
- Use "SPISG" prefix intead of "SPICC", and declare clock div table in the spisg_device. 
- Delete other power operation functions except for runtime_supspend and runtime_resume.
- Fix some format corrections.
- Link to v1: https://lore.kernel.org/r/20250604-spisg-v1-0-5893dbe9d953@amlogic.com

---
Sunny Luo (2):
      dt-bindings: spi: Add binding document of Amlogic SPISG controller
      spi: Add Amlogic SPISG driver

Xianwei Zhao (1):
      MAINTAINERS: Add an entry for Amlogic spi driver

 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  |  55 ++
 MAINTAINERS                                        |   9 +
 drivers/spi/Kconfig                                |   9 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-amlogic-spisg.c                    | 878 +++++++++++++++++++++
 5 files changed, 952 insertions(+)
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

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7182FC87FCA
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Aug 2025 02:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hJLEhD58/XKH2TPR6IdGjiyut49XvBgZ75CYxdL6EzM=; b=TPmQ+taqZ3HzTG
	epxSKSCqloAxSxfuNsoD9vMms841WwhF4u8G0gc+5OMb28YTglzCokhV/ZumyLHR4AHWfWvJhPhna
	OtKSgfIwZHqJk7LRSpB1T5yormtrdJRwIvARBJCTfOj/EehrM5udEZtMqTDgGhq96XyjzZhfgsBKr
	i+XZMct93gBU5kg2vBLx5NNKvr8v9tdACDj6YUWquCbHprHYVFYx/auqWFL8NHZr4Amzk68DsoT26
	TgUWaG5yyHFJzLhD2Pe6xzZf7yjwPKaqA5EbpRr+CgO3aHZcuYeUAlEAYciP+kDxUomoO6TbHKySb
	Ta8Oxxwma0ssTdrkizFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCRM-00000001pik-2K8a;
	Fri, 08 Aug 2025 02:02:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukCPP-00000001pUQ-1YNA
	for linux-amlogic@lists.infradead.org;
	Fri, 08 Aug 2025 02:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 523CD44195;
	Fri,  8 Aug 2025 02:00:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2921AC4CEEB;
	Fri,  8 Aug 2025 02:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754618436;
	bh=Q9TvXkCZZFK5X+atV+OgJiaaH15TABP2XLM2/bN3sx4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FN9OTQdS5b6ueW4LBI3PdFzR+pJf0vrM0UlaNRhYXs54NdBceQnAF3xl/eB4dI043
	 9MTJoqlVI6kvstaIDN/fht+uHuB2hlhsdm3BgrEXpdzSUsHcrJ0MyqeEIwaDIgJB3e
	 FA+Uw/iE/tTVpS12By2uO0yZZkoWjxK3cYH7ARM1BEvBbJ2HKypOX+bDTfAFXfxO3K
	 cZ+loURTob82ESfk2fcKhISY+MJNEYIeCFJUOeesoNSNTICvq992LdNpDPL46O8rWl
	 RQq9LADfkmnqrKWr48jdKiguuvjVeQmmng443tZ/B5KJGbu6NWBrJYpenjtnkpeMlA
	 oFnQGnNeND9yQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C05BC87FD2;
	Fri,  8 Aug 2025 02:00:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] support for Amlogic SPI Flash Controller IP
Date: Fri, 08 Aug 2025 10:00:33 +0800
Message-Id: <20250808-spifc-v1-0-ff4e30e26a6b@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEFalWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDCwMT3eKCzLRkXVNzM8NUY9O0pFTDNCWg2oKi1LTMCrA50bG1tQBFzYk
 0VwAAAA==
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754618434; l=1178;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=Q9TvXkCZZFK5X+atV+OgJiaaH15TABP2XLM2/bN3sx4=;
 b=0P/Gz33Pfi1wslGAfGII4PqKRTTYGefeUIhLu62F6trfQX8GwyFjb3ZT1BSiGIS4QiVjJ6FFb
 1eXhkxn4fdWDMSRI5/MsRJG9DnEXScg1SETR5SvYmi7hzyOyDZo3wHl
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_190039_435515_9B22ED88 
X-CRM114-Status: UNSURE (   7.64  )
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
Feng Chen (2):
      spi: dt-bindings: add doc for Amlogic A113L2 SFC
      spi: amlogic: add driver for Amlogic SPI Flash Controller

Xianwei Zhao (1):
      MAINTAINERS: Add an entry for Amlogic spifc driver

 .../devicetree/bindings/spi/amlogic,a4-spifc.yaml  |  104 ++
 MAINTAINERS                                        |   10 +
 drivers/spi/Kconfig                                |   10 +
 drivers/spi/Makefile                               |    1 +
 drivers/spi/spi-amlogic-spifc-a4.c                 | 1328 ++++++++++++++++++++
 5 files changed, 1453 insertions(+)
---
base-commit: 60fcf916e06250108143a993bd803c6b12ad8d02
change-id: 20250804-spifc-5761e35fbe1f

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

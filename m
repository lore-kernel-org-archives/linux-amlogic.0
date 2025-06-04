Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7732C5B552
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Jun 2025 07:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gLO449CbUw+SpygGTd0yh42dBN1AE6kUJQMxBNsfxRQ=; b=4LMj2E8JXKGh63
	GLpAA0X0q2nGRTm9XSsqaw1tnaAXcvRFxMgQTZPmr/CH3CFevCdAbaYkd3bs+qRUQ7CydV4F9jAXE
	MtCj8/8SNzy9fVgVnCNOqZ/TtkdJAhRe6PyuBF6ZmNUVS6Eal9Cao6eU0VqLuiHRm0P8nxelcAKLu
	zElozni2RR7/wE43M8D6tK0T2MDHnybGBUx0jFdG6EtzoU5cR+vkdrdxV38kogWWmxjg5HzqXXQWz
	Qd1RQ9/iQlOP4e/MEll5x1oJqolMAKT8cwqZxPgm6hz0MgeLXspjVmbWG6F5WkjbxjPQun3fTEzBw
	UQd2uPCtb8ZQ+Z/wcEwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMik4-0000000Cmre-1uEC;
	Wed, 04 Jun 2025 07:40:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMik2-0000000Cmq1-1xml
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Jun 2025 07:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8E8FCA50154;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 374DEC4CEED;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749022853;
	bh=pHr+iNzLv9GxJXJt/p1c4oLkaW7OLQQwQD2ifOprTdk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YhLDvS/JK1MQjqJOCtFmwY4ee7MnE1rf5k+7mIya90zdFIJZ0WTetG5/26ePTXhiG
	 /1svIGiL6GaK1QRuwQPdTMST0ZZADHh7rblpDdYAcPkAQ/9bbMcvreT4hsTc+/zk/m
	 BlRGWM/WvmCFDRJ7aq6lku1l6OOkio/Ch5mSjVRz0r2J63C0MWxchQrOKD4zvCEteC
	 eqsPlR2aX7ZXv8x7wCLHHc/FsfwezehO5/tIY4+HGbLfWJ/Mu0YGRYwDzWybrY2YiB
	 4EnsOoyCtwy4ipeHNfIs8N/IBPp2wvs6cy51zQlygEb4O3FaJbbAz2jKHUmdheTPVI
	 tZE2CrSZpaqZg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE15C5B552;
	Wed,  4 Jun 2025 07:40:53 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] support for amlogic the new SPI IP
Date: Wed, 04 Jun 2025 15:40:50 +0800
Message-Id: <20250604-spisg-v1-0-5893dbe9d953@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIL4P2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNj3eKCzOJ0XXOLNCNDMwuj1KTEZCWg2oKi1LTMCrA50bG1tQCIsWq
 JVwAAAA==
To: Sunny Luo <sunny.luo@amlogic.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749022851; l=1058;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=pHr+iNzLv9GxJXJt/p1c4oLkaW7OLQQwQD2ifOprTdk=;
 b=zYbYWKMNv3d0lQCjOkN7LVwChi6psdws+UWgSlWO/xtLIY8JcHtqxIaHqmCGEcRkP5u6l4uxN
 mPd/KhjEPTcBNK2OHN9ffH7JR2kD8r/8Mo2jJr8HnFlCej2L0E4QD0C
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_004054_581509_6A0C25BB 
X-CRM114-Status: UNSURE (   7.17  )
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
Sunny Luo (2):
      dt-bindings: spi: Add binding document of Amlogic SPISG controller
      spi: Add Amlogic SPISG driver

Xianwei Zhao (1):
      MAINTAINERS: Add an entry for Amlogic spi driver

 .../devicetree/bindings/spi/amlogic,a4-spisg.yaml  |  55 ++
 MAINTAINERS                                        |   9 +
 drivers/spi/Kconfig                                |   9 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-amlogic-spisg.c                    | 944 +++++++++++++++++++++
 5 files changed, 1018 insertions(+)
---
base-commit: 57cf46cd1fe351846e1b065ca9546eef66675ecd
change-id: 20250603-spisg-78f21682ebac

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

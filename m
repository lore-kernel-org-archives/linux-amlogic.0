Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC38C9830E
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Sep 2026 08:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=za6PocdYbNbFGUBQWzcmdV2TtH6e6JK2++ABkDoOImg=; b=3t+WNqseUA9l+m
	X1Vz0FbWQyN8hFqUe2ta+sS/SRCIcUlHkm5yceD5dHTvN6lNLb15QXV8jjxjZXtX1cMkmqoz+ussP
	FM3h9NkonZY7Rpak374CGqr/4Tw5I0YACRZg5g/F/JkDckrTlofokBxMUyExnyw19hf8pACwwIU5G
	rn8WEGMYtDL1zk0WnaiCHZ/5syzeqfUozOU4QzNoyIGOpQ9TFWGy4eDS/go3abPuon0r6Vo1m03Am
	ZVzllXBKTv/f+BN9WkERjaKkYV581MwxmApaSad5PmoDlRnSAjbfp9pwIx5sf7W4gippFHZxCCe6N
	e8b2YCRQIjbthCr9XX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezo-0000000ASjp-3ZDd;
	Thu, 24 Sep 2026 08:40:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezf-0000000ASfS-1Dyu
	for linux-amlogic@lists.infradead.org;
	Thu, 24 Sep 2026 08:39:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6720A602C4;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 31838C2BCB3;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790239190;
	bh=0Zdvv1H2vY20qgMq7ejxgwzP9h/gzw/1guKtZBvMtyI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ZcN3KziGgutG27SBVDaV0ndw5NE1mEgic1nLx0Dl2HKzZVLXipajJwr+SAE1qQhhD
	 D6b7oSGmwYUoyuBJOSF41BbCWnAktaeBKLX5d/OOVpDNM+O9xLd92MgaU6mkfVhsf8
	 dotZmBodZcIJzn8CX5C/tpEx//mybOTdxi1es9Ts0y3nRHzNUAlcn40TTJ6Y4wT6pU
	 S8dF1zY3zWM1pMJ0Y0b3x7pbOhwVy/sLbgvzxLINzsRi3IH5gF6gcM6RAOejCBTm3y
	 recbRcQLf+RoOT4EhoiM5a9+Y//VeA2QMcBHOQ8TDt/NV0sAcSHExvlO+omPBmClJU
	 X/3vBAK0jSVYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E054C98311;
	Thu, 24 Sep 2026 08:39:50 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] i2c: Add driver support Amlogic A9 I2C
Date: Thu, 24 Sep 2026 08:39:33 +0000
Message-Id: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMXhtGoC/x3NwQqDMBCE4VeRPbvUrGLVVyk9xHRa9xIlERGC7
 27S4898MIkigiLSVCUKODTq6nOYuiK3WP8D6yc3SSN9MxrDdmQVx9J1zwEi6IeWMp5tBM/Berc
 UnsmjMI9zL/MW8NXz//N6X9cN2hcA83cAAAA=
X-Change-ID: 20260911-a9-i2c-24478e22e683
To: Junyi Zhao <junyi.zhao@amlogic.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Xianwei Zhao <xianwei.zhaol@amlogic.com>
Cc: Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790239188; l=891;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=0Zdvv1H2vY20qgMq7ejxgwzP9h/gzw/1guKtZBvMtyI=;
 b=nGXvSYzZAE1DmqOkbjIhGAK1rvc731QofIqzvdiWy3K17AECnFpZbcvHNlqHn4CQZF0aDxGzi
 Itu9wKqZKCdDQ0N0sYYTz4I8Oo9Kwc2sEXWQEtzFtzrVBw+2vOkgWbf
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
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

Add a Device Tree binding and driver for the I2C controller found on the
Amlogic A9 SoC.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Junyi Zhao (1):
      i2c: amlogic: Add Amlogic A9 I2C controller driver

Xianwei Zhao (2):
      dt-bindings: i2c: add Amlogic A9 I2C controller
      MAINTAINERS: Add an entry for Amlogic I2C driver

 .../devicetree/bindings/i2c/amlogic,a9-i2c.yaml    |  61 +++
 MAINTAINERS                                        |   8 +
 drivers/i2c/busses/Kconfig                         |   9 +
 drivers/i2c/busses/Makefile                        |   1 +
 drivers/i2c/busses/i2c-amlogic-a9.c                | 504 +++++++++++++++++++++
 5 files changed, 583 insertions(+)
---
base-commit: e817a366cd24ddc8f986ef43c5d54cc3f60b0c21
change-id: 20260911-a9-i2c-24478e22e683

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

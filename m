Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1574CA101F
	for <linux-amlogic@archiver.kernel.org>; Wed, 10 Sep 2025 10:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4BtE/xBTPSIQe6Q9HNW90wgHekkgK8/902txkepeq8=; b=LlfXJgQja2Lt77
	8D2OkFg/jeBk5O1XMqRaiTCUl45XHAjhDcJwdjW9pBSQLU9RqHLQEaOw8DnSnh47CpAdj6US3T1RY
	p6bl77CDRTfJcpYiE/tddvVl7Vt/TVg+idCDdQYnYdfBYiypxYtNSK4FdXPs1O9JNd5p9ZevIC6LL
	VPlh665VAebGaRq/gpNABG+Bn2kjAOrICYFeApXLd4PLwHngbad04CEG1cf6d50ryGhME8Jr6uWlp
	v+yfGPguFO0wDMnf6VGqfQ94rbbpzczhv7bO1UAbZGbHNeLRLOWceJyy20Dw6x1nsSwWiwSMVwbkb
	V8EumKrVd0JBJRtYxYaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHuI-0000000DTJ5-1Fqs;
	Wed, 10 Sep 2025 10:18:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwHuG-0000000DTHP-35rZ
	for linux-amlogic@lists.infradead.org;
	Wed, 10 Sep 2025 10:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 00F536024E;
	Wed, 10 Sep 2025 10:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 902FFC4CEFD;
	Wed, 10 Sep 2025 10:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757499507;
	bh=SGZ/ztM0Jh+alQljhSybFcNPM0P2ohWIF7g13dEMIfs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aBbY1uggocwRGKx/j8D1HLU4/YImCA9BGziuAcnFtGUK8SAhU/pywuFNuTiLLLp7y
	 SnqjhrIN7EhG7wjwRtaDTnGc6phmB31faQUpHVYhj04uysIft7yyWYCPBloSJD3ZMj
	 TyNd+e9yrvfzAY1/sjVeduLtcjD/eO8sZgGOsLvzP6ms0WcfmW31Ty2qBE4bVrRfsI
	 kcfsilc7zV9l9JtPB8mBuA0kPw7fD34hC2KH136+aNJqJ237d7BvBOtCBBov6wqm72
	 igwMkTfZKsWHARFPjtbN9FTEGPA6qq2Q1Yk8n1QaUetrwftcciwJyNXXe99rkJOryw
	 ZUuEtOGZlXY2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83C8FCAC58D;
	Wed, 10 Sep 2025 10:18:27 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 10 Sep 2025 18:18:27 +0800
Subject: [PATCH v6 3/3] MAINTAINERS: Add an entry for Amlogic spifc driver
MIME-Version: 1.0
Message-Id: <20250910-spifc-v6-3-1574aa9baebd@amlogic.com>
References: <20250910-spifc-v6-0-1574aa9baebd@amlogic.com>
In-Reply-To: <20250910-spifc-v6-0-1574aa9baebd@amlogic.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liang Yang <liang.yang@amlogic.com>, 
 Feng Chen <feng.chen@amlogic.com>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757499505; l=935;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=waH2I+tfwvOLzp50Qi+Yg091qChCxHO4Mz5PuoGKYLg=;
 b=xJinMlXhEVwOYxADE3omeK+8/M1V97cBkQ/nAJPKAagfB0Kp9ixIv5Hqwy7AI/ViNeO0sfb6n
 dx478YDU5/zCcO7cLnyyvFVlAuuy7UUZx+IQdhBYRRD4v9tMxJZ0BNH
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic spi flash controller entry to MAINTAINERS
to clarify the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b1c081f9c567..9f1f337e9b6d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1306,6 +1306,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/rtc/amlogic,a4-rtc.yaml
 F:	drivers/rtc/rtc-amlogic-a4.c
 
+AMLOGIC SPIFC DRIVER
+M:	Liang Yang <liang.yang@amlogic.com>
+M:	Feng Chen <feng.chen@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+L:	linux-spi@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/spi/amlogic,a4-spifc.yaml
+F:	drivers/spi/spi-amlogic-spifc-a4.c
+
 AMLOGIC SPISG DRIVER
 M:	Sunny Luo <sunny.luo@amlogic.com>
 M:	Xianwei Zhao <xianwei.zhao@amlogic.com>

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

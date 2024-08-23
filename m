Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDDEC52D7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 09:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68ebMl2yXbeOtf1bPsiiv1BXRftRZWZNfI2Pii5LCaE=; b=y7GqQlVu3rcqup
	Hms+oKIWnouc/9dS+yJhkQ2kuYHfN+1jmRXCICTVur7Q1NkJCCPiR5axf1qaMTmsFFPK65nrVmMZA
	b7QMgkboYzL+sWDPhV7CJn+MBy1JgPwSYzBbI2SNaXd2ooqLc89mdf43iIqbHsEDu+FUzddaJA1U4
	Nm7aB1TeNZ8dL5bTX+2Hd7+9zJ0/itB0yWFh9yri0rJOnymSdn7uPM4iPaAdJUun7PEP8vRo+o9W6
	tUtk9Vzodd1pq864u5FgtI/NWpYbfoCAs3SGXx/gBbMHKKwEpT0btd1oVTbK/2uFTnCUNeG5h0Ip8
	1KtIwxzQuKF0UoKSpqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQUv-0000000G5WW-2ONa;
	Fri, 23 Aug 2024 09:22:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQST-0000000G4qf-06T2
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Aug 2024 09:19:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6EBD6A4263C;
	Fri, 23 Aug 2024 09:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76741C4AF12;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724404787;
	bh=4xDHigoIyATc3IDZe3/YKW1ddkaLez4W2M1ZcQdYvcQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hwizPeTbbiP+l8mb31tumqmYjeb6ictmuKc8+kQFeowO5Vp4Wbh9Ukh/dVUjrS87w
	 R+rxyAusVZXYw2EmOEaoqdTeFeLrOr+UEMn3EwFfTGqel28dUSGUsM2KSlaL8oN43M
	 VjiKpCb8GkRd13YitkpPFZ5K3yGjWFF6S8zxF/+FOw89JfLuOaTj1ksCI2uRlMn1zA
	 RR6aj5tccTVkSd/bcH+JJc2t1yPg7w8zDUYF08TyJ+JKjCYlylXZtbANbBgm066wDJ
	 wrlBtToSOmxUMITCHL1sCjeWyPqXIvrqTlHcXrKOgWTbFVvUt6jFJ8vQrcKqHV6CIE
	 yhF8HT+episAQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B003C5472C;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Fri, 23 Aug 2024 17:19:46 +0800
Subject: [PATCH 3/3] MAINTAINERS: Add an entry for Amlogic RTC driver
MIME-Version: 1.0
Message-Id: <20240823-rtc-v1-3-6f70381da283@amlogic.com>
References: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
In-Reply-To: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724404784; l=878;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=kKfAM48i5NM35z09vCTUkBfuWRf4o7vOPs0ZFkbUpAc=;
 b=oEyXPyxBt9+Kn3pBRu72Bhb7+F7ejh4pwpgFy4LjcjGyHpZpH3LLZti0ow50n/x3xKQjuP1Jc
 oluZXV1U07tDHuIwUCT1eUeBl0YDZJqQrfw3ZPRm8rz1oGwHajfr66y
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_021949_179582_0B49F987 
X-CRM114-Status: UNSURE (   8.09  )
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

From: Yiting Deng <yiting.deng@amlogic.com>

Add Amlogic RTC entry to MAINTAINERS to clarify the maintainers

Signed-off-by: Yiting Deng <yiting.deng@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..672290dddaaa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2481,6 +2481,14 @@ F:	drivers/irqchip/irq-mvebu-*
 F:	drivers/pinctrl/mvebu/
 F:	drivers/rtc/rtc-armada38x.c
 
+ARM/Amlogic RTC Driver
+M:	Yiting Deng <yiting.deng@amlogic.com>
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/rtc/amlogic,amlogic-rtc.yaml
+F:	drivers/rtc/rtc-amlogic.c
+
 ARM/Mediatek RTC DRIVER
 M:	Eddie Huang <eddie.huang@mediatek.com>
 M:	Sean Wang <sean.wang@mediatek.com>

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

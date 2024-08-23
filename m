Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6959C5472D
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 09:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EQsj7m7FnRf+UtHoim4PlzvJ0whds+anDmuhUYGjOZM=; b=RKzCsTmOwo2ZQN
	3btJCwHweVHrMnHRzT2d4kD/PyjOKy9LfLSbhs8SKmfp+cn7SerXaTbHlWqSDfuFnK2UoAZJtkrin
	NsHMci3Ln4LLFm55vqlBPyMDnqqcudvQ/u5GQdd3fsep981RvwV79rlRCaS9MjjxdOILd93YVpdOH
	shTMQbc8oL+a6Z8tjZWQmvdJqWseFdRH1VUPpQKePKSigJE0GNFLgtY7sJe495cIJsBw6QtTk+Wnv
	fmJ5B9cK3uo0tdF9VHmjdWLYgrSlkls2GGtk+90qaQ5imDeVXN4hUbf9yruD5YYoDcCH9mLYioCq9
	/fqcuoBytPfVBNlEYALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQUv-0000000G5WL-0qoB;
	Fri, 23 Aug 2024 09:22:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQSS-0000000G4qO-1l34
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Aug 2024 09:19:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EEC51A40103;
	Fri, 23 Aug 2024 09:19:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48572C32786;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724404787;
	bh=KhN+NQf/vdSEEkKAVXu1CtJtcHLdjhi4HZJpa/pUdy4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=J7gLxvXOn4aeIF7NFISf1/JDSUeB1BUVaekOwiLso82LgXmHjOQjxUDp3986i+AiQ
	 iJoCWGm/BRexqJB75wJ6r+H/8tAHuuI7Cx0l1JlPO5RVXXJ0nuvtmrVOmejndXV0A5
	 o/e3K08o1JQJUfLGMqTXfQlnm8RxHMNKYXJ2+qL/e1aXy7IHric+DNRiQKPN0zx8tq
	 TbyY2PfE1oH8zUv+yTLHyxp7R+kHDlpzk3zr2+jtTk4uuoNECQMYHwFA1CSC/grqBE
	 S0J6RuZ5M5JwtCBjo6QFwmN5aw0PCEeN+r/4zKGHkLvnEyw+RYcO8UBHwwRAIkFOEv
	 JJDcONpnQBdWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C9B3C531DC;
	Fri, 23 Aug 2024 09:19:47 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Subject: [PATCH 0/3] support for amlogic rtc
Date: Fri, 23 Aug 2024 17:19:43 +0800
Message-Id: <20240823-rtc-v1-0-6f70381da283@amlogic.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAC9UyGYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDCyNj3aKSZF1DI/PkFAtDS6NEQ2MloMqCotS0zAqwKdGxtbUAA60T+FU
 AAAA=
To: Yiting Deng <yiting.deng@amlogic.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724404784; l=839;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=KhN+NQf/vdSEEkKAVXu1CtJtcHLdjhi4HZJpa/pUdy4=;
 b=HsWgzJib2xTeA8gPpNPJiGUQhNPcfsMJfbZcceA8byJwSKYLP9/PfVVJ32Xkd/3txvcwOEw6o
 2DM3LDAMKS+Dt84agCJgAMYxbroDNzqH9v7mHjfL6C3XJeTD0HiZATj
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_021948_556053_FB0A5E9C 
X-CRM114-Status: UNSURE (   6.60  )
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

Add rtc driver and bindigns for the amlogic A113L2 and A113X2 SoCs

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
Yiting Deng (3):
      dt-bindings: rtc: Add Amlogic A311L2 and A113X2 rtc
      rtc: support for the Amlogic on-chip RTC
      MAINTAINERS: Add an entry for Amlogic RTC driver

 .../bindings/rtc/amlogic,amlogic-rtc.yaml          |  66 +++
 MAINTAINERS                                        |   8 +
 drivers/rtc/Kconfig                                |  12 +
 drivers/rtc/Makefile                               |   1 +
 drivers/rtc/rtc-amlogic.c                          | 589 +++++++++++++++++++++
 5 files changed, 676 insertions(+)
---
base-commit: dff71e5c6076314f3eefe700abd6af834c57bd64
change-id: 20240823-rtc-127cd8192a13

Best regards,
-- 
Xianwei Zhao <xianwei.zhao@amlogic.com>



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

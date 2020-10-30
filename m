Return-Path: <SRS0=7VJA=EF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D47DC00A89
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 18:01:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1690220724
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 18:01:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sGYAicSs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J43rbx0m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1690220724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s4duso6GNJUYRb5ObB8ARwzn2ZxJYS1+M34w/NZ0fLc=; b=sGYAicSsn4SLYgrpGDHgNFvFXA
	WMNzBE7tD6kTGgAHZ4EBAL6g7ddS9Wtw0xHGk1Ab1aMRv3Lu91nvB1IbH1Z/yyCpMaNOgIxBEMF2p
	RcDe/6UnBUXsFF5rysCg9QLZm09mn8jrekZH6+KyyFr07uhN4bA6Kg25CPCFKjJ0YSQ/LlgSQdhQg
	V3vwrr8o5R4CuTPlP17/oEjXPpq1JH4g3ne7Ul5sGl++vkJ6faSZKQT5G0AiGqWOxsPeybUna9fm5
	F5l312qxME+8rSjQph/IowjYc77GY6IV/uZah4Qjr7IGCjzHEyuW5ryLOt8bAgyugayCtwF2a5klG
	FKziCU0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYYii-0005mG-Bt; Fri, 30 Oct 2020 18:01:48 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYYi0-0005Ts-3v; Fri, 30 Oct 2020 18:01:05 +0000
Received: by mail-wm1-x344.google.com with SMTP id w23so3652596wmi.4;
 Fri, 30 Oct 2020 11:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lBTe67Ruhj9ZxKfZu9SkKaoknEjrb1M2KTUSKiTS93w=;
 b=J43rbx0mOC0X1soYthDm9e8MBasFvBiVlfwiySp++iZtC7tRwMMIXBYujnMBPEUbYI
 vkdCHMN+rnNL/b0bzh7VuaENPKbisQeq2g+hBJyD12AWIMZwOlUZ3/pcze31bcdkPrYY
 kUzqMQR3p82eIdFbE24I9isdSBvjflsqM1tNxwwSO47qpg7/maWZASfh6izn7cpfijeO
 QFMLcABlGdXzUtMzVzUWYnrINCc82mAAgmj8DIvaR1C/HejtrFxZH3lUyAe2KWUfFoVe
 +90vDgu2VkEfU5KLknDUketFwT6PyGWOgdwS0vulMlLLdzNyh4Ti5J3FGjW2q+uTJJHS
 9qig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lBTe67Ruhj9ZxKfZu9SkKaoknEjrb1M2KTUSKiTS93w=;
 b=bzz1tDjpKe8j6i2OnuyAzLFWLHluatH4C6ypbKqvV7OcFHuA3BsLA7FhfGcZBBvxka
 OlPCsvmCkBz7OX8uQ6wjiBS/BRZnrcF7g0f/7LWXPC6n9CRMOukO33BvaYdKEIcsP5wW
 NN6jzWD34vnouhAsAhothw1oVAdoMDuCSaA4x33c7/kzTSEp48PcA128ysM6KqRv8GAc
 8HIK2U2eUrhg3rbc85FN2rajbfbbofSopbmfV1LEFxJKc9FVZ94OeGJEdB1gv99RVvKX
 Pn8dUm6YrxVkp7Hjd68j/YxJ+EoMFfztLir4c8bidyfUl1tkOkYe/L31Vm7duGRtDSrO
 yPkw==
X-Gm-Message-State: AOAM533deYZ79hjdFAi5N3n5zbuQOH6KPgpvWNUQMeZVNawvVV+HEmWD
 w2Rnh0h+Xvy6mu/P9TxUBVE=
X-Google-Smtp-Source: ABdhPJwC01U3vjAh2A+zDHHy1FB0x3lZvf5hR/bOZulRgtWQiwIp0Qov0R/6GZyFV1x2HfibS0kwDQ==
X-Received: by 2002:a05:600c:4114:: with SMTP id
 j20mr3970462wmi.62.1604080861592; 
 Fri, 30 Oct 2020 11:01:01 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id d8sm4335619wmb.11.2020.10.30.11.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 11:01:00 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson: add watchdog to g12-common dtsi
Date: Fri, 30 Oct 2020 18:00:57 +0000
Message-Id: <20201030180057.23886-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_140104_341150_433E2019 
X-CRM114-Status: GOOD (  12.63  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

G12 vendor kernels show the watchdog on the same address as AXG
so add the node to meson-g12-common.dtsi. GX boards inherit the
same from meson-gx.dtsi.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index 1e83ec5b8c91..92afec3ffb2d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -2179,6 +2179,12 @@
 				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
 			};
 
+			watchdog: wtd@f0d0 {
+				compatible = "amlogic,meson-gxbb-wdt";
+				reg = <0x0 0xf0d0 0x0 0x10>;
+				clocks = <&xtal>;
+			};
+
 			spicc0: spi@13000 {
 				compatible = "amlogic,meson-g12a-spicc";
 				reg = <0x0 0x13000 0x0 0x44>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

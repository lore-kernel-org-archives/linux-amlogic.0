Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8019DCD128E
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Mar 2024 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N09R5zbC+aGNDVNzhkucXL8Tk9gPU+khB8bl+khUcW0=; b=d5C78BaNHpbmG7
	VJL8ZOgpNEbYcZnvIaG7Q1OHqMhchMJ5VtmvS0mq6opqk9rmvR3XiuOYqxhgNQzlJfl+cOBevkYo9
	yG6ARL/+XKIpeDstVKCkDYsry25cQoZ4JsoNnikmmEPgGTWAw/qJIgqaeTZDeKkuUH5iwbj2pmOcq
	0xxfk2+KCeJcSOfE5xcME80Q432K9YnAR+9WopKGcrXQAICAziyTiFcpIrU4l9hpSQvOeDuE5PWoi
	2ky9kJ87jHQfFj9fi5LXzSG+ppg/RD4rSFUVB5V3/3LYKgByAmWUZsx0Wwp0Zm9L4YP+HWW8tlfdr
	7u8WzmLVb00d8jFRsURA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Mr-0000000HS1l-04qt;
	Fri, 29 Mar 2024 09:17:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq8Mk-0000000HRyA-2YnA;
	Fri, 29 Mar 2024 09:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8964BCE2F07;
	Fri, 29 Mar 2024 09:17:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64F85C433B1;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711703855;
	bh=stRn40k3Wznn/gwcVteftCGGh9Q8iyBgC3XO/vR9ah4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AZpEFsqyYwMBCtFoX62cC5ri85w8HDkTs8aNFFzgLxCRTyYZip4k9Psofp2kT1e9r
	 XR5azjAXVmHcBXg5HW16Y27uSEHC/xTAdq1+ufUPQwnj9P26o73e03WvD1VWHv5O7u
	 /BKch4lSUmsawiqXvVYS8nAOaV86bLtOGUt2GS9CZHMileOrw6Ijl9bfP406mPx/8p
	 cUR0zcfHDKkMUXJaxhNAc9M2vSq3J4Qyxh1lkVNcZ+GyZME/a6CgzKDosvqQTeY6S0
	 SsSvmQ/lWgv2gZSMDK+NX/EZbR7mrbs4D5trnUo/zSlAA7QpcT5AdH+zTRBDR3PG2P
	 HgA7WRGfWnF0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59311CD128E;
	Fri, 29 Mar 2024 09:17:35 +0000 (UTC)
From: Kelvin Zhang via B4 Relay <devnull+kelvin.zhang.amlogic.com@kernel.org>
Date: Fri, 29 Mar 2024 17:17:15 +0800
Subject: [PATCH 3/3] arm64: dts: amlogic: add reset controller for Amlogic
 T7 SoC
MIME-Version: 1.0
Message-Id: <20240329-t7-reset-v1-3-4c6e2e68359e@amlogic.com>
References: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
In-Reply-To: <20240329-t7-reset-v1-0-4c6e2e68359e@amlogic.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Zelong Dong <zelong.dong@amlogic.com>, 
 Kelvin Zhang <kelvin.zhang@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711703853; l=1108;
 i=kelvin.zhang@amlogic.com; s=20240329; h=from:subject:message-id;
 bh=nQ6i4onLrotYFoJPFCF0uK2+BCj3hGBC1C42Lz/v9h4=;
 b=Jaw99hNZQkkHxQBjC35M3u7xduE2mi1d6p+mbAr75eUopJQwluSwKkTVhFrdm2MgKnxJglndn
 fc86fr2K0poCv4GnbrE3ablxTtxcKSl1DfbTwZmXw38Wpr62LNNX5tb
X-Developer-Key: i=kelvin.zhang@amlogic.com; a=ed25519;
 pk=pgnle7HTNvnNTcOoGejvtTC7BJT30HUNXfMHRRXSylI=
X-Endpoint-Received: by B4 Relay for kelvin.zhang@amlogic.com/20240329 with
 auth_id=148
X-Original-From: Kelvin Zhang <kelvin.zhang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_021738_865113_C71A237A 
X-CRM114-Status: UNSURE (   8.78  )
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
Reply-To: kelvin.zhang@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Zelong Dong <zelong.dong@amlogic.com>

Add the reset controller device of Amlogic T7 SoC family

Signed-off-by: Zelong Dong <zelong.dong@amlogic.com>
Signed-off-by: Kelvin Zhang <kelvin.zhang@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 5248bdf824ea..e94bb85b5292 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -5,6 +5,7 @@
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/amlogic,t7-pwrc.h>
+#include <dt-bindings/reset/amlogic,t7-reset.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -149,6 +150,12 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			reset: reset-controller@2000 {
+				compatible = "amlogic,t7-reset";
+				reg = <0x0 0x2000 0x0 0x98>;
+				#reset-cells = <1>;
+			};
+
 			watchdog@2100 {
 				compatible = "amlogic,t7-wdt";
 				reg = <0x0 0x2100 0x0 0x10>;

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

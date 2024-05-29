Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EDEDC25B7C
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 May 2024 03:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R1YqggsyykNp4cRUwC5ajC+NIIWzws1dEZUxMvq0QhU=; b=X7llfj/1LY4un5
	OgPv8jAv2xLgfdXppVIJWPpv8Q7UVJtReYOxcAT3zFB4lH7YHYbVamMCocNAw2X+jIoIEMOHJbAW7
	hEpyF8wlRVbdwp/gOwWzHjogMRWG6A8gKKf+AT0QP96yBKu92PDuCQyQF0H1G7F0gWcoGFGPmROif
	r6U2UctVidwvaTQsQsmoekoGwoTcshvC5K8hjP3/oflzLcIk5s3xuV+nuyb/WVmLkhV/Qtuemo03a
	ZeD44uIZLHMs4ApUlWOFKsa3pD2g0U9nwqkjDnw11xkJ3OUm7OXZIr1I8wzlZ1yabrS5Md62t473k
	Tl3gOegx+iOFhyap6pdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9iF-00000002fDv-2kX9;
	Wed, 29 May 2024 03:10:51 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC9i6-00000002f9k-3Suc;
	Wed, 29 May 2024 03:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4410CE168E;
	Wed, 29 May 2024 03:10:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8AB44C32782;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716952236;
	bh=R2PBY/msQ742b9lRMEFHyiEIA4TM8B0XBOvPygj5t68=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C0LaGsDP9HUdITKn6KszeovQbqAGdxWVOX7Xf2Qd6rxxhFaHMUm6RpOOF9tiUMwWc
	 6FqNAWaJJOqWZmkKL52lLVZnPvwFLXQDch1zFJlLUhH7F67gUmJrQxT5efxd3FdXJ5
	 PUzzPFrTM77nsNoZ3tlGGzjAIZmKBUEeFjWQK9PLyOdRQnKRP5MGfh44d06GIvJ3gR
	 gq5bhshp1V9neWfSuD538L3NOOJm/HzihYK1sx/fmoKIyw51AIdPj6vEQDFfkdkpKN
	 6Pk3TxOSe1PQJuKaWM0tfbABdSwsE1vrVfPYrJcgepYfr2JjOfcrfmy3Ufku3F8tO9
	 0bcdAATHbRE1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C2DC27C44;
	Wed, 29 May 2024 03:10:36 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Wed, 29 May 2024 11:10:33 +0800
Subject: [PATCH v2 1/3] dt-bindings: power: add Amlogic A4 power domains
MIME-Version: 1.0
Message-Id: <20240529-a4_secpowerdomain-v2-1-47502fc0eaf3@amlogic.com>
References: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
In-Reply-To: <20240529-a4_secpowerdomain-v2-0-47502fc0eaf3@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jianxin Pan <jianxin.pan@amlogic.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716952234; l=1814;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=nfoMiDo//9rMUrKLRoJnW/ImrBs0OKdTcKzaSwdwK/A=;
 b=EtJ0yNZ3A1Spomz+78Y0P6EEhnhU5/ot/KOLV8zTv/nUvVE9+/visaaV8Uw1+3LuqMh4xMzoX
 zh4d9vRrKuaCkc3UUDj6u8OH7gQlkEjf4Nkzc9l1I0F36kMD4rpnqBg
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_201043_326400_64D0672A 
X-CRM114-Status: GOOD (  10.67  )
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

Add devicetree binding document and related header file for
Amlogic A4 secure power domains.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../bindings/power/amlogic,meson-sec-pwrc.yaml      |  1 +
 include/dt-bindings/power/amlogic,a4-pwrc.h         | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
index dab3d92bc273..59915f9d4860 100644
--- a/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
+++ b/Documentation/devicetree/bindings/power/amlogic,meson-sec-pwrc.yaml
@@ -20,6 +20,7 @@ properties:
     enum:
       - amlogic,meson-a1-pwrc
       - amlogic,meson-s4-pwrc
+      - amlogic,a4-pwrc
       - amlogic,c3-pwrc
       - amlogic,t7-pwrc
 
diff --git a/include/dt-bindings/power/amlogic,a4-pwrc.h b/include/dt-bindings/power/amlogic,a4-pwrc.h
new file mode 100644
index 000000000000..bd2f9c558d22
--- /dev/null
+++ b/include/dt-bindings/power/amlogic,a4-pwrc.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+/*
+ * Copyright (C) 2024 Amlogic, Inc. All rights reserved
+ */
+#ifndef _DT_BINDINGS_AMLOGIC_A4_POWER_H
+#define _DT_BINDINGS_AMLOGIC_A4_POWER_H
+
+#define PWRC_A4_AUDIO_ID				0
+#define PWRC_A4_SDIOA_ID				1
+#define PWRC_A4_EMMC_ID					2
+#define PWRC_A4_USB_COMB_ID				3
+#define PWRC_A4_ETH_ID					4
+#define PWRC_A4_VOUT_ID					5
+#define PWRC_A4_AUDIO_PDM_ID				6
+#define PWRC_A4_DMC_ID					7
+#define PWRC_A4_SYS_WRAP_ID				8
+#define PWRC_A4_AO_I2C_S_ID				9
+#define PWRC_A4_AO_UART_ID				10
+#define PWRC_A4_AO_IR_ID				11
+
+#endif

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

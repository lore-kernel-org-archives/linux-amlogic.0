Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B562C2BD09
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jul 2024 08:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cutVvliCXhk/rzG85XuMsFPdQlY7DCJt9aRQpjjwBi4=; b=PYxFpvoDdeda2/
	b4XkkeBrp74tQF80QyK1l/fD9rwRc3bb5Rau2AwYnfzDn3VYmrrhPUH+U3PZiX3AXva3ZMma2bbL+
	pJpOCg9FDvJ7wv567/Zg3d972ZvtyX1Njw5XSp/CKlMtuJwxcg1OXX1Rmg6GkCZlAcnpX8I0FsikO
	gZfskHZ1TeuirqjDqrhP8OPng7FlQntcMv1fdT+wDVCTQcfLCql1ER4s8sPP1QUs1ZU6cpt8+wb4B
	hANQ7zXBR10FR02dBzP9g2tZXgSWq3WY3vCwrfFkJLv9jKFfYOgfbaYwN6r04Rz5n5kRWIzwuQylR
	PmgBEeA69fjeTjGDOBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6WW-00000006Swa-2B3p;
	Tue, 09 Jul 2024 08:48:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR6WT-00000006SvQ-3kU9;
	Tue, 09 Jul 2024 08:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C8BA9611EE;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72A33C4AF0A;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720514908;
	bh=KvArodGPL+YHrSkE1lZP9hFA44qMNK93x2WhNXz/zLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=K5TRH+9PBMepS+J+vzgaz4MzaGR3GmCixlliAwq/c/5gcS6zi6y1aqiUckixT+RX9
	 6CY0slaihb7EVqZ2AijpH+w4+o4g2D9EJlUQmxP+JjtcO8wdj1s15/ThwWxVL1Os4o
	 q028vOM8duPAHjy2mk5Ypq7HkrEIHx69C6OPJM/7zvRqzpNibhIALPsUrH7CGuUnSd
	 Fa/AS2tC9UtkFYT04zJmLlVSRSC0JWgFWA/17wGJMbvlW7XVkmPL7oU94rbncOBjdk
	 SUt33iKpu5lDMLKkAdTWRfZ4PqY5QrXD+quLAsswA2tVqWX3pQ7+Z+FoEPYafeBTSq
	 ONC3AOJrQkVWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63238C2BD09;
	Tue,  9 Jul 2024 08:48:28 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 09 Jul 2024 16:48:25 +0800
Subject: [PATCH 1/2] dt-bindings: watchdog: add support for Amlogic A4 SoCs
MIME-Version: 1.0
Message-Id: <20240709-a4-a5_watchdog-v1-1-2ae852e05ec2@amlogic.com>
References: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
In-Reply-To: <20240709-a4-a5_watchdog-v1-0-2ae852e05ec2@amlogic.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Huqiang Qin <huqiang.qin@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720514906; l=894;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=WSePT+XFO2cODMzffP2GQB75+cxcIunyp22iaEGOG9k=;
 b=/GnnQaw8grZyQF6/wV6MN5no6SKlMc27aNZXcXDnmTwLzDJ7SnyUU0p+7MFhekaNcJ6jZ0tkn
 +wRy6wjmoNDBQPJgq4mp00r+Ylgm11XR0Q+UudFI1wbZOVdHaLJmOnN
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_014830_018454_94484914 
X-CRM114-Status: UNSURE (   7.89  )
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

From: Huqiang Qin <huqiang.qin@amlogic.com>

Update dt-binding document for watchdog of Amlogic A4 SoCs.

Signed-off-by: Huqiang Qin <huqiang.qin@amlogic.com>
Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
index 69845ec32e81..d0eff1ea52b4 100644
--- a/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/amlogic,meson-gxbb-wdt.yaml
@@ -21,6 +21,7 @@ properties:
           - amlogic,t7-wdt
       - items:
           - enum:
+              - amlogic,a4-wdt
               - amlogic,c3-wdt
               - amlogic,s4-wdt
           - const: amlogic,t7-wdt

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

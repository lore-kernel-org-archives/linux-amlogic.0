Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8AED32D8F
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2024 10:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV0YOv2YUw7RopA4cxfaYt6BzZkshxjw5Bv9aDNZ8QU=; b=hy70yQo/a0euyn
	7XdvjTWvEkG4vtXtVQko0LSZaAZgc/s3ucApSK3I4E1IBMsjI4LBwROEsAoyLPC3kOxopJzPBYBA8
	V/Mg+iNywTN751Oq12GDuroCKQhIdsPSGpCKt6e1o685R55s0ZE+RHa2gyXYMVdpgiTkP946KjfDD
	hhQR2s38dPZSADjWR7u1o56LOEM56tjv6LjVM6MOigCD3hYkp9/DZ2ZEiqsY+oQbe1wdV7fwxFnsp
	434KGhDEnhLUbAZ83M6nUD8Y+i8EEfDQkhhF3vxK4GEnwdmDdMuEAYUd8BZrCLZRhhYaF16k5FP4f
	lhZVFxKF3VYAeRw6tH2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAoIV-000000034tK-1mdA;
	Tue, 12 Nov 2024 10:38:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAo6w-000000032en-1srh;
	Tue, 12 Nov 2024 10:27:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 99D1F5C4888;
	Tue, 12 Nov 2024 10:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4BC9C4CECD;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731407221;
	bh=pWVUou38JVsKCBaDMii9eHLeGckCyzdJUiFfL65PTUs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Yenou9MptzFZF5YpRekidDbVw9UM3Om+C7iqD83ooYIYo6N1ncFXC77fyWN2cKpPY
	 VrY+aL+6Veevv7fwlf9NiT/7YLHYn7ickctX8P/z9QbtL8SkZ3GFwMTXXlU8u+1/xW
	 L1CVZK0lAhehjNHE4ARvY2y7Ghx+Mdx+zGOW4Zc56+c5RXf02zrSOGyqPC0MDyqneg
	 an/Xq5f8DwHZGG/ZhTTHQe44QmttW6Hnb+FCGakbY29dYgfY2i5ktl7bCW0lilY/n/
	 nebFAP9wnvaFxmajWj5JcAwMBQ+PSD9CMWOxRRkZcAmwGTrLFixk9oFS/BrYrRTht0
	 r8PhmAMeDUW5Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 964C6D32D8B;
	Tue, 12 Nov 2024 10:27:01 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 12 Nov 2024 18:26:55 +0800
Subject: [PATCH v5 1/5] dt-bindings: pinctrl: modify gpio-cells property
MIME-Version: 1.0
Message-Id: <20241112-a4_pinctrl-v5-1-3460ce10c480@amlogic.com>
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
In-Reply-To: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731407219; l=972;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=vZqjjnCO3zwPWuTy0qDsSgOCsxCV7fM7PewSW3T9rgc=;
 b=vcZvhifPHORlWOS0LP5dmR4xmjVZApG64++PFcGo9B8LlLDz+aPXv1CK9UdzrxNjozCr6v3/S
 tMKjBWTbJL1BDcc3W6TDDy84l6vUVuKboaEkrAnonuxhKjQFb/yba6X
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_022702_582968_4935270F 
X-CRM114-Status: UNSURE (   9.48  )
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

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Extend the value range of #gpio-cells property, including [2, 3],
to compatible with Amlogic A4 SoC and later chips's pinctrl module.
The early GPIO parameter number is 2, and the later GPIO parameter
number is 3.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
index e707c222a07f..6b53577dea59 100644
--- a/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
@@ -36,7 +36,7 @@ $defs:
       gpio-controller: true
 
       "#gpio-cells":
-        const: 2
+        enum: [2, 3]
 
       gpio-ranges:
         maxItems: 1

-- 
2.37.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

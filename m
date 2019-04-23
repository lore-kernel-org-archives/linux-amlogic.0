Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63910C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 08:51:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2907B20843
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 08:51:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="erklQQ0p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="zDLfJXO3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2907B20843
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AuWgm+ZRsctyrRzqZjVqc6i3TgOzbUZYOFq3MdrBhw=; b=erklQQ0pS+ujoM
	F3dqYgQg6K/J3MBj65hIzMH+FEXJOuE9QZv+fj639d4RHEBwl8HekV8EKtsaiEPDpB77OZhhOcNxf
	6T85tyAB4pfNT4SyV9ewWv651660n9x/o0xdyGzVHVxa4gpyHGQBYBNGo040CgRT73ZiMoFToqIWh
	XwM8mEkEp4j7D/WddgCqwUSsXfATz3iqijzgi/sPImz4xONgMVAb5Zh/bfFmb04XP5BLezOZ+CHPb
	zT/JLaIQgCWet63P8mmO5WLlw/cYuZnrBWPNuYTQUzmhzZq8QHvSuj9yNkwTXAlUoBB2eqSIpIgZz
	7Z1pvigQcqxsutYmxzgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIr9Z-0001Ig-JI; Tue, 23 Apr 2019 08:51:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIr9J-0000zI-Kq
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 08:51:36 +0000
Received: by mail-wm1-x343.google.com with SMTP id n25so17717612wmk.4
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 01:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1H3HhuutqaciX5XVa5YZyQWcZq+QYJmYc29n+3rNfQQ=;
 b=zDLfJXO39CUmp95Ai/ksmyDI9XHay6nQzRnKtjQ2i8UHKXeEP28qNnthrBCPqTV4Uy
 y/G1NORz8CVzk9Cu3mTyeTzg+7R+PwWGjtLX7L34SmMDghYjE0BfEhd50CGEGTVFUp7S
 kGYdeldsWFA2dm0/bxlQLIJyBDFu6GkNkK89t5k2Hj09sr3L4tKuxOksYZLq3oYwRFTK
 JOohS6Hr9Fb64gzVB/Q8ULzq1kA0pAlMW0LU5zLT00kp+DLcHCd49p/MBc7zEHAZ+xUG
 RtbGZ2Cra3TB2hNpZ8vP+oMnBPGopX6EZsWb/5ox5neyRCCg5q5pfydTs7OIkJuyh4PE
 PjaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1H3HhuutqaciX5XVa5YZyQWcZq+QYJmYc29n+3rNfQQ=;
 b=o9eDDU39Jl3d0tCiuinjYsA+CMgsk1TsLknPrE0sCWyumbjzX8OO55tVBbSNlQ8IVO
 0XSTezwxbuvhAcrWWIQk9Ki8eFd3GTmDK3ZNtd5x6znoIgJJAOtgv9P6xm4P9RzmKGBh
 q+w5yEXLbYT9xKQeXCX+45c66xL+e1RiDiv5ys78F2ZkzQ1SW+RIgAZV0iInN/aTfE3+
 gHO3pgehfb13GmjP1iZRkS4TCCY0nJYj1KTQ/cDNXBZlG/Hm0K2V8xDsyZiLov6FVOxD
 Pxw+c7hwhKdENARzYobGg6RrjZVxoVnFz3tmKehdQHdzf2KGcM/Ue7R3CdvBAwW83hR3
 uGkw==
X-Gm-Message-State: APjAAAXNJepSVMp+MjbD6oiR1LjgSL/o0FZJ93rBxsKQ9ouxQgCWQ9JI
 cMZXVeMW4vOgl1bZ/fYLeikcfMa+nkuykw==
X-Google-Smtp-Source: APXvYqz7WYQn3ddhxQGgEV0tPmUF4XhHH+DjXXbgvObw/DvJbVNAIQR7c5flZU8nKuvJ6DfIpMCjlg==
X-Received: by 2002:a7b:c3c9:: with SMTP id t9mr1315184wmj.131.1556009491848; 
 Tue, 23 Apr 2019 01:51:31 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b8sm12515566wrr.64.2019.04.23.01.51.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 01:51:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org, chunfeng.yun@mediatek.com
Subject: [PATCH v6 1/4] dt-bindings: usb: dwc2: Add Amlogic G12A DWC2
 Compatible
Date: Tue, 23 Apr 2019 10:51:24 +0200
Message-Id: <20190423085127.3863-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423085127.3863-1-narmstrong@baylibre.com>
References: <20190423085127.3863-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_015133_677705_84E2059A 
X-CRM114-Status: UNSURE (   8.10  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adds the specific compatible string for the DWC2 IP found in the
Amlogic G12A SoC Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 6dc3c4a34483..e150b7b227c9 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -14,6 +14,7 @@ Required properties:
   - "amlogic,meson8-usb": The DWC2 USB controller instance in Amlogic Meson8 SoCs;
   - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
   - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
+  - "amlogic,meson-g12a-usb": The DWC2 USB controller instance in Amlogic G12A SoCs;
   - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
   - "st,stm32f4x9-fsotg": The DWC2 USB FS/HS controller instance in STM32F4x9 SoCs
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

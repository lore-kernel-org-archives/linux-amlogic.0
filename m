Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53037C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:40:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2207420863
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 09:40:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ce0fsphT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ggYWu6M0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2207420863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AuWgm+ZRsctyrRzqZjVqc6i3TgOzbUZYOFq3MdrBhw=; b=ce0fsphToGTimJ
	MhMTaqhS5hPdNINW7YhyfSTF3nzEnfqgm97KckD50WgV0RAQAFZ3mXgYXcVvLqXAl/u3+h8WVAxzb
	XKNsmm5WWIFa1rvnO2nxN7Ng/gZMo2bFgDIY1WsZPsMEipyZQWcRAVlORkqu5uSUj9b9FkB1inHs/
	D4/5gY1vUh9ImdtpOEoRQhKWX37ZkCpTGunnxFSN6VXIIy/RVsaAKaBCQ3dBHv/k3t1LgzxJ8FGHQ
	loR9FNSW2tUF/jKOYKzhaRvv5tflugdhWBGtxcG7fc1vrMSjOFf/IYxt3m4zaiNghM+25HdZLYyWy
	g41fzD73j/SQGQp6l//w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8M5h-0004es-Oi; Mon, 25 Mar 2019 09:40:25 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8M59-0002p0-4V
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 09:39:53 +0000
Received: by mail-wm1-x344.google.com with SMTP id z11so8163652wmi.0
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 02:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1H3HhuutqaciX5XVa5YZyQWcZq+QYJmYc29n+3rNfQQ=;
 b=ggYWu6M0lcYH0SFGGbjyR07csG5yA9YAqfV5f+dVtqAhewryPwGROqC8IVkUNb+IhQ
 IjuLZnavwp8UPNFc0MIw0FBqt9kB5P/JGFPNryKY6CVefvSyZ6krItF1GGBmhd/NTWID
 pJ6698x8x03W5w9bpbq8VxE8n1Hk9zf07zFe/l6l1TBMLw3Ro2rcypdxyisfDZbXmbd9
 X/8KmVSfETGhT69cMPuWkXmJxJNe4lo/6B5lXd3jPMmOIFUChLCEVCT6+Ouptl41inJr
 bVhhftRXXGHTVMrd+JRpsQD3ywy8DGMYdjL0NBS5arGmyyZPaT9CK22tWmH3wte0bLdk
 5xWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1H3HhuutqaciX5XVa5YZyQWcZq+QYJmYc29n+3rNfQQ=;
 b=A4MtYXssHORdixANPuJkm1ax0o6+FABG8ICmioZA1vZfPsEuSjdAiExFrdbIihJS+C
 SLgP59UADkUBPYMCaoNr0iyqXntd1fLDftJmvIbLTMDaoJWm8ZhFmdbcVh8n00prZacW
 8EmpD2Wo8FpNDnFe2iDtGXyiVhwhdjyLkUy0JF/UDpQCF3isErK+953P6cGRqhS0QnM3
 IMJaHH99zGn1q7qlL5E3Gfnrf+XMYaPqc/6m23xi7QSqInkiaRftiz2Ioj1UfY8+4PdJ
 5RpGksYka0f0EGXaYleYKF9kE8IFVYlVQ6sc+feviAAaIXW7YvPzAdiM4cK5DdF1qoqD
 Ep6g==
X-Gm-Message-State: APjAAAV9n+J7L3S4EMAZmD8suu5xQuko3RsCqVrhYjJA2UXKbvd366u5
 NfiNn6wDHxxkw7FgTs7ZY9ec5Q==
X-Google-Smtp-Source: APXvYqzEsEVmvUFoI3dm4C24sHpiaLCRoewBE6PNEECQ7c/KJ1zbK0yqsySzVvFoGLhx+bvU3y7etQ==
X-Received: by 2002:a1c:5f89:: with SMTP id t131mr4620764wmb.145.1553506789720; 
 Mon, 25 Mar 2019 02:39:49 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k14sm13044652wmj.26.2019.03.25.02.39.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 02:39:49 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v5 3/8] dt-bindings: usb: dwc2: Add Amlogic G12A DWC2
 Compatible
Date: Mon, 25 Mar 2019 10:39:38 +0100
Message-Id: <20190325093943.29138-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325093943.29138-1-narmstrong@baylibre.com>
References: <20190325093943.29138-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_023951_192914_B06CD179 
X-CRM114-Status: UNSURE (   8.79  )
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

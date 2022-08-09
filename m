Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99494C19F2D
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Aug 2022 17:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHd5M/7K6gHNXdoJA3Fat+aOczblbk/fdfVGgjZ2Eao=; b=t5D7blvsTQJBrS
	PNsej4ADGRT3KkB152RogxKh6iDF4YTNbtQzVVr4GsnBYODDsLzBTPEuMBd/FshrvdNvo1f+M4z/N
	u3rFWOPn5uUUXgEm1nbl1CL7B60CDOQmIn4n7JS5/H3cRPBh76Xz/HY0jSWgA0lHH723r+hjt4jNB
	fQCcoQPIpkl/4+PhEF/6ylWOFLu5UtApGouKus9G0Zsi7VxKHQWestKc8J80TqHUmzG56oeIcUB8i
	yJATVFiS2vDvOhlqYQx1aYpjMc9u4E6uyANvkni5vHDQ9Z3pyRr2Dsh0UzQAxoUxv/GwzyfrzaFEp
	5A2/LyiQ6vwrLqvKhLDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSup-005EQ0-LO; Tue, 09 Aug 2022 17:21:15 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLSuZ-005EJ9-MD
	for linux-amlogic@lists.infradead.org; Tue, 09 Aug 2022 17:21:00 +0000
Received: by mail-wr1-x42e.google.com with SMTP id n4so13288507wrp.10
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Aug 2022 10:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=y545aVrkkuDGPQff6D7mZBdsso6g+4hQEnF5Ijp4clg=;
        b=mwm18OvAvb3DN1qMcM6AJRveexnF9QeK2qJBPRDNYGf7ZskAiyyp7cqKO+165fN9Ny
         cnRcxxAYqIZnMVfhFK2yPzYW9JA9JBZT6ocT+r+5QfEA8ofsx/1r5jPDKCqMJv5T7cDh
         0iXVd0XPxwIs1T4eBVIWlcS5pJ0rs0qizPcAQODhbdftpgVKKoHdJ2EvkmGNqXnVw+0D
         iyOGoPeNcS0PLvl6QA3MtERhJQSzgs+ILk8UFg2k30D+BH0Bt3IKZiY/Tof4etb7r6KQ
         jQ3V6EEtmFNaQXUD3SfXHZjC060HODxuj2msch63CZSE14EwVFCd8fzIegfKJ6D2gjh4
         ppyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=y545aVrkkuDGPQff6D7mZBdsso6g+4hQEnF5Ijp4clg=;
        b=TJCXG1RY7T8QNzbU3thqTBfGZTd+oWVe8/61ZyrmdcnKNSfupy6HMM/mf63T1RrrM3
         BndwGsx2IjMujdbtPYKwNs2g/w/E46kQ0ULJBOgtc2cW/x1JY89yvdbovSs/uwEGOI4U
         dfx6NxxBie0xX/r/MtUe8pk8y90dJ4illS+jfLrP65idKRoPvgW1HmlH395dTJdQPH2n
         yevaRZN338W8icrrO1KDrJOqiM7i/hh+mXSzxHLZVRaNL2DJ9+r+UR1CrAKyycBAbOIf
         XLljsNBXsV91zXRS6SIOv4aXrbKUVh0th9RqYJTBbpdHu7twzr0IMPfgfatVXZECTyyU
         zmpw==
X-Gm-Message-State: ACgBeo2FJRlHtcZ5zaaXNBEyU8ijKo5MBETrXjrZBA6qqEwuqaETzCCR
	Nl0amm9eYVHHT4Xh0FQPBbOyGg==
X-Google-Smtp-Source: AA6agR7oIC+WFbM03wya4VinLOUGhi0StzJsyj9eBnMCq0cT6vT0Oq+1Eh1Yn9+7C+63+1UPZ0SEgg==
X-Received: by 2002:a5d:63cb:0:b0:21e:b81d:8b0d with SMTP id c11-20020a5d63cb000000b0021eb81d8b0dmr14767021wrw.526.1660065656092;
        Tue, 09 Aug 2022 10:20:56 -0700 (PDT)
Received: from localhost.localdomain (210.145.15.109.rev.sfr.net. [109.15.145.210])
        by smtp.googlemail.com with ESMTPSA id b3-20020a05600010c300b002206261cb6esm13915030wrx.66.2022.08.09.10.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 10:20:55 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	narmstrong@baylibre.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	Da Xue <da@libre.computer>
Subject: [PATCH 1/2] spi: dt-bindings: amlogic, meson-gx-spicc: Add pinctrl names for SPI signal states
Date: Tue,  9 Aug 2022 19:20:16 +0200
Message-Id: <20220809172017.215412-2-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220809172017.215412-1-aouledameur@baylibre.com>
References: <20220809172017.215412-1-aouledameur@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_102059_740839_D9A3821D 
X-CRM114-Status: UNSURE (   8.58  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SPI pins of the SPICC Controller in Meson-GX needs to be controlled by
pin biais when idle. Therefore define three pinctrl names:
- default: SPI pins are controlled by spi function.
- idle-high: SCLK pin is pulled-up, but MOSI/MISO are still controlled
by spi function.
- idle-low: SCLK pin is pulled-down, but MOSI/MISO are still controlled
by spi function.

Reported-by: Da Xue <da@libre.computer>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
 .../bindings/spi/amlogic,meson-gx-spicc.yaml      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
index 50de0da42c13..10707a8216f5 100644
--- a/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
+++ b/Documentation/devicetree/bindings/spi/amlogic,meson-gx-spicc.yaml
@@ -43,6 +43,14 @@ properties:
     minItems: 1
     maxItems: 2
 
+  pinctrl-0:
+    minItems: 1
+
+  pinctrl-1:
+    maxItems: 1
+
+  pinctrl-names: true
+
 if:
   properties:
     compatible:
@@ -69,6 +77,13 @@ else:
       items:
         - const: core
 
+    pinctrl-names:
+      minItems: 1
+      items:
+        - const: default
+        - const: idle-high
+        - const: idle-low
+
 required:
   - compatible
   - reg
-- 
2.37.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8951DC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 14:02:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E77B205ED
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 14:02:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t0X/IjTV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="C3tyRMtk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E77B205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vo8PNMQzFt8jPuvk/Bhl5+WS9P0SZG8vlXo7pxRQP/I=; b=t0X/IjTV+nPG9e
	SiqIOCpvkFHrLfz7PHjnpdsw74N8wSbbo8d9WjAVLnks8qNVCj2zgw1+K2f0siEg8nd586+IuA3IZ
	Ap7jAgqcDFTcnOBAS2HQBRUnkz5sx2RtdXkzyblQ2DLa0WZWmws/iCMz/GKhZULJAldLaz1Uwpr7f
	TYYAYNdPWMKlZLigFBVKjfpWcEC3/AFJZWU5yksi3lFUIvwX2DbOt+C9vmagfJO9/AEZHt7DCXcNM
	DHfM4wW5frZ07R16487KWxx90qCNmL3tmIPPoPLmO/SRFvpUufd5WwsHscAg5yLEkb3jQ/0inYbbp
	9Ckb8AmEWzO8ves4OYJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVGCl-0000Ka-F9; Mon, 27 May 2019 14:02:23 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVGCb-00008u-65
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 14:02:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id e2so8290413wrv.6
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 07:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=flCBkYYx+PdHsv3XsjTv06FvsWqxIYgVPOMABFKuON0=;
 b=C3tyRMtkKESDLxtFYlgpiQcewolwEMTiUIVBDr7x3PEKYiuhwu9mydcq7rXOn2Zpj+
 OsuMTPvCWBndgt6LyHD0GA9FYGZQeIC47jc5XYgtkPzOviz/fiWEo0zQt2lrwinFXRw7
 AOQywD7O3Vz97NW2v2vgrY16D0cQXyYbwglSDfrHpxFOcRWboS0TlNGFqJTFo22D8jYV
 wbyfqlGLlr9AaDpY+9idLlBePOMCpeDmzG9oyYN3hWqijW5KY8HYkIsk+VnI/TjhtkxB
 uhWxJU59bNUzA8PmH5dgVa+CBC3ElbIPx/+MJT47AzpEUlGHGncZEGtkj+UEBoF5OS5n
 rlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=flCBkYYx+PdHsv3XsjTv06FvsWqxIYgVPOMABFKuON0=;
 b=aeCBLh7GYBc39aZbRr5cFu0sPqUUHrGW1aO+FPOFjNiEE6t1PDJB8qPueXkpJJPDGT
 BvUs7rHvawf2d4Dm8ioNIfKQcWc1ahf7Ykb7QeRg/u7VanOeA3nKt6GbbWafmfJjL/Zl
 uFqAdZmIE3+lDrsPRCDGYBk/vYYxH2SRt9basyS5E1VnhkvYV+zY6QTPXMoLPcoRFfM6
 SUs3LygHuTx09iQDmQGQcyKHz0sOOrsKLaCEvKS7/Fm6HSvV1FcJCucog/g7yT6AH2d2
 6UGwjZaAlOoZP9yV30vKrkmwgPEtI11ZBhkEL0POJbBAndG4wz/gZuE1ZXjDQcmjUCCP
 oLlw==
X-Gm-Message-State: APjAAAXCOkfslquS0QfRch0V4qgawjQ1ia54bUoUZPSBMflwnvkXsVPp
 wyG1Pk5+GrPP7hqoalSAxrnNyQ==
X-Google-Smtp-Source: APXvYqzB79oAEKLqaqNxNAfhu1XtKKfKofuiCpo+cHunEcCqE0tpQhb0Z0CVOVDbv88FoAnNyf/Ytw==
X-Received: by 2002:adf:fc92:: with SMTP id g18mr11215057wrr.174.1558965731559; 
 Mon, 27 May 2019 07:02:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s17sm8231628wmj.15.2019.05.27.07.02.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 07:02:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: arm: amlogic: add G12B bindings
Date: Mon, 27 May 2019 16:02:04 +0200
Message-Id: <20190527140206.30392-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527140206.30392-1-narmstrong@baylibre.com>
References: <20190527140206.30392-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_070213_224469_303B84B5 
X-CRM114-Status: UNSURE (   8.30  )
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
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B SoC, sharing most of the
features and architecture with the G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 6d5bb493db03..28115dd49f96 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -137,4 +137,8 @@ properties:
               - amlogic,u200
           - const: amlogic,g12a
 
+      - description: Boards with the Amlogic Meson G12B S922X SoC
+        items:
+          - const: amlogic,g12b
+
 ...
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02BF1CFB43F
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Oct 2024 14:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/bRy34Hzf6Y0UyxwAQxxV6Zb/+r7B08OUX4cCM/YHW4=; b=O5jfNb3A8Vve2z
	+3wLLmrW0CWdhE6A7/v4FmyGf1iBUvAtnHdgvkXTtFwpOXuDpZvR7oyPj6l7XClYrKzP3glioPN4G
	qV/5RKIrnkNH1se+3lyk5nahrXVoApWQEzuujpZIAltTdFz59yRF3qYs1wl/yq1rJG4MfzMSAqulI
	eaHGrjXYy13N2dXfF4SOnoy/uZOivthz0qlYTHCnBqKJFpBZ1fHBG4xs3JYMlWKdxFYKZFrKZ7ZWC
	il7TWg/E5EMjwNinzU2R1c16Quk0L1wgwCMw+qDBTSPiQmGMhw9RjA/h2yHxIQBKwfV5VDCVjbqUw
	Gfa86cDslevM9bxx9msA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoc0-00000002h6R-24UT;
	Mon, 07 Oct 2024 14:21:24 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxoQh-00000002dhm-1fco
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Oct 2024 14:09:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso28093375e9.0
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Oct 2024 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728310182; x=1728914982; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9eGAqYpTSnP5IYjr6JkHkKf6Pg0tCBpu2cvMnI7AN5s=;
        b=kUugAy9z5K9h970WPwC2rwuPALHyw59YsnQuKNpc6s0UC9NuCQhEl1e1HiJAtkAwkE
         6RJt92snNz2nsm2XrR2B62F/GsrRprIHXj5tSImwoeOaMigK9fbI6AiJ3gOSz3AVf47g
         bBIXQOFddkgQyDIZabXkrzSW1ZxlcrGpqt+RqgHuwSyG2KS6lDIgiVlJG7IF+KTHsbVi
         9z+pwmfngtS3pVd5CWJNRFUjexuQ4BpqLIi4qwzlyzWIlX+peot31s482w6l5VbXu80o
         KrW2TLaKwO62kEM2CEY71uLtAQEIWfXr9k3La4GlxCku1zdS4wIosvizohCS/7po3Nl7
         8nKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728310182; x=1728914982;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9eGAqYpTSnP5IYjr6JkHkKf6Pg0tCBpu2cvMnI7AN5s=;
        b=TSRaO8k8kj1iyGaRk5E0kX+zrCuq/a50Q0y63Q/03DoHqlNS3bhVQDEixUFkDkg4/X
         F3dlEL9Hy8eab3CxHT9x2T1HOt712X0E3jlqzRVotuqGbEhPvzCHrmmXirmkFY0t9W7d
         XR8kWU/+bd+v9PA130kt0UlrtPI1MLB8zmTxDoedNxEtR7fiLDyiwmLxrgC3KePcd5yx
         8qSIIYe6n6GnThaIagcJiaT0Nm9TCC0KTkSSg9bQNbBHkg4o8nhTvlRtK4+McRA22AtR
         jh4Mbe3iV80YfLyZy6xfgfgDn48mfi6LBmSbxeXu/6za0obl3Xl1t15VJGg6XfFPkLqC
         kpkA==
X-Forwarded-Encrypted: i=1; AJvYcCWpwR4PmFpTmJqUGHEoAYcyahXUjskRnRSw1/ENPzTe6vmTzz+981FpN3giHmSICgI9FH5Wz749IIWxOHXH@lists.infradead.org
X-Gm-Message-State: AOJu0YyijGx9yb5IWtZ8SpMm3TEBLw6zLn5eNDSpXrlEXhTEeTzSMHNX
	kxEUfuIHY6qMdp61/+Kw9jsuRptJLIo4hS0e5gfhbQ2MDv/3TqHRySm8+eF4P+c=
X-Google-Smtp-Source: AGHT+IEoBYrVUhHyrbUNCwAGbXc+NkRoj3HtTAp7KaajIN1+ewQ5hVAOn9cJfZ3bGQRw7ZRGjXLJpA==
X-Received: by 2002:a05:600c:1c87:b0:42c:b98d:b993 with SMTP id 5b1f17b1804b1-42f85690329mr64378395e9.2.1728310181578;
        Mon, 07 Oct 2024 07:09:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f86b4aa8dsm93766905e9.43.2024.10.07.07.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 07:09:41 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 07 Oct 2024 16:09:38 +0200
Subject: [PATCH] dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document
 the System Control registers found on early Meson SoC
MIME-Version: 1.0
Message-Id: <20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-v1-1-896b24e6c3c8@linaro.org>
X-B4-Tracking: v=1; b=H4sIAKHrA2cC/x2NywrCMBAAf6Xk7EJSLab+ivSQJmuy0DzIRlFK/
 93oaRgYmF0wVkIWt2EXFV/ElFMXdRqEDSZ5BHLdxSjHi5LyCi0XsmDilv2PNZ5HeBZuFU2ElZK
 j5Bke9EaGEAj4w7bVDSJyThrUpJ2Z9Yo4T6JPSsV/2x/35Ti+AFN2SJAAAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1630;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=GvNAWjsTO8OmF8M2BEvmxuvQTz7mfmYHmmUAcH3xWjo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnA+ukvWuQSIbIknk0kNg+wTRw4T3VGv05YtnvNaVz
 AuQp8ReJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZwPrpAAKCRB33NvayMhJ0VpuD/
 443JbwqY4DdWhMLpitV/6InB0J6rz62XzKB2baifQG/qEjKcFujPEHzD39Dhhadrmq8qGsnCzxuy2V
 9n7wdZ+T9QjfxJg+c2ZX+0eiApiZHfFAMN7ellGhLa3MbTnslakOdv1a0X56qYz98B5MDLXPIJwG6i
 NVBZDH58RIXQl/EdQ44Yl8iIlyUZg1aO/CPyygA71fdBdRqCFstjOfu74zSvCXv6wG+s7sjA8N/25/
 PsilnikfZo1iAupEz9lLVIpO/fYUqkksXsAhCy26/te0/T+JXxp4sEnQeLSYKQuIwUgGWySb8osdpD
 cear0CD/CRozwXmrLwJyNZc6UK81LTPRE+4jnIarlvOA5D5pc0W60/QhfVD0b0Jevc7rQ9/nFlSmgj
 cQF+/8y/sTvFUDXZR2AGq3jPas8+kLXju4CzItsrXo3l09GjWq1wEdhvc1y+LFxelckJC64ot6+lnE
 6EKDiMo6HrP6iaNEAzCVtJc4mrvUNKs3lVbMlvTOxpF8fYqCBvFIJUg1gjGPxBZz3rmlurjHrY4ZEY
 NVrKivoVJnFIeFDuWXhFW2XD2pywQytAY+pU0wiuk0zJlVqrT4MBPwgkpI9ZppwXc+uI3SgIhTDWg8
 noJG22J465j0iv8XV8ozPVL/7wUQqbec8uvOD0HrXydZqAzAbsnHu3m5ciEQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_070943_477256_9745DBE1 
X-CRM114-Status: UNSURE (   7.67  )
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

The early Amlogic SoCs also has a System Control registers register set,
document it in the amlogic,meson-gx-hhi-sysctrl now the clock controller
has been converted to yaml dt-schema.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
index c6bce40946d4..3dc66f1de023 100644
--- a/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml
@@ -13,6 +13,7 @@ properties:
   compatible:
     items:
       - enum:
+          - amlogic,meson-hhi-sysctrl
           - amlogic,meson-gx-hhi-sysctrl
           - amlogic,meson-gx-ao-sysctrl
           - amlogic,meson-axg-hhi-sysctrl
@@ -36,6 +37,19 @@ properties:
     type: object
 
 allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - amlogic,meson-hhi-sysctrl
+    then:
+      properties:
+        clock-controller:
+          $ref: /schemas/clock/amlogic,meson8-clkc.yaml#
+
+        pinctrl: false
+        phy: false
+
   - if:
       properties:
         compatible:

---
base-commit: 2e99ba3e918f5f1a987c86e559fe8f14d9c4048c
change-id: 20241007-topic-amlogic-arm32-upstream-bindings-fixes-hhi-sysctrl-meson8-158da98bee95

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=Y0fp=UI=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A73C28EBD
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:07:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D46A120652
	for <linux-amlogic@archiver.kernel.org>; Sun,  9 Jun 2019 18:07:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SKAwlMt8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cIHMqIRA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D46A120652
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6EFqtok8T/PfeWnx1VNivOQmxu8ZZOCv3IKqt2zk9cc=; b=SKAwlMt8MCxxxC
	Feuu7R7sc+nEiLp642hOFXQTM1kDZJGb1TwPaZebYvDz7cCi3ETmS8qRUOER5pQaqhvkDq3AzRd1i
	+LJSbkzoFrDD+/8MvpXkM6vgK825bW9sOK3tacDDaYj057kEr8DTkGcEsx2u438u9xCltFfuRbjvo
	qF4+yCGV1F4BDS5TAQaJvppKPoNniyGUHswt//QcM8yYJyd2+yc/azBDldor2zDrYgsL4NRQPGUht
	ALfM9ORjYbxVgWugkvESzNt8kGpxU6LGFwg0PSllUS/3qAkk+9lhmBD6+ABSPxPHjLeWBsm4Q8jvm
	ceSoOQ2mGamxkMaxzSDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1ha2E2-0004Ju-CE; Sun, 09 Jun 2019 18:07:26 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1ha2DK-0003dS-EM; Sun, 09 Jun 2019 18:06:43 +0000
Received: by mail-wr1-x441.google.com with SMTP id d18so6885699wrs.5;
 Sun, 09 Jun 2019 11:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TqXz/MCeI1smMWv/lBknpm+xQVHD8zLca+ZLsE7CsxM=;
 b=cIHMqIRAANO+YYtVflRdIOjyQQiMyWzgkuArvUa0ZqXdUEqWrZg3+SELonp5CYakHf
 BJtfzZRheP6EXq3w7YoHV48guAMmSuNCBd5yDk2RB0PBGz8nDE5rP0VBKTcTXyzWKBTH
 6vYOaOV1L+zjpdS3SmQAV/uqx+ovVKWNAAM6Tc9ddILTVFboRbYhmcSTtlHMM25fNug8
 NkhrSFSp8+5Zf/FfVE5ZoO1byAYom2+3a/fU8uOXg9HhK0x9/kClKI9qWgvcWGHMCngP
 qSjp1dBKcd4BN5iIKvpBLLouWqZg81JlhCHVqceAo+bHxNLH0sfqhVbG1qeJA0eJPpL1
 9wmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TqXz/MCeI1smMWv/lBknpm+xQVHD8zLca+ZLsE7CsxM=;
 b=BI2sCYILEP/VeLEzEY6D0ZxSaE0M84cOjapajS3eLa0BZEWoU6nMsM40ies6w+m3lN
 RGvr4MkMipOhU0klPJEGCio1MCFwQdWIWO/nNtb6W3qbYJwY3NpBSu9SX5g9+bfIxKBX
 PbmEX2RJeHo+uvoj0aCLKDrrXgRBFd6ZBhadL5NCFHmXQ8FqDMAmpyhcW1hEhsFL45pq
 SfiKdcgDi06DX52/i1pJgC9NNoZRSGo3UMoCDgR265envRti5oMZLEWerd8hdLwMC0TB
 Q4CprJWb9SC+Q8scrfaeoj0bieSfipuZIFfXeoU5HTpTY4yFnOK7CUHLYA1GNCsWJyml
 QDnQ==
X-Gm-Message-State: APjAAAVEv1oBQCuvUw0JLXFYJ99cjkkJYcrE93DI0g3fpk34bkmElF7r
 bveB9SujZ19EZIWzZn2NrUI=
X-Google-Smtp-Source: APXvYqx/9JrA/M8rWMKnXIIb7nHkPwhbRW1rK3/nUNwz5X/AHp/yd/w5vWfFZrKKVybNXW+yf7lcMQ==
X-Received: by 2002:a5d:694a:: with SMTP id r10mr19273919wrw.345.1560103601231; 
 Sun, 09 Jun 2019 11:06:41 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400B42D8EB9D711C35E.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:b42d:8eb9:d711:c35e])
 by smtp.googlemail.com with ESMTPSA id h14sm2007731wrs.66.2019.06.09.11.06.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 11:06:40 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linus.walleij@linaro.org,
 bgolaszewski@baylibre.com, peppe.cavallaro@st.com, alexandre.torgue@st.com,
 joabreu@synopsys.com
Subject: [RFC next v1 4/5] net: stmmac: use device_property_read_u32_array to
 read the reset delays
Date: Sun,  9 Jun 2019 20:06:20 +0200
Message-Id: <20190609180621.7607-5-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
References: <20190609180621.7607-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190609_110642_480420_734FB38E 
X-CRM114-Status: GOOD (  12.49  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Change stmmac_mdio_reset() to use device_property_read_u32_array()
instead of of_property_read_u32_array().

This is meant as a cleanup because we can drop the struct device_node
variable. Also it will make it easier to get rid of struct
stmmac_mdio_bus_data (or at least make it private) in the future because
non-OF platforms can now pass the reset delays as device properties.

No functional changes (neither for OF platforms nor for ones that are
not using OF, because the modified code is still contained in an "if
(priv->device->of_node)").

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index 21bbe3ba3e8e..4614f1f2bffb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -24,9 +24,9 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/mii.h>
-#include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/phy.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include "dwxgmac2.h"
@@ -254,16 +254,15 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 		struct gpio_desc *reset_gpio;
 
 		if (data->reset_gpio < 0) {
-			struct device_node *np = priv->device->of_node;
-
 			reset_gpio = devm_gpiod_get_optional(priv->device,
 							     "snps,reset",
 							     GPIOD_OUT_LOW);
 			if (IS_ERR(reset_gpio))
 				return PTR_ERR(reset_gpio);
 
-			of_property_read_u32_array(np,
-				"snps,reset-delays-us", data->delays, 3);
+			device_property_read_u32_array(priv->device,
+						       "snps,reset-delays-us",
+						       data->delays, 3);
 		} else {
 			reset_gpio = gpio_to_desc(data->reset_gpio);
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

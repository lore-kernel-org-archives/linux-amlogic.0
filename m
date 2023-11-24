Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD26C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2hkT3KBuBot7A1OU0AMJl3qtRnFJTh0Tw5GyE+nf96A=; b=FF4JOi/iEiExkw
	PZWJL6LXjE8X9T7v+lPdlTBcogntNhR5cjg8iiBMhr5HM0Vkh4F1O02EU3QTyEEKe1fMCvPU/Y6wr
	vLePaLBhJa9f7q4orJELYH2Wl7xQljq1m5SJ47ZXNLvIYsYkIbac8Q94uWN7OpyHcKVflJHS9C4iH
	SV+zZ4LqgIggJ6THsLUUXEzxXXHf+WEGE/HPf5ib3GEQqL6gwm7AvKRSddL5cdEi4V1poxrk1BzxU
	eibyVIBEFqAwViv20NRgSdoC/3EtwChbYvl+tCtd5SMhywBSk/nFbXS3LytzKOIGR11UNvFjcBgrw
	daYzxy28upGXS7trvnJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rki-006Xo4-30;
	Fri, 24 Nov 2023 08:41:32 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Rke-006XjI-1g
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 08:41:30 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4083f61312eso12919235e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 00:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700815286; x=1701420086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=Xtvu0xuyZ/NOXe4SmrzruMwzRriOkwywgoWudcT5ifWA+9Vxk+7epGFMumG3uS815v
         +pEXcJNlRjebIPVk2t2FYAmnso42uPdun7RkqJPyFnNxQx2/rIF03JWshU+UnvZiwbL0
         FSWaFzP1MmXhcMVEeRjpuVNcJacgSciaD3q3owTB7+L58QFfLAOhEmmATcyPK+V6l363
         zGpj0wc1cO3kPyknAQ6lF5e6TfjzyrwHCJQAIYGw1xTw4OXHH1UI6RVsdZFU3c1tOdrJ
         WiPkeRU+7jgi1l9EUTb6FLiNxUNkS8HBXdAnwFMwxvhf4TuB7coaRb/anZQgiBVv+PHL
         cf1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700815286; x=1701420086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rfvt+EmrHZv1zbeX+XtXPk6Fy/0gOVGXRVeJ603Il6c=;
        b=h6zGf5NwxwCQlqliwPXzglMJTMQUmFwF9EMsyPkmrT9mxpq6Je1tZEyjibp4ZS33Q5
         J10sSYxvWvqXejD5t8PrgCHaT0P9rRL0gVxqBrgr+2GZgWaIOz67O/APvKo0bGxSBlZ0
         Huc4/fcPl6K2ZAQP1RF1FxP+eJnU8j9Nhp7QTZkojXaxDP4IAZvIkC5nUTk4vMX3cAXR
         C4y4JbFExRUT8U3+Me1/7nnQTkiK6w7h6plrhnZbGNj7I5rq4ZSCd1OTSVxWGwU9sIgd
         9qv5z5+Zl19x5kPmJH16T8PLFp5GG7mIluidMNB62e5kDkNQyPjh4qz2Pu+zRGOP4qeV
         kuwg==
X-Gm-Message-State: AOJu0Yxl8nBJz6vQYdM3OItLhc3kK00NWpB7WOxSeLayRiW4Slr1Yo8A
	kaS25ksRUgjWjM/qmqzPY8WoiQ==
X-Google-Smtp-Source: AGHT+IFnuchw8Ikyiy3m+j3gALkvJfoErNWWwqz7BB2ufK/58r0Gt+p5OXv1H8cdurIdKXJg/ONALw==
X-Received: by 2002:adf:f48d:0:b0:332:e6d8:9345 with SMTP id l13-20020adff48d000000b00332e6d89345mr1676453wro.8.1700815285668;
        Fri, 24 Nov 2023 00:41:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id c11-20020a5d4f0b000000b00332e67d6564sm2534562wru.67.2023.11.24.00.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 00:41:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Nov 2023 09:41:12 +0100
Subject: [PATCH v9 01/12] dt-bindings: clk: g12a-clkc: add CTS_ENCL clock
 ids
MIME-Version: 1.0
Message-Id: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-1-95256ed139e6@linaro.org>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Remi Pommarel <repk@triplefau.lt>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-phy@lists.infradead.org, Rob Herring <robh@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=761;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=OBDzXE6zqX89kc7pvzy4CIEH7gf5glqDzs5WzIgtsF0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlYGGupCZ+JBm/j62lgDoGr7xNwQCD1mUMzIViQ3Q+
 5BTtcTmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWBhrgAKCRB33NvayMhJ0e0rEA
 C7eQ9byvp8DK/smW2cQqD8180I42XiMLdt3wZ7xVsHlZzRItzA+GMiMo8KBxOsciSTcMe2vQ3qkNz8
 /viQaJnuONTjKXGF1XzU0w2a1mU/w+GMAqpq5t5GYrsJYhBKucDz9O4ybGOoKdKFn12f8S8vjiTPdC
 +zThFD679SlacJRPuk0vKbwaPI4yFbHSvKWYKMtm1yYUOTWdf3asCcSbA1r7ZdSxR9n5ptrY/j0S+/
 7MyDnuRCfp8bhrWJqlXGhdXqWuabpaTaiWo7WgKW1sfpHHJgnES0z1FOzy3t+/lECu07cuhyLkdHK6
 hBFrNDz28dCn70wp0d3lmAAKuMaGh0riTCG6cjJHW9y2nNUNfLScNubW48XowuSlqaadd5YUu67laO
 bsXX8vh7L1Nu5uT2wmRY2BZpkUek6F6XRKcvDP9fG/P7LNiGCNkG/gK2pGYR0D8pI8SfeZN3558EO5
 m43V1xVJ/3fhvgYUcrY9QiimI6m7WxdQhcxoePjjVBNYsQwezxq4FGFV6yYRLjjGzzPY1REEU0hYSx
 oHJQit3xEHjUuNXc2fQH7wAQLOFnTcqe1LFiHzo8u0TVEv0EaxKFo1fFXSlIPwb+jNK9flSKdZq9aV
 jjtxeGFXZGXslCW1Bd7c+mso633D4cWnl5ZWduv7cUenT9VDAgcrqQz9kh6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_004128_563796_CD134C75 
X-CRM114-Status: UNSURE (   8.04  )
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

Add new CLK ids for the CTS_ENCL and CTS_ENCL_SEL clocks
on G12A compatible SoCs.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/clock/g12a-clkc.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 387767f4e298..636d713f95ff 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -279,5 +279,7 @@
 #define CLKID_MIPI_DSI_PXCLK_DIV		268
 #define CLKID_MIPI_DSI_PXCLK_SEL		269
 #define CLKID_MIPI_DSI_PXCLK			270
+#define CLKID_CTS_ENCL				271
+#define CLKID_CTS_ENCL_SEL			272
 
 #endif /* __G12A_CLKC_H */

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

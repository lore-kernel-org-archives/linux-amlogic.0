Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D19C38142
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 14:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjPxm36nrpHluM6hiLqWjQeOs9iYk2WS4aCzjsyTToI=; b=Lih5o7z9Z0zqVE
	b4eyRHyskAy4ZqWVKAuDESrENkNBUrds+NEkC8tvvxD6xAcXcwK2YVxO6uAvbaA8Jk2sh93Ztx0Db
	sRWSrp5K6h6TTcKkLqQCWLyUQmbwUFzuougyH9sWky93/DOr0J7LQOJ6z1qz0vSS04Thd9+trHGTQ
	73Zgf4yrnDjbxPTCi9z2Nu2sedkSjbuwNwGqRL5Tha2jgz10OmjC+5dMkTYnw7EuKwgcXgxKaydqv
	XFq4TV126LRwPZNo7Sgg9IPTAkeppIqrx+RM0dwIFZw6+c3KgJPxtI9Zdxzu5Tz+yzgiAY8rTI2jp
	QpSMwuDMc5VfD2SClBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPdj-00FGRp-VL; Fri, 27 Jan 2023 14:23:40 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPck-00FFyX-D8; Fri, 27 Jan 2023 14:22:39 +0000
Received: by mail-wm1-x333.google.com with SMTP id k16so3562623wms.2;
        Fri, 27 Jan 2023 06:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PinM68VhN6u99TllUIHqNBM1Tt1cxF2CM8CRORXHJ8=;
        b=JV6oveLuhFH62jhk/uMBIiAvfXJ4dszJjC5+bNbd0DamtdKxwSIBxS2AJOUGVQldNG
         S5xWyDdkIcSS69MsCnDgK3mt5aFeYq6ve0sat4MF/jrcsf6OjAIepXsCvKb29brDKGB0
         QQLavrrskir4ivpzXu9dmQ9umFG2jHWh+mVECm3JlJ2HDhVpr4iR3fRE0+hdsKUWVCP5
         HVjEeNnWfReW+Ox/t1skKsB82w+TfzR7oc/L01RKkyOVMsP4GAbE8EVXPAO80V3S6aPB
         pNovXRTzmMvgou3bapmDeUnhrWlHExxdyR8Yt9E8Uv01JeeIBk6EowCvxd7Neqn242o9
         Gfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PinM68VhN6u99TllUIHqNBM1Tt1cxF2CM8CRORXHJ8=;
        b=4fikNtliOmobsc+6/TI3GPz6E5zsT3lbcshf8zgmg7fE/UlNJm1m2NivL0upEcXbB4
         mMt/WQNs6its1S5OZ7/iBo/xl5fhsS+eL6yqFxS6xrAYrIdBwj62Q7m/zojHK9dwX7KC
         9S4Vm6jbRsPkqd2P97Uw60H6ROCUDRhmVPbdZvmValD7ZyKXgNZ53DPQURZvXP0TOFYr
         qN6d4Jjy+5HlJur1/jS2FdCjFr+UIUoUMcBqQCiFJDYTUtwFHTLXQMwudZpHZVYSM78Z
         3ohcgsxhE7DX9OzBpJ8KSHd/OZJAUN7WG6E22pGZ/nFiUuVjXfmT9+ciDKiXa+bAXsug
         6KZA==
X-Gm-Message-State: AO0yUKWFJIhvFfqIczVj98AbENinlArMg5fAo9zDsV1Vx8F9OtiWFLQy
	L0NBRsO9hcizjjLNVFE8Nyk=
X-Google-Smtp-Source: AK7set9nHfr6dWXcQoqGY75YR4leV5N5V5+HcoQvKCYovRfHKx4ZovdnkYJB5VkD96F1SmMhhnEGnQ==
X-Received: by 2002:a05:600c:707:b0:3dc:3577:fdb2 with SMTP id i7-20020a05600c070700b003dc3577fdb2mr2743871wmn.5.1674829357136;
        Fri, 27 Jan 2023 06:22:37 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id c11-20020adfa30b000000b002bfb5ebf8cfsm4301039wrb.21.2023.01.27.06.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:22:36 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] dt-bindings: arm: amlogic: add support for BananaPi M2-Pro
Date: Fri, 27 Jan 2023 14:22:20 +0000
Message-Id: <20230127142221.3718184-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127142221.3718184-1-christianshewitt@gmail.com>
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_062238_475451_8D91AF5C 
X-CRM114-Status: UNSURE (   8.43  )
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

BPI-M2-PRO is based upon the BPI-M5 using the Amlogic SM1 (S905X3) chipset.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index e16b5fa55847..e935c92ab346 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -176,6 +176,7 @@ properties:
           - enum:
               - amediatech,x96-air
               - amediatech,x96-air-gbit
+              - bananapi,bpi-m2-pro
               - bananapi,bpi-m5
               - cyx,a95xf3-air
               - cyx,a95xf3-air-gbit
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=pha3=LB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4D7C4743C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CC1061208
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Jun 2021 06:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CC1061208
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7HBLjn88hdssN7HZEHuyLYRXhmd0noQzi1Bs3xM4Jn0=; b=r5lHs8CChCiY5Q
	IO+GqkQXPgI0SnNVRQEARad4MMsjrB6khLHsYLdNeE0m3djnNzAeYuEdbsYtl6W2NBk6samfRxzst
	yJTNGjHuHnq6j5PERFfWBFPXXEBb2kgDzqAj8dxsErXVOPhhvkPxoI++ayEzvdV4kIeUwp/BKpGk4
	LryJKemvoIf6kKAFju7rRD8rS42p8pKnxojpqxhae6BRiMe3135cez+WaUDzAQ2v/U8HHyDve2VGa
	qeuBdGvTkwDXY4v/1lDPKxXym3wWLdUIwGdW6vDhrV3NCPi2A2CD/FFkVeBITMnlmxvk0PLl4lVPP
	vZQnxwBRBJ+lVBIEOepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9C8-001qKP-On; Mon, 07 Jun 2021 06:57:08 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq99w-001pR4-92
 for linux-amlogic@lists.infradead.org; Mon, 07 Jun 2021 06:54:53 +0000
Received: by mail-wr1-x434.google.com with SMTP id i94so11205175wri.4
 for <linux-amlogic@lists.infradead.org>; Sun, 06 Jun 2021 23:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1M00BIXNHjbYONusKxop0Uf6pH0dXi9px3pnctoNpiQ=;
 b=rOwuFqH1U+UWA98YWVC/Z4EZh859kA8eOey/658SqyMYEf9h5/CZ8QN/soWTzMbCIF
 +xr4OIFSMV4iqWS4qHb/416IjpqhCGs/T6FSTUPNL5nat2R5yTkZ4gKC3jYNyLjDevEc
 XFXvFM1WoBd8PCf73ef8QxrTfZMRRPTic73IQQA7KLWMJt3fsHTdRMQAeb0CQOWpvRMG
 TcWcRsAUFNkQEyagf8cwi1YrVN3CQvtTJPIVpbh+2RUN/cuCvFp0LyDNaTvMInGOl9GK
 gTE/9GwKQDtP0V/drKCoPuJBjjSQFDSdHrCUcTEwaOWdurUsMF3AbpLqwlutnf79yBm9
 gNdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1M00BIXNHjbYONusKxop0Uf6pH0dXi9px3pnctoNpiQ=;
 b=bNl4wTuMsqVWfMI9gJIO+m60sK/PUxCZUcT7tCmE/7LHpfqbf5I9AMV42SYbho3wry
 KNzYzNZktugyflln3PQk/TRsrZJf4xL9nVXrSdcF5iwMrRk8csZK7rSUaCwcsMrsFUM8
 CykIEDw8nFHqmF0g2uk3lEbIUsL73qhxF3QfwZ83BzhDa881+7v98TXUxyRONIm3fNYm
 nIQfHfs3lFdI7SmR2lV1J6LGgPtHzUdzxlNm+1GT9bH1L2AqQjejzYIq7AbId9ERom80
 nJFAABSEmSWjtFpcur231Sb+OAdtp58bgloNFy7uoOrBCqRLvmG3FwBPTxcgYLb96IKQ
 CS7A==
X-Gm-Message-State: AOAM530IU0lYQ0t4T4pK8QmqxnOx7OjGiSxt6BDgQJJ7RfbXf64xGkm9
 IokSCynsTajmdp361J0Y+SzSXA==
X-Google-Smtp-Source: ABdhPJwU02aex0XwNNQc0sK7Gsam8Cgv6FgnPe79ajdp71dz1OvZSQfRy4FjzaCtX61dw5PZ8eX1Kw==
X-Received: by 2002:a5d:4984:: with SMTP id r4mr15255562wrq.152.1623048891062; 
 Sun, 06 Jun 2021 23:54:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:7c1f:1c9f:555e:7398])
 by smtp.gmail.com with ESMTPSA id
 l5sm16145742wmi.46.2021.06.06.23.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jun 2021 23:54:50 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 7/7] arm64: dts: meson-sm1-odroid-c4: remove invalid hub_5v
 regulator
Date: Mon,  7 Jun 2021 08:54:35 +0200
Message-Id: <20210607065435.577334-8-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607065435.577334-1-narmstrong@baylibre.com>
References: <20210607065435.577334-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356; h=from:subject;
 bh=2+XB2Oss9iZD3QAWh2ekV3OVz7bGhwenvkupndMpnFA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgvcJBaa4WmHRO5GXz/nWgYW23KSV7SOX+plOr9fgU
 0ZJpR+KJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYL3CQQAKCRB33NvayMhJ0UHDD/
 9yicfv1d29ovM5jCi0kTXgGdAZnedKktOtS4zpUlBgmZgcLUkJslkuKVyZAn/EcWUvH0YhzRksYBbh
 Yhdy97FbJJ00y+I2qMxly8QxEMEdKO5SCpaov9SD7de2wpjXuBgJGR+x4Vn6B01Jh8H4st8ZLWehiE
 zexv+tt62Tu9PZXdH3/ORVnLaujXwmhuGcK6CM5qAN6t/QjO2XccBva5w+OB2JCQy0aGqh9LsCaKZl
 /RZjn2asSIIK2V4OKbwmlX5fi5ReeqBIazRK7JMjAjjhcriPbbMYSCaS0R38JSGXO98qo2u/NsRZOz
 UWzILP7TkdbzAuC3m111+mH7PtjkuiqP6KVmn4hhwbSFVsImqn4CTlMvN/Q6JgAj3+fGTyKBcdo8dz
 LgWHBo4yKpSvKqcjya6RVUOsmBRZf3FFLiiTT+gwmO0ZnAQkdjo8H47Vr62RcW7bVEoS9JMsr9/1lj
 VclXqGdxXXld3L7Lhsx0UhOV9kSc9CxdddD/HH1EsxZASkm/uqf4eSgNyth5bdgwSVKqVGVd7Oz0+A
 zbzqBQeuiXlwQLzxNhOGptrjpJzU6t7pZQYIxYemHyoGDTYYgOzewwRxaXX/v7pH87Pe7Pex9cHiDp
 LbvoZXSNRbp9tiSmzKcLQW5o/lAm+P2suyXCUX2Qi0GfVbLWeX0VQMDJLbdA==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_235452_378059_DADBA52B 
X-CRM114-Status: GOOD (  11.42  )
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

Drop the hub_5v regulator which controls the HUB Reset line with GPIOH_4 which
is already controlled by a GPIO HOG.

Until we can properly describe how to control USB HUBs reset lines, keeping
the GPIO HOG is an acceptable solution we use on multiple boards.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-c4.dts    | 17 -----------------
 1 file changed, 17 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
index 8c327c03d845..8c30ce63686e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
@@ -23,18 +23,6 @@ led-blue {
 		};
 	};
 
-	hub_5v: regulator-hub_5v {
-		compatible = "regulator-fixed";
-		regulator-name = "HUB_5V";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc_5v>;
-
-		/* Connected to the Hub CHIPENABLE, LOW sets low power state */
-		gpio = <&gpio GPIOH_4 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-	};
-
 	sound {
 		model = "ODROID-C4";
 	};
@@ -58,8 +46,3 @@ hog-0 {
 &ir {
 	linux,rc-map-name = "rc-odroid";
 };
-
-&usb2_phy1 {
-	/* Enable the hub which is connected to this port */
-	phy-supply = <&hub_5v>;
-};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

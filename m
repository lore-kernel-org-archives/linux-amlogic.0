Return-Path: <SRS0=dgHW=K3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C6E5C47092
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:03:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 17B6061364
	for <linux-amlogic@archiver.kernel.org>; Tue,  1 Jun 2021 09:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 17B6061364
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1MMqE/d7wvHNVUo9+JCRN567L9GovyGGo4NdGdApWko=; b=y5J4YpkQOIs498
	Hr7ha1zrcH9dyOEWWWnkZQmQ1zmH2MHFZ8do/3hkd4+B44TqdJXVa0HqOoJucafmQL4rZzr2yNsZ1
	S17mhNgpsjStpGKjMDpbTW0fGtGTS72A1iuYqcZq5fU/BneUkVs4rYZG0KAyXwViT+/jatI05TFfC
	sVe8rXq+7/ou0nWEBJAr8FbxOxetFsS4Kku2vFYia6nwoITtrxJJr0hZ49WbWi4VHQ2JWsqGgB9Ze
	RZr9zBT39PTmsSprUU3waOCjIwVTi0FZnNRj+U6wVCQtIJWCqtA+LEWn/qaG6VigdH5u/SHQqkpM8
	D8LRKL3u4UGurkmEU+PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo0Io-00FUYn-4L; Tue, 01 Jun 2021 09:03:10 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo0HZ-00FU1e-AQ
 for linux-amlogic@lists.infradead.org; Tue, 01 Jun 2021 09:01:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id n4so13434256wrw.3
 for <linux-amlogic@lists.infradead.org>; Tue, 01 Jun 2021 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UHCQFBQhPzsG0CEaz0yeVlmPsGxszD+zPyDJnZSWUzU=;
 b=AqIMn9yHEuwVr2ZBVnbEs98mMuS9lRFi1IoNMU/OqM75U+SlAS1KDC1VuZBbAyaUVo
 sUdT2rJt1umJmcANWdjUkfevG0P43m91gzI3o+pwpf9n5MpAgZYkI1PUvI2Bh8V6V1VB
 g/ZuowGQmO110Wi7Sv43GFydJzWdk49VbTAsZabF1dPR0IKy4kts3ZGtHINhiZJFFK8j
 9QNsEYR5+DJxxy89ccxwFoRjcA5wAfIpjTfZbzn3nuxhOCYkjzUwfigfx/KwqgfrIkQB
 TkadOsbtF1jH3LAziq93w3gG9yhEqkvgh5d5kKE/ZnlVvaRlcs7A/8+XR+i0pA3H8/wA
 k0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UHCQFBQhPzsG0CEaz0yeVlmPsGxszD+zPyDJnZSWUzU=;
 b=rYSOVfZ3UmVRP6ONzS/Q+cmhWm1quu87EeI9YL10GVXGs74tvcCgoEHbX/EzsY+I+A
 LZT03F14BrK0H6AA0fPvN2XPHm0eln2n81RwgYL5YcHWM7aswAltveQ6cFuo9E3QNjqP
 +Q+sN50kIeZhkg45rdcQF35rsvBRud326almiadDwTQc5GvHBCQ6hmAkuX9Z6U7N2nVj
 F4bFEtO+6aW0fDtJ/I3Z1Dqb5pCK+loRtg3B5tMGkYwjQ04jiIpJpwPKV4KN6Ospk4Jw
 IukxbqAp8tg3hxT7dmzkOkbWqEYDt3YGfFPdIY6BC2mnm4nBWy/dE2ay0PNgIWXtz9w6
 eLMg==
X-Gm-Message-State: AOAM532EvcVoWqVlio6wUdNWNNjjDDDzj9vKsOPwGkU//Ed5ZDAfBzq9
 XfAc/0RayNG4NA9+SR3Kx9BrJg==
X-Google-Smtp-Source: ABdhPJzvIQebSNhoRt02RhludXujwexK7xW5RN0kUkeQ46rqmWXK+XEQICKQXdtppbGrD7k+CaDAUA==
X-Received: by 2002:adf:d1e3:: with SMTP id g3mr26324279wrd.21.1622538111949; 
 Tue, 01 Jun 2021 02:01:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:90c:e290:a3a:d001:6a80:207a])
 by smtp.gmail.com with ESMTPSA id
 e17sm2668199wre.79.2021.06.01.02.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 02:01:51 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, tobetter@gmail.com,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 5/6] arm64: dts: meson-sm1-odroid-hc4: add regulators
 controlled by GPIOH_8
Date: Tue,  1 Jun 2021 11:01:39 +0200
Message-Id: <20210601090140.261768-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601090140.261768-1-narmstrong@baylibre.com>
References: <20210601090140.261768-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1713; h=from:subject;
 bh=sSgXAcLCZAuhm54ZUZ6B4N280tFMWl0vaDNAR/nWRyw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBgtfc8Vbr2sDac/s+JTxxGHeDjlM2n08Puv6+y7xTy
 6jap8PiJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYLX3PAAKCRB33NvayMhJ0UQtD/
 wLbwAP0eI6j4rtkrOzyfsrLx8Vz1/+wP64GaK8WGSO2mUi9iFWwrzgj0+oBdViiIm2Yjo1jY+5U8r1
 ylhvE83B8p9t/keDyYlF5xkganfVyLmkCXO+ppSqNEKnbdnw21+pzjr2KxXbRTDleHjJoUNTsmLrNZ
 aRXG4QpLQM2penC8CrOuqDwOSjWcyVenExlQyyXRndm/vUNo3jBUbwoZq+HLSXjbRwZX3tL83Af2hk
 wBssARI03BO2BBcfaMYj6pPcW3gjFAt7CaL4tkfk8YSqKJP7uC5jHXplVjaYYo77wdd5DFuaxr/zSM
 dT2AA9WnyPJbq3DSHXdNhK6Bxet4RnhnbVTVuLUgUcc7CMoC2s5HyvC7WN8YJGHRlT6v0Yvq+hJbJD
 Hi7qQJQhIDmm8Xsjy/Z7Rezmr5HWITaWojRE8iV89CBk+s6l3tVw/G8rzyclhk61qn/bAF2ZWzY0i1
 yiunXR5I4w2o+jV0qcGgdiU/q5vHlvlHjOMlxwrbOodB6HVSxepCoTSf0NMqearMjCCc31fRJNvWRw
 r/6W6CeB/OE0ut4yu66x0AcpzRljfnvYjVMsWud8RON+577jUHOSKKMNfLFPGSYTcVTu5vC8C3DfYH
 TFRqpjIfEQsBFRK+B+NDoFWs3OgETo2b6fhzcXWqF4xP4AKZp7Feq1rK2E5A==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_020153_411710_C16040EC 
X-CRM114-Status: GOOD (  11.89  )
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

As described in the HC4 schematics, GPIOH_8 controls the USB 5V and 12V
regulators used to power the SATA drives.

And is set as Open Drain since this GPIO doesn't support Push-Pull.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
index 0a34b658f994..d36c25b5b690 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts
@@ -44,6 +44,32 @@ led-red {
 		};
 	};
 
+	/* Powers the SATA Disk 0 regulator, which is enabled when a disk load is detected */
+	p12v_0: regulator-p12v_0 {
+		compatible = "regulator-fixed";
+		regulator-name = "P12V_0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&main_12v>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	/* Powers the SATA Disk 1 regulator, which is enabled when a disk load is detected */
+	p12v_1: regulator-p12v_1 {
+		compatible = "regulator-fixed";
+		regulator-name = "P12V_1";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&main_12v>;
+
+		gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
 	sound {
 		model = "ODROID-HC4";
 	};
@@ -98,3 +124,8 @@ &usb {
 &usb2_phy0 {
 	status = "disabled";
 };
+
+&vcc_5v {
+	gpio = <&gpio GPIOH_8 GPIO_OPEN_DRAIN>;
+	enable-active-high;
+};
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

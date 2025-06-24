Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77867C77B7F
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Jun 2025 15:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uL0VMwRga1NCsbC0jGT7SgrPEDQebsjMzgfRcxMuDk=; b=IA9XbhttL6St1Z
	eXNIiXQRsXFpTtJMjwqUK01+1jUYtXo3kW35qiPrA8jGJ0mkYX3aJI1OMwPhxskksmDIf7ov5s+O4
	awl8QveKBXcWOYhyKJvofnxzeyV0WfGD3yR7sWSIYYXe4miDmIhudkU3okuluhyZmLM2Kj6/5qUT5
	mHcTbHiTjIjj3z6GIFMABUHxZGh0gIhBizNN8e4tOSIpcG3uszjfKlCGrlUObBSvu055pPqDInVLM
	0D1HwO4EsmShriKvFx72MAT0bebk/q2xbNGVG1gxjt88VFQ1zQM+bF8JEZAcIaJEA5oPTVJqSP/f0
	fPO0Csh6FcrzBADFWxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU5TB-000000065ZG-12sa;
	Tue, 24 Jun 2025 15:21:57 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU45q-00000005nGt-2qUW;
	Tue, 24 Jun 2025 13:53:47 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-553dceb342fso414873e87.0;
        Tue, 24 Jun 2025 06:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750773225; x=1751378025; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPoRk4bv9TKG/GPtay/klnJZ+Cs5fblRZBWiTndC3ps=;
        b=elQ9pV4uc+wfZk6yF3/OgYAckA5QWt8y1/BjtlD3ldb5avL94JRgVolHtxIWBdSwWD
         Py5R5JJs7uDGUpNVyTkgYgPQpGOBjRZq+YEw0t9+deGPXJ0s+QLhth+jj6XazxHpsKLE
         /tqbBTxwKqBSvfqGXOzOuxj5JCMX5Vu8sfq6sdo3KQaaWYuTrOHO2XMW8lL7fcZ7EW89
         THKb9rtMSgCQOgrOrmPI9bP6UjD5B5Vcwl1BWX2GXBQ/HRQf74JI/haZwqi+fab97cAV
         wAz+mWv8cIHFOMqFKXXELFa8if+vdrknEs4+RPrvxZZiHaC5aHbYcqFmVdo3tzwH9B3S
         vy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750773225; x=1751378025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPoRk4bv9TKG/GPtay/klnJZ+Cs5fblRZBWiTndC3ps=;
        b=luz96eNc5+af/UrFkjWyDBXk28oNtbrKKHjPn3EKmGFHy10/ffzkVlTRHbnju3Rp0j
         itawUSrYYr7mpN/U1YneyNExuE4nUEAzX5s/X3S4ygzUJGOIbLQPVe35uCh13d/0MqFe
         eogPsOwb9Z5mDKOG8PlyLk5vIAFTZvcdHnM9XVFl61g0WEKELzzFjp3onAdWe/NvXHOx
         xE96v6NfslI8S0jOhlAFirnxXnHwI+wPw9SaeSBK4lkikNELleMtQc/JC/6oFHdjDz1P
         f2js6XKyS/XLTwqLCcg46zbZOQJgHh7/ch1QX032GkmSl50IlC68IRxWdSFTteCckGlj
         9FMA==
X-Forwarded-Encrypted: i=1; AJvYcCUNAo1LVl9LBdIx/pOiCoFYR+Lbvcl2PHjLBIBi4KT3b18vyH+kZQ+XEh4i7lepsf7jUsaPxHHBJBasupj7WMWyMQ==@lists.infradead.org, AJvYcCVF34CO9j2vtR70n6eLUxsbKsp8nIFJoVtKmH4JhjTkuHaGsdUSUwUc3AabClpJyiZWz6SBPGR/QAM9jwfc@lists.infradead.org
X-Gm-Message-State: AOJu0YwwXqhr2+y1bLl7eeCop1gP4ZuxOIRbEDfb7c1FOATuz8V+zpTA
	AEToORWC/2K0FQ2YqYq3B0nUqwQSXI+w8XgrbmktSJlHo8gBRCgwjzXnVdCj05l5FRg=
X-Gm-Gg: ASbGncvQByvZCmwjHlQJR2yM/nZnI36Pgeu3blWrrup1diEb8PQYXkvPnTzsLgvcGoL
	y/q4JQUdUPOK3e6fXopOA3Qh0ZyoG3mef+x7TO9ENhOjXKuukYqzitGsbN2gGcOZJe2PUKZblnz
	R+I+Ke/UltgCVoKDUsPWR2E5yFdodqNYL+hskvs5kiaXTfqApZNVkxi4AHiha8ltUM2DmMV/vzD
	A+VfAqYGtFae0OZDnoIn9Qcj+6bMFhN6RIFPI79Op3Gg/Bq2XqgzztooXMKUagIih2Z81Nv/CrR
	0yY5umzNMe5pkFGFf86mqWmNkMbnG9THUeTNnVjGoLJtY3xb3M7e+SuYzPdfYTZHwHQ3lw//U/i
	1uyKwMglM8aI2X16pH2VV6hZwAm5YbD9tSVRbU6ULOA3fGue+fCchUONPwHcXZA==
X-Google-Smtp-Source: AGHT+IHWrITTZvm4aBKFUE/hCxGWyHHpvUd1BpQ3eCCcJAyK5yg5EVhrHzcqwCBgUXfsrRLShgxK5g==
X-Received: by 2002:a05:6512:108d:b0:553:2e37:6952 with SMTP id 2adb3069b0e04-553e3d0e223mr5416531e87.55.1750773224715;
        Tue, 24 Jun 2025 06:53:44 -0700 (PDT)
Received: from user-A520M-DS3H.sberdevices.ru (broadband-188-32-30-96.ip.moscow.rt.ru. [188.32.30.96])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-554e6dc186esm1282905e87.114.2025.06.24.06.53.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:53:44 -0700 (PDT)
From: Alexey Romanov <romanov.alexey2000@gmail.com>
To: neil.armstrong@linaro.org,
	clabbe@baylibre.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v12 19/22] arm64: dts: amlogic: a1: add crypto node
Date: Tue, 24 Jun 2025 16:52:11 +0300
Message-Id: <20250624135214.1355051-20-romanov.alexey2000@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
References: <20250624135214.1355051-1-romanov.alexey2000@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_065346_716627_91A377B5 
X-CRM114-Status: UNSURE (   8.78  )
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

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index f7f25a10f409..a2f2f377bf99 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -665,6 +665,14 @@ sd_emmc: mmc@10000 {
 				power-domains = <&pwrc PWRC_SD_EMMC_ID>;
 				status = "disabled";
 			};
+
+			crypto: crypto@6000 {
+				compatible = "amlogic,a1-crypto";
+				reg = <0x0 0x6000 0x0 0x48>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+				power-domains = <&pwrc PWRC_DMA_ID>;
+			};
 		};
 
 		usb: usb@fe004400 {
@@ -746,4 +754,10 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <64000000>;
+	};
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

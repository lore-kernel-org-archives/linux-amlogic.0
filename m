Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F83C48BF8
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Feb 2024 08:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x3fePHSNpig4/Zp/tHFMlTeAqd+hVdejsn9slBe3e3c=; b=YfqZDZLY1WGLmC
	Vrx+byD8hHlHMg+Cv4Hf/l2MdSTPCCLwr6OrtcyUv3f2T+Jnrl+8wwA29psmOx9oejKf8+g7gziNF
	eBxfBKO7ms115afAYkwIOPpe6JLttuGwnEgM96spEwhuzAPe0U+h9vvnkPglYE6o3Orj0NbE/6A+d
	b8UZwzZ3j1whPcsFc+L/Zpb8J8daEstMHtwqdGY1XXtDy18N0iU8WVnsUt3bfzr57hqO9N/4ITTJY
	+lghp7A2YFgmsIdHcsJp4Z+ejfrnMMHlhBafC9GkG1h+fDCKh07QJ1rzDfx27DmdJbJ9XBHMJDgSv
	/2GpxNZf3yCMF3+sLDiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4Oe-000000040SY-1Ypi;
	Thu, 22 Feb 2024 08:25:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd4Ob-000000040Q5-1H9R;
	Thu, 22 Feb 2024 08:25:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4127a7c082dso6828735e9.0;
        Thu, 22 Feb 2024 00:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708590331; x=1709195131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5emx/U2oYhPeHt5StfEB6Fse+tRMmiJLxAKZrtTj2k=;
        b=li4rpaU0HgQab/wPY4z8xQl80UbAx9nMSZMb5Q6oW9ulxEgS3Nj0QU4S7LI4CGu+Ji
         8cAnOsb9JygITJuMvM/IraS8cXRcXu8ISYhSDYInufDPaxq2SaMNvu1F/l5Tkw6K86nK
         IWSMT+3ketzfBuxLDDS3YRlup7UAX6XF+UUwqPlgiM/MorchAXUG19rrCVQCX+mFzJDn
         VXuIFovy/zHyxnXap3Bu7MWtWyxjTs1aQVdg/DScBooALdfvMBxumIAJQuDR9l/uRnCU
         2h6WjHM8N/zluXg5JAD/WSVy994ne+EQUaIgAaYeLJXRbuSQ1HqLI7aajBslZU8d0ovZ
         242g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708590331; x=1709195131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5emx/U2oYhPeHt5StfEB6Fse+tRMmiJLxAKZrtTj2k=;
        b=mA1fSW8C2fmaGT1hD4GwiSSBWvlKWsvABitNJVhinGijowaXEBJmyhBf7OrG/XHkYE
         wZ4cMBwA4LYbGcEtGO9C7E/EJjlzWqRfiGaeAJ/Ws1SrlG6IsH/YheA+pygdmTfSfxiD
         8JWn+ozlF5mlLlJXkb6CG4Lo1lNycXnwRexAMlTrS/+V+OIZVUc5j767Wlbu41HH0TC2
         a0Tp4ir0sxTkQd3puT4/azrlfcb5LFbalt7p+XrEKPRY4SEpIHTZ+ToEGgulZIQlECuV
         9x4z3F/FyccgI05IJSz1PA1+PwANy2H/jKQiFWVHLklf0wdvtZpI56BZ9x7N5XKizRkf
         L1Mg==
X-Forwarded-Encrypted: i=1; AJvYcCVtybdHnZlVrQjZNLyZzV1ImP/qH8RZ+FvwYekyFacHbBiDaSMyMbntkEQ3QBBEBln9fWFQeCcCN6LlKm+FvDdsTYGtr0vij3IIBg4EWxn27yLMXJC4/GP8441KrmVkUiTn7pkeYHMtqiNBolUq5lnK5AMLpX6rbQ==
X-Gm-Message-State: AOJu0Yw0l0A6PM5jD/8oBybQAtUxiEdvfOGMEhA1PVVlSF/tDuGeRndH
	iaGeUnbqZJSLv5e2oNREl7lekDGBEApADJhlpkak7scKt9+1LtcB
X-Google-Smtp-Source: AGHT+IFG7HpvoJfvcho61ZilkRh4f43EQKTRBGVQohjbw13VTUNFyeF+ZKY8ZpAdb6cG9jZdIBAEPg==
X-Received: by 2002:a05:600c:4711:b0:412:64ea:8f3d with SMTP id v17-20020a05600c471100b0041264ea8f3dmr8386573wmo.41.1708590330899;
        Thu, 22 Feb 2024 00:25:30 -0800 (PST)
Received: from localhost.localdomain ([90.255.110.157])
        by smtp.googlemail.com with ESMTPSA id o20-20020a05600c4fd400b00412590eee7csm18155822wmq.10.2024.02.22.00.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:25:30 -0800 (PST)
From: Adam Green <greena88@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: greena88@gmail.com
Subject: [PATCH] arm64: dts: meson-g12b-odroid-n2*: Add support for overclocking Hardkernel ODROID-N2 boards.
Date: Thu, 22 Feb 2024 08:25:23 +0000
Message-Id: <20240222082523.1812-1-greena88@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_002533_367308_2F7207F2 
X-CRM114-Status: UNSURE (   9.67  )
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

Hardkernel actively supports overclocking these boards in their own
documentation. (https://wiki.odroid.com/odroid-n2/hardware/overclocking)

This aligns the SoC opps with those in the board vendors bsp source.

Signed-off-by: Adam Green <greena88@gmail.com>
---
 .../dts/amlogic/meson-g12b-odroid-n2-plus.dts | 25 +++++++++++++++++++
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dts | 17 +++++++++++++
 .../dts/amlogic/meson-g12b-odroid-n2l.dts     | 25 +++++++++++++++++++
 3 files changed, 67 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
index ce1198ad34e4..1731d542a00c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2-plus.dts
@@ -15,6 +15,31 @@ / {
 	model = "Hardkernel ODROID-N2Plus";
 };
 
+&cpu_opp_table_0 {
+	opp-1908000000 {
+		opp-hz = /bits/ 64 <1908000000>;
+		opp-microvolt = <1030000>;
+	};
+	opp-2016000000 {
+		opp-hz = /bits/ 64 <2016000000>;
+		opp-microvolt = <1040000>;
+		turbo-mode;
+	};
+};
+
+&cpub_opp_table_1 {
+	opp-2304000000 {
+		opp-hz = /bits/ 64 <2304000000>;
+		opp-microvolt = <1030000>;
+		turbo-mode;
+	};
+	opp-2400000000 {
+		opp-hz = /bits/ 64 <2400000000>;
+		opp-microvolt = <1040000>;
+		turbo-mode;
+	};
+};
+
 &vddcpu_a {
 	regulator-min-microvolt = <680000>;
 	regulator-max-microvolt = <1040000>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
index a198a91259ec..0c71e8bc0124 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dts
@@ -13,3 +13,20 @@ / {
 	compatible = "hardkernel,odroid-n2", "amlogic,s922x", "amlogic,g12b";
 	model = "Hardkernel ODROID-N2";
 };
+
+&cpu_opp_table_0 {
+	opp-1992000000 {
+		turbo-mode;
+	};
+};
+
+&cpub_opp_table_1 {
+	opp-1908000000 {
+		turbo-mode;
+	};
+	opp-2004000000 {
+		opp-hz = /bits/ 64 <2004000000>;
+		opp-microvolt = <1022000>;
+		turbo-mode;
+	};
+};
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
index e26f3e3258e1..b16a69d0cad6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts
@@ -97,6 +97,31 @@ codec {
 	};
 };
 
+&cpu_opp_table_0 {
+	opp-1908000000 {
+		opp-hz = /bits/ 64 <1908000000>;
+		opp-microvolt = <1030000>;
+	};
+	opp-2016000000 {
+		opp-hz = /bits/ 64 <2016000000>;
+		opp-microvolt = <1040000>;
+		turbo-mode;
+	};
+};
+
+&cpub_opp_table_1 {
+	opp-2304000000 {
+		opp-hz = /bits/ 64 <2304000000>;
+		opp-microvolt = <1030000>;
+		turbo-mode;
+	};
+	opp-2400000000 {
+		opp-hz = /bits/ 64 <2400000000>;
+		opp-microvolt = <1040000>;
+		turbo-mode;
+	};
+};
+
 &eth_phy {
 	status = "disabled";
 };
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CCAC48297
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Feb 2024 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZRjg1UHPWM3OYVx2mr7dEB/dR5tbGZ6Jo0nP8Vtuxik=; b=KV/YpG4U4AD08M
	khtazp6gpa230TcLO5U5nhb1xOeMjxwFF1p6nfAN96RJNnFFtu4ZFuokB8rwVNarpX2dsCgcNFoc0
	R51d+2zWav0FgVLsi3BhTWtbgxFi0by+Eg7dLk6lsR0xGAdy0vsgPpKtuuVH9/4nTUKxZnowLNbfQ
	a/HLIXqadium634SBDYP+uDgttHxF1bPcoERVADp7+X8Y9q67xfOTttJhVt/k9Cn0nw4xCCm3w9Qd
	UhmUNtGHjWDxlRVaTKA2ECZRcPV+GIZszIWjnweU7jEktjjzKKB6pK7PiuXHu8sxciHndL7VO65G9
	pGKLQNKM5WjzwjDJQtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2eG-000000047Dr-3VDH;
	Mon, 05 Feb 2024 17:20:48 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX2eB-0000000479d-43Ic;
	Mon, 05 Feb 2024 17:20:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d934c8f8f7so37511015ad.2;
        Mon, 05 Feb 2024 09:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707153643; x=1707758443; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWaLBR0WlEM6D0U1zRhCBiq+gAlYg7I48ZvwUp7dgNM=;
        b=ZDavuciTHH4xG1Hhyxd94KXPQJ4vyE7MgGec6ge7ZHf+js0AxjCGUMNkVsiqI9dYTB
         81gZwAHhTl0zlo2m+aie4uxAM869AYhcyO14k5BOVaRgtsgHg25O+Ah4njOkdkLvixNk
         KJLARwJTWRRKW/QTYrFKepYxMlg8TCGcwcEguhrRj+aBjou8lczR9MCFfzTj4tLJtppY
         zpTH2huLFlrhBl76YxI4u/zBN9bd/ytksUbBPkrhQA38LiKGsqMNAlg7ga2yl4ySedgE
         I5C/CVyfpIMCo5jWo9BSMsnkFypXKAauCtEnhF/POqZjpVV99+0dxPEkWmhuktuWzwHf
         FhbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707153643; x=1707758443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aWaLBR0WlEM6D0U1zRhCBiq+gAlYg7I48ZvwUp7dgNM=;
        b=eOe9O3lDjMqhDVIDzO5czUkyaT2sUbcpyjpfqWZUdilIMMSlfFs0OglMFVkuhq6GDG
         sgle0rlHBbv7fvHU9KpKuAaX4sLGZhOOVsIKtW0jCcysdXWaNTdys2y3onAd3RWUcifY
         XxaMiTj0BU4aI7Amk43xzsJza4XoskiSVPwHL5eoIwezTjFAD695XRZiSY21Eb9UQNbt
         Kg2mieDx1TgT5zqno47G8yXt2wP1mOho35KguAHFbX+/ONpeZgSEqhe5ooWElmcXJI7e
         2KUHMC5c7wAXYxlzNzCLRw33AjuakTomkTD3S+gqV6LFjTAVYyseVhftgyLdP2sGdGLm
         eqdw==
X-Gm-Message-State: AOJu0YykoFfiYJcntk7sOLEPAp9u8uqLtluimSrglQfu31nu3Zib//t0
	lwErXASL89Wxq7VYzHXJGL2AmVs/vVUeWQylNIPSiZXzEhDvn0rh
X-Google-Smtp-Source: AGHT+IFux0vnAcGSigV2zamwXtg4bl0sAU+FnlK0V6Xxw8ZKPFwer90li5pVZLPDbgLC4VCq7hwykQ==
X-Received: by 2002:a17:902:ea02:b0:1d9:2369:d0f8 with SMTP id s2-20020a170902ea0200b001d92369d0f8mr206724plg.9.1707153642721;
        Mon, 05 Feb 2024 09:20:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW+4pcPDNpzBNw2iVMRZ7RtzGLMVV861ND21C1gOLQ9OKfpXU+VXgZXr9Eit972ikAKaNX4N28yaCXscWhRZo9KgUTsTztuw5GJK1vQSzv6rwf7PCBATiPIjC1homl0WEJtu8WDNYsl4XaOu6CtUw3TirF27PvyOXaeR92OBCznQgcvd3WdTrmm+OUvoLmMcF3OVTJ8s7NvArr9yM8D7zBwG9wHv0dGnnLitWIzpJ1tX/WVPJOxmSdpexTRNjpV6RGXsx657DbX/bOdg9nUKvHVZWim0VYOlXnZWsjU0FyUnAbjYkHIR5NMWxkthYZY4YZaV9uetBjIBQqTPqMOh/1+HsPcwySVfwf8pHk1KU7OP1mN3AHKXTlmwdwwsVcnU43ap6Fag123DpoJumMVLcMu9YQkx66BdOD0wG4J9ZQmEZ4xrZ3Z1GsMZvC30DU=
Received: from localhost.localdomain ([113.30.217.222])
        by smtp.gmail.com with ESMTPSA id iy15-20020a170903130f00b001d8f3c7fb96sm107518plb.166.2024.02.05.09.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 09:20:42 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCHv1 5/5] arm64: dts: amlogic: Add cache information to the Amlogic A7 SoC
Date: Mon,  5 Feb 2024 22:49:23 +0530
Message-ID: <20240205171930.968-6-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205171930.968-1-linux.amoon@gmail.com>
References: <20240205171930.968-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_092044_076339_CBB758A2 
X-CRM114-Status: GOOD (  10.95  )
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

As per A311D datasheet add missing cache information to the Amlogic A7 SoC.

- Each Cortex-A53 core has 32 KB of instruction cache and
	32 KB of L1 data cache available.
- Each Cortex-A73 core has 64 KB of L1 instruction cache and
	64 KB of L1 data cache available.
- The little (A53) cluster has 512 KB of unified L2 cache available.
- The big (A73) cluster has 1 MB of unified L2 cache available.

To improve system performance.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
[0] https://dl.khadas.com/products/vim4/datasheet/a311d2_quick_reference_manual_v0.6.pdf
[1] https://en.wikipedia.org/wiki/ARM_Cortex-A73
[2] https://en.wikipedia.org/wiki/ARM_Cortex-A53
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 74 +++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index a03c7667d2b6..72dedc40f460 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -52,6 +52,13 @@ cpu100: cpu@100 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x100>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu101: cpu@101{
@@ -59,6 +66,13 @@ cpu101: cpu@101{
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x101>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu102: cpu@102 {
@@ -66,6 +80,13 @@ cpu102: cpu@102 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x102>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu103: cpu@103 {
@@ -73,6 +94,13 @@ cpu103: cpu@103 {
 			compatible = "arm,cortex-a53";
 			reg = <0x0 0x103>;
 			enable-method = "psci";
+			d-cache-line-size = <32>;
+			d-cache-size = <0x8000>;
+			d-cache-sets = <32>;
+			i-cache-line-size = <32>;
+			i-cache-size = <0x8000>;
+			i-cache-sets = <32>;
+			next-level-cache = <&l2_cache_l>;
 		};
 
 		cpu0: cpu@0 {
@@ -80,6 +108,13 @@ cpu0: cpu@0 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x0>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu1: cpu@1 {
@@ -87,6 +122,13 @@ cpu1: cpu@1 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x1>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu2: cpu@2 {
@@ -94,6 +136,13 @@ cpu2: cpu@2 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x2>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
 		};
 
 		cpu3: cpu@3 {
@@ -101,6 +150,31 @@ cpu3: cpu@3 {
 			compatible = "arm,cortex-a73";
 			reg = <0x0 0x3>;
 			enable-method = "psci";
+			d-cache-line-size = <64>;
+			d-cache-size = <0x10000>;
+			d-cache-sets = <64>;
+			i-cache-line-size = <64>;
+			i-cache-size = <0x10000>;
+			i-cache-sets = <64>;
+			next-level-cache = <&l2_cache_b>;
+		};
+
+		l2_cache_l: l2-cache-cluster0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x80000>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+		};
+
+		l2_cache_b: l2-cache-cluster1 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-line-size = <64>;
+			cache-sets = <1024>;
 		};
 	};
 
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

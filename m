Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F57BC43387
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E17952054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:32:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OuPvUYGo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Bqj58vkK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E17952054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/owgTn1+1mlY1ieaGYOZ9X5SCHvz8MRtZ8fY6X0Q1g=; b=OuPvUYGoMR9rjK
	iYyQXrFI3psa+dw2boNfHhpZPdU5Ra+ET9vubYPjeztZJRE0u8ZQHWjmBTKi0M2QARKk9L23Yybhl
	bGsFnxT6J/4hsDDkKmH7E3alPr8PZZ3S7duVPBqgKx2J+hPlK4Kbynhhv0CB/KycstGS8mt05k177
	0+V+cUyJArOPOMnC0SBhdEUpOgIB3bYGfb2axsx7/xik3XOcaSuKV07iB3RmoIa2ePG34xJzB7a2V
	p7gLThcLzq3HEREEM6GNacMCMwswaEDhQdO9vOz/Wr7Y1ihu03zWgD0mu6WXlPrvTNPcZ+WJ4kcXA
	Lc66D4M70z4KaUZhawQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4xx-0000Wl-Ag; Thu, 17 Jan 2019 10:32:05 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4xt-0000U6-0y
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:32:02 +0000
Received: by mail-wr1-x442.google.com with SMTP id 96so10408348wrb.2
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=59lSFWiKXUet4YBV9ctjDOXoipeUSkvqSc4ERhu10Hk=;
 b=Bqj58vkKOyRYZCoMa5TrckC29HjEgfW6Ls+PRJ/0QM4b22jpGTvgdFOA2HS+Id4y3c
 C1shCH1rHGsIpweCdGhNZetg5vXVVh/3Zr8I9h8Xo3nVJFDh48k3LGZA0gX5gXLuv/sn
 B2piQrauOXroZ74Tq5FuzpCPNMv7mge0L1kauNPUU1iZjBVuuiYc0ltDoCNReSRcKeFo
 uCg9JMsSDIjAyTUxbOYaKlzr9RWdyJpS1OSXHc3yMRBXwhTaTnjdwO+Sg2C983QcXWk2
 FvHfNm98G/qmRnPQyR11XtRl3Cvsu0WoczXM0gT8wEQT5rsnax5C6cmEyVzC/Bnq0scg
 yANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=59lSFWiKXUet4YBV9ctjDOXoipeUSkvqSc4ERhu10Hk=;
 b=uIFBQsCs2vL0mpK0FzZcKeR1hcOgQmaqP3TZd7PsO2kDIMtXJcg3yKUXUgISeOzr/f
 Q0uYlqaP7rAGre5/90SfWlA2tEj5t9QYbHfKyw+lmhiV2m6PgX8P5/2EkRtEg6CFidzK
 tYMtSZUh5mYExbgtBPGall68c+ufAzeaVJWH0fqtPa1ATRqTocFOJRxX0neyWWJyTN2z
 z3dmUOWeKvMF9jZ2YxB0Dly6yqdVfFS9XI/IZC4mIoUKM6dlGuq1iUIiv69xg49kbpQ+
 bCFkZtvcrgVuCNWnxpCXEiqyCnJn6d8e9WsdHkbQOS5woDSfYNcwNMdwzvmEklf/ZJPR
 MprQ==
X-Gm-Message-State: AJcUukcoVkEN/YCSRUUt7o3R6RDgrx38IJ/Zl2Of26lIGbQbu6wkC4iO
 mP9KuwOl1lcvv/GZqSoQHd14wQ==
X-Google-Smtp-Source: ALg8bN7s5VbZn0Sj44pkmrn8b87kVUa+xpO0SLvjkz+eDt0L3Y83kMydB5RFWeXiNPPeVFe/8+FvNg==
X-Received: by 2002:adf:8143:: with SMTP id 61mr10995914wrm.47.1547721119612; 
 Thu, 17 Jan 2019 02:31:59 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 143sm77658107wml.14.2019.01.17.02.31.58
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:31:59 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 1/2] arm64: dts: meson: g12a: add pinctrl support controllers
Date: Thu, 17 Jan 2019 11:31:50 +0100
Message-Id: <20190117103151.3349-2-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117103151.3349-1-jbrunet@baylibre.com>
References: <20190117103151.3349-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_023201_064613_67FC299A 
X-CRM114-Status: UNSURE (   8.89  )
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
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org,
 patchwork-bot+notify@kernel.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the peripheral and always-on pinctrl controllers to the g12a soc.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi | 49 +++++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 2aea5ba62fee..39ad2bbaa162 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -84,6 +84,29 @@
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xff634400 0x0 0x400>;
+
+			periphs_pinctrl: pinctrl@40 {
+				compatible = "amlogic,meson-g12a-periphs-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio: bank@40 {
+					reg = <0x0 0x40  0x0 0x4c>,
+					      <0x0 0xe8  0x0 0x18>,
+					      <0x0 0x120 0x0 0x18>,
+					      <0x0 0x2c0 0x0 0x40>,
+					      <0x0 0x340 0x0 0x1c>;
+					reg-names = "gpio",
+						    "pull",
+						    "pull-enable",
+						    "mux",
+						    "ds";
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+
+			};
 		};
 
 		hiu: bus@ff63c000 {
@@ -94,6 +117,32 @@
 			ranges = <0x0 0x0 0x0 0xff63c000 0x0 0x1400>;
 		};
 
+		rti: bus@ff800000 {
+			compatible = "simple-bus";
+			reg = <0x0 0xff800000 0x0 0x1000>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges = <0x0 0x0 0x0 0xff800000 0x0 0x1000>;
+
+			ao_pinctrl: pinctrl@14 {
+				compatible = "amlogic,meson-g12a-aobus-pinctrl";
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges;
+
+				gpio_ao: bank@14 {
+					reg = <0x0 0x14 0x0 0x8>,
+					      <0x0 0x1c 0x0 0x8>,
+					      <0x0 0x24 0x0 0x14>;
+					reg-names = "mux",
+						    "ds",
+						    "gpio";
+					gpio-controller;
+					#gpio-cells = <2>;
+				};
+			};
+		};
+
 		uart_AO: serial@ff803000 {
 			compatible = "amlogic,meson-gx-uart",
 				     "amlogic,meson-ao-uart";
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

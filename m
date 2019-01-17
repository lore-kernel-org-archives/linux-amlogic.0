Return-Path: <SRS0=bSlY=PZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A17BDC43612
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8702054F
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Jan 2019 10:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FDpggOrp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="SY8UCb2S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8702054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJArfMYKyEI2uuRhTUN8r377JLZGLk9bIgKFTGrzjr0=; b=FDpggOrpVrlwci
	9pUmn+kZOqtc05p/e+nNTfDMGtFgRdJpAsqH4MiWQHIsXFGZ8xWyWkmNGGwcyRhF0SPU6dPoxczN8
	UcREWeBBo9Ue9CD/pwx1vbisgv9ezhgVJwp8ZPxf3ZUwbb2TNyaUGThGkvw1j3DuUlbtafx92uoLS
	iqwJvHkEv9cwRwpIGqvz141OmNaadycMVXehxzKpcpCQksFSVAkGJXzgs0t9QoihAG2+/7DwKjsIT
	CZFE7br9/5ZkdRLWEpFhZ5oQeZC1wmIWLtbuwIb5n8PrzBIxYNqHzXVVS1ZAd6xwC/U/noEdvwQVm
	7a7xgHyjwsEL7pYbK1AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gk4xz-0000YM-CP; Thu, 17 Jan 2019 10:32:07 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gk4xu-0000UV-KH
 for linux-amlogic@lists.infradead.org; Thu, 17 Jan 2019 10:32:04 +0000
Received: by mail-wr1-x441.google.com with SMTP id z5so10342566wrt.11
 for <linux-amlogic@lists.infradead.org>; Thu, 17 Jan 2019 02:32:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+aR/gi/5Y1MXmA3l33o5cCv3DhvJKA6RGHAmdL+89w=;
 b=SY8UCb2S0aaTYBSBMrVuMWUti2aRFjdJweUYsAczAg3S2YJp00MXuhAArZwOAZjBxd
 qft3/c49Rg2REcF/2R9S/TjNJTA5IfGfZqfB1ES3VWlREWlmgk0/7qtLrsNsTnKdnmJY
 g0+lczJRdclQGr6CJRcLx2lH6xIOyuHTsR4d8sn8QvZlBv1+mX+zRuXL3agPBvX1SuKR
 ZKZfKaHa5XDLr9/KqSoEN+PePn894BZV6z5cBBgc4PJPI3dXZ/vrrOqaTka+yjTBJzeT
 UgWpUG4NSqmMuyXMvNho7IXujzPlw6o+ACnBj3DAcb/9dkN7pxr5SdEOvby5qv+Tzyvr
 d2yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+aR/gi/5Y1MXmA3l33o5cCv3DhvJKA6RGHAmdL+89w=;
 b=WjHWnB6k+XNksL/FCipo+ofc8GRO523MkBIoHQUfFIMlYTLITK70g6U/Hz4peHg8Mr
 A25Iz+LrKdM2NlvYsSi9BX54pVmfvoPmcIrA5iNo5yEMyrUWkBzGEUD+Z7VnwdqKqK8v
 fkRspt3oSBMQ4usHAuGocCLMyEvdBMsrQFrV1ZHRFTtPc0fo7vvuw7ZBrd+VgQj4Rzod
 bgjha/d8N75sNjIP03jmJBWb8jDIHuWbzq2gh8Bfpit6pD/JsoitZNLGpJvjmses4FYc
 zH/5TDXqY/UQSn0/KGXB6KG/pJFdp+ZkAK+L8su7mtkswMkV5qn/fHzr10MAnedqJxMG
 xNMg==
X-Gm-Message-State: AJcUukeGUh+oQMBI29XmeUN2LSuECZvIhwrCUuPzGqxjNdfdXegXzR2N
 vbxchrQTnu+KmCuCO7BRyNKsmQ==
X-Google-Smtp-Source: ALg8bN4YkpBB3huWK8lh1EuyQGOrr2d5EI1/BmoKj3CHaog7uoztiS6ucApg5SKmsOqikCI0cSvs+A==
X-Received: by 2002:adf:e3d0:: with SMTP id k16mr11891258wrm.223.1547721120855; 
 Thu, 17 Jan 2019 02:32:00 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 143sm77658107wml.14.2019.01.17.02.31.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 17 Jan 2019 02:32:00 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 2/2] arm64: dts: meson: g12a: add uart_ao_a pinctrl
Date: Thu, 17 Jan 2019 11:31:51 +0100
Message-Id: <20190117103151.3349-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190117103151.3349-1-jbrunet@baylibre.com>
References: <20190117103151.3349-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190117_023202_880599_AF124C74 
X-CRM114-Status: UNSURE (   9.53  )
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

Add the always on UART pinctrl setting to the g12a soc DT and
use it for the u200 reference design

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-g12a-u200.dts |  2 ++
 arch/arm64/boot/dts/amlogic/meson-g12a.dtsi    | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index c44dbdddf2cf..f2afd0bf3e28 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -25,5 +25,7 @@
 
 &uart_AO {
 	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
 };
 
diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
index 39ad2bbaa162..bd24de947a5b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a.dtsi
@@ -140,6 +140,24 @@
 					gpio-controller;
 					#gpio-cells = <2>;
 				};
+
+				uart_ao_a_pins: uart_a_ao {
+					mux {
+						groups = "uart_ao_a_tx",
+							 "uart_ao_a_rx";
+						function = "uart_ao_a";
+						bias-disable;
+					};
+				};
+
+				uart_ao_a_cts_rts_pins: uart_ao_a_cts_rts {
+					mux {
+						groups = "uart_ao_a_cts",
+							 "uart_ao_a_rts";
+						function = "uart_ao_a";
+						bias-disable;
+					};
+				};
 			};
 		};
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

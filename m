Return-Path: <SRS0=4Wh7=NB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B23E0C4338F
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EE586054E
	for <linux-amlogic@archiver.kernel.org>; Tue, 10 Aug 2021 04:17:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EE586054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gpfm2KfvxYQX9456lbNWk0CnZWy5vclYyZcuTQh5FTs=; b=m9FiOxhpXG8CGf
	aNK56vN8XnZpAdY1nVb6MsuiNN9UqHSEvL3xRY/PcpCkd5F67xVT62uQJiH5BGaQn3+zEX+BBVTw6
	Tb+/Rlu/UZppQKJczj9WDTBzF8dYzBzTnv7xQ6mXy22XXkYzNQbDDDg94gHgQtv1KhktkXWoMTYGv
	B6PlSxpWlvYyzazKD+E3cYhZrShm7B9zcrA/Qjv/sf6f5LrHYSDTf7Wsoc/Mf2GDE6s6w4AQ0FRIo
	mZcuaAYkwUQyfFRkiss6qqyHAfOVjqMcUnabA64I/KWPOapXXDggILYZO6qWL80pD8/cE2pMcm94C
	zbL70XfRWe0rXKzgunSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDJCL-002NH2-G4; Tue, 10 Aug 2021 04:17:05 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDJC0-002NEQ-RK; Tue, 10 Aug 2021 04:16:46 +0000
Received: by mail-pl1-x634.google.com with SMTP id j3so19237488plx.4;
 Mon, 09 Aug 2021 21:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RiSNmAnyZus5dcVLvfEuPhPiZnZR0/AbgyI2eI5d9iM=;
 b=MSQIg5PW6zun2u0DBHggz1QzDX2mMk7hAht2dn4+T0k/KAIbBajPGhjcmeidbhc7Od
 ZzdzLKM4OUQ/6cRusIyVMbg1BTqmN8wSLLhS9JL6/BGjkQHJHL3uTw/WNHKdyxlFjzY8
 opB8z5C2gZw72wGVACB9A4TPEKsZYRKzIDp94xvLlUpB8FyVKuKWk1GFejq2+ohGmauM
 qS0VAzfGxSdmItBwHNFs9R+649Ncd816yX4H2+ArJDYlsoAIXE9cxszR7s5Wy8WCY2zi
 6lDzSFLxpcZzsWCT5SLLq0G9VwtDh09oXJn1cDgeBo5nc5pYaL6rtgHyZSUK4MEB2mLe
 jcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RiSNmAnyZus5dcVLvfEuPhPiZnZR0/AbgyI2eI5d9iM=;
 b=uJjlsFxsPAxjFuwtybNRjzc93bvNt76Zwp8LgZyUiHHzLTPs9tYywjmLTDqVhKejxZ
 AJMHEH+ebl1VjhPaTwOfikhDi10tgr8dy8IlEdnd1D5Qh6cDLUo2hfZj8IwkY4cwH4sA
 vXRCy6qpCwJIJNdODrLx4UhmGB5ItPiT4E5UIsr/WOJVzikzk5vsu9jVkyHOazo28cz3
 DvCunDhOmfQ4c+Z0PxV30kjGQk8xSe5q1g/oJ0CJJ2lIFSz55Kh57ace6DiDVXtsWD+B
 c0wAW9x6iSTSbrs5W846ODdSPfDK8hSbjbH0fkro30/+hoqRb2A3W4BL6LffRTq3LfnG
 bC1A==
X-Gm-Message-State: AOAM5339FElw/uOyiCACD3tijUHAKlF69+IasoakDediX69B+dtnhBts
 IiMdD0T/n+/ZZKBo+UUXaFw=
X-Google-Smtp-Source: ABdhPJwO2JBpaCbhFltHLY50YQJniRKPIQv51e4Ev+QeP17djuAbvRw65rOIXmBZk789A4PXLZeofQ==
X-Received: by 2002:a17:90a:5588:: with SMTP id
 c8mr2787556pji.36.1628569004240; 
 Mon, 09 Aug 2021 21:16:44 -0700 (PDT)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id g22sm12741647pfo.164.2021.08.09.21.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 21:16:44 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: jbrunet@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 christianshewitt@gmail.com, art@khadas.com, nick@khadas.com,
 gouwa@khadas.com
Subject: [PATCH 2/2] arm64: dts: meson: add spdif out to khadas-vim2
Date: Tue, 10 Aug 2021 12:16:30 +0800
Message-Id: <20210810041630.3673406-2-art@khadas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210810041630.3673406-1-art@khadas.com>
References: <20210810041630.3673406-1-art@khadas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_211644_928292_726BF1F8 
X-CRM114-Status: GOOD (  10.21  )
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

Add spdif output audio support to khadas-vim2

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 .../boot/dts/amlogic/meson-gxm-khadas-vim2.dts  | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index 18a4b7a6c5df..a129a827f6ee 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -146,6 +146,13 @@ wifi32k: wifi32k {
 		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
 	};
 
+	spdif_dit: audio-codec-0 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dit";
+		status = "okay";
+		sound-name-prefix = "DIT";
+	};
+
 	sound {
 		compatible = "amlogic,gx-sound-card";
 		model = "KHADAS-VIM2";
@@ -179,11 +186,21 @@ codec-0 {
 				sound-dai = <&hdmi_tx>;
 			};
 		};
+
+		dai-link-3 {
+			sound-dai = <&aiu AIU_CPU CPU_SPDIF_ENCODER>;
+
+			codec-0 {
+			sound-dai = <&spdif_dit>;
+			};
+		};
 	};
 };
 
 &aiu {
 	status = "okay";
+	pinctrl-0 = <&spdif_out_h_pins>;
+	pinctrl-names = "default";
 };
 
 &cec_AO {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=ZFy2=FH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 713F5C63777
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02D3820665
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Dec 2020 06:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 02D3820665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo/xVVfnq0AYfoiLs2SEBHScaGe/gzNvesM90EIT/ME=; b=aZ1nKXFQJOtEZwJuW0vZeyjGLj
	D8yX5TkqPqXYkjfsnFgxPHUjEYxcLEusGpO5UxivKcCsBrvVlwQXqsYtWsRo3q7Hvpp54KAsOMpYS
	njq5e0Mw/M53yc41rs+6UlJ5lppJyNS9tv6wIqUcPbdZuLzoGtdIWBBG6mF1LzTAK9rrHpGBHIzre
	4spvpwqUZ/YbC0999Wv0bBWxTiZJqmvHubycYPQiM2hSo0DLK/cOY9hKUdjB75aGtqScnjDOwTcWF
	BsmlXd+1A6wVmn+Jx8WNBSPGPLQb7jG1UekUQdKFoAnHcAfSS4wA83F1JSYYVCYurgDSJSj8uSExE
	jzJcaNbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkhfi-0008SP-Ow; Thu, 03 Dec 2020 06:00:54 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkhfP-0008Kl-Mz; Thu, 03 Dec 2020 06:00:36 +0000
Received: by mail-wm1-x341.google.com with SMTP id k10so1588043wmi.3;
 Wed, 02 Dec 2020 22:00:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=qiNlJdqxsbnz4NC0VDWGxLMRJ3AyXGB8P9pN0Z7BvMc=;
 b=YGxKo493V2KvNC4Fntbenbw8xLGA4Q3xktli4n6/Rx/bhhZmQd7KG18wMM7sd6mur3
 NDTp7OeKoyl0/tPuJ26oPgzGw0bAVm+JO4ekBF3n6Lr4IgWThv31tO0cF0MG90yoQBXy
 PPj0Cq9zM9xBH6SMRXjYYutc6P893/ST9oX31p4iRMyByE+yf/NdH/CEOM2Z6j2h+SJH
 +ze+lISI/hF2tDw6raVfApDG9Qh6t++5aeDl1JkGqMZDz+v+Amb5gdvI8zHAZyW/Bf2e
 uzZ5BM+awunwN5Yq43Nc65OSZb6LamHnde8EmOhVtBd2L7aZ/DKIU3XLJ8Sc2hzYWo+I
 z8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=qiNlJdqxsbnz4NC0VDWGxLMRJ3AyXGB8P9pN0Z7BvMc=;
 b=HyLfPXrXXQZLKDTT2+ZUNIjJT6hMwM5p+4OyAF+lBCkgfhcNUHp37xBD6I7qXOyjeL
 1B22q/Ikg/5hY47FGuheT5J+E/LBIQNgONbf0fXTXhlcNxTtXJ7AlyU8AkvWI17v6NXw
 zs2sDQBwWn5o6G2ul5t3VIBQ9Zxddt+5LkqbSVIPQgn06MrMEAskRGgpbNzNbr/8d5Hc
 8+bXsPce0HKASRKK1ZW65gZt4UangiaRPFuZXate8u3aPAXAoLeV46pmGn6+gS7jQTpq
 mHziVIFTVnDzBvAewWSte2klTnl2D5uih2yqeSPDeMa7WEJScF8CrT1rw+2vzCsj4Kn0
 yC9w==
X-Gm-Message-State: AOAM533WQTDNj1MgPP2wRaRCnoHVZk9kcCCNHqKWQQlJcFWnh7cq0Mut
 iJon7k0jGChtQbaUrfdIJ7U=
X-Google-Smtp-Source: ABdhPJzo0oIB2vo0mTvBTl9n+VEw61QX9ZG6RxT0SBPAFF9o8Jz2l2AvulMUhruFVEv55OYqb70RTA==
X-Received: by 2002:a1c:e445:: with SMTP id b66mr1367316wmh.187.1606975234407; 
 Wed, 02 Dec 2020 22:00:34 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id i11sm218439wro.85.2020.12.02.22.00.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:00:33 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] arm64: dts: meson: add audio playback to khadas-vim2
Date: Thu,  3 Dec 2020 06:00:19 +0000
Message-Id: <20201203060023.9454-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201203060023.9454-1-christianshewitt@gmail.com>
References: <20201203060023.9454-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_010035_809790_87BEF972 
X-CRM114-Status: GOOD (  13.43  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add initial audio support limited to HDMI i2s.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../dts/amlogic/meson-gxm-khadas-vim2.dts     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
index c5ee55caae0a..0250c98dbe9e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 
 #include "meson-gxm.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "khadas,vim2", "amlogic,s912", "amlogic,meson-gxm";
@@ -145,6 +146,45 @@
 		clock-frequency = <32768>;
 		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
 	};
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXM-KHADAS-VIM2";
+		assigned-clocks = <&clkc CLKID_MPLL0>,
+				  <&clkc CLKID_MPLL1>,
+				  <&clkc CLKID_MPLL2>;
+		assigned-clock-parents = <0>, <0>, <0>;
+		assigned-clock-rates = <294912000>,
+				       <270950400>,
+				       <393216000>;
+		status = "okay";
+
+		dai-link-0 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_FIFO>;
+		};
+
+		dai-link-1 {
+			sound-dai = <&aiu AIU_CPU CPU_I2S_ENCODER>;
+			dai-format = "i2s";
+			mclk-fs = <256>;
+
+			codec-0 {
+				sound-dai = <&aiu AIU_HDMI CTRL_I2S>;
+			};
+		};
+
+		dai-link-2 {
+			sound-dai = <&aiu AIU_HDMI CTRL_OUT>;
+
+			codec-0 {
+				sound-dai = <&hdmi_tx>;
+			};
+		};
+	};
+};
+
+&aiu {
+	status = "okay";
 };
 
 &cec_AO {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

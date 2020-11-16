Return-Path: <SRS0=sVtX=EW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72522C4742C
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E37EB20684
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Nov 2020 06:21:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kOHlJYr6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CSyeqbDM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E37EB20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PjICXT0jziLpg+UoF6nxWDTVYM+dw9tMrxNPojKbmCI=; b=kOHlJYr6FJwe4/mOSAiwSt98jx
	hNV30dL4oQnEKTMN+AyYQYVym8LduzzEfDU520PXyHTD2mX9POyTch3z/DGd14qnVhUW06MbCw0Iv
	sCyn8Hnw/FS7Z4dyreS7DE6O0jWVKItaybhd/TwRkZlpDvfjXN5uCUT+53y/TyqdTWrbfMdyPT3CD
	TG5R7dG1F3fQELL6HcstcjjGcUImZFljChEV7ODB6rn/Ctalyah85vaPrgqfLuh4mIgdCSUz0AzRg
	3aSLkrCOpl5MMzD+0rGLG+5b6TJbiqE123lQCZnXSpPWMoDaMpFw0x5/IUTlzJTlnCSiF/zPyaFTf
	Sy3h75tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keXtj-0001cU-0K; Mon, 16 Nov 2020 06:21:55 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keXsf-000189-2d; Mon, 16 Nov 2020 06:20:50 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u12so10157628wrt.0;
 Sun, 15 Nov 2020 22:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=+sbzGxZrB59pV6U+pYub8QGMoi1y6WlUsM0RAR+NpTo=;
 b=CSyeqbDMvdjKLX8MtLbreSDP02EDh+7Zm+zOmhScel2VP6cQwl95sF2y7Jblr7RzVf
 JmjhyoWj3YS8KND+fhd7LSWv8NilLxgCxhGp8VCMrDtwcPs89eSYQjEdGf/m75RgOa5E
 5mCzn+B26V+GwEqEtBEyAHU4QaRat5rkn2ZhFhQEiGxInbwd3WUeY6BctNNuh04K/602
 Wykf7t9k4HHphoEmZ6ywlhxKVpjYbfTi6oS5tW6rG+iPGVvItzVgzKLDJu3o+Hf3R2DP
 oX+kytguYUw2SiRe/5r1SxVjjz5d70HtGEIzMiAN1SmT7jzZvOWUgj4jcZwia6XDCieg
 aQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=+sbzGxZrB59pV6U+pYub8QGMoi1y6WlUsM0RAR+NpTo=;
 b=dbY7AJuq/3S1hDrms3nrEpCnUQjqu9dSvQk9222UIaaus4b5nHatza9fe7V40cUU5c
 WrO0c3wVSA2DDsGmXyv5TBYJEiIoKPzZCqB9yEs2fydq5QA5cLQGC2WEffWMOl1q17pk
 CchiLYSggvoyqgRhI+Hw/KV7gs/qBsYFavM8AELg8CPXVoyeFYECVnRnyLuTWe/JEiWW
 p7Xe1FEzCC6nPaboSMUo31m+nZq2AShe6BWMIfETj7yjFQaLzCDFJONGxP9M2oEFpTaA
 meVFyZNScH9904p9108kNyA7ArpzylooVXJ52quMa0ePeEgeuW+p8Xql9jaN8X1vg0an
 Kt3w==
X-Gm-Message-State: AOAM53257UNXC0lUTamQP2LBCq3UsAjJaSHN1VW+DqpyLTwsBh5ct1v4
 lSzaNSOf575gq6Ck5hrpZ5w=
X-Google-Smtp-Source: ABdhPJzmrLFU5dvMmXy7h5EUkBgwiGp4rm9nBBhE5RBvs2NeOPKorE9a+wIGzCM2EpS8YoQDOXrSeQ==
X-Received: by 2002:adf:a191:: with SMTP id u17mr2437524wru.421.1605507647994; 
 Sun, 15 Nov 2020 22:20:47 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m3sm17065985wrv.6.2020.11.15.22.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Nov 2020 22:20:47 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/7] arm64: dts: meson: add audio playback to wetek-hub
Date: Mon, 16 Nov 2020 06:20:30 +0000
Message-Id: <20201116062031.11233-7-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201116062031.11233-1-christianshewitt@gmail.com>
References: <20201116062031.11233-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_012049_192844_E9213702 
X-CRM114-Status: GOOD (  13.25  )
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
---
 .../boot/dts/amlogic/meson-gxbb-wetek-hub.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
index 83b985bb015e..0c1570153842 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts
@@ -7,10 +7,50 @@
 /dts-v1/;
 
 #include "meson-gxbb-wetek.dtsi"
+#include <dt-bindings/sound/meson-aiu.h>
 
 / {
 	compatible = "wetek,hub", "amlogic,meson-gxbb";
 	model = "WeTek Hub";
+
+	sound {
+		compatible = "amlogic,gx-sound-card";
+		model = "GXBB-WETEK-HUB";
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
 
 &ir {
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

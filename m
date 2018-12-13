Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1182EC65BAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D526220849
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 14:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X7xCW8mv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RUnwFh8t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D526220849
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6w6GPGs9v1J8lra+CneKngHdz0AonO7bgb9bCsdJL3o=; b=X7xCW8mvqOV3E/
	Q/tMJV8t8ZCYNuQI809zn1kI3pOo7ghIkEWw3RQMHatfVca+mlYu7iUX8Pl8cYKnTCKnp4UEUQ2Hn
	T83tEuvEH0Md93I14+kfWq4kGgWhwncEnwWcCZEfM1JD6wkRxgjzVbtWxgqm51Aded5pRgWtCSZ9q
	rCxjXqNEnmqwoXFQHxwT2itbc2mHILgLocMjLvkI6Jg3IKpnLub7sNsl4E3gGmW4W/y4PVHwWjTsF
	fVtlsnYrK2DKtV2Qft8i7qcRIF6Dq/rAeHd7kI/X3eCOI2eufh4yI3GnaFWC4YZGkeA2XHAbzxK+H
	ikWDVmjr7m4AwzbR9M8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXS6q-0000f7-5p; Thu, 13 Dec 2018 14:37:04 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXS6g-0000JS-E6
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 14:36:57 +0000
Received: by mail-wr1-x441.google.com with SMTP id z5so2235096wrt.11
 for <linux-amlogic@lists.infradead.org>; Thu, 13 Dec 2018 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m88udau/ikGQTftb3kkyEEVxwlYtl5cz4zTyGujJo8k=;
 b=RUnwFh8tQtIHv0gaQ9xRx+HkM9ckL/Zh3HAN0c5utLU5cezOpHiPPkiS/pK2qwLYY4
 +hLmVJoU3B33JpdRQ3Ohvwj1/tCBPgus8KjnVWyfYsW4G5rBCWxkX3LEmTZDZZABOCP9
 5yMRwtXaeavutUD7KQSCse1SE/YCkgrK99jGItZU9t9b7DLQheBfdAWldh+JVaB8hsHC
 OGMJPa1UyBgLiijjDpPBc64cKJ/fEVqQ/ZqQOTrBsaVt0cRUctB5r/u2THl4RDWRNcjx
 0N4Jo9GCMsoJ4mGbe3mB+D0kTunBWLKiurlGimsbouOdPbUA+TiR0aWKXGYA2q8wWv04
 OtvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m88udau/ikGQTftb3kkyEEVxwlYtl5cz4zTyGujJo8k=;
 b=qHx/Cb7j8JPQlveWk61COLzQyIwIEDg4HNjhoCMVEPCiIh00Yc6DKZMF+tE614aUTT
 SuJawfSal00HfRXynkBgEANKTmFpozF/ON3yrmRBxHMikVZHx0WdXG+2yvXE1l+dtvrU
 cx2rpgMhWEmHHcRjw5gG4fWy78D9/aDxE8xruEsqH7HhwTe86AkQK6ArJTwEHgVmQuBD
 cpKpPw13SyP7usqY7G6dgCWKVuT5uJumQzQ9JXFFrj47RMs0cnbnOPG/FZZP5oY0EUp1
 sYQr+VJOmL+dHy0Uy2sXRfdEo9RwWt0JD9YOq94wr5m3BoHA05TzYfbFCxUU1jzCzGdw
 h+AQ==
X-Gm-Message-State: AA+aEWZBjwngUzhdu8YZ5jvXQN8g49CuU5Du0HwWspcvyuSuFA1bm8k9
 sLSFBYBktlhaVOGfv77P/lDuNEolxDU=
X-Google-Smtp-Source: AFSGD/UabJYkWYrgD3gYyk95at84HwJGThzAIrfdZ0SO3fbEdfwFIIIyA/zirgiJCzC3H3OBNVbj7g==
X-Received: by 2002:adf:9422:: with SMTP id 31mr22766966wrq.106.1544711802495; 
 Thu, 13 Dec 2018 06:36:42 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id e12sm4929930wmf.22.2018.12.13.06.36.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 13 Dec 2018 06:36:41 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Subject: [PATCH 2/3] arm64: dts: meson-axg: s400: add spdif-dir codec
Date: Thu, 13 Dec 2018 15:36:30 +0100
Message-Id: <20181213143631.19218-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181213143631.19218-1-jbrunet@baylibre.com>
References: <20181213143631.19218-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_063654_471304_4F950B3D 
X-CRM114-Status: UNSURE (   8.46  )
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
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the SPDIF capture codec to the axg s400 board

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
index af2f2619bbc1..2f622a0b599a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-axg-s400.dts
@@ -95,6 +95,13 @@
 		sound-name-prefix = "MIC";
 	};
 
+	spdif_dir: audio-codec-4 {
+		#sound-dai-cells = <0>;
+		compatible = "linux,spdif-dir";
+		status = "okay";
+		sound-name-prefix = "DIR";
+	};
+
 	emmc_pwrseq: emmc-pwrseq {
 		compatible = "mmc-pwrseq-emmc";
 		reset-gpios = <&gpio BOOT_9 GPIO_ACTIVE_LOW>;
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

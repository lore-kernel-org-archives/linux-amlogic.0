Return-Path: <SRS0=Y5gA=R4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E63CC10F03
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:16:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DBDE20879
	for <linux-amlogic@archiver.kernel.org>; Mon, 25 Mar 2019 10:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TpxP/U4r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VTRPpUxs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DBDE20879
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqYcN9qpJLBjhbI2bULg34DwYNSznrzbaC2ripKRhEk=; b=TpxP/U4rUYpbSM
	nJdWQKGjN1tCZb3dGb31AZXgw6fGoGWqjvlrCzdYRZGyssAcd+hHypOwS7x+PuXy8HJHhBuhgpatT
	HYmq9kN6IyEMsSx/59ac92azV4LFwea0333K8ky3y8yzvb2t+IoskjZvqxEG9UG5ouhW8CVLlpCXw
	irLkVHENPCSedFYlhWpvoNRF8G0wIs3lYfuT5dcWyu639ON92qzRouYYxZQkjlj7rwaUjr/eCyVEX
	rGHwgOMDXn2Xgdqxp2vC4WxoSCL1tYeDZ37Q+Urt9NACjwhKyfi+BpyFK9M7Iilp4ksgWTnZjcNbY
	FO5HtTVZ+fdDXxP97OOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h8MeH-0003DD-R1; Mon, 25 Mar 2019 10:16:09 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h8MdF-0000me-Ua
 for linux-amlogic@lists.infradead.org; Mon, 25 Mar 2019 10:15:18 +0000
Received: by mail-wr1-x441.google.com with SMTP id w10so9400951wrm.4
 for <linux-amlogic@lists.infradead.org>; Mon, 25 Mar 2019 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEQc6Wg8CZcOFKxbK8s1T4WXh2s7N0+F2je28egpEkM=;
 b=VTRPpUxsdWXbvv7s+emAjTBvA/MqASJ8uvpD//UsmZrVF4PxfkW/Flq3+RtLo6M4Q5
 mA+18RfAY4Wq0AZW/5NQuAQjVSqpGenpGOwhByGggapCMKigQua+t+dE5G1J18yLbih4
 qEgO7KH00eq9d7xjbxqeU5oLR7YnByL2UqgWZ38CprGg+DIsBoWHzZf4di/GYI5wseku
 VDeaX6iRVxu+0Kf4mAuAVOkjzKEWgWyHNy305nrnJNsjDet4L1LYsKDQ7ImBmVOjdCLM
 Wt1VZnnjz/uNmbkD7VGZj/6ozwKiLiIR7LQFaZX7iUjPIBtt7YkvSxDY5ZYliu8ekvnZ
 apAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yEQc6Wg8CZcOFKxbK8s1T4WXh2s7N0+F2je28egpEkM=;
 b=jkDmwFK0TEFdzN9MDXOl4RJX/Abg2NJbdQmSsYR6dFkoRCVDxjE7EkqAbXg0GM8oHE
 pV5kiMcZLFMN1VC0oiMTxRgvJO9wLlnsJ9HXUDucQm/HeBQiD+XE6C1uuTJpa2quBETZ
 WM04Ex/aYnEgtZMg/5yExtE4XyzyDS0QWvRB55BCS489sOSpb2eo2aCw4/+In5V9slKP
 8kYuMaU9CH/i2MewgENATA4+fa2nBwV+8d4nIqo3ziH3niAiBP8gbY+jD7qVFhQZ1Ma9
 iqWFpsN0TEQEXG6epxW9d7QeAuYMsaHEiAPXV7yBEIwgO3+5W7Waq9MlhO2cXtV3xAPt
 BfBA==
X-Gm-Message-State: APjAAAUIQVADoYY7SRqk2f7eSrQoWNkgOfFLjUNDDFmss0a01gGO9ozA
 HsrdlR4tv+r4x8M3qpFj9BM4tA==
X-Google-Smtp-Source: APXvYqw+efCxqUDAf3UmoXIoYX8pvXaCy+7DXnJZURVRZ797iHI/qbzdgU+ufRqjODLA/Ddjc/AsOw==
X-Received: by 2002:a5d:4a87:: with SMTP id o7mr10621233wrq.306.1553508901246; 
 Mon, 25 Mar 2019 03:15:01 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id v14sm20049484wrr.20.2019.03.25.03.15.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Mar 2019 03:15:00 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH v3 5/6] arm64: dts: meson-g12a-u200: Enable USB
Date: Mon, 25 Mar 2019 11:14:52 +0100
Message-Id: <20190325101453.3009-6-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190325101453.3009-1-narmstrong@baylibre.com>
References: <20190325101453.3009-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190325_031506_141703_B142DDFC 
X-CRM114-Status: UNSURE (   8.90  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Enable the USB2 OTG and USB3 Host ports on the S905D2 Reference Design.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
index c69328d16333..2240e365af27 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts
@@ -108,3 +108,15 @@
 	pinctrl-names = "default";
 };
 
+&usb {
+	status = "okay";
+	vbus-supply = <&usb_pwr_en>;
+};
+
+&usb2_phy0 {
+	phy-supply = <&vcc_5v>;
+};
+
+&usb2_phy1 {
+	phy-supply = <&vcc_5v>;
+};
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

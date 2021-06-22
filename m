Return-Path: <SRS0=yQOf=LQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4EEC2B9F4
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 04:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 73CD261153
	for <linux-amlogic@archiver.kernel.org>; Tue, 22 Jun 2021 04:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 73CD261153
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wNknwpnvbDTSwKchhK0of2r6ShGULqjnv8qnWlVx0tA=; b=X0PFf9x+fjUHAV
	alvCp54Zb6UVzb8EWxBSi8JuiNUIV4eVmwmAqxGZz6UrFg49AhIk1gSCsta5R34oHZ0vMQwRf7xhw
	Y+dpantP/MNG/07qlsUNUAyw4VKbXi44ycZH9CnJVtUvR1a5KB7nN+zgVkOmE5cfQLOYQQzMNTx6W
	zFOjuulixOw3x2kGEy06cr5ZRW8hnEEIQGXN/8BX2uq3ItlJ17eCy5/bD+2vpAI4LxAjFO45ws83t
	ojXY+j2V64Dre++C5S2c5oeVX2XIJt2qc1MdmNEdNk7GTiKhl7XHUTdk4YiUqphMjZLoF7CRHEKhV
	bsMuZqL1ca0NG+63AIuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvYGX-005dbU-U3; Tue, 22 Jun 2021 04:44:01 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvYGL-005dZh-Dh; Tue, 22 Jun 2021 04:43:50 +0000
Received: by mail-pf1-x433.google.com with SMTP id g192so7767943pfb.6;
 Mon, 21 Jun 2021 21:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c6/Tm5shpqw/9OS5+/PUErLb83Yh9LzqaMHRoOepMhM=;
 b=J+NRlZnKzxJOmLmfXB5MYj8stHZsG87W4lKtFNjzvrU6veKVqX8ZDvu9OIvEg9qiB8
 legNgyX2G/i3yExo63yyypkJRpzonN1n8I+6PLrYt8MBsFBfhgKPsaLV86m4W05F2dkD
 ccklSEay4G7sRcvBRwm5pvn1r09g0mZ5MnDdQ6AoKOS+R1ZiI5s5LAUiWpfZsjtPYaYU
 VEBr9xNKaiWoBmf5Pi+pQsW5vRAYpTaKI1oCqAdimbBvSeOi1smZiD4kaNZCUncz+MdD
 OozH9PkadyqiXZenSpCqKqx2yi7wWEb98/NFSgZ3gsUquMNdOuZyZn7Z1rr/CwgcKEtf
 dkcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c6/Tm5shpqw/9OS5+/PUErLb83Yh9LzqaMHRoOepMhM=;
 b=N6L8oNbEIm2MJMCK03NQZ5iCsZfOPwMjJx3f03NZ9kMko/UpG2lbi4XaTW0ekqXtVP
 9U6YFCfNd9PdlcWhocJCUMTKQvj4ZccNGV0IJ1cnmlBmREvKooqgNNdYvuVLdfaxNqcG
 pe9Ms2Xu5VuRX8IircTcSMY6TI7xVLsCD1elgYZx5CR6r3NJyw4ZpEmplKpXwySPnDQW
 AUm5yYYnxBxJZnhfIcjPr5vJy2M/An/Qd3lCMfY6smzcD9XX4dTg5UJaQZ/jKoJ72dUs
 6HOpPOKfpl9t9wPwfJc+JD012pJn67PzYXrkGO5uFKMiMX/DrwqqnGnt33pHmvQV92T7
 UXfA==
X-Gm-Message-State: AOAM531MubHZ7SNXU9XRnkEIzDVQfTeNtGHdvkyQA8T8rogTZ655Kzot
 0H8nRfvO4ZEATeoTW4ywe5c=
X-Google-Smtp-Source: ABdhPJzm53iKSRmJ2/x99PM4SPNOkyqKGBe0icyCehyexTfDoHU3tyewXM+7y7bT5e8IbcGb5JpOeA==
X-Received: by 2002:a63:e04c:: with SMTP id n12mr1888835pgj.239.1624337026407; 
 Mon, 21 Jun 2021 21:43:46 -0700 (PDT)
Received: from localhost.localdomain (104.194.74.249.16clouds.com.
 [104.194.74.249])
 by smtp.gmail.com with ESMTPSA id v129sm8686909pfc.31.2021.06.21.21.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 21:43:45 -0700 (PDT)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Cc: khilman@baylibre.com, robh+dt@kernel.org, jbrunet@baylibre.com,
 christianshewitt@gmail.com, martin.blumenstingl@googlemail.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 art@khadas.com, nick@khadas.com, gouwa@khadas.com
Subject: [PATCH 1/2] arm64: dts: meson: improve gxl-s905x-khadas-vim wifi
Date: Tue, 22 Jun 2021 12:43:33 +0800
Message-Id: <20210622044334.769791-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_214349_505218_0651CA40 
X-CRM114-Status: UNSURE (   8.26  )
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

Improve gxl-s905x-khadas-vim wifi performance
* change freq from 60Mhz to 100Mhz

100Mhz works well same as in meson-khadas-vim3.dtsi

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index 60feac0179c0..6ab1cc125b96 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -218,6 +218,8 @@ &pwm_ef {
 };
 
 &sd_emmc_a {
+	max-frequency = <100000000>;
+
 	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F81C61D97
	for <linux-amlogic@archiver.kernel.org>; Mon, 30 Jan 2023 08:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qOXcmX5cDMkLmNJKxb71DsiCvknaYPU+ibffx0pDvw=; b=r6sKVnghZctrBF
	QjwM6dGtMbmFsBXb8EPbbtk1VbgizcGoBekQ8rG9ZS16/ttvUK8qskXdKAkRoLgpFn7doG3MIWtyU
	GArJD39wjMvxR/qDv+KrNO8wvtjMUeuywkoJtBGMFkwiHbKC5VZBuwDF9ZPW+ERsyidh6hcWzGflF
	sSX21s5IrQmsf3IBUxrYEk8qESD/HV/ufgGTSiRatKJMWdFDSQncSfkPxVgao6zsXQsdvJRAkWc5i
	xEsGAYm4Cvymz5gncT6oFu4diWH3bBIv3BbAzPXCGuCtgswwGx9noHLZVTxl2HXg7NkEeSlfAiQR6
	tgT/1PHNeZk9DKhHFfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPsE-002hpk-HM; Mon, 30 Jan 2023 08:50:46 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMPpj-002hFe-QV; Mon, 30 Jan 2023 08:48:13 +0000
Received: by mail-pl1-x633.google.com with SMTP id m2so5855068plg.4;
        Mon, 30 Jan 2023 00:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unCcttXWXEyPBVOHC739lbFOm1ITKrqNz2Z3vNi3kfs=;
        b=qwNhEVCCmT3XrxwFDJjMtFFSoDFcrvAYPFEqvwk5MgKlAP9PMilB2KgW1wj8Gl7d1x
         IzuJauKvyAmtgtOtWDqf57HjfOJSK9IqxGfD6mo9pyY2wsd0n+lcq+zOEFwRHlIgBgKO
         BrY4c3oYmxGbbSK4utppVDEe5NhzetNxJP0bhjqwwGV+Bfol/lWdNmRjUzBmr8YVM7jG
         0niAJa6HZqhT1yV47y2nyWorFHyICis9xRCZfplEyeigo8SD92NAHLfCCNPoy/4gMPj3
         iSo57wFeeqapd+97hnUpu44EYAi47GV4NofKVk+nk1Gt0DCnEjlDRImSVt4xR2CDPiwo
         8i7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=unCcttXWXEyPBVOHC739lbFOm1ITKrqNz2Z3vNi3kfs=;
        b=r6FtOv2yWtuhsAuQVwXhO3ml2avI/JNnP6pgXmGxhRSDFowIdkouh/lIAsfyJp6Uw/
         kkRuPneVkzSOKxSjgY939I2eXGRO+L5CNtcimjUxMV1NBxZScX5RY30IRBoB2BgK1HD0
         1FYSxt6S5ae7eAtD+HIoUNogyqzd/6ah6ta7P8WZIHS+4Xc5Ubr+EuudAAHZBylKqUV7
         w0OMidmbdHXOMRgU63+f+c8ewhRoQ0B7k64qA4PngTMEM+wJyD1KlVe6nVjXB03XMhZz
         Ib4jWuHhc8Ql0UzeuSRK0ftjb5zk2mOYpTrLJFHD42/jH03Pdicp8sQ8G/YTFCHThXrs
         gN3A==
X-Gm-Message-State: AO0yUKWfPY8kpthy16MVMIYxpwmhyce5iQKCK7WiSOLVvC0Oq1zara46
	DOgQLyT0+WDy1skyYUTFCPM=
X-Google-Smtp-Source: AK7set+uLpUD2RiNQ13tofZZTlyItEtiLxY5qwZAWwYSGHsseTy0MdHNDrrht3UCeksMMtrpxBNBKQ==
X-Received: by 2002:a17:902:e88e:b0:196:3a54:8b23 with SMTP id w14-20020a170902e88e00b001963a548b23mr18673132plg.10.1675068490816;
        Mon, 30 Jan 2023 00:48:10 -0800 (PST)
Received: from localhost.localdomain ([45.112.3.15])
        by smtp.gmail.com with ESMTPSA id ix1-20020a170902f80100b00192d9258512sm7205284plb.154.2023.01.30.00.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 00:48:10 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH linux-next v5 2/4] arm64: dts: amlogic: Drop superfluous dr_mode in usb node on odroid c2
Date: Mon, 30 Jan 2023 08:47:41 +0000
Message-Id: <20230130084744.2539-3-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230130084744.2539-1-linux.amoon@gmail.com>
References: <20230130084744.2539-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_004811_899406_1C15CF39 
X-CRM114-Status: GOOD (  11.70  )
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

Drop superfluous dr_mode="host" as it is the default in meson-gxbb.dtsi

Fixes: f24859bbec8a ("arm64: dts: amlogic: Used onboard usb hub reset on odroid c2")
Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
v5: none
v4: neww patch
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 01356437a077..70b10934a811 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -399,7 +399,6 @@ &usb0 {
 };
 
 &usb1 {
-	dr_mode = "host";
 	#address-cells = <1>;
 	#size-cells = <0>;
 	status = "okay";
-- 
2.38.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

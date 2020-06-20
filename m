Return-Path: <SRS0=BR63=AB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06F13C433E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:11:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B5FFF22B37
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Jun 2020 16:11:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BZP67CL/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="KP8Hu6H+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B5FFF22B37
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGaPZmi/XgTBI4AdGDWIRfMgfNo7AGct7D+Np/3nJb8=; b=BZP67CL/IYHGFY
	SF3bR23VWGMg+oGNHO/1CiCBdlu3OaN6A9BzNhk8xUIN/xdqI4CE6gw4Jg9MjzEHbZY1VmcjHKgIf
	Ci/EGlF/uIN1gE2hdo/nayDlk2AupNpnOPfT5aZYIU/gtODRBzEe8UjuQDWjoHlclckXuJery08Ze
	3kROD+8wCEMZP1aAuEF9gm2v5rUgyUCuIWU2SGS3YGGBL7vb+4nI/1fjZcisL4q5uR8yZEmknlfWF
	n/+/eYFxHas5i/m8GIyAVaVQzu+9GpJWpCC5ICQyW7UVv7s3D1VaAlMcdma+8/uKTBZd2do+fVl7O
	q/AYWz3DibHLqn171+RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jmg54-0008F9-TP; Sat, 20 Jun 2020 16:10:58 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jmg4U-0007jD-F3; Sat, 20 Jun 2020 16:10:24 +0000
Received: by mail-ej1-x643.google.com with SMTP id gl26so13539411ejb.11;
 Sat, 20 Jun 2020 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D5sGkeTgB7hG+3/+kop32buJfTUcIo0SVNUTekYvYHs=;
 b=KP8Hu6H+TKWt9icYwwel5BGCy7wG8KTCsCGoSAK+W9eUq7i/GXSA2q6DwPfwMedTUz
 11CcEr8qJFI1fGzQThuGQIBJgK4ZNsr2CQdeuSTpKZaQeeUQ0VSojBLOwvt+VTa8lN2h
 DTZdd72qL5C6hPcJo2AwwrZ7RnJRspjTDyJ7qGeiLh0P/1RlL+xNOSAQUVQQsCJUwl7D
 l44N4MyJWSzgMDJuJH+n3u4G654WojXsT1V52yZJzYzoyIbIRHtaAhuYMZLVCYn/CTwq
 2O2Cz+77lYvpywWEuQfF8IHn9jZGc4sIgY8J7IaCLRNmhzfInUQTCcwIfRqa91qucGWp
 kTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D5sGkeTgB7hG+3/+kop32buJfTUcIo0SVNUTekYvYHs=;
 b=JKoOoN2jRva38hIMkdYek+qsRw+Ht/L/yQ5XVFYbjfhvb3hcu2twddeZnkhQEnsevG
 199RFkuT1ew06Gi0b900znTavbFwdx1RAHAA9avDDf6awU34fIDj36mSFtKGWB/rOFek
 TNXdVd8nxZ+HhZ3G2zNzhHpgcepTTdDDJsI8Y2TPzN05R9uaPTWH3n6xkKIbd2MqI0nO
 6phkky8jYm9paJAcJTSbgoYxVMQuMUqfZuvFU9lBC/pY+zwAfeXMycLdfJlR/EcAbXci
 fc3thC2P9Xs+eo4XmWoam5rhK/30shgW58/XBj9NKsSeuAgGi45wqWtPVoeepmmtbFwI
 fFZQ==
X-Gm-Message-State: AOAM530B8kinhjBZbrK7Phr46OV1ICsnQn679Sa9pDQtujnLFXD6Jn33
 HmG8I3uMd7S6jq7WTTltvjWvlIpy
X-Google-Smtp-Source: ABdhPJx4CvOmAO/aNMwlgPaw9yw/l476jL1k+DulhYLM1sPPaPtnarcJAAVfirTfPa+5CcP3cHzYpA==
X-Received: by 2002:a17:906:f2d9:: with SMTP id
 gz25mr9045554ejb.467.1592669420963; 
 Sat, 20 Jun 2020 09:10:20 -0700 (PDT)
Received: from localhost.localdomain
 (p200300f1371df700428d5cfffeb99db8.dip0.t-ipconnect.de.
 [2003:f1:371d:f700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id a62sm8033207edf.38.2020.06.20.09.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jun 2020 09:10:20 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	khilman@baylibre.com
Subject: [PATCH 2/3] ARM: dts: meson8m2: add resets for the power domain
 controller
Date: Sat, 20 Jun 2020 18:10:09 +0200
Message-Id: <20200620161010.23171-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
References: <20200620161010.23171-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200620_091022_503595_1761DB53 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Meson8m2 SoCs has introduced additional reset lines for the VPU
compared to Meson8. Also it uses a slightly different VPU clock
frequency compared to Meson8 since it can now achieve 364MHz thanks to
the addition of the GP_PLL.
Add the reset lines, VPU clock configuration and update the compatible
string so the implementation differences can be managed.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 arch/arm/boot/dts/meson8m2.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/meson8m2.dtsi b/arch/arm/boot/dts/meson8m2.dtsi
index 2397ba06d608..c7ddbb210366 100644
--- a/arch/arm/boot/dts/meson8m2.dtsi
+++ b/arch/arm/boot/dts/meson8m2.dtsi
@@ -61,6 +61,25 @@ mux {
 	};
 };
 
+&pwrc {
+	compatible = "amlogic,meson8m2-pwrc";
+	resets = <&reset RESET_DBLK>,
+		 <&reset RESET_PIC_DC>,
+		 <&reset RESET_HDMI_APB>,
+		 <&reset RESET_HDMI_SYSTEM_RESET>,
+		 <&reset RESET_VENCI>,
+		 <&reset RESET_VENCP>,
+		 <&reset RESET_VDAC_4>,
+		 <&reset RESET_VENCL>,
+		 <&reset RESET_VIU>,
+		 <&reset RESET_VENC>,
+		 <&reset RESET_RDMA>;
+	reset-names = "dblk", "pic_dc", "hdmi_apb", "hdmi_system", "venci",
+		      "vencp", "vdac", "vencl", "viu", "venc", "rdma";
+	assigned-clocks = <&clkc CLKID_VPU>;
+	assigned-clock-rates = <364000000>;
+};
+
 &saradc {
 	compatible = "amlogic,meson8m2-saradc", "amlogic,meson-saradc";
 };
-- 
2.27.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

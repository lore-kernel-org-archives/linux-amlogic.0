Return-Path: <SRS0=l5NU=HA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AECEBC433E0
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 08:52:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48F1764DEB
	for <linux-amlogic@archiver.kernel.org>; Fri, 29 Jan 2021 08:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 48F1764DEB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0/dgVdmB/jqBUXr5KCfBoURdhuXTKieRSwJ+E/rQHKI=; b=Fe7YbMgwvbu8KaO7v2fzfmt5xu
	l4QsgVizVwxyRZ2vahY67No6f+mi8AE9iMAW8sHLs/m0LJq/PI1caRrOZMW8q8x23AIyRHw8J8FYG
	xHhhsuto+cDVFJEgLtlH3glt8WUAwQE9PTsvwyeLU3MRG3D1BEPnB9ChYcUzS6DREYLewBGezc28r
	PrWdWqxrBJGMp8VUCb2cALcKy8cZ3O9GsykGlBBHDKSHE6Kiq+dz4H9SBGkTcbEzqN4U6hrcoqN1L
	uhL//ivV+xa+eDZOB9RHwJIOf3lcZ1h28mvuw51VlMA1TD3bLPaCJjDSLZeOxTiU7wQwnLhEV97Dm
	ryqyUhzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PVR-0008TZ-Uk; Fri, 29 Jan 2021 08:51:53 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5PV0-0008Gs-AJ; Fri, 29 Jan 2021 08:51:27 +0000
Received: by mail-pg1-x52a.google.com with SMTP id t25so6219216pga.2;
 Fri, 29 Jan 2021 00:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/kMUCnPjMoG3F2dN655f7lulHpNgZHAPEAOhHDF/EE=;
 b=Z+de4S6EC4uXcX214Pq0xKnI+wm07B2pcACHJCZqX7ZW5q1fuBAevLEW3W+KCZgi3m
 1oaif22XsE9F6fpzHZGA826Uy/yeHY7/B7YfQque1T1NbvZfTi2QamDJJ+OCqa2uBpJW
 wajJ74tyNktAswFMmBGkn3dUV+mSV675kZtS4maJxh6IPFFEX9y0iLzV6yS79JMjKv14
 SIOvlk2PWTLD0qErCma+9GcSB/YmVAfzJrnEMkxUWNZNLnpsNGjmpRRi+dPqp22CA+xe
 60ydWpO+PDd4P8Kb2txZZMdwuiMjK5CA2dxApV7qETfe8uCK8u802bdUvv35zTPleKoK
 NS0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e/kMUCnPjMoG3F2dN655f7lulHpNgZHAPEAOhHDF/EE=;
 b=uQvzeQDraK8/DZYFVXEMY7Aai6PaPYMrkhq/xdLhXFOIWSjrEEl0g8H0wNQR8iY42w
 GI99ABcCL73LIEhnxsZCMGdRu/iCmcfIA/iKshPyEB5bdO99iU9gWMAVPUSZZE3Tv1lJ
 Mr/0f8lwSuG2XL5g32jZyrjOcr876fHyTVSADzEF2fJYpPxEMP0WwxPwqlnFmOhlMQip
 pbyfDGV7r9UkqGoYIKdvV/YVnaU+6G+NywXojpkr3jc+jh7+vzsAi+W1cCzntJcltMTr
 0IFZlpryfo0Uv/qYnb3v8XTibYyQ6jH7EZWGwz7KOv1GBWcqu9ZjTfq6nwVXgtADeZyk
 at+g==
X-Gm-Message-State: AOAM533Ah+BAPLhpuPGKdfDTEoHAiiPE1UCuYDwmrmAYlc2WGpcbniyN
 TuBfxHC67e6SKKyE0jf+hQA=
X-Google-Smtp-Source: ABdhPJw7mGqr7BLwQa1nGHesD5YBTD5oQn67bBH4gcas6VZ9gOXPt+DoD30rhd7rZ0zLGqY4qdcCBg==
X-Received: by 2002:a63:fa0b:: with SMTP id y11mr3789812pgh.35.1611910282281; 
 Fri, 29 Jan 2021 00:51:22 -0800 (PST)
Received: from localhost.localdomain (199.19.111.227.16clouds.com.
 [199.19.111.227])
 by smtp.gmail.com with ESMTPSA id i132sm8432931pfe.10.2021.01.29.00.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 00:51:21 -0800 (PST)
From: Artem Lapkin <email2tema@gmail.com>
X-Google-Original-From: Artem Lapkin <art@khadas.com>
To: narmstrong@baylibre.com
Subject: [PATCH] arm64: dts: meson: fix broken wifi node for Khadas VIM3L
Date: Fri, 29 Jan 2021 16:50:40 +0800
Message-Id: <20210129085041.1408540-1-art@khadas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_035126_430453_3714E7EC 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: devicetree@vger.kernel.org, gouwa@khadas.com,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 christianshewitt@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 nick@khadas.com, linux-amlogic@lists.infradead.org, art@khadas.com,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

move &sd_emmc_a ... from /* */ commented area, because cant load wifi fw
without sd-uhs-sdr50 option on VIM3L

[   11.686590] brcmfmac: brcmf_chip_cores_check: CPU core not detected
[   11.696382] brcmfmac: brcmf_sdio_probe_attach: brcmf_chip_attach failed!
[   11.706240] brcmfmac: brcmf_sdio_probe: brcmf_sdio_probe_attach failed
[   11.715890] brcmfmac: brcmf_ops_sdio_probe: F2 error, probe failed -19...
[   13.718424] brcmfmac: brcmf_chip_recognition: chip backplane type 15 is not supported

Signed-off-by: Artem Lapkin <art@khadas.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
index 4b517ca72..29c785cf5 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-khadas-vim3l.dts
@@ -89,13 +89,13 @@ &pcie {
 	status = "okay";
 };
 
-&sd_emmc_a {
-	sd-uhs-sdr50;
-};
-
 &usb {
 	phys = <&usb2_phy0>, <&usb2_phy1>;
 	phy-names = "usb2-phy0", "usb2-phy1";
 };
  */
 
+&sd_emmc_a {
+	sd-uhs-sdr50;
+};
+
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

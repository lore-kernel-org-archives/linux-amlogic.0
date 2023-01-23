Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9A14C05027
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 06:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rmwDO4RMDLEnDblh7i0qVKjS7ENBApeO5Gnn12h+R/0=; b=l40MwbKE0sRdNr
	6SQLfNfMHu8sMoIFTdlmCAm3daqUM3by1f0auR0v8M0PR3/JbCts0gsIVWVuwILY9Qv0J9w3eaySW
	rNWeVB705xAZKuuhc8ZXA0lmfuTWT0N4qXI+T2zfb2UbzrBk9toTpEUUxc6h5CmvDp8OWX5HHpU1i
	0GHBzzd60n7sJcxB3UL59cRRL6lUDuQidxqi0rMQRUj/BJido3rcjXr/oGCosFX2Cz/FQ8N4i7b0a
	LzCVDo0lsvMPYR4CO0xgKnJwIkRad6nHfmPrbZDq/jQYmY1sq7FLeVdoVEBeeRmeqoZCe50Li9WPf
	L1/z48umD+34TGP82PsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqk2-00G7pZ-59; Mon, 23 Jan 2023 06:55:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqjb-00G7gM-W7; Mon, 23 Jan 2023 06:55:17 +0000
Received: by mail-wr1-x435.google.com with SMTP id q5so5150210wrv.0;
        Sun, 22 Jan 2023 22:55:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2GVWHT8LMHCj7WTIetB8Hze7sdYKVKxQsoEuu2SrhJE=;
        b=XYLWS3YFEemtqCVqYvM+uFf+TWff8nPVApRa7jMz/b/taJLSCSVYCHPr5muYSsjEer
         yAX+Po4PAqBqDPGE4EeE0oIFRLz49C/sILJE2fUo5TEc57fRZt9qRgGUebHthw1rHD7g
         CA2cepQCzWVemGn6gkj5duDYJyslnjuU0m/2Ga0NnG966D5mkKAV1aJ00x7+Ob1mi2qZ
         kmIzIR25q3usNIRY0XRD8n/D9/XvXUWTTWt0EQ62XS2jjRSBPpNFKqpuXnvVFUsM4fKN
         jV8OHEJn6Z8YSGE+qTuFYtQPYGHd6FEnBzuXmjfL5CphB7i9dHQ2Fu4THz6hklSapUC5
         ft9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2GVWHT8LMHCj7WTIetB8Hze7sdYKVKxQsoEuu2SrhJE=;
        b=FbFdBEY2mtzG6ob0h/dOcXBHKfzOSRyMWF8pR5QzYGwpSXuoFmaKgX9K7rxIQdN6NP
         BKrEKkcuCWUsrKmL0HnLK70UfN5JyWOYzzNR4eZNcNQ19AMj4y20Il6Y8z0eE1XW2Wqt
         wdGd5BAlhSEd75b4sH76G41oWH06dgIrd3DTpslSjOK65ioaIMkzrqPbhWiHpKWh/HUD
         XESlFMA7oeVzqLrJ8wOpZnwDt8X/iCG1e5SiEaLFFk0kdr21b/TT43wzs9l8EI6c+cYG
         mTVkT70FwHHPp72zpKpEFn+gFDfM/bUNbw0BLHzRwXEyWJUsVpKcn0fgN8/zGq2y9AOc
         PU7Q==
X-Gm-Message-State: AFqh2krH7Uh7hO87cx7WvJ8KONy+U5kwqgETAXLyYr+4Gf5u2Hyd5xSK
	yg1f+shi4IhiL+B6n22op34=
X-Google-Smtp-Source: AMrXdXt4pawslOEzxLqt8MDlQM4SuQ81Y2SJGvh8/1Fha6HZzFFYlcbi2z8s0Nn/a8ickF4mkNbOhw==
X-Received: by 2002:a5d:6702:0:b0:2bd:e009:79cc with SMTP id o2-20020a5d6702000000b002bde00979ccmr27714202wru.53.1674456914067;
        Sun, 22 Jan 2023 22:55:14 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id az22-20020adfe196000000b002bddaea7a0bsm25948365wrb.57.2023.01.22.22.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:55:13 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: meson: move pwm_ef node in P212 dtsi
Date: Mon, 23 Jan 2023 06:55:03 +0000
Message-Id: <20230123065504.2669769-3-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123065504.2669769-1-christianshewitt@gmail.com>
References: <20230123065504.2669769-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_225516_093993_7066F279 
X-CRM114-Status: GOOD (  10.06  )
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

Cosmetic-only change to alpha-sort the pwm_ef node.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../boot/dts/amlogic/meson-gxl-s905x-p212.dtsi   | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 7055057d7942..a150cc0e18ff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -97,6 +97,14 @@ &ir {
 	pinctrl-names = "default";
 };
 
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins>;
+	pinctrl-names = "default";
+	clocks = <&clkc CLKID_FCLK_DIV4>;
+	clock-names = "clkin0";
+};
+
 &saradc {
 	status = "okay";
 	vref-supply = <&vddio_ao18>;
@@ -170,14 +178,6 @@ &sd_emmc_c {
 	vqmmc-supply = <&vddio_boot>;
 };
 
-&pwm_ef {
-	status = "okay";
-	pinctrl-0 = <&pwm_e_pins>;
-	pinctrl-names = "default";
-	clocks = <&clkc CLKID_FCLK_DIV4>;
-	clock-names = "clkin0";
-};
-
 /* This is connected to the Bluetooth module: */
 &uart_A {
 	status = "okay";
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

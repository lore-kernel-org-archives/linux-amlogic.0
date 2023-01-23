Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83BEC38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 06:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rg+Ln/AZZMAlB58YuhVtLB/pVs8bf+tf6ILUgS1aHiY=; b=hjz/UolESG1Lg1
	zN4PtDcdn8mdpgKh5lCENmo6D2tN92YMb18Va11fCT9D0eJOt9du+PNNEcSIl2Q942HDrlQl7lExH
	h7nYnMj+djUAfbmIUkl5NxaeXrggb/vRuTA4TpepqH1HvfwsoWnl6W/k8/0T/VsIMCjM/Q6EBgqZx
	w2VixZ3mfJEhwpfVY0ubRnXanU+3w9NCIfiqWjUw8RW2+ooBd7rDJ8bJ/md2ihvxP2ILyojI/hzkz
	J8cyi2yd82bjwTzVGqOvK1DOzf1zEaymTd3bEa2hqaXvpk5cUkJv2ruhEWudY31978p5uMJ8ZdBXz
	zEqfXni4P9suV3lTvfOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqjr-00G7lR-Rg; Mon, 23 Jan 2023 06:55:31 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqja-00G7fZ-0y; Mon, 23 Jan 2023 06:55:15 +0000
Received: by mail-wr1-x429.google.com with SMTP id y1so5308238wru.2;
        Sun, 22 Jan 2023 22:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LugQgmyfqJAZM5MfDwY/veKinnwsgbPTEKVFTK+HiPA=;
        b=hfnH8EWTZxl/73vw/86Qzx02JPFf/H9VA4qPbkFVVCxMaKkrnld8AgUnT/Q71LGo+8
         pJwoDDxA/chFkenXnlg2+iv6Of3oqA+vvC85iLnQl24JDALfPmddCIoT/pvDZCmba42e
         aLg0qsV0d/ZcDIzN1caw/7h5OhoZ+J/5900q5WIz9qjhFB/V+3m433Y/C+KeEVXVXfB2
         906RjPZzqT52pA+U95AVEzBXinmEl60QMpJSSTIm0etYag8/HNtvGTUUKcp5+iZRvVGK
         PX2CY6VlxOz6YYPwm+NYD5shLB8q5+170gE38J/O3b9uacxt3zwIVhJsPI9QcqEGPIsO
         5azA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LugQgmyfqJAZM5MfDwY/veKinnwsgbPTEKVFTK+HiPA=;
        b=00n/ILNHzEl+th9eP9w1dTMZMmnCEHOr5Nk205Lui0XoN10yEj8lvj5L5Tdy1N7BFW
         gwgmqL2xFp3KRjZf2bpMEINkB1GBnUUxDlN+/P0QJ4prwhv4uhkv2osRUpp6uTzD5Y8I
         849W3Vflc3OukPNTjc/PiBp8M+4zrchcSxeAvdVXq2CcKwx5bw8BjQPihNZMn22PlfpL
         7cXQ2RpShcaUaeTYUwts/CocQsYja2vyWZbBKfWsIC3SCpnNldJHUCtTNQZn9Lq1tryP
         RKgHyGn3wVTImRxhki+SxgfXf0FERFLwH2wf1VmgDbKmK5sW+z8uzjIBP+u9amG45dBC
         hpIg==
X-Gm-Message-State: AFqh2kr/lekFoSw3RteimDYPH6Tnm1FskgPY+n51km3Ywct1mq3lpHpO
	xFToXlvM5qkmv56k6C1DGMk=
X-Google-Smtp-Source: AMrXdXvIp8ELatgU7oKdVRfUKO7qM5zVf4fqydlUFyU9ZXRmcrvc7eR8SpDf/crtuX1Xonz1xqKjaQ==
X-Received: by 2002:a5d:5608:0:b0:2b6:daf8:52ad with SMTP id l8-20020a5d5608000000b002b6daf852admr14347847wrv.52.1674456911675;
        Sun, 22 Jan 2023 22:55:11 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id az22-20020adfe196000000b002bddaea7a0bsm25948365wrb.57.2023.01.22.22.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:55:11 -0800 (PST)
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
Subject: [PATCH 1/3] arm64: dts: meson: add Broadcom WiFi to P212 dtsi
Date: Mon, 23 Jan 2023 06:55:02 +0000
Message-Id: <20230123065504.2669769-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123065504.2669769-1-christianshewitt@gmail.com>
References: <20230123065504.2669769-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_225514_105876_A7D8D76F 
X-CRM114-Status: UNSURE (   8.94  )
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

The P212 has a combined WiFi/BT module. The BT side is already enabled
in the dtsi but the WiFi side is not. Let's enable the WiFi module.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
index 05cb2f5e5c36..7055057d7942 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dtsi
@@ -125,6 +125,11 @@ &sd_emmc_a {
 
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
+
+	brcmf: wifi@1 {
+		reg = <1>;
+		compatible = "brcm,bcm4329-fmac";
+	};
 };
 
 /* SD card */
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

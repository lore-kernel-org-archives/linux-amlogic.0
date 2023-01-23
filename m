Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5AAAC38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 06:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haS+nBV1pwTMf3ELUNU9ZcNBI0AanaNsh+hsjW/HhSE=; b=ne3ZPrJpEQuY0N
	X9iRtc/hHNDxTabDG6JD9dk0eEb5AJONBZ7NxQ6co7w3YdSGm0SsRvaHc2tVBz4eTg0+z/LAav3v0
	l1WZvBpQOjmO1fY9ICv4H/3hWsldHWliSCaUScVwS9Fw/aZytimgnAh66gYn7lt6sN0Py6OlUmeKJ
	IzlHR81NmlVKphmSV1O9W53I8nw/HnmTeMPaBoBMEV1HxBgXX5tDH1vj+RNniK6aamIdq1Nk4Q8ed
	FakDixmdP90BZglrNuVG/pAlRDVz2hXXceOkBeo8NlGmLSzbv2ro5xPR870VtMAs05PAgeTKUokFZ
	6dxqvsjKxVMBEyScpvqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqkE-00G7xM-QX; Mon, 23 Jan 2023 06:55:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJqje-00G7hH-NA; Mon, 23 Jan 2023 06:55:20 +0000
Received: by mail-wr1-x42f.google.com with SMTP id r2so9797281wrv.7;
        Sun, 22 Jan 2023 22:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3OYHf6uBdRg2Pv0Tc1k0a2GUSIrlYLxSnMEevum5bpY=;
        b=KGpeEul2xiba3v1KsjCN8fEMjddcL2wnjP4/BtjA3jfdyeBt10wnp3ntC1kLE8Pxo1
         pI+R/Gl49zXS/ULo6Ell/He88LvhBbXjs1uViXCx8ul+XcyZqRVEYjz592at9ufWB2W6
         VUpKR7pDTkwr5wdj7kimOft3mfu9WugNfdvjM0QNZ6IGZE4TAuG92RCCh0QMrUuLVv3t
         Ztj9A1OkzS3sTNXa6yXUe8lsyIBWbvPqsbMnTY0ucPFg44jA11AMax6Z679wMP4j4v8s
         8rrTN6/RsAQX3YVMRPl6aKBUz6cjdHV00x4gD2b80+ZtMdToHwjXxD/xv9pGgSD5xbhJ
         wGag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3OYHf6uBdRg2Pv0Tc1k0a2GUSIrlYLxSnMEevum5bpY=;
        b=Dtx/shP4zXSfi5YNFGWuBnM+7XgZTjGK5gTsAkoAKZfFwXMZEZLjJ7JJHUqNdNpXJ0
         uaY4imYNa9C3h0G41EiX2RWN2z4h2E1cztE6dgddtJ69B+Aag817jcSQnbL9m8WoM2u3
         aJu9pDrF7tyFjoQ+Gy9Zcy83353NLJnu9yQ0/ZvoT/q5T2m8RBWsWGuvdm0ZSyIJlRGP
         V5K/+n6QPtUAl76cicztmWBDYN2KRDri5zzXUjdoQMnD1Po6BEz7ajeDe7SIT+ZS9/iL
         I4GKk8KG2rkZORTE2RXMHxwdJ4g6cEFIqTRxNOJ8Omg2aeJJnIpLh6ByzJdzXZ0HwCdh
         QgXQ==
X-Gm-Message-State: AFqh2kraEx6LXULLWfjwnk0WfYbunS+byoqv3T2qKV3TMZHof/NlTbpK
	wJ2pJ2QhPfK/Q1LCE/XYX50OkNY1C1XULg==
X-Google-Smtp-Source: AMrXdXsvxNmWMyKXfXak1lyV5JX7ANjEeRxt2fZqd75eEp91UqyI/xjA5bU7YPFAtl3LpapusGTfCw==
X-Received: by 2002:a5d:6e8b:0:b0:2bd:d9b5:8191 with SMTP id k11-20020a5d6e8b000000b002bdd9b58191mr20903324wrz.61.1674456916457;
        Sun, 22 Jan 2023 22:55:16 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id az22-20020adfe196000000b002bddaea7a0bsm25948365wrb.57.2023.01.22.22.55.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 22:55:16 -0800 (PST)
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
Subject: [PATCH 3/3] arm64: dts: meson: remove WiFi/BT nodes from Khadas VIM1
Date: Mon, 23 Jan 2023 06:55:04 +0000
Message-Id: <20230123065504.2669769-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123065504.2669769-1-christianshewitt@gmail.com>
References: <20230123065504.2669769-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_225518_809304_8563C230 
X-CRM114-Status: UNSURE (   8.91  )
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

The Broadcom WiFi/BT SDIO nodes are now inherited from the P212 common dtsi
so we can remove them from the VIM1 board dts.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../dts/amlogic/meson-gxl-s905x-khadas-vim.dts    | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
index bee51e29015b..2f88f78de5b7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts
@@ -220,21 +220,6 @@ &pwm_ef {
 
 &sd_emmc_a {
 	max-frequency = <100000000>;
-
-	brcmf: wifi@1 {
-		reg = <1>;
-		compatible = "brcm,bcm4329-fmac";
-	};
-};
-
-&uart_A {
-	bluetooth {
-		compatible = "brcm,bcm43438-bt";
-		shutdown-gpios = <&gpio GPIOX_17 GPIO_ACTIVE_HIGH>;
-		max-speed = <2000000>;
-		clocks = <&wifi32k>;
-		clock-names = "lpo";
-	};
 };
 
 /* This is brought out on the Linux_RX (18) and Linux_TX (19) pins: */
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

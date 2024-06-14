Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA0E4C27C6E
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jun 2024 09:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAYWLeYhD6fDOS8wM/c8Y4R2wpKzfbFafXYYQGQjJ/s=; b=QyMEii6fFAie3/
	6Evwk6D7pMfImNXPRf3nLq+Dk2x92UqlaoKsauGFsjUVqHrF2qehue6SYTKx89dpUqZ/Ko6aujScH
	KA5jJyrJqYpQM1rLO9DrHdE2jNCtu+wiNxDfklb/HlCIM9zf0ikY5EGAf7Zpk7piXHXmSLbsTFgCb
	ezH0ZpBrG0vQ2IechQQugT82ThK18fHNR6PndxbVGZRHdIGoIhaSfjidEIkpdumTvW3cDEnBXqSEb
	AVOBwTvlb0UfUgNUrNKcMa207bl0fTm9jVYV3NExuZPITStcJ3P8wwb2xfC8QiNnXeDjLH0/4dtAh
	tq5PDoJjQiMRL749B1aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3Wj-00000002FgP-1Bfy;
	Fri, 14 Jun 2024 09:47:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3W9-00000002F9c-3D6U
	for linux-amlogic@bombadil.infradead.org;
	Fri, 14 Jun 2024 09:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5rccL2DhMpg13ts9Hqjm/6zzy9zUKGOuodol16mwTeU=; b=aEKRkeXGMhFT1I3uwwUysHsmmV
	pPtGNFKpI0IYVpoQOEEgbHgQsJYj9PKrOkg6aG9m/dLK4BuLJxBJm9uOtQGaPo1o8Ye1ENryoGv2R
	9ZtF5aHZM9ZOOdXfArcMJgHOArwT+/34bFKCwh3n+W20bi/8Ut3q9jiUn6qs53+G+LkCHionUneKG
	6ApbEfJ5OPCuX+f1Psq+Mg2RJ7jOhrTSp3ohRgSx9v+8KDVTWR1DSaKSl5EXVYqIROgJW2MO+lE3q
	+wxeznQs/QMOFHJKHAFZFBAAZpsw+A08cn8fH672/mMUNbOmV/nnjTB+gF9/GAmraAy+JIV0FsLGK
	GkpPwv4Q==;
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3W1-00000004F1B-1TkR
	for linux-amlogic@lists.infradead.org;
	Fri, 14 Jun 2024 09:46:44 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-57a31d63b6bso2596642a12.0
        for <linux-amlogic@lists.infradead.org>; Fri, 14 Jun 2024 02:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718358395; x=1718963195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5rccL2DhMpg13ts9Hqjm/6zzy9zUKGOuodol16mwTeU=;
        b=MA2F1tt8K6iv3Cagm0lbkqYIHbJi4GkhBpCM4ZH68wLJVKj7uomjHh5mqlZ9nU8pWD
         DPUsn/dY6DL84wK86AimFxZjC3n2IpMELJ6OzDIrUFD0Uslju60XX5SBPOC+3RiNgtCP
         nCg1XeH78Kt5Wlj8KpXSrMlt8kBLrzKlOnRapilaSYYOCjZAa+t440RXBs84COGV8ozQ
         twL9qulQ5L0qUgsNQ+w6JqO0lT/UODojUPJ1xPS83kx+3CDKs7VQxNFDoJtpl/iyf8Lx
         orSBALZxxATp5fKZjugxzoH5s2iEovg4in8b9WPBnvs/clGRVgSKItzOJJxeVVM9SZgY
         13Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358395; x=1718963195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rccL2DhMpg13ts9Hqjm/6zzy9zUKGOuodol16mwTeU=;
        b=xBU/FsscJ8m4m62XasdnNc4sDzgRYaG7UPpXs6BCuLUOq34gUOPanb6vB/LXIhX80F
         ouAvaKcPSGT/zbqVHegb/Iue30+lafglhec5pPy5W5Xf+m+fr68HC54a94PcTHiTiqqm
         T7PezUDMHIZpQeIxqKAbHVgr/EM7ZP5qcx3EF5O3kvx0bUMwrX0acPvS24K4dhAwSj+5
         6r7gNrdnZ/YmiAqjXKC9Yu1UboieozYWKTa2z/BYUNMVnXnhQ/8nnjwf9vUAQq7zA56o
         uVq8GFPbPGI0piJ5fG8HygqbyET2KAPKqvw1rZZAfNIttX3+o/zzlzOpyVxQeZIRw0cY
         BMcA==
X-Forwarded-Encrypted: i=1; AJvYcCWfd2t4z0RPG4gfHQYc6HLzwn8U3RZbiqDxLEBNh5wGDzCe9q72J80QvZWoinm8zsQYlf1Hoo7+M2tJ5oI0RWsL+3Gk/AKNA6moyu40mUNny7Y=
X-Gm-Message-State: AOJu0Yztox4JJzVbis8hpyRDeHRCIZT34einCPyQEbY1xaUBUfc93Shm
	7bsTwFPD85mzgqbeD3nKVy6vc3Y92KWlqXNRz3RoF2NytS5845VV1s0eRMS5odU=
X-Google-Smtp-Source: AGHT+IEIIi7f/khX+DL0ElnKeXbkTkqu3Do2h2qNKYCQfUhMKe+WvRGDBSKEB/3Hlft5tLx5w1488Q==
X-Received: by 2002:a17:906:ecb8:b0:a6e:fb9b:6769 with SMTP id a640c23a62f3a-a6f60de5fd6mr154292066b.75.1718358395585;
        Fri, 14 Jun 2024 02:46:35 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.206.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56f9c84csm164966366b.222.2024.06.14.02.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 02:46:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 14 Jun 2024 11:46:01 +0200
Subject: [PATCH 02/22] dt-bindings: thermal: amlogic: reference
 thermal-sensor schema
MIME-Version: 1.0
Message-Id: <20240614-dt-bindings-thermal-allof-v1-2-30b25a6ae24e@linaro.org>
References: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
In-Reply-To: <20240614-dt-bindings-thermal-allof-v1-0-30b25a6ae24e@linaro.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Guillaume La Roque <glaroque@baylibre.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Vasily Khoruzhick <anarsoul@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Anson Huang <Anson.Huang@nxp.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Amit Kucheria <amitk@kernel.org>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Heiko Stuebner <heiko@sntech.de>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Pascal Paillet <p.paillet@foss.st.com>, Keerthy <j-keerthy@ti.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, 
 zhanghongchen <zhanghongchen@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev, 
 linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Florian Fainelli <f.fainelli@gmail.com>, 
 linux-rpi-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1065;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=OL1bThiSTDRnxDnX7dUSElkuAerpOnM4wbDcCD9Dzlo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbBFhz93LdRptZhTU1GW4iGarOwOO5EBiFYLFd
 wFDJHK7K/qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZmwRYQAKCRDBN2bmhouD
 18s9D/9LP9unfX0MSkgXF8TFjscV8gcBK408X/8oxDWBhIrJxkLZCwMssuTlysHZ2OYfyKJHsGx
 G6Y1+icUV6gklZsPxjJ03/jABHwNj3xRb9AQPOwWQ62xpX/+zxQNNaEcW6AKyNmY90EgCBRRrwx
 +zhCuMur8Gg6isM+gl3qHVZsMSALb5gwAMQDe3KP7A2Sno1hJw+giAAb3KI6FtfvevD2XtkMgab
 x1xdWHM5YlOGmNi6acFw/2dtzcokVRiNbkNGuBpupXWq+vZL0n0mPr26qRUOIGhKqt/t5xQsemZ
 L+Mr4ASMWruC2cyuxRkPN6WXiOqU2PWSej9kVH8O1xuNjE4e/PQHH91KA761ii2PhPs/7y+OwqF
 pctdv1ol8AqI0F3yHRz/o1pCSJ8swPRC9vEXoLIwXfRYvwqouz1kVDofMzUcA302kDb5yZk+EgG
 9KCfyKlubN63juUO4jfkwe2WzfAcEXpi7GKMv5Gky8SLAPPRYoGewIbSvc/Zog++OvMxg+kMDGp
 +C9mjIWV+rrT6bt6c5KjBkE/42bqZ5THaEoLUfgzGuhP/PUHKyI5JxC3F+owxWNpfB7kDtFeA3z
 Yk0Am2y1AAsjqTGzDLnMJpNuFIZZoghdpcYJXcGJPZk+cauVsVa4n9fxRsSpvMdZFo6Fl7Qrb8i
 h+5fgjivCVGsZIw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_104637_762402_75F0E03D 
X-CRM114-Status: GOOD (  10.15  )
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

Device is a thermal sensor and all in-tree DTS provide
'#thermal-sensor-cells', so reference the thermal-sensor.yaml to
simplify it, bring the common definition of '#thermal-sensor-cells'
property and require it.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
index 01fccdfc4178..e52fc40e215d 100644
--- a/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
+++ b/Documentation/devicetree/bindings/thermal/amlogic,thermal.yaml
@@ -11,6 +11,8 @@ maintainers:
 
 description: Binding for Amlogic Thermal
 
+$ref: thermal-sensor.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -44,7 +46,7 @@ required:
   - clocks
   - amlogic,ao-secure
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |

-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

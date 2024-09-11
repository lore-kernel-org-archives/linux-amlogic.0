Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA4FEE498E
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EsadhGOtaB2ix4L6g6EgJaOSbrlhG1xotPQ6Z+t5lVc=; b=ZeDCoEOnNvp9MG
	OJEeLoWuS4m4x8VRyiNYuaAmckYsCCnZM4Dj8cB9q3QBk0ZqzCALTb0EEucub1EWIosMo83f25O8V
	zIOYAWAAV0vKs4te6whDLvDwP5+034J9jGnVZs+NsFlxkL0euANF8bf+WKWLbzRhn0YrOmT5ksE7c
	7uRKlygQz7YX53Bt5TvxkGjADllIpucb1ux4bvVAY+ndc2Wdsp3aTg9z8Ts59xJtY+8gmAhXcZEOZ
	T3vkVO/gXeSIhUFjwEWQqVWNxrBstFVy2z6/YHysZJLGjGeT7Ft6imEYicMOeSAXQJmmzlAGC1/N2
	U0wKf7A0VuuwEQl8u38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKWD-000000094dZ-1exB;
	Wed, 11 Sep 2024 10:24:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS3-000000093Jv-4050
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:57 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-42cb60aff1eso32967665e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049994; x=1726654794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dtVXEEyIECSDN6VChW7COEyWFA2mGv3xOzKg/F3A7CE=;
        b=oTTOp9XahtZ2TwnFs3290/dm2djE9jKVB1YwdQuffvfzGZU5iD2OW8Mijq0OwH5UBo
         DIQG2IVBJRXl/zv4uT4c+qp1MHGglrNrdd6a4w8nBSYhDx+hRmkNwbmB1VcOuPXJ0D8l
         iKoa9WJ5Yf8ATfNPNyn15QO5TD0CGfPvUiMch49oyyCkA1qQSqQafv8rIKSDqx4Fv222
         yZqiu7sc92tJJMw96lfizFV8sLyqOWh+Yv28BD+1H0qzDt/y53zI4e43tUziyjvGRfGN
         BCSxbkHXdfGz1daZ2a07QkbnjdE+aJl9QerqSJ81TSFQMZNojwwh8aT0Nkygb5kbjDgY
         xUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049994; x=1726654794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtVXEEyIECSDN6VChW7COEyWFA2mGv3xOzKg/F3A7CE=;
        b=HHimKFC/8N9zdkhlFoKYn+4Ouajvyx1/7TKMFWddcbl5Fk1SEGxpaz9Iry5eHkpdh0
         LmmyqCHky9ZN+Jh/j+q/6EOeL57XVTwX1qD2bCcBi4pMqupnlETTfFOyUrzuzcPyePSm
         okNk978RD5kCeSnS69vKCtYHorWg1QjFj/qy2x7F0i2xwwt3Gl9PCoQwKxaWq3ezs1Uc
         kB3pYmggUWlnAZF3CGwo6A+ZuDJo23/ccKf6jfRb94Znu7X6L4NTlZY+KMYPkHxwifMz
         0Hg+C8Fmtpy9oJJW5tAyQzADNRe+kB/h7e/2+JhhNZtH+RyruUFXnLsK2hSNVhBX0KFI
         JbHA==
X-Forwarded-Encrypted: i=1; AJvYcCUnjea8z/5a2QZ3vg2wNF5w2Kx48YIHc9kF0cDvrDYypTnZHsgr8QlYgKmmKkN38i26WACHT+OMMgx/bGzu@lists.infradead.org
X-Gm-Message-State: AOJu0YwJsjWXZw5gJWwoWA000ZdNVGTBEtpLfao8/JD7pBW6/3nbvdAk
	GmbH5t7SWww53MoR7ukPg2a2y5JXUwc2TBS3DC/ycFIKpuz1s76R34i8kow3vWw=
X-Google-Smtp-Source: AGHT+IF60qGdNf7PJkX5FDe/IGRRPdd8lxrMmNtxnSMaOHABQ4KsCRSSsI5n2gss620PjPeGmffV0A==
X-Received: by 2002:a05:600c:3ca1:b0:42b:8a35:1acf with SMTP id 5b1f17b1804b1-42c9f9ca788mr139816475e9.25.1726049993598;
        Wed, 11 Sep 2024 03:19:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:53 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 12:19:43 +0200
Subject: [PATCH 4/7] ARM: dts: amlogic: meson6: delete undocumented nodes
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-4-feaabb45916b@linaro.org>
References: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
In-Reply-To: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-0-feaabb45916b@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3135;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=RWmk6OF5GEw/0+RQqnhJttyJm2tPM7O3ljEKjPu2GbM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7Dm+JGWmHBTBU05K0c+ptKNT/q7A4vBnGP1Il/
 iWFkHYmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuwwAKCRB33NvayMhJ0Z6CEA
 DAO+OKkQLeCMKNxQ2jKTnoaUlwJxj4gPDCVD+aS0Z4iMz0llhoDdd5wVyA/ahuQ+Q6l7PVH+SVK9kN
 ZJBzQdyZ0/wjNi6xALoBqG8SSVBByh8Fmj2AAJlwJK9/mU33bdZCl2ImobLgFqH4Pd8LlwneHD14yp
 PadZ6jRpu+/HO51okQq7FGZU+54haBJrZ5QsJtW9rRs8MX63v9JAnugpRWmF2jbIU7KIJ8C7EjbJkD
 LeVzoCpzPwoMFFh2AWEtiN12l+NGa+fggOcxv7FcNat0misjiwOq0vwU3KOlxJLM3GuTX2J5/AjFar
 ctQtPpuOxfxF5XT2XVVx2pu7AEO0ZPx5YZxorOhPQObL1wUccHrwjnouwZrcIC2JlBF9Uy1sw0fdmT
 jBvlLTfhH8Lv/yYFwH48faaVa4S6nufkKdl5oeI3IQCjaS7VbaOYOhKQ/SVCmaqxfTAkBJwmAg2hkN
 lzpr8O+4HreLrOfpcURtHgDNtkjXU2bgYbojjKjftZMZjMhUmM6L1CfknZ3BY3eqzCx+URjgnuaKNk
 IiNaUuhMszICSiKbmSHycbdUqUM6CUv66OSILGJqwRnKlepIjx+QvRUvzZbMstkeBhu3qbbImQRGBD
 g6bhl+k0bi+GjwFlz1nella/mJ5wHU1ur+t2sU8dxoMtklS7jn7DUC6tWF3Q==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031956_178324_CF27ABCC 
X-CRM114-Status: UNSURE (   8.71  )
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

Delete nodes in meson6.dtsi that are clearly undocumented & unused for meson6,
fixing the following check errors:
audio-controller@5400: compatible:0: 'amlogic,aiu' is not one of ['amlogic,aiu-gxbb', 'amlogic,aiu-gxl', 'amlogic,aiu-meson8', 'amlogic,aiu-meson8b']
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
audio-controller@5400: compatible: ['amlogic,aiu'] is too short
	from schema $id: http://devicetree.org/schemas/sound/amlogic,aiu.yaml#
/soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-pwm']
/soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-pwm']
phy@8800: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,meson-mx-usb2-phy'] is too short
	'amlogic,meson-mx-usb2-phy' is not one of ['amlogic,meson8-usb2-phy', 'amlogic,meson8b-usb2-phy', 'amlogic,meson8m2-usb2-phy']
	'amlogic,meson-gxbb-usb2-phy' was expected
	from schema $id: http://devicetree.org/schemas/phy/amlogic,meson8b-usb2-phy.yaml#
phy@8820: compatible: 'oneOf' conditional failed, one must be fixed:
	['amlogic,meson-mx-usb2-phy'] is too short
	'amlogic,meson-mx-usb2-phy' is not one of ['amlogic,meson8-usb2-phy', 'amlogic,meson8b-usb2-phy', 'amlogic,meson8m2-usb2-phy']
	'amlogic,meson-gxbb-usb2-phy' was expected
	from schema $id: http://devicetree.org/schemas/phy/amlogic,meson8b-usb2-phy.yaml#
/soc/bus@c1100000/mmc@8c20: failed to match any schema with compatible: ['amlogic,meson-mx-sdio']
mmc@8e00: compatible:0: 'amlogic,meson-mx-sdhc' is not one of ['amlogic,meson8-sdhc', 'amlogic,meson8b-sdhc', 'amlogic,meson8m2-sdhc']
	from schema $id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdhc.yaml#
mmc@8e00: compatible: ['amlogic,meson-mx-sdhc'] is too short
	from schema $id: http://devicetree.org/schemas/mmc/amlogic,meson-mx-sdhc.yaml#
remoteproc@1c: compatible:0: 'amlogic,meson-mx-ao-arc' is not one of ['amlogic,meson8-ao-arc', 'amlogic,meson8b-ao-arc']
	from schema $id: http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#
remoteproc@1c: compatible: ['amlogic,meson-mx-ao-arc'] is too short
	from schema $id: http://devicetree.org/schemas/remoteproc/amlogic,meson-mx-ao-arc.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson6.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm/boot/dts/amlogic/meson6.dtsi b/arch/arm/boot/dts/amlogic/meson6.dtsi
index 1c4ea7266f66..8952c086d069 100644
--- a/arch/arm/boot/dts/amlogic/meson6.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson6.dtsi
@@ -43,6 +43,10 @@ clk81: clk81 {
 	};
 }; /* end of / */
 
+/delete-node/ &aiu;
+
+/delete-node/ &ao_arc_rproc;
+
 &efuse {
 	status = "disabled";
 };
@@ -71,3 +75,15 @@ &uart_C {
 	clocks = <&xtal>, <&clk81>, <&clk81>;
 	clock-names = "xtal", "pclk", "baud";
 };
+
+/delete-node/ &pwm_ab;
+/delete-node/ &pwm_cd;
+
+/delete-node/ &sdhc;
+/delete-node/ &sdio;
+
+/delete-node/ &usb0;
+/delete-node/ &usb1;
+
+/delete-node/ &usb0_phy;
+/delete-node/ &usb1_phy;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

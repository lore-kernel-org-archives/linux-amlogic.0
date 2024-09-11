Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3299AEE498D
	for <linux-amlogic@archiver.kernel.org>; Wed, 11 Sep 2024 10:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVse8Gwt1uQIvbqDwyihjY3FMpsASYGZCFP4QuyplE0=; b=QjQPNMoB0gX6tV
	qL/IX+aIaXSViYAc5UveWOzge5UPH8aOwjsyIpAuylou0yZqoAiaD8WufYB87rmuPBK9OaovZR7O1
	/Tw39mm9UzMp7e235Br3++jp/62fIBee1AMYvPoafJHrzw21efajborZ7/c0CvDdTN50HBm8svKgu
	g4rNUZdue5eAxOWyqzN8vaHZUTjMqpMGBi8jpvy2XuS1x0pkISSce+dvVGeDbUlFBwEn3YmA0O6lh
	sxDSnAwDxAC9ZK8Wcnr97DnL+STCFLomsDMPsC7NNScPcaZfse4bIdfvG0p2t9QetJy6Llh3Yt9Yy
	iJoBdNBpVvuoDrN4frHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKYG-0000000957Z-1zPp;
	Wed, 11 Sep 2024 10:26:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKS4-000000093Kz-3thE
	for linux-amlogic@lists.infradead.org;
	Wed, 11 Sep 2024 10:19:58 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-42ca6ba750eso4586255e9.0
        for <linux-amlogic@lists.infradead.org>; Wed, 11 Sep 2024 03:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726049995; x=1726654795; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I4ke8rkrISZcsL/GsnQciTxTsopL6efg198qUqAz96I=;
        b=sTnAS7ZSAu/X7ydhOzXKmE15ep+TV8v2+oYxzoTG8EM4lFrVqYS13Kscgw0TkXnWJV
         wPMbIZ5nwa/Wg1CTnjDjYhcwOQ1fZpZW9iQphsHkm0GDdLIWaP9D/iAUdmsa2y26m3mt
         8HWt909BXvAtNA4HMjw47X9WtQbMEu9WzM+vMIuU2gfAdxzgvLJedrxnXDSFyQMHY5bj
         MRCsoOB2QTlu0/DmR2Z21IZkjCrlOJn6gWHmQ+nH4bozEamphsJv8qHyaVNY4DQH3Iva
         HwKD3TWGgEPwRyXNilghE+mC3SpfEY0yEplo7oHVZrmk6an7CV5AcdGeH3dskYgou0HF
         Aa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726049995; x=1726654795;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I4ke8rkrISZcsL/GsnQciTxTsopL6efg198qUqAz96I=;
        b=UOBDSC49yRqkxD0fXv2zSyMk9sliujPcuCM6JRh2ljL/i9N6IoyLWZtC2zEDDqWqip
         JkNOEIADhzIhA9ghRtvceSnpP9WtG5015LOsKBo4YK0xs0mkk+r+og686tI1SX+Rjgdz
         G6xg/KiH832bgKYIE0tpxYNDUQlqsaCw3mC91XK31KGW2LhxmaHMvgRExslGq24s1Q6E
         ISRqHhjBf1Q1doCP6Du2rmx0CkA4cJb1i4QyoXJwia85GdeqloaroDcZQklLegsm9Irz
         +yaOIx8qfxVxpvtamE8OtvlXIrLKH15TqdP/CaJYcCVWOpTpQ01mJibc2Gr0D8IUuWbL
         gQCA==
X-Forwarded-Encrypted: i=1; AJvYcCWXeARSv2yIp6W36M4AZVmXoei7gSembNOdoPGTaL08GHmaWvL/KPXBhLD6ZkAeHCDcmjJXC9BqQ5yUm2xh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Wi6BHG9AnbLqZ0bWf5Ev30qLxbMwBlE0F2xCA5Rq8Mkoqi6c
	Vb6CLf9cesNhxQrZ0M/UUX8yAmNlBFYy1wxpLIj0D08e6uhpsP0f9RSeoC87jy4=
X-Google-Smtp-Source: AGHT+IFwsA8iLp/sFV2OBictAm3MkFC0wZfIoLwMq7XoNBBk5IByMVVOBBM329hmDHR8Rm5CMkJABg==
X-Received: by 2002:a05:600c:4fc8:b0:42c:bd4d:e8d6 with SMTP id 5b1f17b1804b1-42cbddbd72bmr35576715e9.3.1726049995406;
        Wed, 11 Sep 2024 03:19:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42caeb21a4esm139349125e9.7.2024.09.11.03.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:19:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 11 Sep 2024 12:19:45 +0200
Subject: [PATCH 6/7] ARM: dts: amlogic: fix /memory node name
MIME-Version: 1.0
Message-Id: <20240911-topic-amlogic-arm32-upstream-bindings-fixes-v1-6-feaabb45916b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3199;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=tLKXgebT2prz5WEl6ND2fV5WeoNygwXgxZNKBU22Vj4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm4W7En5FeYn59+5T3iP9cHUsF61r2nWZ5EStooK1M
 Yn8owziJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZuFuxAAKCRB33NvayMhJ0SYKEA
 C4JDopIv/Ye8pDuBtnr5uOAmhmEQZXfqHpIMch5ntuyVd2pQhCPu4kPUdWMhcqNoBBIKb40vPKXL/h
 6p2cjGb580acYM75rmFdyjU++o7rxjMUGsAw3ZKB7/4LRPouYpGlIyzs59B3PX35gzp2QT8gu49FqL
 yBCzHXPTJEkdsCLf0uYTZh2/FKNYUfrJdqHILDuQ5ZVhPHIrX8WTPprckcQ4rk1qHf4oVjhUrnjMqc
 p4Vb66alwwCKcb1I8SiXQgFn+lTZQkGYyzpDEdOTR/wN+zbXI9AiiNmXCMYLen0LDhFOIlnTOfwmfS
 DlnVLpdxNYgWH5rUx3mXUbN8avbnSNKxPAgaQ0aj2/LO+ZKBRLiQQQalQWa7Ekf9Dq+qtWtC8/K4vT
 Br5hoqaybflyg/1lLVM9TEhCmpqQwj+IVsTXQoqFeboJQsNbgqHwrDWOQwwRXc+vDiggkDhMpeD3G9
 3FsGmbkvK0zCDKmUhJxYDaKoG1iK4lw1unjuA5jsnVUe2YlKGmadF+ubTz3uttX76bgdJrpI/BTrUu
 +pVqOY+vitfNSBRCpklczW+5NhV8TaACqpS5zawdl20ijao1cpaiipXXcawkz20b3xvINPrTmCC5r4
 b1OOGCFGvEDGE37yv1EquQ9SoXCKhx4m9sVRbVkU4F9j7EhHxm8NqmVFq8Yg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_031957_131776_F6F9F6A9 
X-CRM114-Status: UNSURE (   9.93  )
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

Use proper address in /memory node name, fixing:
/: memory: False schema does not allow {'device_type': ['memory'], 'reg': [[1073741824, 2147483648]]}

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson6-atv1200.dts      | 2 +-
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts       | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts         | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts    | 2 +-
 arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts | 2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson6-atv1200.dts b/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
index 98e1c94c0261..f3529e5b0f13 100644
--- a/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
+++ b/arch/arm/boot/dts/amlogic/meson6-atv1200.dts
@@ -18,7 +18,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
index c6d1c5a8a3bf..e7f5d290c1b8 100644
--- a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 49890eb12781..bf5e80c874a7 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
index 7adedd3258c3..f48748a02409 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 962bbe3337db..85dae08afe9e 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
index aa4d4bf70629..587bbe706fd1 100644
--- a/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
@@ -26,7 +26,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@0 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

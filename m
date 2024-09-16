Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09DCC3ABB2
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrsX3gpCYfR0ZuMMH3+DorbVUuG4OjfjXYkXJDzbhrU=; b=AoYbTYYMDe18/W
	qdCq9g2aumfG4TkpDeEjwR28pIWkk2uKiUQIBYHKOSLxKvAtEkJ9nyWVHVgTTNk++lBGler4fqqwO
	pt0uHhfb3bk521Y/pW5tayDTKymbeqxt0n2HZtwmJveonRyTrLGjaoj9GZwm/JCn9WuK/bGjg8jwb
	u9WiZZY3eQtUXIPzfm4eYWq85Bt/9O0aghGhNUD0Zz4oGKtQQlAn8TVd3ej8/7QTGi9taqQX5gJn5
	ieKXtVeKJVc6Rnkiu+tIB8LzGgnR0/8rCYkhUn6IVHEri/OuVYX2LTp/MQ03nBaHVJ/feIb2kLCnL
	3npnIWD6QUab082YzsUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6uP-00000003P4v-3SmJ;
	Mon, 16 Sep 2024 08:16:33 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6mw-00000003NEM-0F4i
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:52 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-42cbc38a997so26130105e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474128; x=1727078928; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gyrG/39yIquvbCmBYVx9eiuBKuujGgooJBfHN3TrPfQ=;
        b=UkRNGtBXPD2r8jVFUfCFuQKY/RCY/j5skORKoMdUl7RZpRcg0sz+2ejVbW0MD1xy88
         aXFPSI2LzMmlxb6RkcQXlr7C46vzyPtQt81fXd3v7rPf4ckGMr0KS2DwsiDqKbFd/Xcb
         FvAdsdMOsFWH11Qs0UgbXx3RBupycxhOkkjlBmxzZNEbC2KEPiUtxBVdUxIMIOfzHC4E
         G8ToYvSHlw5vY47qhanSSGkBe3Dr2+NsBcTU7FfQ7Y2Q1lNvNEtShBqsobQt8HBQtkuk
         QK9zuQxi9Y94apfNU1vKDozPQ9525NOwE7ojPlRQdpStVjJokVGASKqu4xz2wPHugkar
         /67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474128; x=1727078928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gyrG/39yIquvbCmBYVx9eiuBKuujGgooJBfHN3TrPfQ=;
        b=nR2F8Rys4e7UwVmbLlLxW/EvD4Oj08K0KjSVwSWqawyqNsYWMdRUOjJEmQ4pi1/TaM
         dwNP3Jfwthzx+/B3talNLpPYA9+e6rWAZp4Js6Acr8Gj1qHOWJgufJFYU/+ep2pWZ/Jq
         FveMR/PzbfGD1h9/+OuFU2T/eeb//7Ej8+KUjintQGYc3f4B73OM1Gq3d3ELyVRzVgqZ
         QfQChmtvBpkdz8KptyHIt2RxLXrHTMq/n4vkdkY0yxZv8eVSWc9WUrCUU+/C3uxv/oOr
         Iqki95qSLuA+bEokyCELUO8hOEQqa4qcNy2Nmb5dwxULBx00jsfj1V/hqcO9qFlYnDy7
         ftcg==
X-Forwarded-Encrypted: i=1; AJvYcCVb+vHF6lfI67A8vAy/F10Blcbi4VDrvKCHZjqvh5BGlQWCpIv3Ei9FA2uLCPbvUskOzPmGEFkjTj97Kjiu@lists.infradead.org
X-Gm-Message-State: AOJu0YxPhUFvAvjPA0/K50fMQJGBzs6iLRSHPPh10S3WVPbY1cpKj+E/
	sO8HiilM5yzmGVfNtyShPOzwglw+abkzzp3IAXYh2pteHCvx1QFCtJkLajPmw1c=
X-Google-Smtp-Source: AGHT+IHGmppS4PFg1Xsjs8QMIiLiYyfR0ofoHSGknvjx6ulr/GPZF9iZovUAobPsZPzBZ9UTs/nMAQ==
X-Received: by 2002:a05:600c:4f08:b0:42c:b54c:a6d7 with SMTP id 5b1f17b1804b1-42cbde1a7b6mr129698535e9.14.1726474128120;
        Mon, 16 Sep 2024 01:08:48 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:35 +0200
Subject: [PATCH v2 06/11] ARM: dts: amlogic: fix /memory node name
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-6-0b20ed4f0571@linaro.org>
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2754;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k9f3zeZNf22hhWbxdNbW9N9SNlPMvy1DbsfTCeBd+r0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eG2bxlIrKdJ79EiteVP5xs4/qQ/mQodteKiqmv
 yVeXHP2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhgAKCRB33NvayMhJ0S+VD/
 4hdSKVD77LSfV67vgBCvXvn7j+lCOKAzjTAh+gwy61FrFuOIL1G+NsN1L1i2QUlk2FXocQv/62qYYA
 hZ3zV9OnqsYJsgyrTeURzrNboDZX2PZhrZEEhxat//Cc04R5jT9yyuIAE7boadg0B/QBpa28Zq6SiT
 Bi/ceaJCC6eiK6bBhYcR1q5O0Gg4xb0in7sotEhKXJtxTZzEAm01R1s6lmYAAtj/aQg6dmnOy4olan
 4ZvR7E5QdeWoujOyC5nDN78z36zKIwmmfeYkHjzfYsWXo/tKxPI8ZH7fnENwuB1ScsoNgKhPNtUcxj
 dATbs9VkpQjyfDGP6z1cp7Fj9Xl3o3Mn+B49FRVIFM55k7OS51bPXmj9TqON/2Ws/nczIbFsDDzHPV
 WaMOQhvMTUzfWUBZKTsge1XleqAVPBg8D148QIT3F53pQSLGxbviDyTo2K0LACF8gkEHTnCNKMpnnc
 d3Mv72rsIwPthTvybHUusEjCVGGq2/oGk9P731Nultyst3D2xR0c2qjvt1h+ll/Gm8Ks8qrwdiU3OP
 nadxv1UeLGduq+JBUiJAjgLbTe192vhZ+LQPADV2FaFlhAYUD4Die/RtqAc2UDCGHQVeJmVsyhP6Is
 h/5vMp0b8PXp87FuuNLLF/AZgac0cdfnB78VVH7jgwW7u7eZvdsc/b99Vqag==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010850_275799_23C0ECBB 
X-CRM114-Status: GOOD (  10.09  )
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
 arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-ec100.dts       | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-mxq.dts         | 2 +-
 arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts    | 2 +-
 arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
index c6d1c5a8a3bf..b97531000d55 100644
--- a/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
+++ b/arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts
@@ -19,7 +19,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
index 49890eb12781..36fc3e15ee9f 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-ec100.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
index 7adedd3258c3..fb28cb330f17 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-mxq.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
index 962bbe3337db..2aa012f38a3b 100644
--- a/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts
@@ -22,7 +22,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x40000000>;
 	};
diff --git a/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts b/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
index aa4d4bf70629..08aa661e17ad 100644
--- a/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
+++ b/arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts
@@ -26,7 +26,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
-	memory {
+	memory@40000000 {
 		device_type = "memory";
 		reg = <0x40000000 0x80000000>;
 	};

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

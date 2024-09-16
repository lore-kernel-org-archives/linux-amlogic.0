Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29102C3ABD1
	for <linux-amlogic@archiver.kernel.org>; Mon, 16 Sep 2024 08:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhhKXg2lQOyZUPaNR3G85PtEZ5wiLmNvO8b4T8OxBnM=; b=c1FMZW/QYRP+DP
	JfPFAkH74OWxDSBU+GGtGTnViGErEgW0O2gLzU+ssX6maYmqGkhEPHhO8aMhceNXy3Y9fiN0eMd6y
	+jrFZauN6IrA2pKmDns3cn3zXLlQ0054AOdBJO2xKcSEwggARxqmmkIIw2vf3wCLwkE/xAv55HhFg
	lM9Q7dTGlQzzQwG9AVZUNidZiOzuNDSZ1t7VKE6B+5pGeKOlv11IOU1ErcYFXZO/7Txp5zmMR9h2t
	X5plGfRKadn5ftZgx33Pq8xIk+PKwXmbXPwwYdNV45vaghAA+bykKbaE0f+/Dj1RZvBEvSiT/h/f8
	WW8RR7fW0YEjbSdc72LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6qB-00000003OKw-1euk;
	Mon, 16 Sep 2024 08:12:11 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq6ms-00000003NB9-0LPn
	for linux-amlogic@lists.infradead.org;
	Mon, 16 Sep 2024 08:08:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-42cde6b5094so32580825e9.3
        for <linux-amlogic@lists.infradead.org>; Mon, 16 Sep 2024 01:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726474124; x=1727078924; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E1vIpzk9oVyVOG06g0kL+sRHU+69aulg2Ae7JhwO8wI=;
        b=rXay0tz3EIotGQ8n+i9+sqq+FZYZqN/16VmMrVBwB0D5KiFbT6JSRG1YP7HE6xRtAr
         7J3iclOK0P1CUtajKaUZ5gErmnRLo5Z+q3PNk6IcUgYlIxYc1lEkpnlDBlmxPOWrdFpS
         cjiLcGLcrQLylVv0B56/aX16Uo7Zc0IYlzoq5csjvYn3WO9G8SGiCxEHcPtbrPsYEbSh
         cd1qbLf7qu1vRJVX4v1cM+WjOIgqG4+AH0F1XODK4dWy0sDc4KBEkRpiPry76T7r55Wm
         BozGGTIZo9Rg0qkk+LC5OOd2IsaS0KhbShGdKgUO0O4yvGic2tmn5i9QM3A0gGkYWEbK
         7LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726474124; x=1727078924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1vIpzk9oVyVOG06g0kL+sRHU+69aulg2Ae7JhwO8wI=;
        b=PfQ0BBAycCKFI0meCrlPk21CHifF5YmcBZYw2rAefrpO17cXVS7NJ/DWbbNgHbJOxx
         15DxRe+LcjZouCtUKbsrFsqHaMzK5WxciMxPVUgr4e/kElPEzXmwF0mhW4WX1Y9nJmk0
         rTPGvAkWn8CPnz6Lg6hjixWLGXiawUe5LCwj3GyTtacHjV5bzvOttDxHZN0YmNy0fM7t
         nIdnhnAOzqtN32I9W9s7l3qD3z168oGNTzZ7SRiYmCw1EwoYqMK5f5hEigznis3fTRnK
         vc1xm8OvgVkwQyLc7WtLM5Vi1cFTXvu/DMVEAB0Jaxa/+/gv0sJaj4L/98WiWTWwjnoT
         ah2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVcKxtQr4OXie5kBLL7Y5NbPOJfOIjLPUOFm17Ffl5+JFdYt4Jmk9flWHb78XIkeLdeX4DOuEni6nNPnOhF@lists.infradead.org
X-Gm-Message-State: AOJu0YypM+y/f1lGapmDXNWehDbuy9/xdUZZLTolMC6eu+tLioc6kfOG
	wDZrThUMYpNDbbtU7FzxD3D+CW1wCK63Wk4Ftad/ilE+D0E+AJS5qAMWN6mkXHg=
X-Google-Smtp-Source: AGHT+IG81+KShsTttTV7KpPm//Kr4bYC9L8B76e5tQUnxOSIOPDISgzTpvOQZ1QN9LKC98DyFOdpzA==
X-Received: by 2002:a5d:6743:0:b0:371:88a6:80d8 with SMTP id ffacd0b85a97d-378c2d051c4mr7718649f8f.28.1726474124020;
        Mon, 16 Sep 2024 01:08:44 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42da22b900esm69309465e9.1.2024.09.16.01.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 01:08:43 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 16 Sep 2024 10:08:31 +0200
Subject: [PATCH v2 02/11] ARM: dts: amlogic: meson8: fix soc thermal-zone
 node name
MIME-Version: 1.0
Message-Id: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-2-0b20ed4f0571@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1469;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=UoETFPdjMMbnPlCPiHelAcyMEU+Sy/PC5jjGukKQYVo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBm5+eEns2xpAxBYid4qem4ZlnMXmeoAFKNbpHSzSSh
 6MH/b16JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZufnhAAKCRB33NvayMhJ0VBuD/
 9n+YgWfHkRajzlW1vTJNWZLmGRg7FezL0IYhxhYiXr6R/YeefCPamoSvjGvNrZHQ7tkyUvf1bXbaNw
 vkv9blEGGVjdFmEVPoqo58Paw5tMniQZcsoieB1WM7pj5c/erQ6sSrBjrLJYOvFeH0sY5PdP32bjaY
 x0HpCVUhQ6YjR1M5C2K7ix3F9mjWIBFHl44xZwURf/qwhaAyAMZeIBcpuRKttiRMZlJ2dg7Cyvqt1E
 01JSJV1RE8I81j53PZsHKRV7xmdED7+a5Ezjq8WOqJNq7M1PGExkq6jnNvV75Iw6RTsDVzRruqYCvM
 J5e3ylKgwBym5xMuxch5z0cK7jCR+6zw+kohkK/JmGD2cIZccz0s6/EYvwwXva3aLsmB9xClGDih0A
 zyAYl4ewUeZAZi7zVJt1D9Rz+pA5T8ohPXsRTV4lE1iXp1LYQlkUj9Aioma7EiGk8sDtYAeFWLmFLB
 GtLMCACr48z+aer0G+zr8po7tSSCf8H0GBHOKlOF8JVL6Q8cxWkNy77S6j1O3XwlaBejMTu0q+PfRL
 a7Jyrg8q1Q/skxQO3ijIrD+ORehBQykz+MUbGee3EN5jC8ShRTAf1kai3o1Pib6M6BxhlrJHjFs5X/
 D3X4vNj4Od69gY3YxYQPcgvnRxEDVMULLd3ggp6elTVdhrshccuh2C82FKUQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_010846_169887_1BC5664E 
X-CRM114-Status: GOOD (  11.39  )
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

Use proper name for the soc thermal, fixing:
thermal-zones: 'soc' does not match any of the regexes: '^[a-zA-Z][a-zA-Z0-9\\-]{1,10}-thermal$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/thermal/thermal-zones.yaml#

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm/boot/dts/amlogic/meson8.dtsi  | 2 +-
 arch/arm/boot/dts/amlogic/meson8b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index f57be9ae150f..06174d8df789 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -196,7 +196,7 @@ power-firmware@4f00000 {
 	};
 
 	thermal-zones {
-		soc {
+		soc-thermal {
 			polling-delay-passive = <250>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 			thermal-sensors = <&thermal_sensor>;
diff --git a/arch/arm/boot/dts/amlogic/meson8b.dtsi b/arch/arm/boot/dts/amlogic/meson8b.dtsi
index 2d9d24d3a95d..a3669025d8da 100644
--- a/arch/arm/boot/dts/amlogic/meson8b.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8b.dtsi
@@ -173,7 +173,7 @@ hwrom@0 {
 	};
 
 	thermal-zones {
-		soc {
+		soc-thermal {
 			polling-delay-passive = <250>; /* milliseconds */
 			polling-delay = <1000>; /* milliseconds */
 			thermal-sensors = <&thermal_sensor>;

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14672CDB479
	for <linux-amlogic@archiver.kernel.org>; Wed, 24 Jun 2026 13:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YAXQwnPDXiIjjbaG2Ll9wIpGn6/fTSssBBcByrkTEI=; b=er1txbdJLFFtdv
	YSlSVSXEv/+C7zzf1F8vrljfNbD1w97/8Ew00Jp+KhDV5NWWKB/z79JtE/82nKqiR80KZfGRV3NDu
	1QqSHpAmcPzsrc+S/I5xPfqzapUlD7YLKCF4UzI1A97MlOSxLiI+73mkHpzWXIcN0vLbcWKm3pUbI
	I6OQ8lnRpa6oDID1ioYQw4DjSqHPAuP2Rzb+Zi3CL4fVKDBoZo8bssZYQkyUEx6nETKgsbbb+F0Yy
	9SiWIngXk3FUjyKjwVlF7KY5kOeD9/HQsdmcP8UHP/axWA4qLxPyifXXWXZTPArc/ySyfD568K9Hw
	qBpq+x5iAVBbsHxDtrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6t-00000007rsE-3s1S;
	Wed, 24 Jun 2026 13:57:47 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcO6r-00000007rqI-08Lc
	for linux-amlogic@lists.infradead.org;
	Wed, 24 Jun 2026 13:57:46 +0000
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-96392241154so786321241.1
        for <linux-amlogic@lists.infradead.org>; Wed, 24 Jun 2026 06:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309464; x=1782914264; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=JT7DeUGJw26HBVx7cUjvHmk4w0ja+o2ShE09dYEfJI1hl/XhEQPS5k1iusC0qvZYj1
         YY09SSGtJPPrnBGvyst1ZQPoJm0J5LmO/olBLi2u9pwROyGQqbGTTpJ+p8ebXf5jtbyx
         G3STXni/NwOBD2RmxnaKp5l+JJSd1Ed7lcp0I1bO1Axh4Hav3tN82PSc819aABW4nnlX
         WqxM7Vwcjf0onMAwwoXzGIZtoky7GxmWsozcQiag/4B1E5kPTqWzVDa5xyrxfqFU6n3e
         4IbWs0o5tasc4SDJOBzI63IWYlyYQn+oMGN4szy8UxsN0iUCOwWJ6n1HuKfeg5s8tFKb
         OEkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309464; x=1782914264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xh5Slloxf8WGtp7aR0d3xxTsesmRmOMMsUzMEvdtcDI=;
        b=AZMpcXwRRpYSApxkmR0VJx0gFonDUYCADv0SeDGRU+qR9xYOvQNzi2M7ftm/wNqtjP
         lkZ0866xtmQEnPSGECaxT7SoxvaPzez3l44Qx8N/h0eulUWDOELu6tGHaqou8GOzuGW4
         Tnqoolc1yAO4yiYxeNlj9dGNNBKL6c+nviAkXTIWjSLINPGAxoxVUNMsw6y4E8nndop5
         W39tJ3UxwP/its9ejdozvIYj+ODHJv0gnGdawvBs3Gs9chAoEUSojJDB4/yez5QTPQwD
         2olwpK33CarWVpCyPaxyZDGr17J9/sluCoiCGsGR3dp8ovETMrxmqH6PZqqalIaiYjNv
         wo1Q==
X-Forwarded-Encrypted: i=1; AHgh+RouDPZScKvRp+axcHyo6KvlCAdq9DD/gd4YmPry7EO1BfdPsYKcO/jEyhL3lMKJAm4SyoCp8XhJbEzhgiWR@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjzrxt8u9NAf1cRdBiKxR+tOSf1njICvSbjVPQQLH+8jK2DsWc
	2Fo6vAmJOoZmFoxMyxmdMFQDN/FBRC3f4/GK4+JO/uoiMQ/3FuWlndU0
X-Gm-Gg: AfdE7ck7zWK/KLfC8WE03PmmdSuYugowVCBXAleSTDSEDIHpfh23xReZ0LEoyVmGFHS
	IkQJ7pkRv8Dt+L17ajm8polN4FKlwbofhDtrxsIX+wXBWhswlpQ+HtX0d5TuUorUIj7ZzBwGS2f
	ZfbqKLHZojlse8Ec1EywJ3Jc5E9NYpOO+n9nwOrXY6q3egnNV8P20F1WbuHZJCcXebvuv47Yn8Y
	Z9rQpj0FzSKNOHAfds5yLWY9govhRzN5Qnk9aFNZNpxRuMxpMjD9P12dwHHMdljfyu6lWQ80jeY
	huJi21bj/nMJkziubovNFmYokYRghZt2Qx6qHmuKyzU21u2oB9X6DHWDhGZiy3cGCeYaJEhZqGp
	8KfxAvcwKL0Xix4B4BfC8i8ORUQd2BHK72795IRvr3UySu4j4UrblhyDXhc/dKjZVnVpQYFVA09
	38ZJVaA57RDVBAh9iW0yenuz0qQaoLiOU+8XVlusH6h2VyiQ==
X-Received: by 2002:a05:6102:1611:b0:723:b92:31b6 with SMTP id ada2fe7eead31-73115d8fd1dmr1491466137.27.1782309463680;
        Wed, 24 Jun 2026 06:57:43 -0700 (PDT)
Received: from arch.localdomain ([160.250.247.70])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-72ba2dbc17bsm9805730137.6.2026.06.24.06.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 06:57:43 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Arseniy Krasnov <avkrasnov@salutedevices.com>
Cc: Jun Yan <jerrysteve1101@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/4] arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
Date: Wed, 24 Jun 2026 21:56:42 +0800
Message-ID: <20260624135650.727077-3-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624135650.727077-1-jerrysteve1101@gmail.com>
References: <20260624135650.727077-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_065745_073353_C4F4546B 
X-CRM114-Status: UNSURE (   9.10  )
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

The nand_all_pins pinctrl node was missing the nand_rb0 (ready/busy)
pin description, which is required for NAND controller operation.

Add it to the pinmux list.

Fixes: be18d53c32b2 ("arm64: dts: amlogic: meson-axg: pinctrl node for NAND")
Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 6457667d974e..8ca3ac09b306 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -481,7 +481,8 @@ mux {
 							 "nand_ale",
 							 "nand_cle",
 							 "nand_wen_clk",
-							 "nand_ren_wr";
+							 "nand_ren_wr",
+							 "nand_rb0";
 						function = "nand";
 						input-enable;
 						bias-pull-up;
-- 
2.54.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

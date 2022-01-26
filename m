Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E21C2BA4C
	for <linux-amlogic@archiver.kernel.org>; Wed, 26 Jan 2022 04:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dI94P6tMY267LRLSFu6/3yR71X8CHtT90CE8AYWHGcg=; b=ydtAwCNIZAibRn
	Xru5esOE9jQjxNoTpquvaXxzwj6bVQguoCs/tNzcQ7xkcy3Gpi/ukGgSzcUP50+LgZfbfQZIGP+GU
	s8kKIjloDfOODxBv0DOgoghkmyN4/xdEyqJV4bEDjTov3cOalxDbAqzEBrgJ2ImlKrbDwaM9FzXfv
	h8SHNORVzqrhcx4DFU71sZUqBLjeXtm2lyO7bH7Noltr4etTMHaIn/vEHqEA485auFZZcgAZbgQ9p
	TA3ALu2P8HTV9Y+2w8f+iQbODFsFnxv1Jtex8NaatiPFNrUCGb9m1rUKk3zJnvcoLqduW3Ih3V6Dr
	kGrzOtF1tvoVxWR0yEtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCaGg-00A9a2-P1; Wed, 26 Jan 2022 04:50:50 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCaFz-00A9JT-Br; Wed, 26 Jan 2022 04:50:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 r2-20020a1c2b02000000b0034f7b261169so3386776wmr.2; 
 Tue, 25 Jan 2022 20:50:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VcXMYRd9nvU6wwq0JZM21t9w6xo2utk/CM5bkqi1t0Q=;
 b=OORLWLxo5Qil2yoA01f7hsqlK7krLOGzUBUGb+SB6dzzWYrX0Yl8XzvlWYp3tvmpKR
 If1supF8lx5s65uDJYGNW7oPCSSMlWlVmm0lrv5dsKr2q3aSTG6K6Nje+2XhxeTOYCAw
 u+nNdYX6qhojp0CD1kQ0dMSrTbGpxyYtY3JGlzrY03vorRA32w5/10Itwfyq0GRNKG+E
 OEtYWASYvjA+W1GXCQv19HKxn6jG8HTpdtOzw419gt9mCkUVKBujLG247H+SNf1ShcHV
 IMZ7PgB8vYV3UB9K9rKNJTvy+ZDSJW/Z6IG9Sa+TsSF4unA1WpRWIRqCx6qzW6WNgzDV
 Kttg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VcXMYRd9nvU6wwq0JZM21t9w6xo2utk/CM5bkqi1t0Q=;
 b=aLEMkPQORJ1JGkzBkNxKnzUwS15f8VJuLawUAdGlSp6NAzadnN+MSSwad/6dqxPv6e
 tmqpX9vIDjvi+p8j++qN71XG3uy4WGvAWZhOSARJEdebFWgNmUQrX0Kr1rs0/rNEm6xX
 EZbkAx528RmWpiHeb8O1IFBNZXNm0DlK4E1YJwLQQuHTJYVbZJKxw7L/A5VjWI8Cg0el
 ALWGIac7ndDI8hZByN2KB0my1KuqJglPovlsOIFizu1iUmVKr7Kvk0Urz2qOgL3GJJPo
 62OrdPTY+PbvynDjY6Cy+pyqehu2VaSnQhMieBnF3r7FTjn+jRQ3GzA8bjg2XDi9t4gO
 4iQw==
X-Gm-Message-State: AOAM533wkvlEfGcRohIHu392ruwjRYdg/2jx2/mD6vKF3QWXoG8hJhGH
 Ny+eS2144qqhzyW2m7zZ/gWj8lBW4JB4pnsf
X-Google-Smtp-Source: ABdhPJx5Lyiaze7X5x6rEgdEsNm08hTFIL56leW7p/EvLMH+WRTo9sI+PJMQJH60z/9Hbju/7W48Dg==
X-Received: by 2002:a7b:cb8b:: with SMTP id m11mr5697035wmi.5.1643172605083;
 Tue, 25 Jan 2022 20:50:05 -0800 (PST)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id n15sm2171342wmr.26.2022.01.25.20.50.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 20:50:04 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH 3/3] arm64: dts: meson-g12: drop BL32 region from SEI510/SEI610
Date: Wed, 26 Jan 2022 04:49:54 +0000
Message-Id: <20220126044954.19069-4-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220126044954.19069-1-christianshewitt@gmail.com>
References: <20220126044954.19069-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_205007_431406_9B3E1EBB 
X-CRM114-Status: GOOD (  11.67  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The BL32/TEE reserved-memory region is now inherited from the common
family dtsi (meson-g12-common) so we can drop it from board files.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts | 8 --------
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts  | 8 --------
 2 files changed, 16 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
index d8838dde0f0f..4fb31c2ba31c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts
@@ -157,14 +157,6 @@
 		regulator-always-on;
 	};
 
-	reserved-memory {
-		/* TEE Reserved Memory */
-		bl32_reserved: bl32@5000000 {
-			reg = <0x0 0x05300000 0x0 0x2000000>;
-			no-map;
-		};
-	};
-
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
index 427475846fc7..a5d79f2f7c19 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts
@@ -203,14 +203,6 @@
 		regulator-always-on;
 	};
 
-	reserved-memory {
-		/* TEE Reserved Memory */
-		bl32_reserved: bl32@5000000 {
-			reg = <0x0 0x05300000 0x0 0x2000000>;
-			no-map;
-		};
-	};
-
 	sdio_pwrseq: sdio-pwrseq {
 		compatible = "mmc-pwrseq-simple";
 		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

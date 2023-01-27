Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA33BC61DA3
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Jan 2023 14:23:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvANTeoafpheFKh5gvT2sJA4nCB8dlA3aZYZzQCD7tQ=; b=mI8RBJmHis0qjd
	MQGa3uy9YQ0L02Kj1UzgZ6OBPUBV3vsOHWgufFKWeegx98YVpr9kYrezpYaXr8Vggk3WjqdhVQmPu
	fdplVXg57j1VAX2Yxvjdbe2L4NX33tBdvGCNQJfrhAr3NAL5HILXinFk/bxJNj74dThyY1vMXvqhM
	aJFLMEF9WDB7KDMdI7d9MKJ3c/toErUpZuhJ8mnBbiPODrcnGDIioK1fVfyTSkuAsb3ImNFDJdVn+
	FMeFxzmsig4pN6a+JPsZlav6uT9KgzEVMCmk2w9gbe0zpVbywCkk5jwEdbImPFz+2Sa7dDVn6bmiV
	PmZ5kpXuUYRT5tSTqFOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPd3-00FG5d-AY; Fri, 27 Jan 2023 14:22:57 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLPce-00FFut-UG; Fri, 27 Jan 2023 14:22:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id b7so5131370wrt.3;
        Fri, 27 Jan 2023 06:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bDAPnltMdRm1ugUQxshJ1/bx7aojXccJ0679qqZoo0Q=;
        b=kAeJjQWJNHE8CQ+467n+ObDLeH4XMup0tRUWzagdgBA/kl4NBhb8rC8PA/xHCUQlMx
         VpKIlKn6ZJpAeVDDSdCq+1opeE2lagO1r0FrrS4n2JvsLRBPSgk+HcnCsNZ4Xvqy6BMt
         Ns+FWpszlBigRvayDY/W4ZdHNGimw9x9VL2s2uJysB659gpPvaCfu9RSuipnOYmlb42s
         gErKWigh8MzVh/4ynTUMRKjhpEn7JhoZXCH4AZm0UETYnpfVE6wERUnsDydgHYmjYfd6
         7giwlAJThu3O00H3BdSUEDhMNkDBtScm8BmXk9arnw+PI2ZC/aPjd5b0EXDM3xVPsAEM
         DnkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDAPnltMdRm1ugUQxshJ1/bx7aojXccJ0679qqZoo0Q=;
        b=joQRD41JHpxBxcTY9Mx6D3opW8qgTrAjKJTmBdU9swyBZW99M0NqOGfz5HlB6wHI2i
         B5q5jAfT0qKEjrXsWZByp/aPpJbJmCq/EBHrE/Is+vbkb0F65UqTVdlY61vn+KrD+5bV
         p9Aq+CE4dfi7F64tR7/Mh+Batrq7Efu8uADAhFvtzk57Z7SkDIetD3xhr2gqIAzyMK+n
         tls6J7+y3gl1gKiYZd0aMsjKRayrFD9mllz+sP0CkZibsSu2TlLD5zNVe6Tkc9eGvDlS
         uYrKVQG9E7x/ISDdy9DqEnt43tSm/jtOzfU+EJR3mAW46cQMOnse2kVUqJCI/aFpi2kt
         f43A==
X-Gm-Message-State: AFqh2kpWm5RtJGqzqAcgcQuUt/DrqGKwQMh7sh2pgC1nduW8BvTxIb70
	LqP6DD4L/EriiCIYbgbFXGQ=
X-Google-Smtp-Source: AMrXdXuPgItqz2YFvhsDQUBsxBJbBa6hpjC4Ng9uwYW9LPS5ffYmGUsO6XjxmQBMsTS0MoiexZGNqQ==
X-Received: by 2002:a05:6000:1c0e:b0:2be:5403:45ef with SMTP id ba14-20020a0560001c0e00b002be540345efmr27000772wrb.6.1674829349079;
        Fri, 27 Jan 2023 06:22:29 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id c11-20020adfa30b000000b002bfb5ebf8cfsm4301039wrb.21.2023.01.27.06.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 06:22:28 -0800 (PST)
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
Subject: [PATCH v2 1/5] arm64: dts: meson: bananapi-m5: switch VDDIO_C pin to OPEN_DRAIN
Date: Fri, 27 Jan 2023 14:22:17 +0000
Message-Id: <20230127142221.3718184-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127142221.3718184-1-christianshewitt@gmail.com>
References: <20230127142221.3718184-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_062233_000615_0C7ADF4C 
X-CRM114-Status: GOOD (  12.25  )
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

For proper warm (re)boot from SD card the BPI-M5 board requires TFLASH_VDD_EN
and VDDIO_C pins to be switched to high impedance mode. This can be achieved
using OPEN_DRAIN instead of ACTIVE_HIGH to leave the GPIO pins in input mode
and retain high state (pin has the pull-up).

This change is inspired by meson-sm1-odroid.dtsi where OPEN_DRAIN has been
used to resolve similar problems with the Odroid C4 board (TF_IO in the C4
dts is the equivalent regulator).

Fixes: 976e920183e4 ("arm64: dts: meson-sm1: add Banana PI BPI-M5 board dts")
Suggested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
index 028220ed45ad..3c1267a7ffef 100644
--- a/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts
@@ -123,7 +123,7 @@ vddio_c: regulator-vddio_c {
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 
-		enable-gpio = <&gpio_ao GPIOE_2 GPIO_ACTIVE_HIGH>;
+		enable-gpio = <&gpio_ao GPIOE_2 GPIO_OPEN_DRAIN>;
 		enable-active-high;
 		regulator-always-on;
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

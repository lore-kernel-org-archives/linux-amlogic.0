Return-Path: <SRS0=+CC3=YH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F40C4CECE
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C68A2168B
	for <linux-amlogic@archiver.kernel.org>; Mon, 14 Oct 2019 05:19:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uJW3PGEj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BD+S0sfz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C68A2168B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcBe/9jxgRx+fkTuPTpykZIAOHs4xKVhU1kjju+ro7M=; b=uJW3PGEjy7CTNV
	nqn5njCBRz/iIrePGqwmIJB5eRltql91gmPaGodWd2yW7T0NWpe5J+qlHJwiXYuFJnvYHxSYevAK/
	5KbOz/4Scey1v1gwEvf1bPs+yrNDZrLL72Pj5HfATLrYls3s2utHtHKFvNcm52JRTxubdjA7SrnHe
	bnD6gsTElRIYV6MTCaWKjchrSwfxXvYvLf8pPuwWTJyya/u9SAUwtvjRZNODNMQgTeiWlKGkyuorU
	xolM1jWwU1DGMn0PJwRUGE1smXgMnprRidY7odT/YmP/Lg/VMp/LKtZWVZR1PYDCW/5dCwonCL3CZ
	IipOcE7z7AL45fY/s/NQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iJsl6-0007Ly-6K; Mon, 14 Oct 2019 05:19:04 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJskt-00078c-Db; Mon, 14 Oct 2019 05:18:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id r17so13606154wme.0;
 Sun, 13 Oct 2019 22:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IYELzo9paCdNSHZmbtgi4XuRP3zt69X3tMzTrt8WAxw=;
 b=BD+S0sfz4B7A/bxxA6b4D/PzrFOg/tbJ6HIHK6u8MQCD5Y6fmIxJlq7XsFAih10qFc
 fe+7G+8Oq7sseBQX30ziTyxqsqKOnX1+lj4Di4mwwp4zxrcpvGFD2Au6c+XoKTnhxtFh
 aOwDZgV/o/jeeInR/ue6gDpFrOYcsEn67ZBKYx9u3JNVojcx5qMKOwy/GgZtb3sQ6/FK
 bexRD373A4R0XwRpS+/pkfx5dS6Fx1ujfkeCxV/SvFFTtI4ZHqZFARwzri4sAHt/j1MU
 FKn9U3Do26GNlOWfYg7E4d1jfyVWzTQni+tBYRsoTjmL2ODBxKYwQ3T1h3b6rf9vsDg/
 e14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IYELzo9paCdNSHZmbtgi4XuRP3zt69X3tMzTrt8WAxw=;
 b=pvV7Z8EefPEFO0ixmabisW9pavtt3PBV9sH8y9J6z/U5CKLUdImugkHPYRmyq/t6G1
 fSxJJWksEMjhOMzZbmIhjerjPHg9iAUBPw0hfb4K7JUbkWNTIrRI33TZLfMVCzMHiAVB
 y74i8H/QhVuTDADlDyACW/cq/ARweltQlE/KEuPgQwviaf2NVTVd0pyJgtEJ31XMK9VS
 pUsMWPT8phAVi6oQmem5uZ93/81uR7Zite/GXiAkGdRNFXJpxkNQuJBpHnLWOqhKdwq7
 oJOwFgq35Dj4JDLsN8kQa10jV6SXbTXHjXUXDdapqTEmx4FD5KnHm/95fX5bs4ys61uL
 7E5g==
X-Gm-Message-State: APjAAAUrB4cCysf+XzZJ0qGTXeAKRiv4pc2MjYFsFubxjG3V+Jby9Lam
 uWPlQoGGeGvk1nwGefJePkQ=
X-Google-Smtp-Source: APXvYqzDeIQMzuATD9N9pJOIMujxL8TUHVaFwMZVR/+YhNBw4jMhgGwy4f0S8CRJNje0FHxlYVxgMQ==
X-Received: by 2002:a7b:c8c5:: with SMTP id f5mr13251625wml.170.1571030329786; 
 Sun, 13 Oct 2019 22:18:49 -0700 (PDT)
Received: from Red.localdomain ([2a01:cb1d:147:7200:2e56:dcff:fed2:c6d6])
 by smtp.googlemail.com with ESMTPSA id 5sm14660340wrk.86.2019.10.13.22.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2019 22:18:49 -0700 (PDT)
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: davem@davemloft.net, herbert@gondor.apana.org.au, khilman@baylibre.com,
 mark.rutland@arm.com, robh+dt@kernel.org,
 martin.blumenstingl@googlemail.com
Subject: [PATCH v2 4/4] ARM64: dts: amlogic: adds crypto hardware node
Date: Mon, 14 Oct 2019 07:18:39 +0200
Message-Id: <20191014051839.32274-5-clabbe.montjoie@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
References: <20191014051839.32274-1-clabbe.montjoie@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191013_221851_538434_85CE617B 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Corentin Labbe <clabbe.montjoie@gmail.com>, linux-crypto@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch adds the GXL crypto hardware node for all GXL SoCs.

Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index 49ff0a7d0210..ed33d8efaf62 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -36,6 +36,16 @@
 				phys = <&usb3_phy>, <&usb2_phy0>, <&usb2_phy1>;
 			};
 		};
+
+		crypto: crypto@c883e000 {
+			compatible = "amlogic,gxl-crypto";
+			reg = <0x0 0xc883e000 0x0 0x36>;
+			interrupts = <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_BLKMV>;
+			clock-names = "blkmv";
+			status = "okay";
+		};
 	};
 };
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

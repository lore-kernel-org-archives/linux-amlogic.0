Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65F39606A321
	for <linux-amlogic@archiver.kernel.org>; Fri, 27 Nov 2026 12:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HB/2jiMd;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqiYfyNR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5dfUgSqt+4kZYAhYIJuY5AA2zFlI7aiZq2O6bG5HP8o=; b=HB/2jiMdhoAWDFsxJXc/cwSXqL
	rXKl8NrFyy6pBVflJj0xzmAjxez5WEmubCinP7ZMOgu1Te8GOuUoHrTrCTkzBqIx9szl5GFrrwszg
	DjnpD9KRanE0u6flaQGXUyoflodJnIVg2p1b260DsQZQD+vkwtwcpMS1D1Fd66Hz97Ljo87mqr87W
	WaijGhvqW8JPja7/zKrbDmY5PXpw87g7udLsnWWG5GwNjekFza3wLPKseFnVA43dMugmIn3wZCNBk
	D/0xkFFFcudMBNbOgbPQm9J7/Cb1hWaPKSGlBTXPybraZiWVnOOB8VVe3ingMEuMHtUJH8U5MylE1
	P9KJDSYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWugz-0000000Fyvz-09Nl;
	Fri, 27 Nov 2026 12:04:41 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWueS-0000000Fwox-0KB3
	for linux-amlogic@lists.infradead.org;
	Fri, 27 Nov 2026 12:02:22 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so75481595e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 27 Nov 2026 04:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795780922; x=1796385722; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=zqiYfyNReOeggtu78CipZ4oLB57AGMCEZ1aDVTe9QygPNg/47kaopTtF+Kt9C6h2a7
         tOJr9BxD21vVbjdzVkrnoAb1RZ0k36SUj7Nrw4ncB8aMP5XkZ9ZyObWdJigcN7/uImj8
         plUE07ixwApNTO/1WwF+O7BhNiWBMTYuKPzMhzu10HWpGSKzUkAB7GvtfA3+mtMC4K0L
         TxeDP0xZVafhlEYKMwjFW2J8W7LIP9rpvyxnrUp2SYrMBKEMKL2/d1hyvzLjNMuDPPSf
         SpdjtbYF6HB6Qptx8bViyH0AyQhVh2aH+l6r/WDeeTYX7CPiKKI38ED4HoGYKYMN7Vfq
         fs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780922; x=1796385722;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7TYh02oTJOZVmPV/26Kf9AK9AugmvaVvF3eHOWqM4o=;
        b=U8V1SSDok+U8lrvq2wsiZaRSHrQKSG7KhsDgSZpOuErMRRt8E1fvRdE69VOTcbLTsF
         JeuPUh1liD0XZOfqeLSK8g21GVN004lSZSYInXX4vad5+MASVo+114x+DaA6MgGEuPWm
         nS+Z1bgtoFdttKrKkkwJLWcvqEf67YonqIdsrNAPmjvYmk3MqoqIydhYvKGNDQNLp+Cj
         qG0SJjUBTmxgjRkaWqm7NoEr81SuRPOqj/+oBzQEMMAHZUIQCYIjmTvK8rqjd2Bo4rFQ
         kpegoYJH4oanbISg8fdJaAX+yyOEo2kuB4DwA/QzQWG82j69zoXSHkjJAD0t/hzbJd8T
         3nMg==
X-Forwarded-Encrypted: i=1; AL+hErFdRyAWC8x5mhyHhQWU8MmJmJ4/+FU+U4XtIM0sO+JVdmJAHEQZZJiOW74YhzkWNIFpgAiTbNZ3Bsei617w@lists.infradead.org
X-Gm-Message-State: APuU4Z+0VTEtcF9ub8t9snxJFNZ9pvdsRrLYxaQwAR7DcU/wFNA5/Fgz
	nU76XQs+nboCeBY+0gnk9va0RlMkz6v2GLvY/Hd+tY+NiBl6TEHMLiXKOE5Nk77sD6o=
X-Gm-Gg: AZFdTZdd9vc42EwoBjuK02+otJfPxlNsr3H+QC/G2G8RXS4L5THkG8Av3iDdXxBWbN1
	pWmWX0ZkypzK6jd0jZZg8elyr4BJUrQIYMe5sIkgKNVFttjlFh6RM/W0z45HQuIvsBuWQqVRAm4
	HnUnv5SF5K6FdZlsfmlRY49jGi3RJwB6bbn5PVeflRq9QhQESHuzoKxJMSzTQasG1OOtPDgtSlj
	1tBhVKqev6W8ehTEsbGqJqiB0J0vQ55BXindvfYcjr/qjEgQ0GwXB2H2tyMA84mbf9vMWTmLZWI
	uLLA3gan8U4YJOORgY1gWQU2tTd+U8wht7LhuUxx2TrbxwXSdiXfEjyjsyFdExhANPVhd231ZT+
	EdjMCmely4hzxnDQ5pnttC9Qh/tTCGTZUXxk2yHNULtxh49zPXZW5f6Ngld76AKR/XQ6eQrggSo
	y2RHhe20Y6dplY1KcGhIvDqJLPnKZaWsSDhAVLH2d1YKSMJ2mYa5nGGKSPoy/YzxeXQnPGXE6mY
	KbTudKPPwQ7RM+xafAsbGG5zBmXq3nhlq0dHhsu3NaYpH1uFFYoUuGJqyFpsHmf0m6sMDr9X0+Z
	SDyNBEfnlN+5qfIlIE6P3zW04TOr+Ok7iFJ3/jSJb0TtjxSK
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb8881d019mr479327835e9.10.1795780921851;
        Fri, 27 Nov 2026 04:02:01 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm393684565e9.0.2026.11.27.04.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:02:01 -0800 (PST)
From: Jose Nieto <jnieto.alaber@gmail.com>
To: Corentin Labbe <clabbe@baylibre.com>,
	Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Romanov <romanov.alexey2000@gmail.com>
Subject: [PATCH v14 23/30] arm64: dts: amlogic: s4: add crypto node
Date: Fri, 27 Nov 2026 13:00:56 +0100
Message-ID: <20261127120103.1532882-24-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127120103.1532882-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
 <20261127120103.1532882-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_040204_186385_C2D944B3 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Alexey Romanov <romanov.alexey2000@gmail.com>

This patch adds a crypto node declaration for Amlogic S4-series.
With the Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd530836..de173f40e15e 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -71,6 +71,12 @@ xtal: xtal-clk {
 		#clock-cells = <0>;
 	};
 
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <166000000>;
+	};
+
 	firmware {
 		sm: secure-monitor {
 			compatible = "amlogic,meson-gxbb-sm";
@@ -621,6 +627,13 @@ mux {
 
 			};
 
+			crypto: crypto@440400 {
+				compatible = "amlogic,s4-crypto", "amlogic,a1-crypto";
+				reg = <0x0 0x440400 0x0 0x48>;
+				interrupts = <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+			};
+
 			gpio_intc: interrupt-controller@4080 {
 				compatible = "amlogic,meson-s4-gpio-intc",
 					     "amlogic,meson-gpio-intc";
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

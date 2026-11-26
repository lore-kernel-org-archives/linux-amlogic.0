Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F1D606A31E
	for <linux-amlogic@archiver.kernel.org>; Thu, 26 Nov 2026 19:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3zLj9ms+;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=d9lJtUUo;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gvwYemCj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=fUtTu6fpDE4CC6Ii1mV56UAF0HTqWdmYj38rehcAqTE=; b=3zLj9ms+WECDuOT/Jalez4Oye7
	9/5QVGtidl666E5jhhdrTI9bbCBrQ17Hh6XpWOzOyVXnnoXj2+PBY6KjqHGueGK47K8kHkhbkJ7es
	efU1A1fkQQT+LEUnMoGlNdAlSAzq8iH0KgFy6spEV8jkcSI0EUoQthMZ7R/rcJuFh1xRsvLq3T60V
	FACwUrJbXmMZKb4lxDnSQR8XdNkaYJdgBVlGfDYAt3JMaJLDqQ2t0WWH/LNFe5a7GNuClO/EMMLFO
	cARqEDHxfRLNkGYDxdtf6YXkR8OsCDzF6rb4nxDMQ9SoZ/0CDCsgfs5Yt5COW2vw2Sd5F+GzpIKCe
	SWuULwhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfEY-0000000ELJz-0eiJ;
	Thu, 26 Nov 2026 19:34:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfE1-0000000EKJQ-38tq
	for linux-amlogic@bombadil.infradead.org;
	Thu, 26 Nov 2026 19:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=; b=d9lJtUUomJUFbLB68NhbPDm4Zy
	1519iHG9im+zZfEbUuHkUIN01palgbIhRVAMEsoOPr02IX433/fABAPCAqZ0nS/0gBO/Q9J21CeFw
	wtq+sVqXTla1ckaHCwB7T5S/IwuoMzwdOmFMAKvBPj6pNy8zQyIv0BFCSYs5199B11ptGqfdvE6+K
	S0mOAyednnIz0d6SHF9gh4iB4GHLx9+lf8RlgYw6AAn4y+CI2V3dlXVsvxUXgdwfQ2W7FZ3ApOI3e
	myjoRe+tuTh4wpBt0Wm123h2mZxv6TGEdQbkc5yyF+j9y0oHoV7GeAQNEJMQe75lIz7n7Nwqyyf7N
	2QelBaPQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfDw-0000000702R-0TGF
	for linux-amlogic@lists.infradead.org;
	Thu, 26 Nov 2026 19:33:44 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4a358881793so3896426f8f.0
        for <linux-amlogic@lists.infradead.org>; Thu, 26 Nov 2026 11:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795721617; x=1796326417; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=gvwYemCje2g+pes/7uQhOLht5J9E6vObTtqc6GsKafcuZHozn/xin5ZBkg0Mh0Sttv
         D14rw0Y1BJ2P2y14kbqI7XS1DhWTHWo6l+wgy2iT2dnODimhwatkMifd6Y+eYEhgsHiV
         xKNiVIGicgKbufgS19o9gEHzapIOkn8EE8WLZknQHr70zGY4QzcrumJby/uJycjbWoT6
         bSj4czyDUJtJBK8mwETV28OLQB3ulQ1dbmks7E0HRPR7L69XeMLM42MfNNS4BoXGQ7aN
         CUzu77CWhcs4HNPAeRulTgFzGc2siIX5Q8NRrYJpa6f60GKWy7FdEJtRMjV6OySm7wCb
         a43g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721617; x=1796326417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EgS1eeYniF1lumgzc+HBSwMC0WmhqQn1YuP8Q7M2uI=;
        b=gMmID7ZxsmSF5tyOo3RYtTIdismDSE6P283NhInerBdvZCiNS9rkkz42yR2dMSGswq
         HGdeLUIMGjge6cpaAB2CaJEufHjS/6/lKtqUoJHl0GYg9Nn/EzMqw05WSA39ebyBZeNL
         axDuNfJXyfpXrODomRYWWiyq4e2udT951FR/4WCz7DyZFMqr6950vNbBb/FGC/DbxqPS
         5Q3fq9YFMm0Nfbhx+KEU9uaL8lcii/PpNENAhN0T45yXrc3IMc6rLn0usb68b7KRDCxn
         GW+p+O90RvydfG3ClHgnQfmjDfz4LuCeJyVz8rkHgR0wWd28exqCqFMwx4bc9leL8HmP
         j1Dw==
X-Forwarded-Encrypted: i=1; AL+hErHho7UQ3K8/3Xy0RZ4OMzo9K9S71khrfEYyT2fsa6enCujxCri84M9UkyMDYcSBQzNa0qEGSKlvLfv3RwVS@lists.infradead.org
X-Gm-Message-State: APuU4Z8JEIPclTwSDxWpfPGsjDFlIUg+a8SSqfNrkMVlxM5Kd095GpR8
	OFQ++0BiqueIuzx2hlE4JbC+ilXrvNfCyDOhcTPuSlORAgQso4DYMUkA
X-Gm-Gg: AZFdTZcybOQ217Mot7vqxoWceOePE3bkgPIX8TfPdtnBsx+BtBFWbQvyKWqzzNmAs1Y
	LnVKMo8dmv4KoFHM2uPHBd4GONbgFmNuPmoztS7crPkNFyaqyEs6kdNdTDBkD+MjMyo33Ck3sWe
	Yf1dfE20hDFBESt6Uz7q+yFuENpFpNkYN4uecXxJMejmxLY9xFcbd15nfLRVjc71lGpvYISwuml
	fRWdg+zYUPWn1uUkOP4S1nz3QycTPJxaUBAo6J0jySJXSj2HTwXqH5JSWtxhoZLE0ERds6zCjgd
	LKJW8XRKJKNLF+zjegW1ehkgWvZP/C99cOVod9TVHfhq2S4fPXiBc3TkaJDi+R0oe0RjArPdfbq
	WwYzcjFLQtFj3Pg3eUm2WCaslUYii8+nG1r1afUeCogPGsBOfMGGDedUAP7zc5Y2kMoPDtGp7YG
	J2PKSFmp61mWdtwHlgrs2IyV9oguRntBNdwoM2f7Eu/2+kYtoLmkNF4EPx7zzgmdcf2CceZiEH5
	gpxWbYfAmGeYE8w8iGt5u1SFAUs+8n2vIHiQfJ40heEfPHXtPrxVZtfPMdOPE46flERNzF+7JJE
	HlZRVe/yLSmXdNM/+nDIfkfqaAayZfp6vOYodpWKCb+qwg==
X-Received: by 2002:a05:600c:800e:b0:4bb:7757:fe58 with SMTP id 5b1f17b1804b1-4bb8881b9d7mr459950635e9.19.1795721617102;
        Thu, 26 Nov 2026 11:33:37 -0800 (PST)
Received: from localhost.localdomain ([79.117.198.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm368287675e9.2.2026.11.26.11.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:33:35 -0800 (PST)
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
Subject: [PATCH v13 22/25] arm64: dts: amlogic: a1: add crypto node
Date: Thu, 26 Nov 2026 20:32:38 +0100
Message-ID: <20261126193241.1471372-23-jnieto.alaber@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
References: <20261126193241.1471372-1-jnieto.alaber@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_193340_030552_DCE421C5 
X-CRM114-Status: GOOD (  10.28  )
X-Spam-Score: -0.2 (/)
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

This patch adds a crypto node declaration. With the
Amlogic crypto driver we can use HW implementation
of SHA1/224/256 and AES algo.

Signed-off-by: Alexey Romanov <romanov.alexey2000@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-a1.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
index 6f6a6145cba1..396260b7b398 100644
--- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
@@ -686,6 +686,14 @@ sd_emmc: mmc@10000 {
 				assigned-clocks = <&clkc_periphs CLKID_SD_EMMC>;
 				assigned-clock-rates = <24000000>;
 			};
+
+			crypto: crypto@6000 {
+				compatible = "amlogic,a1-crypto";
+				reg = <0x0 0x6000 0x0 0x48>;
+				interrupts = <GIC_SPI 120 IRQ_TYPE_EDGE_RISING>;
+				clocks = <&clk81>;
+				power-domains = <&pwrc PWRC_DMA_ID>;
+			};
 		};
 
 		usb: usb@fe004400 {
@@ -767,4 +775,10 @@ xtal: xtal-clk {
 		clock-output-names = "xtal";
 		#clock-cells = <0>;
 	};
+
+	clk81: clk81 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <64000000>;
+	};
 };
-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=/5FS=RH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35C1AC10F09
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09D302146E
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Mar 2019 10:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ssIO7yUI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ae2qOiDb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09D302146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jrew7gT/BcrRcpoFB5kp84Gy/k4zm+TFOuBE07gdLR4=; b=ssIO7yUIJW+CZM
	wt2jDAmdLdZUsIzTYkmmB5vfQIDn8+4eymLsUbo8RRo8ot9djDgNY8MaC5DCeFoKEa4nEbd8Zks3y
	fPXD+w56ajZLBC4v8rwR7szfTShVPmuBy97T5+9d1Aj96NNNcrGb10vQsTUrhWm3v03g26WpQ/Iei
	HZ8nMZ3aPTtqCPbspiGOCDvnfVao7L88NaHLR/msCBnU1u1Pa/3nm9duWtF3cn7R3I2PQD6+VMTy2
	IfkO+jpFR4agOc9aoE+bMSzhpRHyn5OemjtOsNRdFjrsC50b01lwe1qN+YmQQPD/CGq8gmbmMq8BY
	2khOwUGAMKxlNWpCr9vA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h0l0S-0002rD-NM; Mon, 04 Mar 2019 10:39:36 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h0kzm-0001v4-D3
 for linux-amlogic@lists.infradead.org; Mon, 04 Mar 2019 10:38:55 +0000
Received: by mail-wr1-x441.google.com with SMTP id t18so4955986wrx.2
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Mar 2019 02:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CUW/0oX1GPWgNe1zd7vEv15Hxq4TFiRMZCgKm/8ULe4=;
 b=ae2qOiDbhee4RPPzRPkZKkKxwAOTQF/asyRDofppn8TnwxUAwXb3Wgvx6XPMbnaIU1
 uodcvHMYF8LlMecizXko1SbLoKWbIsLB5/ISaAr0eHXApyNZA3Fj64r7YEfYv9Zk57DQ
 KRr8mlFzHliQPUAUeUGBgXa7J9UzpU/pLennzGW2xZ2TAif9yEKBD4piqI00a+875Fyq
 dWamkxkGMmG2McLwe6ptL17REKF/MrInCHwX2p5/uCklBONL6tRbzvdHz4zrhe2Ybym8
 NwjO8jg2kJlP/GLDwaJKtWI+eEVvdsAH8NkzWYzXjUVEBZP+aQBWT19EW1fdmROhFidr
 SFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CUW/0oX1GPWgNe1zd7vEv15Hxq4TFiRMZCgKm/8ULe4=;
 b=GVqpgvrktLL6HUIUlBW1TTyctGaPbm5VEFBeJ4hLrVvR2k64CsDTfQCSr1Y6abT2CQ
 ONOnINn13XSBA78Ij+C2KNWQ/8f3hW8UEE8LQ9KMuZq3QNHs1Q/Vvl50+cw5fM+rFr/q
 Wl/F5XODP9a7wrYKihemUEGGXdi0j3aZ7prubbjmiO653Tgeo7TTgX/wakfZoZaYmCZO
 xMivqFsMdcF2ZaVbF8nvbATvTb6ZVCRg6IXz4Lpn/eMKVB1eYQrtAw6eZo9gqIdez1+w
 Xi2e0OgTe2+bsW4QlQtQJc21IaYzyvIC+H8ORkmxe5kpSkhwlD+pX5vie2eKSRBnLYJg
 nSDg==
X-Gm-Message-State: APjAAAVP8zqo9/CqTGpNuH5AL177pmtkySwvuDn809P0Pt1fghgf1D8O
 rmyTpi9T5Ao+6bZMY1ro8NmWMQ==
X-Google-Smtp-Source: APXvYqzr/0bpdiSQx6K3wQBGBTtdiy8QH2VuNRkP4ZwuTVFnmC63uEqpOAiWynvE01J29qOFKgQiDw==
X-Received: by 2002:adf:b784:: with SMTP id s4mr12037871wre.155.1551695932593; 
 Mon, 04 Mar 2019 02:38:52 -0800 (PST)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g24sm5505676wmh.45.2019.03.04.02.38.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 04 Mar 2019 02:38:51 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: gregkh@linuxfoundation.org, hminas@synopsys.com, balbi@kernel.org,
 kishon@ti.com, devicetree@vger.kernel.org
Subject: [PATCH v2 3/8] dt-bindings: usb: dwc2: Add Amlogic G12A DWC2
 Compatible
Date: Mon,  4 Mar 2019 11:38:41 +0100
Message-Id: <20190304103846.2060-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190304103846.2060-1-narmstrong@baylibre.com>
References: <20190304103846.2060-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190304_023854_464347_35EE6C82 
X-CRM114-Status: UNSURE (   8.89  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Adds the specific compatible string for the DWC2 IP found in the
Amlogic G12A SoC Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/usb/dwc2.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/dwc2.txt b/Documentation/devicetree/bindings/usb/dwc2.txt
index 6dc3c4a34483..e150b7b227c9 100644
--- a/Documentation/devicetree/bindings/usb/dwc2.txt
+++ b/Documentation/devicetree/bindings/usb/dwc2.txt
@@ -14,6 +14,7 @@ Required properties:
   - "amlogic,meson8-usb": The DWC2 USB controller instance in Amlogic Meson8 SoCs;
   - "amlogic,meson8b-usb": The DWC2 USB controller instance in Amlogic Meson8b SoCs;
   - "amlogic,meson-gxbb-usb": The DWC2 USB controller instance in Amlogic S905 SoCs;
+  - "amlogic,meson-g12a-usb": The DWC2 USB controller instance in Amlogic G12A SoCs;
   - "amcc,dwc-otg": The DWC2 USB controller instance in AMCC Canyonlands 460EX SoCs;
   - snps,dwc2: A generic DWC2 USB controller with default parameters.
   - "st,stm32f4x9-fsotg": The DWC2 USB FS/HS controller instance in STM32F4x9 SoCs
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

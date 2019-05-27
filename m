Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58D1C04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:24:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1692075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 13:24:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ru/UAPTI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="MiJuoVo4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1692075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oWEQgU9N2B6h0Z6admZ8vRoGhg2TrM19et7l7ybwN+0=; b=Ru/UAPTIuFBzrn
	EpXengRBTown+bMij5ovZ86nvGc+6uL1zVm21tS5Y7AWHayEHat4iSEMlzmKYCu3Kv+QcwBAi36tR
	y5xWM9QmMvROqzFl9Kw+bhg3lQSNSyj5DC0ksxrbNk2AoCwSMJDhxg/0CqGzn5yF6QQdxVQfzNkfe
	t7TWqYtevfSXtwQkqmSftEFEmuDoDtMgY3qDSlQiw7510U2qhxYJy/DNspJxHt8NO0W4TlXbl/fKT
	QVoFdqeAlnRy2kCTfv/w0QCQcDbuOkL4joUTA5kfmp4D0jMBsVFUgz7QklwJSvuafgJy8P1sfgH1j
	JCmnypofDwxo/S2vHqAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVFbY-0004HC-RG; Mon, 27 May 2019 13:23:56 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVFZs-0002Gv-Pp
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 13:22:21 +0000
Received: by mail-wr1-x443.google.com with SMTP id d9so16942533wrx.0
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 06:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1P5QlVaHw/qutd0fn2pg3sEjq4K4xykyak/BNOBt7EY=;
 b=MiJuoVo4XE9EvwCi1lJ/KTjNn5vkTGuOAboQ1357fR8CCKNsFMkHx7jbSvFLyf8nAK
 lT0K3rrLl7Udusvz9kAPZ2Am/rHTN8UJMd2sjIQeV0EUo007PCehoOLFxmjZNm5VZY4r
 DFPwp91uwX2GfPpY1/vvPH0Penf8j3IsYBnOJu3yTpXNEVMdNLFnyVeTf7xRpkTODG32
 hRFdP+VZyIPkWJaHaiWHkrWfTleo4gO1n1ozF1DlcemA7hAzh1FDoyJgGNELfPPNkog1
 pD9D6pirVHuUyUozIsY0z7VhmmegqBdW7iVCknjA9PIhemNQwpp0NhCCQwSQvOKlTabG
 +CqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1P5QlVaHw/qutd0fn2pg3sEjq4K4xykyak/BNOBt7EY=;
 b=NbJI8aB6zknZMjGq5CcCRj5dHyqlKejDS1ex1ohGwDw6pqpc/QVcxi/nFx9PfWeWG2
 oDg3q/iIcrakKhGcU8YITg9Iznyqoxpii9d2kst9C3HU/xnl48IJ0+OgFu8SQ4yx2hAO
 tjzgUEiZ8KXH6aZvGI6SUf7TFM66TjCMHzcEYuIfPSIG5TIEAgdygqkR6mdUKSRAFL7+
 trSeNPvTK4NPCoBgOPDZ5jD1YvFVZaxRF8O5Z7Fqywn5hpE/SrFhaLCMrwX+DL72qQHG
 hxAl7VXLfZTcYhW0oECojVi1Wc8Y1nlZT3otn0M3B2oaxPWDBB+E3lV4V9dOa9dygv0W
 Q7dg==
X-Gm-Message-State: APjAAAV7h8jEZIdTR51doaJ3Ww93k/emjFK0Dgr63CO7fC88VmmWt5FT
 i83JLEWrQ56/H5e1nZGVUW/cGA==
X-Google-Smtp-Source: APXvYqyWlquctEhMRszF7odvCHXFI0pvNktDwIVJZOgmAvW/p89BNtQ/h0utKRsS3NvmSJeu3FKaGQ==
X-Received: by 2002:a5d:680f:: with SMTP id w15mr7705835wru.349.1558963331213; 
 Mon, 27 May 2019 06:22:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id l12sm7019836wmj.22.2019.05.27.06.22.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 06:22:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com
Subject: [PATCH 10/10] arm64: dts: meson-gxbb-vega-s95: add ethernet PHY
 interrupt
Date: Mon, 27 May 2019 15:22:00 +0200
Message-Id: <20190527132200.17377-11-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527132200.17377-1-narmstrong@baylibre.com>
References: <20190527132200.17377-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_062213_282172_0875C6CB 
X-CRM114-Status: UNSURE (   9.74  )
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
Cc: linux-amlogic@lists.infradead.org, christianshewitt@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the external ethernet PHY interrupt on the Vega S95 board.

Suggested-by: Christian Hewitt <christianshewitt@gmail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
index 9b52f3dcdd49..18856f28fd60 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi
@@ -128,6 +128,9 @@
 		eth_phy0: ethernet-phy@0 {
 			/* Realtek RTL8211F (0x001cc916) */
 			reg = <0>;
+			interrupt-parent = <&gpio_intc>;
+			/* MAC_INTR on GPIOZ_15 */
+			interrupts = <29 IRQ_TYPE_LEVEL_LOW>;
 		};
 	};
 };
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

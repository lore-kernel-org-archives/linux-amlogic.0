Return-Path: <SRS0=7yak=FG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC91C64E8A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:45:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85EE02086A
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Dec 2020 17:45:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85EE02086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=56U3goVSkLc2u3PqLa1RYR97cHeHukZU7JvnSf9I/qA=; b=kGFQd0FzPk8fPMidTw5KmaaEV
	z/XZI10z+cwAFMRoyOSkrs1H6sMEvp+jWhURY9pGHVQ/jZ4hZxpP7U9Lpbj49cyGiDHLH/11QDPeI
	uPP4NhnNO8WEv3wD83Y0YfyrHdget12iTqQCmW0uOD4/JldYcUVTyI57sivzzUbvFvn4mRMK+UXUz
	HDZNZvKCU5+qB4jO+dvnorQPK4wM+inthB3RMlDIgtuiz9+TqZ9rMWLKLA3WK9Z7TBNoTxiaUiI/o
	l4nHwiltJjwqI6oJp9ADJKEWLex6goAuzzHeB9ks/OeHWBjKZJyy5U0X7rQVaxa6lF3v9otOlIIBc
	cgzKyCghQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkWBm-0007LA-M9; Wed, 02 Dec 2020 17:45:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkWB5-00070f-FU
 for linux-amlogic@lists.infradead.org; Wed, 02 Dec 2020 17:44:38 +0000
Received: by mail-wr1-x443.google.com with SMTP id i2so4969315wrs.4
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Dec 2020 09:44:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s7fXTOo1aazw2JxwuGjclgMvOEDpr6fiuRKDzr3aTR8=;
 b=xv0VaZTRH0v0oboQ91QM5gtP0jffstmJtMQe2QVLsdKl9O6p7QEhxaKpXakYOev6Mm
 nQ6YIrZzJ4I45lWqvV8HCWbFvx8iu0WaThJ0WKkGZxZE9xm9/7pVZRtYHAL13ryKdcqQ
 4VjTSZ80O0pyvYUiMtRH/YzLe/uST9FCkByGq3gfbkuspCo5FTMy4TRQS01uzsKqx3Jk
 +IwDoRw3EZgTopFda+ew1FDIP3uOAsjL4X+jOgeaIT4MeKhpAvdWP6sAf5YzLhUtgfYR
 2VT/DOuf3+GN4R3fOBV6XF0EuPefMax+P9ZtGmD/JUuBUNOYG/4Dc9GogXdwNBedcIUF
 aVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s7fXTOo1aazw2JxwuGjclgMvOEDpr6fiuRKDzr3aTR8=;
 b=NiL8mgatopWzgDDcSnKBZ0yNXjgaPnCpONLurJLeH7R2z85i8RK2f5ZbxpqX8Nz10J
 OWi1C0bTdrdbfgKMERklpVEIpG9453pg6VFqcT4rCHnU+6ndSHZaU7RNPZOkGBes5bwk
 BPnE8VCTcsXkAw6W8Mrus9x0tgelD5exmt/ZkhFIBIHILThDu8oGiYQKZHUpSQvykvpw
 fSEbD2ki6Qi6/7uY0Z+k4K2iCRzOiWiWj+kOCCrrNem+MaFDH2PbH6z20HXuB09ncAOp
 bCeyQ/2k/dMZ2V4NvuH8dySZ38CLn9r64F2JhmPfKBPxmjHErV1cTSykC5WZdV0m9u9w
 U9Vw==
X-Gm-Message-State: AOAM531lG5WvnTg1E8qr5mTnuky8YPfz6NWFs/3bhjhpCti6s3GF1YCE
 52aUPU60QOyIkC2gRqQA/KgiHQ==
X-Google-Smtp-Source: ABdhPJyp/pXoOl8woo+mTCPlCCyB3BR1ozyf9vbD4WED1vgNH+uYjDWaoa+RLNi1V2lRikNy9pKEug==
X-Received: by 2002:a5d:4ccf:: with SMTP id c15mr4774675wrt.237.1606931070225; 
 Wed, 02 Dec 2020 09:44:30 -0800 (PST)
Received: from localhost.localdomain ([2a01:e35:2ec0:82b0:15b4:c668:8f06:1b99])
 by smtp.gmail.com with ESMTPSA id q12sm2842915wrx.86.2020.12.02.09.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 09:44:29 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	khilman@baylibre.com
Subject: [PATCH v4 4/4] arm64: dts: meson-axg: add GE2D node
Date: Wed,  2 Dec 2020 18:44:17 +0100
Message-Id: <20201202174417.3778306-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201202174417.3778306-1-narmstrong@baylibre.com>
References: <20201202174417.3778306-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_124431_718641_BA5974CA 
X-CRM114-Status: GOOD (  11.64  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This adds the node for the GE2D accelerator unit.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-axg.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
index 724ee179b316..30efbceaa35d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-axg.dtsi
@@ -1605,6 +1605,15 @@ saradc: adc@9000 {
 			};
 		};
 
+		ge2d: ge2d@ff940000 {
+			compatible = "amlogic,axg-ge2d";
+			reg = <0x0 0xff940000 0x0 0x10000>;
+			interrupts = <GIC_SPI 150 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&clkc CLKID_VAPB>;
+			resets = <&reset RESET_GE2D>;
+			reset-names = "core";
+		};
+
 		gic: interrupt-controller@ffc01000 {
 			compatible = "arm,gic-400";
 			reg = <0x0 0xffc01000 0 0x1000>,
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

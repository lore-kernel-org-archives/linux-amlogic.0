Return-Path: <SRS0=6csC=YU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D09DCA9EAF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A271214AF
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Oct 2019 16:18:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kud0JI6F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="fuZKY1Gw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A271214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OBahr9WIMHi0YwAg8L2llbznAiYSYn4dlKOX+50T5YQ=; b=kud0JI6FKGPl29
	DAxmhzILs4js8srLH9G17AoVfG6pMGLB2OKGCfGyZOu93bRGgqJJ2S/bQKDk7cvzMo7SX2vXDif4v
	Ao7BRxSLNjbqkGYz1gmnRHyFbAxQQRR23oxOjAL3RPHxr6GCnTmpyLnL8mymXsO/ZrXSPT2nYxnEM
	W/hSzEevBn2nPWX+3azLLPdfFchjZ1wlAdsKhWhHjTnvaA8ASEhKRDmsgCtg/En7S/PYQdrVQ35ZO
	asa7s3xkntgSR1/eMl0scj182XYy9LLjZ/cWtXLgzR7pagpLVfYb0UzezDZPPz/ZgAqcK8qLqFZng
	JCX3Ucpi4BqvR4h+IqUQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOlFU-0006U4-Lx; Sun, 27 Oct 2019 16:18:36 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOlFD-0006Bs-AR; Sun, 27 Oct 2019 16:18:20 +0000
Received: by mail-wm1-x344.google.com with SMTP id q130so6693308wme.2;
 Sun, 27 Oct 2019 09:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=l2pKUClZPs6kJxYKVc9s3ay4DPVtu8eC20YF9cqpcPI=;
 b=fuZKY1Gwot9PXbdi2F0wFKeeUjfJaM8qcBUEEIAcOoEfGOkP8ISPg68uLOAqKjU/zV
 gxOYOedqSMEtXUZ/eVc8E3Z4snEmY16p65SFrIFEZ+ssrsOhiQIp8qEW988N7tm4j+v8
 GKm3RY37S7u35/GOsMJcLlw7oHLwyN1CIZJJdQ6aVEXHYHe3fgzAhztZ0+dMg0sMb5Dd
 NS8ced3UpEBqX+np36zo2dGDKSrgrbr/e4ibJhaaxF40LwkbsNHnTl6mbCVIXgL6tpdG
 fQnKelPXoQs/met8AQg2y3NtSoU4xbqyKSYTagtJpy+89PYHPkwqKy/NbM6IintphWGW
 hSaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=l2pKUClZPs6kJxYKVc9s3ay4DPVtu8eC20YF9cqpcPI=;
 b=f83kYPv28v29qMBf8EIrnVdsebXc1F5IN4rrKvDTSsmKAUyS8cosaRrGwB1IIuvb6+
 UGV0ji5yhqtZVUyLhPsMT8NRVpQSWkghcfudWRkDadYH9r+yX5bYGRyDuC/cLHWYj/ut
 4PYzY40i1RUjGOpzidKzhCWrDDse2lAddKGeV0E6Ys9STCQ/I2PQeHeq9YKKaV37xh3i
 Z5CX13scaPQizf96DqrOMZgaSWQU5aOlrHwmQ8dce4UUJAAOcpxaWCOhFFlTpFxEHqZB
 ZnNiPw7prcCS20EQYMHJF8NFT8nCZjYLEhS+IHvnKLuOw9fLlMlqIkvECkF3Pu/dZRg1
 ro5w==
X-Gm-Message-State: APjAAAU+956PnKFdw6ur8no8L1PvfBOzpvPdQC1p1aoLUkkaUoc4SNXY
 AD42Gfv50S6bOIgYaHHp2aEMrD4Ox+/Qew==
X-Google-Smtp-Source: APXvYqzdDF+BTs3CmnmqR/OMrHlFL2KK0vQNMdUQU2ukI3jHraGwiggiPz8BvE9c9Q3Z2hXogtSkKg==
X-Received: by 2002:a1c:6146:: with SMTP id v67mr12265207wmb.102.1572193093558; 
 Sun, 27 Oct 2019 09:18:13 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F133D01300428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:33d0:1300:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id j14sm9585014wrj.35.2019.10.27.09.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2019 09:18:12 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org, khilman@baylibre.com
Subject: [PATCH v2 1/5] dt-bindings: clock: meson8b: add the clock inputs
Date: Sun, 27 Oct 2019 17:18:01 +0100
Message-Id: <20191027161805.1176321-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191027161805.1176321-1-martin.blumenstingl@googlemail.com>
References: <20191027161805.1176321-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_091819_389904_7B8AD664 
X-CRM114-Status: GOOD (  11.48  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 Rob Herring <robh@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The clock controller on Meson8/Meson8b/Meson8m2 has three (known)
inputs:
- "xtal": the main 24MHz crystal
- "ddr_pll": some of the audio clocks use the output of the DDR PLL as
  input
- "clk_32k": an optional clock signal which can be connected to GPIOAO_6
  (which then has to be switched to the CLK_32K_IN function)

Add the inputs to the documentation so we can wire up these inputs in a
follow-up patch.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../devicetree/bindings/clock/amlogic,meson8b-clkc.txt       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
index 4d94091c1d2d..cc51e4746b3b 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,meson8b-clkc.txt
@@ -11,6 +11,11 @@ Required Properties:
 	- "amlogic,meson8m2-clkc" for Meson8m2 (S812) SoCs
 - #clock-cells: should be 1.
 - #reset-cells: should be 1.
+- clocks: list of clock phandles, one for each entry in clock-names
+- clock-names: should contain the following:
+  * "xtal": the 24MHz system oscillator
+  * "ddr_pll": the DDR PLL clock
+  * "clk_32k": (if present) the 32kHz clock signal from GPIOAO_6 (CLK_32K_IN)
 
 Parent node should have the following properties :
 - compatible: "amlogic,meson-hhi-sysctrl", "simple-mfd", "syscon"
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=H3eD=OU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0D0DC5CFFE
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CBB52054F
	for <linux-amlogic@archiver.kernel.org>; Tue, 11 Dec 2018 13:47:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QBMkwRlv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oh8a8u8G";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="hIZN705s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CBB52054F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PJtE0P47trg4dTS+UGvWr6r8OWrinoxVV+ZtCkagQ24=; b=QBMkwRlvJ4f5lz
	X1XxWDv8pUcEPcdrWoLWqsrW2rgwPlz9QPeVIsxaarU2KKVAeCfogH0q4n17gOVsmCNnAiT2b52Y6
	6YDbPI2BU31gH9UCaVZeN3VNrf2SXy8cJ/fVPREvnGKUnOtpM6QLajVkkhglc/Gg3zigeC2K/QK/K
	uhVZdBfZvPWSNbad6rfapWEwx5+U7j381u8uv8o45kR7h5NOPLHMlPdv7mrqaXLgFLFkDxvYePjPT
	yLBAzU1PboXHQfSGmO2vSHVbdSqfBok1qsoMU+HT1Wo5PARtmr9g+3ZluM1vOmZ2nShmHd5DJu2cE
	ASd1U2upNDBb0/4Fy5mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWiO2-0001sb-9S; Tue, 11 Dec 2018 13:47:46 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWiNx-0001p6-KS
 for linux-amlogic@bombadil.infradead.org; Tue, 11 Dec 2018 13:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B3o+VZnttimFeCQxAmu6M7QAtRnX+/U1ANv52odWswA=; b=oh8a8u8GIorHMs4GeR2+a07Ipd
 DsUlpntlook25X6BsE+LGM44fWBxvv1F/Hk3M8e+MWTcEvXIic/t1OGslHmK+J42QrIW0OP5XMZI6
 0OP1+PsTXj/FltXngGLlzLEZmrPOYvDl6Q1OfNz2UBA1lMR+nUO2qG1vGNKigGixJnL6ivXyyJEK3
 SKF4sTCtine5X9IFdd7LkDggDvzbNoB3U0CLeJc+zwLRqjnXsCEIEcYF2GrJgD6tCTC7IxOkWHmCA
 RVsvzL7E6PsNWLSldOgjygbATdpPE1GYO8/zkljgiYAv0b2artfn1inmsvqu/i5fkIo+0d3zMCArX
 tJpfx4vg==;
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWiNu-0000zX-LO
 for linux-amlogic@lists.infradead.org; Tue, 11 Dec 2018 13:47:40 +0000
Received: by mail-wm1-x344.google.com with SMTP id r24so9051553wmh.0
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Dec 2018 05:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B3o+VZnttimFeCQxAmu6M7QAtRnX+/U1ANv52odWswA=;
 b=hIZN705sTu6SeovdrawG+uO2CDCw3EuO1L03Klmq2GoxpJQfM4oJn34c8B29KlQ5QG
 huHHfThXHfd7/6Y94lqdkh0uRw8qgXM0USVCsaTMCJM9fIhfuIQAhBzZhdl9HWVOd7Mk
 ItcTLIbs/1j/jKlLkhh+dHi21SK7eEDPta1W0Uj8UYimWGh45Alk0J/Wkj8zRGSI2/9z
 X+h6kEzcHrdE5sZV/SXRJi9EluclWv7d+skTHxkxX5pwhc1HphKskDT0EJwuwh3xa0gY
 4Gxkz6G6mT6SAzfM2EaQQk+3T8TMbAicDQ6R/mK7K8FBIwPIwD3WiHGusxuIf0eP4NUr
 TvJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B3o+VZnttimFeCQxAmu6M7QAtRnX+/U1ANv52odWswA=;
 b=Uzs4X+Os8tH4XCN16Ox20yNDsCOTTndLvIp/e1Y9sjDhihlGG2bDg1dDbHNWgUuO7q
 enaugWPZuhC0a+hMgDV4ox84E9XsgeIv8vsIcgOwtdlKVgDsjvoflsJ0SqZbqR1k1dEi
 qGhtc+2VPPqcAvsyzROVe5kx4x6vJceXerfNsAK1sWzHaYfbhlx4MPxAtIxwUI2sRNBV
 6aFCV6cAsCGatklbMMaF7WulpI/n0TLfhBCKr/Q/iFM2d6ON3ATfF8bc15ujowjnwu+H
 QGFzkSlf6toE38Sq1mecd0vxnV++eFyYvV/LZ8nZXpVHlJDZ6IGE+0cfpf6149vJsRr6
 TXOA==
X-Gm-Message-State: AA+aEWbOPSJ4ab2of1CoPslWJHx+TUhhSdD3A75H+s6SxTfHh9hKVcqN
 ya1Ve3NNDY9FzzUYkLl+AY8lsQ==
X-Google-Smtp-Source: AFSGD/W/NyrKCjhdHe0M1cLXzGs7Aqq7gjSm1xXM86n0BpaeIZt7fGhsC9ipLmaH45yiFviLykspZw==
X-Received: by 2002:a1c:c70f:: with SMTP id x15mr2362816wmf.130.1544536047118; 
 Tue, 11 Dec 2018 05:47:27 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
 by smtp.googlemail.com with ESMTPSA id 126sm113768wmd.1.2018.12.11.05.47.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 11 Dec 2018 05:47:26 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Carlo Caione <carlo@caione.org>
Subject: [PATCH 2/4] ASoC: meson: add axg spdif input DT binding documentation
Date: Tue, 11 Dec 2018 14:47:11 +0100
Message-Id: <20181211134713.4908-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181211134713.4908-1-jbrunet@baylibre.com>
References: <20181211134713.4908-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181211_134738_687193_8155689C 
X-CRM114-Status: GOOD (  12.32  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add the DT binding documentation for axg's SPDIF input.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../bindings/sound/amlogic,axg-spdifin.txt    | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt

diff --git a/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
new file mode 100644
index 000000000000..2e6cb7d9b202
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/amlogic,axg-spdifin.txt
@@ -0,0 +1,22 @@
+* Amlogic Audio SPDIF Input
+
+Required properties:
+- compatible: 'amlogic,axg-spdifin'
+- interrupts: interrupt specifier for the spdif input.
+- clocks: list of clock phandle, one for each entry clock-names.
+- clock-names: should contain the following:
+  * "pclk" : peripheral clock.
+  * "refclk" : spdif input reference clock
+- #sound-dai-cells: must be 0.
+
+Example on the A113 SoC:
+
+spdifin: audio-controller@400 {
+	compatible = "amlogic,axg-spdifin";
+	reg = <0x0 0x400 0x0 0x30>;
+	#sound-dai-cells = <0>;
+	interrupts = <GIC_SPI 87 IRQ_TYPE_EDGE_RISING>;
+	clocks = <&clkc_audio AUD_CLKID_SPDIFIN>,
+		 <&clkc_audio AUD_CLKID_SPDIFIN_CLK>;
+	clock-names = "pclk", "refclk";
+};
-- 
2.19.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

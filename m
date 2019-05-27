Return-Path: <SRS0=xEjq=T3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85A0EC04AB3
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:43:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 599DD2075E
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 May 2019 12:43:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dlqkKf1v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="RbixjwZf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 599DD2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6mikJ6b/4efjn2jz8cuE6rxZQRtiHAyviJWZaqzpzt8=; b=dlqkKf1vGcy54g
	LAQmtoQNA/FQisVOnz0U/KoN+ioFOZr4jDo4F0fI+w0pYiryCZwDPNaIh5ghtNn80bDVCNz0f/CKP
	TotOHrE3E0TVcShEn+hiLfcJIxg1sI2mIE7ODcvo5FLc2kV3hXJxW/1f/Rt7Gp0n5GBp2W6MG6A5V
	OecKh3Poo9pNsXVKiY4WWOgvWQ1Ijtlu/75gxRhC6zmkX+Yg/JANVXqjf1UenThnLOOhPdhyZVW2h
	EXgsi5q+n2lsRlEPCp4Qo7vRTKg2BvuBMSlosYW8gOmoyNQXCAArUFaKRXsD6ZJBBRrlcSRkb4W2/
	D8mjX4mjdnnfAYgrq4eA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hVEyd-0001Qv-O0; Mon, 27 May 2019 12:43:43 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hVEy9-0000p5-GP
 for linux-amlogic@lists.infradead.org; Mon, 27 May 2019 12:43:17 +0000
Received: by mail-wr1-x441.google.com with SMTP id f8so16826269wrt.1
 for <linux-amlogic@lists.infradead.org>; Mon, 27 May 2019 05:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wfKAsx1k3aZxm1g3WHRqV/EWJCTGjV5kvipkF29KWgY=;
 b=RbixjwZfkqTf7IjnopTanq0l4LQmRfQrKZvuDGX7vGcEw57/aoOmAB7MvWEgbsFEEQ
 FnNubmDp9BOqpEMqt7ceQvKzMftLMFAlYy8DH6ClC2u3tTNNQyTt4j07CKKUSop2lyKK
 O6BY8X+QzDpCyZneUK62VsxMklgpvmSbEBloeNMS8blv125hNBND2y7hPxGdRXhUasVA
 2BKmUMDZse3jc8EwYgQfNqwVUguTsaERfTcXWFAeT/UUpTVqivGAIncepVhKdgPlYTfK
 WttPp0FRlWnvcMT8iOT+SL2Yyn1PINPI2xPOErptKrxeTxaG1FcfI2gSKDI+Gzarc7QB
 N8LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wfKAsx1k3aZxm1g3WHRqV/EWJCTGjV5kvipkF29KWgY=;
 b=Al9x7gaT7zTJCYLeondE5Vb+D3gI7N04il32iYfJYvZNhqIdBDoZ3At+71IDqJD4Jf
 pxZkrCAmWoXI55ygSxoIbqlAUf2cEnhZuRoU5/IgTNTqjXCkXsOxEZagTgEFw+QnHTr8
 QpT0ZabWUMPlcUpYt376/5AqTK+mc6d/DpvmalI435l6J+VrFFvVdXvLhSAJJbYTsRxD
 DmAZmiXHC5zuky0V11P/eSsTL2aE4sertsfyY36ayEA4FIzN2QWp/sTH11ZqH9KgXdEd
 RqOHqSU12nhCxk42FIVZ9oExizZKqL26OzGaZeTaf0Zp3hUapaj/QiKNCU53CdeRnhd6
 nI2A==
X-Gm-Message-State: APjAAAX4I6xL7pZy2ND1tQborYe9HMITNGGW9pvUBfbnCglUh+hr4rhS
 bQMxr/vTPfCuUWO9RXhiiseR+A==
X-Google-Smtp-Source: APXvYqxnfjIHIRa4qi07Fsf6jQxGYjFAlyaqW/pJH4kjCXSboDIWvjhSeowBftxypf9mHpHl5S6bwQ==
X-Received: by 2002:adf:db89:: with SMTP id u9mr36557444wri.294.1558960991581; 
 Mon, 27 May 2019 05:43:11 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c14sm11494930wrt.45.2019.05.27.05.43.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 27 May 2019 05:43:10 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: ulf.hansson@linaro.org, khilman@baylibre.com, devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: mmc: meson-gx: add dram-access-quirk
 property
Date: Mon, 27 May 2019 14:43:05 +0200
Message-Id: <20190527124307.32075-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190527124307.32075-1-narmstrong@baylibre.com>
References: <20190527124307.32075-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190527_054314_045063_D6054A4F 
X-CRM114-Status: UNSURE (   9.58  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On the Amlogic G12A SoC family, (only) the SDIO controller has a bug which
makes any DRAM access from the MMC controller fail.

Add the amlogic,dram-access-quirk property so signal this particular
controller has this bug and needs a quirk to work properly.

Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
index 13e70409e8ac..ccc5358db131 100644
--- a/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
+++ b/Documentation/devicetree/bindings/mmc/amlogic,meson-gx.txt
@@ -22,6 +22,10 @@ Required properties:
   clock rate requested by the MMC core.
 - resets     : phandle of the internal reset line
 
+Optional properties:
+- amlogic,dram-access-quirk: set when controller's internal DMA engine cannot access the
+  DRAM memory, like on the G12A dedicated SDIO controller.
+
 Example:
 
 	sd_emmc_a: mmc@70000 {
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

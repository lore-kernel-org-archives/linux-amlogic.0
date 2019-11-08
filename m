Return-Path: <SRS0=M8+g=ZA=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A905FA372C
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2019 10:13:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C9E1214DB
	for <linux-amlogic@archiver.kernel.org>; Fri,  8 Nov 2019 10:13:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OpQPJEMw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PXCijcCc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C9E1214DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=WAR0GhrsS056ZOSyHx1fL4klb1g1UE/lpPimQcCCjFQ=; b=OpQ
	PJEMwfDwDBb3LS9yd4hXadqCI2sZZON30UTl37EoTbT2pEUj/r/byswS2WesGNF+H8o2fAfdjc6FM
	9K/xvpVCNBVVo25WS2TlY35wtTKl4EbTwBmZaojnDFO5YxMkzGoMxksiAkBJOc0LqHHwO28d7hrGc
	wPOaAm1wP7BJhHPb8nek5lf5q/42IK/7T46HmBfmBNaN1P0AXHh1aubXnUZi3nn2QimSIIQGiwSLb
	Fkz2oDDJ1xUgk0MCyGS1f2byWvfwZA2zsexAh5YtriZdvQ04uwORxQXVRdObqitbZ135tYCJn8O5t
	SCYnVTNgqEGKlik15N5Xon/6JK4j3Cg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iT1Gi-0003EM-R4; Fri, 08 Nov 2019 10:13:28 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iT1GZ-0003D4-Ne
 for linux-amlogic@lists.infradead.org; Fri, 08 Nov 2019 10:13:26 +0000
Received: by mail-wr1-x444.google.com with SMTP id t1so6373291wrv.4
 for <linux-amlogic@lists.infradead.org>; Fri, 08 Nov 2019 02:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=cU3L2BBWe8lA2LWE7gRXOVYyqfxgb1FEIKhotYOu9Xk=;
 b=PXCijcCcFDJnq59ddsvYjds27Zng22aFdWDWqJdpNGJIMHInEgrmbDnllDSDlpseVv
 ndv7yrifX9deROcU0bVxOwT22xYXQu9hh3qu6HtK1LKytptdkfMwhiOLlxuozEs7fDX7
 ekcbINwgFnIB1f3PYGXxtvrsVTGVqwc9fO4FE6rLLPlcMsXG0LdGB3K20jbqhsO8+Izr
 ZO9nT9X73Ks4swESUuATZx0VOTBixpPG8QnDSKKc6TEjkDIxbZpUc9BWOEOymq2lQzur
 n5SxVbKa15+zLCTN+BvD9PsOP91lfz5uW/edkJ5CODwQsSuAlsIX8dO85SkJcJC9o7z0
 WKjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=cU3L2BBWe8lA2LWE7gRXOVYyqfxgb1FEIKhotYOu9Xk=;
 b=bewUj2YrhDhWjsYKTLViuiSNBB1LrqtCf/IAqDLrFu11TtcNr6+eO53ysuDPcjoRRa
 4CV3pcxdWD2jH2lGCo+fqYGRfoh6/N2nbrs1QYayxB+T1oKdBWHi/+SB+gNlpDLKdWDx
 2NO0lwppygqSfF9Y7A0VQlR7kIPhMBEeb7iRUF6vXatBmkB5iNNbLdMBoaEXlxPfuBIA
 O+NiM97DZDGIUo52Eo5BaKrONo4QKYiFS97+Jc+z5DNe4XUWKB2rY9mWZvlKl0VcWnN/
 D5trrjZjlA/k3dbGTVllNhmUGODZBLjacyWWOy623SjY/qymLPNAmA1rU/X8Tva6txUN
 gLwg==
X-Gm-Message-State: APjAAAUOGP8lq2orm+PDiSTUiDxTVnrtKO9wH9tVoiZdGdVdAsuyiopo
 BP8rpZAwr4apllY/maQ7PdvvNQ==
X-Google-Smtp-Source: APXvYqy54qoamMo6mHEiIaRis19DIgx8N4yy7Hc7RiXAPhgRu6JpxysgeEp8fI0vT1GFn/Qpj7mQfg==
X-Received: by 2002:adf:f4c9:: with SMTP id h9mr7041901wrp.354.1573207995337; 
 Fri, 08 Nov 2019 02:13:15 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
 by smtp.googlemail.com with ESMTPSA id a11sm5762163wmh.40.2019.11.08.02.13.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 08 Nov 2019 02:13:14 -0800 (PST)
From: Corentin Labbe <clabbe@baylibre.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH] MAINTAINERS: add linux-amlogic list for amlogic crypto
Date: Fri,  8 Nov 2019 10:13:06 +0000
Message-Id: <1573207986-26787-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191108_021319_770947_41893081 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-amlogic@lists.infradead.org, Corentin Labbe <clabbe@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The linux-amlogic mailing list need to be in copy of all patch for the amlogic crypto.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c4c532c70b86..ec1c71dba03d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1488,6 +1488,7 @@ N:	meson
 ARM/Amlogic Meson SoC Crypto Drivers
 M:	Corentin Labbe <clabbe@baylibre.com>
 L:	linux-crypto@vger.kernel.org
+L:	linux-amlogic@lists.infradead.org
 S:	Maintained
 F:	drivers/crypto/amlogic/
 F:	Documentation/devicetree/bindings/crypto/amlogic*
-- 
2.23.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

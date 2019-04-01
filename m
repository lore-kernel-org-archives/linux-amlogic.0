Return-Path: <SRS0=bepq=SD=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE02C43381
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:27:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF50B20857
	for <linux-amlogic@archiver.kernel.org>; Mon,  1 Apr 2019 08:27:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qz4n7p1L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RvXqHbyA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xYIZPGmc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF50B20857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beXhlpzTR2fWRR4UeUtTX01U+ndlSE9+LsTLQQP5/QI=; b=qz4n7p1LieqVRe
	xjQ0EIVFcrmRFa8Ukd+s7obzsx9duESbKVIGJ6FcgdkkpHeIfQS47gnxu0cQyjl+AfpEFk2rdEvyo
	zoXvQTuNQH5FIB8ZIPS7wEH8a8feqj7Ngonf7s3MkhRmpTqPoYfsFFS+Of6sLItaZIzi57SogZrFZ
	pWeowIKz2fCet2sZDKGzKI44/l/1IKTajbUlvsOtvEcuQwF5CVtLqLSOsGo8/VoDS4Tjxcsv7f6Uo
	xcgmiIXzMMtgzDWLqwdXNVEPqr/LV0TT28uHdsoQTZzfRh/GM99z03tZi4I5VC8HEswqQr7R8ypoJ
	KAKQklqP8WvVMHihHSDw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hAsHt-00051x-97; Mon, 01 Apr 2019 08:27:25 +0000
Received: from casper.infradead.org ([85.118.1.10])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsHm-0004dI-8m
 for linux-amlogic@bombadil.infradead.org; Mon, 01 Apr 2019 08:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=; b=RvXqHbyAKpMxvRTqT6M4KZQj4U
 e7Bxx6T8Oz+92GFdLqIIvOz4JWcO1nFarmTMYgYsyHVrpOerQnKBulFAOkEBBBL9QAS0pEUiQ1ZOh
 VKsB5myAVet5WBC4/rYBTohOrbfO6wby4w/BsDclaVKDVV80nxVKYXeuz2S9RU2I3uxD0Y7S3lHV4
 cOwFC+z8ZzHbLwVXmAUj/pahftF+M7fpMkUGSJadEFoRU02GYaU6+ARm9qcvjIlQDi/ztVKnIiD90
 i2NLfaFecJ6S0fscaAS+EXy0hKX8EH7QGxmknLhirrFPjPUzr7z4TWdXSG6hFiV8RAgKokXeJgMHQ
 j/7ootEw==;
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hAsAq-0004Hv-2Z
 for linux-amlogic@lists.infradead.org; Mon, 01 Apr 2019 08:20:13 +0000
Received: by mail-wr1-x441.google.com with SMTP id r4so10709864wrq.8
 for <linux-amlogic@lists.infradead.org>; Mon, 01 Apr 2019 01:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=xYIZPGmcOPsx7XltBlBvQqo4aj3zrDHZsgpYJMUWKPcVGo/kHCMfsDAJXpsoa57UQz
 H8IlQlLh2XzwmXEkqTeur3CW+s6LEzySJ91njN24UFYfSJ+i6mOuHcGzxG/BQG/DmtMZ
 dvpVUg34ai1IEcyIh1Q3ONJq3jz7szJSGA84px6hwK4yJ8i2FWAthA3DjN7l8noIufbr
 bBMCsFxwOIthRq6WRyO9rPCEIn6qP0cGwV//CeBETxRpDfRkIilGb5OsroIFfAI0XoG2
 ktrbQ8aaioxMishErHDn0fMLpp3+GsDa/WqaOIaL2Dt4e3QgGl2Mws2sHz1HKm8+Mw93
 kFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RNAd7GNGVbL6BOuK6iIVW4N9neq3YiGA4nYoCz6Ftyo=;
 b=hbKje1eeZiJoG8jQx5CquMM3856xgWsBkA7JhRLNGTh8DCeThFb3WExNctCx+oGlWH
 ycQjVXPk1yJ02xDzgCQbn5Mw1IDuS6atHeqTvNVVrHjFC6w8zDCLWRJy1SSpIJKkdJcp
 ZFV1T5+DbDHQhpD1Adcb8g9+sHw4CexiMhXopdwbxWX1hEzSu/EO2eTiog2LfC9/Ne8l
 MbCXOI1k6xCT6VkGzkBAi1fk7EU+COpdwlnFDoZSdzcA9dfjMktROgwcKGnVppPBWTmQ
 XKxQUDchK3dN3FZiwncca4fE9oWi4vhRzRQPBiYEDSfceruNpTlbLu7ynTmQFoWXDxLH
 KiCA==
X-Gm-Message-State: APjAAAW39EouFmM7Ll4C3h1kQNysk+YYxknFCBrdSKEDoNEZSjNf8uRC
 xgZUTd1NeEdjxaUMhQ9u8cPn1w==
X-Google-Smtp-Source: APXvYqzIW+q2+FLKqh6tWh31Ax8luv8fcduyKnCHPA0UgJM2fP6G5fzjKZ5xrEvKhHgto5EzpQRN8A==
X-Received: by 2002:adf:fa86:: with SMTP id h6mr32694410wrr.67.1554106806327; 
 Mon, 01 Apr 2019 01:20:06 -0700 (PDT)
Received: from localhost.localdomain (176-150-251-154.abo.bbox.fr.
 [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id r196sm10053534wmf.22.2019.04.01.01.20.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 01 Apr 2019 01:20:05 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	mchehab@kernel.org
Subject: [PATCH v2 3/3] MAINTAINERS: Update AO CEC with ao-cec-g12a driver
Date: Mon,  1 Apr 2019 10:19:59 +0200
Message-Id: <20190401081959.16474-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190401081959.16474-1-narmstrong@baylibre.com>
References: <20190401081959.16474-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_092008_389692_937CE9BF 
X-CRM114-Status: GOOD (  11.37  )
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
Cc: linux-amlogic@lists.infradead.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Update the MAINTAINERS entry with the new AO-CEC driver for G12A.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e17ebf70b548..bbad8f3ee3e8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10046,6 +10046,7 @@ L:	linux-amlogic@lists.infradead.org
 W:	http://linux-meson.com/
 S:	Supported
 F:	drivers/media/platform/meson/ao-cec.c
+F:	drivers/media/platform/meson/ao-cec-g12a.c
 F:	Documentation/devicetree/bindings/media/meson-ao-cec.txt
 T:	git git://linuxtv.org/media_tree.git
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=EW34=TU=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D271C04AAC
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:03:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A08D20863
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2019 20:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dFsFt4pt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lF2o1SjA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A08D20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2/TbJNxaxeQuahNRHG5DUVrZ8L5LEB5FaSUBdJXDVU=; b=dFsFt4ptL1+a6/
	HJ6bo+XVL9eEgdSkvG6DffldS55C+lgA5eyDf9eXGN7D7H4IuMDLJqGwaRvGia+2rD+5QLiVHMLaJ
	1iNgmQORqGh+5M5SQh5gXquYNUaULzWH+ZGhj5xqhzoRzSYbGtqTxrnGePWwbxTXKK4XUzLz7LDm3
	iMLgrwC4nGDBiXWo7WMb4bFHTpw4BRFPodalaC9LsDKkOQz7JcA8iNOCiJLRospz9WSfvlED7klA7
	9CBvMugo+3Kan8jyTrRC7lY2nYh8yh13VfZUT7xcNH02EhreFKyb/rTohPIeuKVgMrD81adHqHWWC
	o2r09nlR8fs+xKqGyXpQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoVa-0001mG-Dp; Mon, 20 May 2019 20:03:42 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoVP-0001Y5-9V; Mon, 20 May 2019 20:03:32 +0000
Received: by mail-wm1-x344.google.com with SMTP id j187so703713wma.1;
 Mon, 20 May 2019 13:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HBbcf5smXwn2ERqZmWxMF9pKx3odOzZfT39bu+z+NO0=;
 b=lF2o1SjAnq7Xp1obe3LurDFZKd5BN4khe9sRyPhqgRBSwXBdkoewCBHFf8zoEzEx3t
 waxWgk5yCdtpMkuIOw5iniH4lLAYZqDMMLGCnfXqfrHbgEYFj366Pmunus0UqhMLDz6N
 lUIiposDj1jZjf4bLcYTXv/O61vYSkhJM/7nHXruOZQ5Dc5G28mPA9h5j1CCdfX4yZx6
 Maym0sCKZgVswaiC2gxIrp4w3V2P/K8rwqIMIWm0NAme6TuS7h3Do3JSHUdLUxBnuB3E
 kwQTXI/91n85e85WkrN1yM/EC4WLajIH3hna/bJWB5kFlsm8P8Cn8lGaGXZLXEM7HE5J
 u4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HBbcf5smXwn2ERqZmWxMF9pKx3odOzZfT39bu+z+NO0=;
 b=fO4eyDpSR3D5YQZwWJrQM6u7iANyeh2OKEf0vADamZtvW0iRqELPynbTgZriQXspCc
 egtBOjJIhSLnqUj7blNilasx1SE1PBxc3s+oh0xUl4rI86q0dkQJDc4G75iIIzHCEBZU
 bafxgHrDoJk3aZRm3Wr064BVz+Tz/RzUOH0ZLkh2qY/Khxu0HOKE7z/HF4zWygAxvuLA
 0Aus/8JPJJx+Ua/ZL2vm4xSKSn5GHXNx3o4ARaJTCgtpZv40+Lp1cyxfOIX1kD3jHp4r
 tjsK2BXmxdS8qlN5yx6HoPweGX+uchySCCWZqhCT42W7XB5uHn4bJqmnC+PRALC0GayG
 vmHQ==
X-Gm-Message-State: APjAAAX0N7hZ1jzYS/IBRfl5p5ZegbeZX4gCe2AdOrEuzkTdXuUynYv8
 aee56nGA54WSqxOn2z+mdI8=
X-Google-Smtp-Source: APXvYqzXRf4StT7i+KCej0246pfMyRIOamHfikr5+acfST7ileYaaYz3AnW9nN10il0xEYLcJxFksA==
X-Received: by 2002:a05:600c:23d2:: with SMTP id
 p18mr613218wmb.66.1558382609718; 
 Mon, 20 May 2019 13:03:29 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133EE71009C356FA1F0E19AF9.dip0.t-ipconnect.de.
 [2003:f1:33ee:7100:9c35:6fa1:f0e1:9af9])
 by smtp.googlemail.com with ESMTPSA id t7sm23583379wrq.76.2019.05.20.13.03.28
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 13:03:29 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH 1/4] dt-bindings: clock: meson8b: add the audio clocks
Date: Mon, 20 May 2019 22:03:16 +0200
Message-Id: <20190520200319.9265-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
References: <20190520200319.9265-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_130331_326252_FCFE9CD5 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The audio controllers on Meson8, Meson8b and Meson8m2 use similar
(potentially the same) audio clocks as GXBB, GXL and GXM. Add the
CLKID_CTS_AMCLK, CLKID_CTS_MCLK_I958 and CLKID_CTS_I958 clock IDs so
they can be used for the audio controllers.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index 47556539f0ee..68862aaf977e 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -112,5 +112,8 @@
 #define CLKID_VDEC_HCODEC	199
 #define CLKID_VDEC_2		202
 #define CLKID_VDEC_HEVC		206
+#define CLKID_CTS_AMCLK		209
+#define CLKID_CTS_MCLK_I958	212
+#define CLKID_CTS_I958		213
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

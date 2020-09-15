Return-Path: <SRS0=PGU9=CY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D30B2C2D0E0
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 885C721D7D
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Sep 2020 12:19:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zTP/CFf0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="1GseTMFv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 885C721D7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NGI1rVVWtLxCrBQo134p5ZijGjOTMZmXS7nVx4pj94w=; b=zTP/CFf0bUSWyVjK2kXedNJC4
	cF5grFgO7Dz9A6YSavxGeOt/U3m4AwqBfZLPnBRv4+3Vkn2DIap7IO6EDZV5t3eG/EpW2QDRRcMBb
	dbLu/KM3lXaok2kgTXVPC3btJsqJY6HivUkNpbbvXf2pRroFDWToDuGLmgv1JiEPSKXEjJu6sm+MF
	zAguFgohiJgDCVR8tK+hilDgn7hv8ULZnOIhY+xJ8ezbrBc6HLNGmob7iqlLLxq+lEA3t5YRHGDhA
	JoQZIp/EuxAywBE9Us+bneXVk0WHUx1OdNvFWtln7ErcPIJiukkWmQbZMFSZy6rR3YIZtRXtAP8+P
	6S2QYWQBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI9vj-00075s-RA; Tue, 15 Sep 2020 12:19:27 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI9vc-00072E-Sn
 for linux-amlogic@lists.infradead.org; Tue, 15 Sep 2020 12:19:23 +0000
Received: by mail-wm1-x342.google.com with SMTP id q9so3156596wmj.2
 for <linux-amlogic@lists.infradead.org>; Tue, 15 Sep 2020 05:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i0xP//LC/JAnxfnl6E8AG6wYjP1bfMTZSmuoa8PLIdQ=;
 b=1GseTMFv3VBD+l/ZbJu70sdyna8HX7Q9Y3kd9CNWJfzpgmcxj50frrDrMlisuErsz+
 XZvKQDDLuVqe4Rr/4XizNQyWt150VGfmxP4tUAoX2BEGFilReRHbwPYgTmWbNcwe0d5z
 Un/x6V6eDqLFZf8/C7VnXiT/BgkcN3Q7WJCPikvDNr7EK59Gi/Wc+J6/10LTgzksvFV0
 ddlyn4S8++wymZGcymJ+DvypBpjPPGBRl9I9qAz5gHapBfPyw/No727HNejEKyj5qnCp
 ABnDEkFdHy9iZwrYcf+PQbhgBwfOgseEfitn5UJUtrJkUC6VSm79gUIPrRK3v4LumHqk
 saqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i0xP//LC/JAnxfnl6E8AG6wYjP1bfMTZSmuoa8PLIdQ=;
 b=ptieaGVhmyNn+GNNPu10zOpTnwteWzHMysKsfm7mcTqVhYAOPfgGD4K+FsAfK7nP0q
 OqhN3BCMaVXYG1KurBC9++0sDUUTlsfq+1bU2dtx81jKxD1D6XhmPAgjUpitpcF2oziJ
 cRrNQKYGa6qk6IQQdgtBh5yEcNAnAkRhuwT7ZYZV6S7O00NU3mopmWd8TburS6QInMk9
 CUEzFHm7QemrTd7fEB2kRYmfd4BMVvDcO8CaYXHQCEgqVJOvlC6u4tugQg98Zw6Q5d5u
 MUfqn4KJJseihJShb17Dv0mZawGxhiturkZQ8d3z6nv2aP34dvoI6Dwlm0en+CUMsWh7
 2Sgg==
X-Gm-Message-State: AOAM533Chw6HfvI6IP3BxcAJWZAbkcXMzCsj8/RWWMTBMYAqpqKjX6/E
 +LlGl08/nQqSobhCfxS39GM6nw==
X-Google-Smtp-Source: ABdhPJybSb0kYSEofFmaWgshAySRgZC//CUx/9p1zAMvIm0aMmbt7ZrLqp91l2b0uPGrWrXR6CHjUg==
X-Received: by 2002:a1c:f003:: with SMTP id a3mr4474794wmb.170.1600172357860; 
 Tue, 15 Sep 2020 05:19:17 -0700 (PDT)
Received: from bender.baylibre.local (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id
 2sm18271411wmf.25.2020.09.15.05.19.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 05:19:17 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add Shanghai Top Display
 Optolelectronics vendor prefix
Date: Tue, 15 Sep 2020 14:19:09 +0200
Message-Id: <20200915121912.4347-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200915121912.4347-1-narmstrong@baylibre.com>
References: <20200915121912.4347-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_081920_988659_8A0C18BB 
X-CRM114-Status: GOOD (  10.22  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Shanghai Top Display Optolelectronics Co., Ltd  is a display manufacturer
from Shanghai.
Web site of the company: http://www.shtdo.com/

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a1e4356cf522..fecdc7200b40 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1037,6 +1037,8 @@ patternProperties:
     description: Trusted Computing Group
   "^tcl,.*":
     description: Toby Churchill Ltd.
+  "^tdo,.*":
+    description: Shangai Top Display Optoelectronics Co., Ltd
   "^technexion,.*":
     description: TechNexion
   "^technologic,.*":
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

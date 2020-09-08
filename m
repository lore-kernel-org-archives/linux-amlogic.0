Return-Path: <SRS0=WuYP=CR=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A7AC2BBD0
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD87121D46
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Sep 2020 07:54:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HMAZ1Dci";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tCb7Xyjy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD87121D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N0zG5JgQw9IHCuyMTT8oXETsDFOP7/vRnMl21o2h8n4=; b=HMAZ1DciXGvwZCDkffstYNeqJ
	MDchpRWVxXFPPxrtB+lypEc5lKFsaoSOb0YYx2JKKT5PODzID1lU1oaIMU2oQkfBREluSbvd45UVx
	fHhm5LDlgX7pNT6cmkfi7O+KD877AQaG3486TnmeL+WD5yDeeqWW7yplrEtq3Oes+JaAflj/0cVNH
	ITwePvvEGe6jH8oo9Gyyof57pqD7GexDhXgg5dHlXsBbmA3cPWQ2Gyz5YtEjsIDmrz+qAGDWB9XyC
	0g6KNyG7T91l0TaAWdKiD1leYnpGY4xUQJpLDbMdw4dG+td5vwweAyF/1XH4UTJT87gPqpJICVsie
	MLkFTnRBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFYSa-0007O6-2I; Tue, 08 Sep 2020 07:54:36 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFYSV-0007LR-Uu
 for linux-amlogic@lists.infradead.org; Tue, 08 Sep 2020 07:54:32 +0000
Received: by mail-wm1-x342.google.com with SMTP id k18so1016952wmj.5
 for <linux-amlogic@lists.infradead.org>; Tue, 08 Sep 2020 00:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=tCb7Xyjyf1pbyOxpVBg4F0iVcyXBpfcmtbaHZdYb60cttT+CeyHT6RB+AwUBtq2Vf1
 RdYIVREjuQImrCPeIQahoOFtc6cSUYC2q20fncg2NMlKVTVhbJ4mPXkydSj7AOgcC49n
 U7YPR9aFYv9Csqy6oOmfqK+ps590dJ8SsHDVA3QfK/8O41Zr0MK4lVvfsFSmAH6d4Kdm
 uRdElAGxaVHyKlgDX3xN/3jx0DV1HvK/dMAVAm/TKIdx4+1lgk+oHix0dZMGJ+z8TdPt
 rNpdfI0UJLbU6FJ7OcMjjAz5FCC5Ew5b1m8/tX1RLMRlfWSCIzhcj1wQhnHzLmaSTRsJ
 hW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=un3Gh2gweDlAUsvqGdAT6fJ9irEjsQvOrf4xpheQKFc=;
 b=ISTUHnAqSKkRxOOXj2XAsNXWNpUjSrveY2B77nuxxzX8J9eyfU82RkUisRD6deDQvC
 LmgRdUR/J+AO4k/TgXilbPsGIfyn9AE+6M1sLRUN7KD/u052I3c0jMi89/8nUhfbTKKH
 UXYdeUQCyh+Hp3QXnqlKZxwVP68v20Huljl2DkRnC9tw5LJDYJuGhK91nGBrAKF4j2kW
 ovbmgLFFoFOi50yGopp0Bij9ps4orMGHYt3rAwWR9yQ0fGiTHEydbAu3/MODr3gDlBYV
 BnaUGwHyZjkDjCnqES1oyAwW8RcH4S3p1xNMP9EnKy/FfbpsQuR3SoVnr1MKwIhVVWxR
 vkSA==
X-Gm-Message-State: AOAM53312tFrBQ3TtzTZ3M7W/Uj7ZlKCPZ8Ux42YEtEwF6ML50VIZt/T
 w6fBjivJ9G8HMCrwRalVncTHtQ==
X-Google-Smtp-Source: ABdhPJy8k9dRtwiSz7EuBFI6BBdW9mwejGQ/bhYXctxJ64XJ3GDkHhArqskhdpzLqbmeozv+wzk4Eg==
X-Received: by 2002:a1c:a90a:: with SMTP id s10mr3027307wme.11.1599551670992; 
 Tue, 08 Sep 2020 00:54:30 -0700 (PDT)
Received: from bender.baylibre.local ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id f14sm33788291wrv.72.2020.09.08.00.54.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 00:54:30 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: thierry.reding@gmail.com,
	sam@ravnborg.org,
	devicetree@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: display: panel-simple-dsi: add TDO
 TL070WSH30 DSI panel bindings
Date: Tue,  8 Sep 2020 09:54:20 +0200
Message-Id: <20200908075421.17344-4-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200908075421.17344-1-narmstrong@baylibre.com>
References: <20200908075421.17344-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_035432_057311_51D39A8C 
X-CRM114-Status: GOOD (  11.05  )
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

This add the bindings for the 1024x600 TFT LCD TL070WSH30 DSI panel to panel-simple-dsi.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
index 4d08e746cb21..a29ab65507f0 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
@@ -47,6 +47,8 @@ properties:
       - panasonic,vvx10f004b00
         # Panasonic 10" WUXGA TFT LCD panel
       - panasonic,vvx10f034n00
+        # Shangai Top Display Optoelectronics 7" TL070WSH30 1024x600 TFT LCD panel
+      - tdo,tl070wsh30
 
   reg:
     maxItems: 1
-- 
2.22.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

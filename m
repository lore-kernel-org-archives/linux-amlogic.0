Return-Path: <SRS0=WPS6=7A=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E6C7C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:36:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0DB7207F9
	for <linux-amlogic@archiver.kernel.org>; Mon, 18 May 2020 02:36:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KrUvfWK2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vp8NHPcU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0DB7207F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=9R1KzRdL0XaGTKyT7VyxRy0m5+LDbSH/v84TZlmfOww=; b=KrUvfWK2aI/ms9WUUdTUPLC3SB
	2Z9VEgwURPvCfVLgmpH2MVfxCudsMowpQZqLJcYCs/YgoKfIDlDPTyavkMyC2L0Wfp/qAPZgFkEW8
	CMAzkI+Fxd9Vpo8jzbPwGJRn4tnouZzwgvMwvN3MAOSyS8dq5jbvfHX1mBN0pslB4HRtVxjQR9xuP
	a+DVai8ItrIuXUFha72mh2DDS0aE6llcTF+j8rcL2JFNDk6fp8AOoCoYxvVJT+VDeEwt9Dnr8D22B
	2E9i2w+vWivbhwC99O0Pe/AIC6I3Lb79MoZWsdI08rlUmuaPk4gfTgMKx7ia1l3rkFtCu5OtfRHqo
	diXWDO2g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaVdF-0002PJ-38; Mon, 18 May 2020 02:35:57 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaVbh-00079M-F5; Mon, 18 May 2020 02:34:22 +0000
Received: by mail-lf1-x143.google.com with SMTP id v5so6615685lfp.13;
 Sun, 17 May 2020 19:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Xl1nvwDloC5SGyJGluG2bly0970Vlb/BB3rsowSf9jg=;
 b=Vp8NHPcUwpw8zYnWA8mTeUG+3McE8IfMPpfoMHJfWLwK8BY1J4U+IssULg3zjBUU0A
 AXxrxx0pwnASo3ENkTOZIdDTrbuEzkGiVTFM7+GLqxAvk3jNSylzzwFaKRZYE2mCWWI5
 71PdpGqhKQF7pJ702HGH3EOnn9un+gIwRc55ZjCvE5tbfvFATs9rcr2UsnlMrrTL09GK
 Y//YlllpkcafLoRnsbM4shqCDTjmd3BXQeA9ymHgXHHi1qWPj+VilpwKrVAEOorEqvCZ
 14097X6MtNZVF6jDqwU2+KzBqed3WQhtCOG4gAn8kO8WSCVP6EwJEZfrbeH4fYEVTpc8
 eCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Xl1nvwDloC5SGyJGluG2bly0970Vlb/BB3rsowSf9jg=;
 b=fLBac0Og6W3wOSjQPmNHBbppLUKrPeOjUDfEEQFzFs2NOWtNtguooqGI/4fIsm79uB
 NdjMFkffK5/jrHx5k7PCCySepqCT0a/QhoEGpO7utOWWfEatx791WOfLaOFm7F19bLIQ
 lovhrcEmtAVkF7tMSMwEo9z1C277QMQrWnnhoMvoSBkDXRCDFKOe2MkKCMiVP2zm2FOO
 V49zoR0TYckqLErwdZv7CxIdYo3s2m2hgQusUMZeA3Gm/2nV9Iv6o9YbXLpmhUIV+wjQ
 14OcYxTHqeWuuS/y0KdpdWkb4lKpkzb+4YwLMQECGlKqNrYP+P/V99W6tOYPE7eoF2HJ
 lJaw==
X-Gm-Message-State: AOAM5322+zcVbGQM1yAFaW7/ch68wDEwPX6SYobG7Bkv45YtQAVk/sbJ
 2TINA+X+LKrkSfuriBv/z3Q=
X-Google-Smtp-Source: ABdhPJyDKiLHGZ0GOOXmaKBS9PeMnLagvUEr271z/x0uzFEC4LwRMky2e2bGIHIRXSQQA9+KvZFZeA==
X-Received: by 2002:a19:d57:: with SMTP id 84mr9997952lfn.112.1589769260032;
 Sun, 17 May 2020 19:34:20 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id l25sm5937498lfh.71.2020.05.17.19.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 19:34:19 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/5] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King Pro
Date: Mon, 18 May 2020 02:34:03 +0000
Message-Id: <20200518023404.15166-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200518023404.15166-1-christianshewitt@gmail.com>
References: <20200518023404.15166-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_193421_537823_6472909F 
X-CRM114-Status: GOOD (  10.35  )
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
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The Shenzen AZW (Beelink) GT-King Pro is based on the Amlogic W400 reference
board with an S922X chip.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 25e118b8a97b..46cb6359f530 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -152,6 +152,7 @@ properties:
         items:
           - enum:
               - azw,gtking
+              - azw,gtking-pro
               - hardkernel,odroid-n2
               - khadas,vim3
               - ugoos,am6
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

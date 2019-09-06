Return-Path: <SRS0=Pg3q=XB=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E53C43331
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:09:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9CA12070C
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Sep 2019 14:09:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bvuo+IB0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZnywVXdz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9CA12070C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=QHY+GwN/WSZwHfD8C6rLiWTUsWbhlA+hxkGXqIbWaNM=; b=Bvuo+IB0xFvXnXSGrv4U+YZz3S
	Y1pbD36X3PWDX1qwnXh2Jq5yrs4IqTRQzMN1QoMrMPLRYSUc4xOIm6fTAh9q9AvGl5++ExsFJ5aJZ
	8YO1Hq163OmmAJjO7DC4Np6GiRIpZJgG6NR7mxxeXszel8+9ICpl+9uoWmhf3+yzsFjHAXXiTvdcR
	dAXoZdxNZGc482u2DvjD5w1LmFbhsTrlXpJoDtcSmB0AjRYNr7RzmWxW47nvqA6zXGARIM1VQ47HJ
	mVBhRP4sA+WHMbBNjQcAW2lY8awtAcLvFuqHEML2bSeDG7i2fM4uhM73EXfobEVtu7p62Jiu/F3Lh
	QqIJAIVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i6Ev1-0005Fc-D2; Fri, 06 Sep 2019 14:08:55 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i6Es8-0004Q9-2P; Fri, 06 Sep 2019 14:05:57 +0000
Received: by mail-wr1-x442.google.com with SMTP id g7so6775562wrx.2;
 Fri, 06 Sep 2019 07:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sVRT27xgfEva/e1C67Zzs31eL0ogg1a2U8ejdj2fXBc=;
 b=ZnywVXdzjivUjfuWw8KWRGVDzFu6IuuVOmY6Mn58dcYWQlXed26VL4Rp68k9DjU4dv
 7V0VfDNvbx4A6XFv4lW0gM9xekpm8Ar8OsE/+THFTt8dmCUWxf1qE/ReGjkSNUe1RIJG
 Ye1UYNwok/zCByqPsaqlCJHXn+SZLd2/C9hh+CRwMsx6+BEV8/7guQQJIlK99rTEjPdB
 3lC6qJzUmNpvA/uvLPpE9HWbqJ1C0r8ecnshk1lVRGoCxGLI/MgJhvof8DycTCAdtzAa
 Lu6oiXbeunkhLNXnaMlhCLGoddF+k22b2w70rlhTHV+5X/RCFeKzrw9zanOuaL26bf4a
 3o7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sVRT27xgfEva/e1C67Zzs31eL0ogg1a2U8ejdj2fXBc=;
 b=HN6xNpQJrlN/p3m2c/WDUoswRP5Zeml0iZKKKhfkww+E9e0CBhdCRPNT9JoHZau9SC
 VtSG2EqtSwuKsos3Ug7pKn5cEU3uCkvtGI/BTU3LUj3KYjunQBWGP4RxvqNEPdd7dLgS
 +bWNs8uIPw1iPWOmuoMEnMhcTctJpGnHu24SueOixbT/x3w7zYTXzryXiigbn5WHTxNb
 wcZlccTVSNczR5X2mXdYrcE/SP/onNtdttDxCZpDQXgtbuTgU0zYCA8YLcws7HNsThZP
 lrCxlr/Mt6JFEFF26M42Z1Y50JisBRnHxRH5QseyfEOHWlCRQ95zDbCOay36EhXlcrzZ
 OCZg==
X-Gm-Message-State: APjAAAWefT/y4VB+Gp0/Ro9A2hmuXJNFm+VGEpKOAJdpKSqKsZ2Z+/Wi
 i5q2hWDjB/SQJ+nrlhdUEtc=
X-Google-Smtp-Source: APXvYqwHNjN84vTb0aFBpduETgbA5BSuKjVhRZOlvvvWhde7IDe/uBFdy1S7Rp6t2FWJZ++iNFUVRQ==
X-Received: by 2002:adf:8b13:: with SMTP id n19mr4125783wra.203.1567778754943; 
 Fri, 06 Sep 2019 07:05:54 -0700 (PDT)
Received: from localhost.localdomain ([94.204.252.234])
 by smtp.gmail.com with ESMTPSA id e20sm7480542wrc.34.2019.09.06.07.05.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 06 Sep 2019 07:05:54 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: Add vendor prefix for Ugoos
Date: Fri,  6 Sep 2019 18:04:58 +0400
Message-Id: <1567778699-59231-3-git-send-email-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567778699-59231-1-git-send-email-christianshewitt@gmail.com>
References: <1567778699-59231-1-git-send-email-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190906_070556_153494_6C3B2777 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: Oleg Ivanov <balbes-150@yandex.ru>,
 Chrisitian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From c9402f747c02605fd8bf7e6495271edf855476c7 Mon Sep 17 00:00:00 2001
From: Christian Hewitt <christianshewitt@gmail.com>
Date: Fri, 6 Sep 2019 05:38:48 +0400
Subject: [PATCH v3 2/3] dt-bindings: arm: amlogic: Add support for the Ugoos AM6

The Ugoos AM6 is based on the Amlogic W400 (G12B) reference design using the
S922X chipset.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 325c6fd..2ded61d 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -139,6 +139,7 @@ properties:
         items:
           - enum:
               - hardkernel,odroid-n2
+              - ugoos,am6
           - const: amlogic,g12b
 
 ...
-- 
2.7.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

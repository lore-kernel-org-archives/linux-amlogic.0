Return-Path: <SRS0=iZgZ=7C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7C67C433E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 01:45:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7324B2075F
	for <linux-amlogic@archiver.kernel.org>; Wed, 20 May 2020 01:45:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fZMUdWo0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKiw2WCd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7324B2075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RZdZTBAJmegRuuNmG35qrnmD+6JdCyqVDdI9fUGbGEY=; b=fZMUdWo07yYuXY/BjVHnXot7zo
	zGkK9BqHS1BIXiVW8G6jQzJFj1L9BMPYb7MGLn1clU57rRHlXBmxUsezN2Gq6Pcyxhi+n8N9gU1ns
	Gdrs0fw7yM54qQzShJMV72wXRxpEGNojvVTrFa8qvCj9qZCcN4ryQ/P6egSomGVfs/uU13Vn2MEhr
	femd6ohlE8dzM8hpPFN7S7jk0BifGIr/uYLhlMrVCdp1SEU/Vmt1LYvkWUWhTNjGTtmv2wnDMc4hO
	3Oh7pfwAPHqeU9Q8z5mq+0e1Erg1TB6YrZXOsEHaSLlnAM8Hliz0xIdz1yYZhtK7iTfDEAm+PtgUK
	lsBhldVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbDnm-0000oo-8z; Wed, 20 May 2020 01:45:46 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbDlp-0004v6-CW; Wed, 20 May 2020 01:43:46 +0000
Received: by mail-wr1-x442.google.com with SMTP id k13so1469590wrx.3;
 Tue, 19 May 2020 18:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Mgc/ds3i5rPSJg4nQkW0agG9zLMcqHYeWci5jVpxRbE=;
 b=gKiw2WCdT80gtPyNeWAzwQflZsVbMe7s3ePl6h5iiT4Gl6OEH8k0yBOwH97pVGS4ZL
 MjO76cH/DKqUi1Qm7KTwDfuxWalTptIQh1fw6oYPWOsm3DBZ42VWI0YZusr/gkOQKFBB
 l+fEajCY/jRdzSdWPnyK6DwMgW+Os+9zwCf6G/WPK8i1by3tXOVoiSdGbxxq+AdQgbMR
 oUQuCYqnLpNpYiwIzpIICiY+VL8Bf+gNcv0QX7WYj2iHjSkNUhwTTpr9I0woD9UlbsZK
 +oUjy5g7ANH90hZuaLELuI8h99R+uoN5sXJCUYJkdv5owfAMeG/ZMpjulqp1BhyZi5k+
 jnqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Mgc/ds3i5rPSJg4nQkW0agG9zLMcqHYeWci5jVpxRbE=;
 b=Ts6W+5p9ypP1bx+hHFptGv5eNafGuUE2iUi1pMq7KUOl6dBKb5CXZtqP2NFM+GBZw4
 sbb9xO6bQvp+8EIQ6WGLuK9DMAr0j4/iph4mMt45dUjRpei8E8+rhHsvem/cD9YBFkuv
 qpmFmbP9q0qoj2+OtQwZMz0jLjn2HUzNFBmbTo4q23VDEfssZkdSXSkDZa6zudjaTEWh
 VZXeuwqVqevDcHNKkD0Vb71ECY7VhD57DdNr4i/tGoc+N9lZ8h/ohT2uL9k5mVUfyvdw
 wTfX9F5B7CEoJxSlFEv4rFM8+gwsntKFx0OjX7LrWRb2/QCimJptKFDcGnvxPlxcxTVI
 LvzA==
X-Gm-Message-State: AOAM530W2dtiCLTuCBjrQPV6clAg3EhkYJNUuWK4aTR19x2yxyhZdd+A
 OffBQGVYgMlaNS4pyhCGtsA=
X-Google-Smtp-Source: ABdhPJwXnlsRU3f6ngJsAlED0L79WhGm8IWhfAwGH1W31Ou5U+mb9yYbdccRkvLXtHkRp/6UbpRnBA==
X-Received: by 2002:a05:6000:8:: with SMTP id h8mr1808632wrx.372.1589939022831; 
 Tue, 19 May 2020 18:43:42 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id z10sm1493351wmi.2.2020.05.19.18.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 May 2020 18:43:42 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/5] dt-bindings: arm: amlogic: add support for the Beelink
 GT-King Pro
Date: Wed, 20 May 2020 01:43:28 +0000
Message-Id: <20200520014329.12469-5-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200520014329.12469-1-christianshewitt@gmail.com>
References: <20200520014329.12469-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200519_184345_442346_B89F363B 
X-CRM114-Status: GOOD (  10.08  )
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
index cd7a081a4f17..db35e0d0134c 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -150,6 +150,7 @@ properties:
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

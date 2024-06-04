Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A7CC41513
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 05:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zSdTywZuFrCjR+OvELXVBQYsTARpp4mKthUgLC8wZ58=; b=k3nQ5JdBMDq9wU
	6kX15GZlP0GeyNd9eI0BesC6TZysgNX46cVil8ZMjSHBBCdNWF8jV8Fqigsj8PQ2KAbaS1666FTfd
	9w+S5v55S+Q9cfVtfUhEW1nytpGr+P0CFdFvjmb4xamXWBkgps1P5mJ9cgZViPCHaxNALi7y/yRIq
	dGB4o7eI2ov7XXkMKNF2ykp4tZC0mapOkwKNivYodCnozf4LPkZ9aXQ7f4NLoWGqc+oM99o+FA1Qz
	+iM3hfpKNev4O12NCtYfYn6XLLy2fjq/MFPnXDrQVj/Wqf9Vwr8HOm4ZFpGMRr54+BdPvmh38KliR
	VbhmK+Sj2c/e0B72REkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEMWU-00000001FPk-1WwD;
	Tue, 04 Jun 2024 05:15:50 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEMWR-00000001FL5-1Hle;
	Tue, 04 Jun 2024 05:15:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-57a30b3a6cbso653652a12.1;
        Mon, 03 Jun 2024 22:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717478138; x=1718082938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2KFwSuk79X9DX5w/ku6Z9rjU54vKlCO06+DBoLY9A3Y=;
        b=eYIEjprSY722B8Kp+r8BRkR1jj+c7YlZnEmRkK92eC+1PIGwlNTE9hE6jlGcU9oNAm
         YOt47SFuSx9UTogYA+iRaLQZV//C4CfOBqnw2be2ogTNQthvr08cyEgcXBR2PH4LUvix
         WODPt0RyjIHyDaZort0s8Un1KcqULOBiDXbNznJFpwlYopk+eV6rYsR9f5PorFkKNtGU
         kNpilwdnTDWZMfeVH6XJu96BShyOQf3LQzrXng6aLIv5Coev+30/tbIOCpND8ek7zyUB
         6XbNodUD6gCOkj+4OTj781TykxBnLX/5+6lRU95XlgmpkosGSs4caJGwCcghQ3qBt+7R
         6r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717478138; x=1718082938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2KFwSuk79X9DX5w/ku6Z9rjU54vKlCO06+DBoLY9A3Y=;
        b=Uv+IJPf5G+TsapXy1ge2NaqFthWmoaqLZtZH3iC2frqq9B3dFpSEDXyszj9B7Fkrr/
         eXFRjkSBh2iHs/9Ja5V7v0KhzKU4SmIEp1cA9Yt7cZfXndMyaTEouvJ1RKnMm+dxnS9z
         dxyBdeCCBDbwNvpV1hKuWyDg4gmSB3joDXzdfkCmS4JCfeaIHGQH2du7piRrMNABbD05
         rqlmLB1ndPGP+1XWLcP0DQIx+YmqPgSWlJ8hwEhBJOQ8Fv/iZG+OC0o0kWhT2KJJSdlU
         dtZRadYShRRn2PpE8097mMaGduSg97ay04KAAsWRZTtQ+gDg4f9Rrq/DujVTzyGpsySC
         897w==
X-Forwarded-Encrypted: i=1; AJvYcCVH1DvdLRGzCf7wt8GNy5smdoax//2U3jfU+L1kIfBjxvb2RTjgHV0E7Zj2UdTFenhA6MTo0tDJEWjTgG5PZuaebG/njODlJPvCmAFCVzr+ZwEpE2IObXBNV7H8T3iZdos5LVOOeCL5afsppZW2OoCpaw9D6UtuOg==
X-Gm-Message-State: AOJu0Yw6QNiU+P/CBbvQ8gW13kq61WeIkNF9/s8JmUR2MtLZsvWMRK/T
	6JJhbTBd90qnjOp6OttXhze4zJtneXScgJfKMW/ZbNdf/ZdWNzu/
X-Google-Smtp-Source: AGHT+IELwPjYkPPMjx/cOlLOkJTKS9byWM4fjPErh9dLotwDfRJJOfxB6eikJGAPgwJevRJtlecYGA==
X-Received: by 2002:a17:907:970e:b0:a69:228:8a6e with SMTP id a640c23a62f3a-a690228939dmr370899266b.44.1717478138040;
        Mon, 03 Jun 2024 22:15:38 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68afbaac03sm451896566b.149.2024.06.03.22.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:15:37 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: media: amlogic,gx-vdec: add the GXLX SoC family and update GXL
Date: Tue,  4 Jun 2024 05:15:32 +0000
Message-Id: <20240604051533.3312944-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_221547_357305_1A880C55 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GXLX SoC is a GXL variant that omits VP9 codec support. Also add S905W
and S905Y as GXL chips and sort the GXL comment.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
index 55930f6107c9..47dce75aeae6 100644
--- a/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
+++ b/Documentation/devicetree/bindings/media/amlogic,gx-vdec.yaml
@@ -31,7 +31,8 @@ properties:
       - items:
           - enum:
               - amlogic,gxbb-vdec # GXBB (S905)
-              - amlogic,gxl-vdec # GXL (S905X, S905D)
+              - amlogic,gxl-vdec # GXL (S905D, S905W, S905X, S905Y)
+              - amlogic,gxlx-vdec # GXLX (S905L)
               - amlogic,gxm-vdec # GXM (S912)
           - const: amlogic,gx-vdec
       - enum:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

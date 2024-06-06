Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED7BC27C52
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OT6RzEhSmF8zQ+ThhW7D71nNrkATR2OraXcdG3+VCDs=; b=zCgaMLJBuT6NVG
	ZN1j+yF0LOwbUVf+6SSBzbUSGzAvOV6xnUn4lu3TwX2BLsDuoh6FeKQVx/m0A/zr1KD/C6FwOAKyL
	JuDsnZQb4XW+ffGLM4TpyGZIWILAbfebTTZ/1GvBuQsYO8B7RCZILcNwZzELnmb1QCPJxw2v+dQsV
	MYW/HnIqL5qkEDO9H4vMLOsClovqNbkfkS/71KfWZTBejLXyppAPYDXqdD/qsOEEZkgSlhnPsFYRO
	rx52kF13PBLs7mLugB6yg8FP9QKcXfaTdxRQ+rxUlXubfyDIVEstpSwpYJDcfdeKlNVCIKJ0Lpb5p
	44ehdJt/G5j8BAsijfYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9gQ-00000009GCW-3WN8;
	Thu, 06 Jun 2024 09:45:22 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9gN-00000009GBH-3JkG;
	Thu, 06 Jun 2024 09:45:21 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-35dceef4227so749365f8f.0;
        Thu, 06 Jun 2024 02:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717667118; x=1718271918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZB61FsXEvdeTva0wKHZGI63+eRsL4trnKbQfk9L9rtI=;
        b=HpdXIpweQcG68nZT/uF65qsk1Pp/qvxeTuPF55ZyzhBnV4CNeCoqk9E2L3Hzxm8+zi
         Kmvq4Qnkf5xPdp9vLCPxDuMg7srVLSjuUDWJZLrjCzwqch437n3bWTUuZM0e9SShOJOY
         +5oe8A5CB8affpSacajNfBtnY+QojudFpVDGwS14X31ekH5kO8ZhEnnUook1ynA5x181
         k+kAk8bUuHe9hB4P3L71LnOhZGWB8bBowILhxQW4gdAo2sBgmcfLVn+ByXb4qPp19zN9
         GKEihj3HHWEOG47IoL/zdwQrkE9cpB2afvy2D8FF0Dqr/MJoAxkgpwkjOTvhqcjq5AOO
         0d5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667118; x=1718271918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZB61FsXEvdeTva0wKHZGI63+eRsL4trnKbQfk9L9rtI=;
        b=kpPLaMJ6uWgpF6xmmBYn5JZrDgY5uPKA6rMJSRHU83oRo64Nghkl9Cp+XlMbAGKizX
         OkrMVHDGZko/SS0BsF3/MzY1IHyDtFBJn9RewSkImd8PAqXTvodd5mM7+qh/B0jwPeUe
         qhMwvX/6IET/t/2+UfU9vmJ37OxtouhweFoW96cDfsTqnqzwqfiw/O6JetynlIMz6/3w
         2VokLYo2TG5MIwMdbtlNGw76e6f1bVxbZgkbfQhRtfSK1RPHP/GTv01VoTt+r3OJqdu1
         m1bHd2U9d3JrY8ilETSEhAeFBMi7r/CNcVd/Wh6qyKfjGRXYyPUpnosU50Gg91K85B23
         /aKg==
X-Forwarded-Encrypted: i=1; AJvYcCVPbg6Y1FRLx3BMyECYKXTj9n8motjhZD6wxIjJbIIa7EisennluPbCzLRNBQYLKq7+inbR1VJjJZyfj5/52rqrRO9OxEQ0KURsH4Yg0fbhFcbLUx5RaII9HAChMecp0vJ6StIyerYmQ9oy/2D49tdneh/jrOxvrA==
X-Gm-Message-State: AOJu0YzJ6oY+gqFb3DFGh17zlNvDlqZgDn3V9ASabTw5jYg+gaiiushF
	kt4ZzmlsfMD/i3nyPWQBp5eAHfC09CNwAcTsSo3Ow6hKA+X+DSOy
X-Google-Smtp-Source: AGHT+IEYqlkNtr2dIqwmiztFMsgFnSBixadRM5Vl8vwGezMTvxuiQnVcKhqjqfys2YOKPQVjWIxxIQ==
X-Received: by 2002:a05:6000:1749:b0:355:52a:eb37 with SMTP id ffacd0b85a97d-35e8ef861bcmr3676931f8f.67.1717667117732;
        Thu, 06 Jun 2024 02:45:17 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d47930sm1094817f8f.29.2024.06.06.02.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:45:17 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: add dream vendor prefix
Date: Thu,  6 Jun 2024 09:45:11 +0000
Message-Id: <20240606094513.3949323-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_024519_853293_8DD2AAD7 
X-CRM114-Status: UNSURE (   8.06  )
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

Add a vendor prefix for Dream Property GmbH

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index fbf47f0bacf1..a6cb1eb8e5e0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -394,6 +394,8 @@ patternProperties:
     description: DPTechnics
   "^dragino,.*":
     description: Dragino Technology Co., Limited
+  "^dream,.*":
+    description: Dream Property GmbH
   "^ds,.*":
     description: DaSheng, Inc.
   "^dserve,.*":
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C948C61DA4
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 13:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8FGkLZHmX/I3zE9egcVkQMG6r/3CEKiGY4JD8zqXeg=; b=ZdKOfX+AXYAKPM
	Q5rDp7KHDeaoG4TWATlZQWCYX1kejQAFa6jvD7lM2Rkzd+AnPetnIgSEbVXoMVHs2qm7Dgxxnp1KI
	Xix2OactmkI6f0XqocRvNckKti+/+WoCMFpLwXNqBWuTBTtdLlYp2VC8Ao8jB8bRUM36ynCVkJcpV
	h5k24FoCh06NLiDyN/MKmBbVNZSsiv62VI476NqiGwDiQEC039N2x+2J1J80Fom2AE7MS4E8t5Wsv
	iQ06zP0sVgX9soX3s3G+VJ8Hi91RBJ4AfnjmsFe6JbzoLm1WfzvqFFi7LaDSULH7xOhsFbXMz9LaT
	T75YYxEU33wUggaSZECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoIY-00AEVk-8c; Sun, 05 Mar 2023 13:21:10 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYoII-00AESe-3u; Sun, 05 Mar 2023 13:20:55 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e13so6295229wro.10;
        Sun, 05 Mar 2023 05:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEtPGpczGTI7rRRRNUVfOdyAV4EBveumy0ZU46zBcAA=;
        b=LCG/C4hBL/FQpGSn0I651WRXvfwuKsA4JNvOm38weOv/eV+iRBznk5jaSGS4+ziSha
         DjzOeYMphCFeNwAJ8rYkCMZJRo0eYKPsw6HMaJEZmlNaCYR5CURYDFHBQDOW+hEnT/SI
         4TO/geIf2Q5DO5I0zD/fsUAOAb2VClbg5cAD/BCSaejNkde3saHSXAOc/8EQCBCUgTUX
         tvOSmYoXF2UnjaYSn/teNyNc4idokllTzOYIvgmJz/hv31tgGXazs16UM0qk/FLbRBnC
         kbDRDet4CZV5w09fr4r6+/1qqviRcgqecxQhK8lPjwoL+Cbq2cRrD8tAEEorCvidymGz
         N9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wEtPGpczGTI7rRRRNUVfOdyAV4EBveumy0ZU46zBcAA=;
        b=7M0J9d6WmdNp9EXgRCpmWOfyNUs1SEppBFu9/c18bUtK3D70nMeaI/fA1mjfn937+4
         pJjah9P6DDO10yRZtlMgJsFr1YdPwCLGftbwgc7MD8UJDRIrIapy7tdWAa1TpOwY1pNH
         beWerUal5jtbZIPCS0elRJZTpv0af0MKBT14PMgbKRe5K/jftKRNvKr9e9FaXi9Y+8/Z
         Fa37mhWrNE01QezMHCaMgaPuSfwvf5udtfkQmLbrROiqLaCeFlg4tE1siBvYevoDRy2n
         hjsiptcPtpWpVLa2tkI3Pg6U967oWnC9CJ7pAvLbVh6nRFY5R3Xm91heOU/KX0old8PI
         kR2A==
X-Gm-Message-State: AO0yUKV5i1oXocvAF92FgZGBXKCtBNyC7FNoyq+dpHgl1pnjqpSHDR4l
	uq00rGHSi+s9vsvcCc/mjEIxQmVpSZPtPA==
X-Google-Smtp-Source: AK7set8zXTM8eQu7UzmjQT+pTdmZoDItAanNFD57k5xmtBXo2nD57UtvDjve2s/aYMoRBzZNIPefJg==
X-Received: by 2002:adf:e6c9:0:b0:2cb:2775:6e6 with SMTP id y9-20020adfe6c9000000b002cb277506e6mr4747193wrm.45.1678022452170;
        Sun, 05 Mar 2023 05:20:52 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id w7-20020a5d6087000000b002c567b58e9asm7496851wrt.56.2023.03.05.05.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 05:20:51 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add support for BananaPi M2S variants
Date: Sun,  5 Mar 2023 13:20:43 +0000
Message-Id: <20230305132044.1596320-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230305132044.1596320-1-christianshewitt@gmail.com>
References: <20230305132044.1596320-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_052054_174083_8A2BA6CB 
X-CRM114-Status: UNSURE (   8.20  )
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

BananaPi M2S ships in two variants with Amlogic S922X or A311D chips.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b634d5b04e15..799a4bfff854 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -153,6 +153,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B A311D SoC
         items:
           - enum:
+              - bananapi,bpi-m2s
               - khadas,vim3
               - radxa,zero2
           - const: amlogic,a311d
@@ -164,6 +165,7 @@ properties:
               - azw,gsking-x
               - azw,gtking
               - azw,gtking-pro
+              - bananapi,bpi-m2s
               - hardkernel,odroid-go-ultra
               - hardkernel,odroid-n2
               - hardkernel,odroid-n2l
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

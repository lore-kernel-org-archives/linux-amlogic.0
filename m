Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27182C27C52
	for <linux-amlogic@archiver.kernel.org>; Tue,  4 Jun 2024 05:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fJB/IOOGu+7bR/2tjZKuMPfggeWlJe5CQ/n0SlVjVyA=; b=sMfZgrnXouWVSz
	fcJiapERRofWW7pmRh/qmgmhPNf7ujNuHb+J5Djr/CggqlnJCwVCXiBws593aAPaIEglHBgyu9fsk
	L6Q9tBape996o5P4rgEQCrg3L5izA0pDu+ZDihhO5HXtKBKxHiUo3RTNS9qiw16fgApSbPNgm4fN7
	aUtyXWUU4Ytsy4/v00Z71FC4jChPU+W+ckXjEkx5o/cEVNrirUphHs/+Y0/oorNGyHYH3hbUCOMjR
	ThaDBK0kc9lISV9sHopECHVy8haiOd0ENWBM++i9tDsQrCDqt6/Z0JBHGrhDY0gJ+bsJ1Y04pX3US
	GCJ7uPFNek/m9uC2Mw1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN85-00000001JtR-2vCN;
	Tue, 04 Jun 2024 05:54:41 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN82-00000001JrB-3BHl;
	Tue, 04 Jun 2024 05:54:40 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-57a23997da3so5440783a12.3;
        Mon, 03 Jun 2024 22:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717480476; x=1718085276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=/B3D4wtGRpJZ2iApcLLvXsbZjMk476N0oS3prX5uEXY=;
        b=CHr31Y5t18W5s9rinXpj/rMRi6KAY+tbYsuAp9DYbCUDumqBP8f4+ggpg3w3D5EpIZ
         05/UZZEkigqySt1iuG+PxeUHBXkiESMQ1IdMVarn2fW+gReehEXnGqwvOM6PsNdC8N6T
         zGBiJ/LZVGTNsYQ/m01Aaw2WMWw3njzkZ1M+SKMvaUMZzqHjLaXvN/dtOo5hNmIkyqxc
         l2hYK5Alvp6kgH9wUPtVZ5sUZ9LiSRSZtnEPv9uRqcBk7z6ruQCy1muJF6iDt1WbvLBc
         16E97unlYC4ngOMPYls3KnxK/FZG/KEMAEKrlW8JsZXxtB57Ju/F251sBNQA7htHqhNq
         4i5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717480476; x=1718085276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/B3D4wtGRpJZ2iApcLLvXsbZjMk476N0oS3prX5uEXY=;
        b=thymY3vfmsbDfvsesMySw76CIHmUMgJYElFna/QVgX/5FiBQ+LudPFqmD6lHQqKnyY
         psSMilFO0fJbJC/RC+dpWjzVP5wHUh/jeB57p53ioip1FidugVC2LDOoPDlfEMuJQucu
         HeSMSlxPHkc72AMwgHaSXMkwhsNjy/l2SY8w+SDJMovhqiGjUBF0zo9pOYxrvfH7/DxC
         Pb0ZK21OKXIqd4GWN28Ep8hXgE2hO3x4eTIk2TqqyMkxhf8U/CL8TTZwX4kIqaiWEI9e
         2otIMJJTgRgGn67o7cGlQWWUPKCuK4LxaXkOghmPqn0DmPbrBOkue+7DCYUyUaj30ehp
         NY5g==
X-Forwarded-Encrypted: i=1; AJvYcCVyO6rA5Mb5+rTks7i7PxW0mIeJpTLfST/EtbgsGOMEZtguZGvhiLF0JB5X/o7xoRKnGu4GLmbN/KntHbG3aGhJnTuxbhG99xdI5t3+vdGLYl1cLIN6x7Q+r1bI2IiscUxhRczQ4NjLScZipcDQwmKcGJFGF3lqPQ==
X-Gm-Message-State: AOJu0YyL82hoFY7cPz8pCQUrw3zx+Ey8Al0YsWBrpHAb0Xn2y1uTKqIO
	mIMdCJN3Rxtl9dQfVJgCtwSSiLCekNryLZl4FgBniJGQ9MZ+xvJd
X-Google-Smtp-Source: AGHT+IHVXdxysaq5WMsG98sCezHcJNWQkXwVmFFXDwwcoFJhWDYblpS3zlpgz69HjU4vaFXbm5lIDQ==
X-Received: by 2002:a50:f609:0:b0:57a:2a46:701 with SMTP id 4fb4d7f45d1cf-57a3638f2f7mr8298598a12.19.1717480475987;
        Mon, 03 Jun 2024 22:54:35 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a4fc842b5sm4895643a12.71.2024.06.03.22.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 22:54:35 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: iio: adc: amlogic,meson-saradc: add GXLX SoC compatible
Date: Tue,  4 Jun 2024 05:54:30 +0000
Message-Id: <20240604055431.3313961-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_225438_830094_889EB7F6 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Add support for the GXLX SoC. GXLX is very similar to GXL but has three
additional bits in MESON_SAR_ADC_REG12 for the three MPLL clocks.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 .../devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
index 7e8328e9ce13..b2fef72267b4 100644
--- a/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/amlogic,meson-saradc.yaml
@@ -23,6 +23,7 @@ properties:
               - amlogic,meson8m2-saradc
               - amlogic,meson-gxbb-saradc
               - amlogic,meson-gxl-saradc
+              - amlogic,meson-gxlx-saradc
               - amlogic,meson-gxm-saradc
               - amlogic,meson-axg-saradc
               - amlogic,meson-g12a-saradc
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

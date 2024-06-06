Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFD1C25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YJS35BzxKpbJvgIKvxXTcvPjXZPPORrVpai9mhG+sqU=; b=MfQ4k0r7WqfjJf
	KhtnOFfWK8YAThjJ+z1yx5q9JWNggMKqG2n0CpVXhEgeglIXQu5Kz0Nj4Sjapqxdg7+NKz/5k0SAI
	XLLRkbBxSZvC8f4B3HylvedkvtSo91XYs7NZfXNGN4XGJ+kctWV4B+gCe2QmIi4QcEWqhW2mXMbXy
	uUDqsksIw8ZLgfyFU8dGobp75cM0CLww4GAI76xo7LTSxX/pjzm3P+pYVmJP161ZLurYO73FwP3xc
	XockG7E/VvkeVMFpbmfybx07Pnqx9kryfe9EnM3RcY1xlt/FRFw2kuVq6Jr+WPecOMsjQAx7im0R3
	qV6eXVZ9MVzJy5ixcUwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9pH-00000009ID6-0Prw;
	Thu, 06 Jun 2024 09:54:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9pD-00000009IAz-0a7J;
	Thu, 06 Jun 2024 09:54:28 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4215f694749so2598665e9.2;
        Thu, 06 Jun 2024 02:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717667664; x=1718272464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=apHCWRIB7mRNBEtiZcbMzZM2Ta+6YdoOJz2/tCdUzps=;
        b=SNVDyskcpfcsjEzYEKja9yyJPslB+J4eHeJdt6KB+6FGXjKyRTqwVPBy8fS9WV6Y8d
         CG90qxxvrPbb4cZBNkW4xl2iVDauFnTscW5mx85JashjDHTQBAEZD/vKZzBL0fD6x6zL
         d8KqP06zjjc2q1jKo2KUTNKqfD5pPFAGDxsFzDdyv3PN+/Bv5kUTP6I9/30JBrOeQRJ5
         LtIEkIHKNsspeNaJOxPOfhQQOv99FTNdTJA26MkDpTWggjcTW6WYJhQ7dKmJiZjMOryy
         5tgtXBT1vcCyY7ppYynGHUAidDT5zlDSMxg2fOfiExpNjCGp6ObSX9FMs2K3x3d3u9BY
         Elaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667664; x=1718272464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apHCWRIB7mRNBEtiZcbMzZM2Ta+6YdoOJz2/tCdUzps=;
        b=h9aqMaxpSpiG23i6k253LKrfQcW3OAeX/RWp18sNiptIaf+Ev1s5WiONVLR2Df6SdG
         F5RgbjAs/LtKYwNJeGMyQvB1dig+G6WyKiEwjXXaltMeqym9+ze56bAbKpG1PCAvcCfr
         ljt+vSJsYdmI8RsuWYkTM6zzNgMPiRkTeFM3fOx/UaxxYOrT9H1gWdufQOqRTyI2yfuj
         adh/F5zaBHYP298+LXHMvVA14i2cTeTgL+4HypmmT4IM7KVsKxiySCXazcNTwr/iCFd9
         pXprmssFaaRYlETQJU7Ekqd2VY2mWWaJZKymkOd4FQkzKyQp8ZbZRrs8mOS8KpAUh16W
         ArmA==
X-Forwarded-Encrypted: i=1; AJvYcCUYs3wy82XubatNRg83iJXSr9I3j+bf+Yh4vA9IeqivrlGsprc/ylBlIe8tMMbhXboWQ7ovu9nBfg5TcCX3fUkVNnKVU5qHY0gzumU4E0hWZx82f5/VcNfjSD7ziQx3JzlWjxnOcI+i1rQTQFoIIefLaS16itvEMg==
X-Gm-Message-State: AOJu0YxvsFDUA3tUppvnDfUJMRwmg0nirAZgRbFwkdD+vyAwWzpwm7dN
	f5j9se8qTJwKClIlsEDJmt90Kwt8jTZvW9jnks+pVfZTPHVpKRN7bIFDNb4kGUo=
X-Google-Smtp-Source: AGHT+IESF+hF++itPBlS+1rbKuC2h+vYSYamsDEjJaYuGkc6F/FPJuj8oyrWs28c0E+zvST8Mj8jzw==
X-Received: by 2002:a05:600c:4f84:b0:421:5352:690e with SMTP id 5b1f17b1804b1-4215632d104mr37980375e9.25.1717667664364;
        Thu, 06 Jun 2024 02:54:24 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42158148ffasm51454325e9.38.2024.06.06.02.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:54:23 -0700 (PDT)
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
Subject: [PATCH 1/2] dt-bindings: arm: amlogic: add OSMC Vero 4K
Date: Thu,  6 Jun 2024 09:54:18 +0000
Message-Id: <20240606095419.3950015-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_025427_201459_21129349 
X-CRM114-Status: UNSURE (   8.00  )
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

Add support for the OSMC Vero 4K Linux-based STB

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b39eb17abbba..0647851ae1f5 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -91,6 +91,7 @@ properties:
               - libretech,aml-s905x-cc
               - libretech,aml-s905x-cc-v2
               - nexbox,a95x
+              - osmc,vero4k
           - const: amlogic,s905x
           - const: amlogic,meson-gxl
 
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

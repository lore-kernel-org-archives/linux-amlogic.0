Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8AEC25B75
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Jun 2024 09:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QjsDsAQCAP20BiMgIKqEReOFK/PY7gSjTqjiRIy82c4=; b=2bB5+W2IpWpkiK
	ATT3c0B7NCWsZG0PMRwYgqyI0RHugYfudm7L7yPyZzQkzckLdlKxap4lejpxrdd/uR32uKAHyWYSz
	qTdXD0LGKIDj27BxO58UiDLf5R40eNQoTrY4NQlKRxyT5cyHPGaScum76Xh+b815CA6Q29QdJ5fjY
	Xp12dhKNsqV89vfBD4u2NUF3/iVZm+HHGAzlEZqyWlS6Id/qTCDDXlixAfXKwy6obDp8W/KdBUkCr
	K+6ggYcq+fdmLyFfWnaqi37Nu5X6l1z0vG8yGXrPzN0NLD9RLLJOwNwF74Lx3ful4aKP4QuVCyF8z
	zE0gIszbvTGFZlo3yZKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9gT-00000009GDk-10p2;
	Thu, 06 Jun 2024 09:45:25 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF9gQ-00000009GBx-0Ec6;
	Thu, 06 Jun 2024 09:45:23 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-354be94c874so549344f8f.3;
        Thu, 06 Jun 2024 02:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717667120; x=1718271920; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/abp3c/U8eNKudjyhDdtFs1lZxFEuDv8/SDa8wxnOc=;
        b=Yh2PwuVCJvaDgdjXlHeIF10a8m99M3oIx2bf4zQ3BaazwvZ9P2XZKBKgiu2/j+HX6k
         3Q2Vfh+TQda1xP+y0Z4eq/b8JnavEENkdJ23Xvy9ttv6aoRfR1NgrP82Mk82ebBRTO72
         1hdWCXT1YCXXuz/cCU0Xb3nUKjzZyxbsyQRFl0S+5XXh1SSfMACAzrDW09HU8QKbk2HL
         z7twl6u8FdpfS19lhyIoFS3mvqIGG47ua1f3PgnRyqR5De38DHxTMInmHQK3F2qYKb1O
         Hu8QDWqSfRNOyP6GSR7gmXoyDd4MexUNNOLXSGSjcv8EsUNFrwwIznqwz68W1gPSm9DL
         1LcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717667120; x=1718271920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i/abp3c/U8eNKudjyhDdtFs1lZxFEuDv8/SDa8wxnOc=;
        b=q9Xi8zdOzrNLJ3WNPU4UiWfXziPu6GdGC2S/s4I4KuLfyKcODX9EGtBAwKVkxuvwUR
         1vHx7W4jp9m8EpxQGlntpSjWjzBNoGxLfG4mL/6luxrLMNK27gvXVWPyeE7Ufw3S8+De
         tXqyyohSwacmVmJ9Kx7ILNuwiFKDgtsKbl3Yb10kQ2fs7hiNXdcNbT+rxXE8v8rwK27A
         xLasxKwvfEs8++3N1kmEX3bLRCND4j183WFCca9cWgDCIGGh3iiUc9rjPCVRuPWrzaXT
         yfKqWd850RH1PD71vezoQpYR4qOV8oBZ8gDPdUpWecYDSMz28khOZdu6S0NL6RkiW6Gh
         47ww==
X-Forwarded-Encrypted: i=1; AJvYcCW2svoZeBiOwSX+uG/NgS516YNh8YBbBC64emgeKsySd9NgpkzJC/BwEpur8meWjkGtgH1TuEK8vY/vPyQNv7Aah8lAujuWC1HjT0kggAkzcs9msb5FbgzyZQnG19rniN89z4RfXamOcA6vlT8vvlQ8OZg6Lkn4zg==
X-Gm-Message-State: AOJu0YzHfcGdqSVujWgL3thefl6Gc74c+azaSvKOeeeWcNHBa1BXE0NE
	1c9J/hu1hitQdedUJhPV7oWORYe0OrAqi7L5FnBKuv5fWt9QBhtt
X-Google-Smtp-Source: AGHT+IG745YuhU9aw87AU94dbf4in9m4EmzyV2/eQwRQ89ttaSUzLVoesp8NdrEDNh0TbYWm7kbzjw==
X-Received: by 2002:adf:feca:0:b0:35e:83c0:82cb with SMTP id ffacd0b85a97d-35e929c89e7mr4058570f8f.70.1717667120186;
        Thu, 06 Jun 2024 02:45:20 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35ef5d47930sm1094817f8f.29.2024.06.06.02.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 02:45:19 -0700 (PDT)
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
Subject: [PATCH 2/3] dt-bindings: arm: amlogic: add support for Dreambox One/Two
Date: Thu,  6 Jun 2024 09:45:12 +0000
Message-Id: <20240606094513.3949323-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606094513.3949323-1-christianshewitt@gmail.com>
References: <20240606094513.3949323-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_024522_120777_EFFB7E3F 
X-CRM114-Status: UNSURE (   9.17  )
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

Dreambox One and Dreambox Two are DVBS/T2 receiver boxes based
on the Amlogic W400 reference board with an S922X chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 77f8dfa86e6a..b39eb17abbba 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -176,6 +176,8 @@ properties:
               - azw,gtking
               - azw,gtking-pro
               - bananapi,bpi-m2s
+              - dream,dreambox-one
+              - dream,dreambox-two
               - hardkernel,odroid-go-ultra
               - hardkernel,odroid-n2
               - hardkernel,odroid-n2l
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

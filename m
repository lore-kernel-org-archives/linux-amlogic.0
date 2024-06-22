Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E54C27C53
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jun 2024 14:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJmmv8TtMWmBnvM38YoofbrU6Xw/pyAWpmv+lBzC/JU=; b=ipiHtrz1AeH1jc
	qA+OxhooVlrg8sh0q9yxW2RIZvULRhWhzfQ+Gz75haXNtN+jxeeyPgS865uyFV0PSAlQWP09xLqWP
	zB2lzbM0vz/gyrnrIn8Y8iM7GMb0iklImBzq6Fx+4rblg6PsnTEbUKDQd8mx/6L8/E0bVpSff802W
	WCscwxPF+ZJTNgEhMSSXc6gA945r5uSGe593XYdcYq2dQq2gbZwSWqdvaNmRLV2hp5GirULNEOyP5
	Im39KZ28vfRo+rTkUkeKCSGCNOnAykbvKlOW4+Yi/MLUtxruUrzpxnSzG+AQ6AWO0OcLIuRMNVuWp
	N3sRZ4dYbzc4UeVZ4gUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL1J7-0000000CCda-26to;
	Sat, 22 Jun 2024 14:01:33 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL1Iv-0000000CCZ7-0POC;
	Sat, 22 Jun 2024 14:01:24 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a72420e84feso24048566b.0;
        Sat, 22 Jun 2024 07:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719064879; x=1719669679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lA5SnMtVhJJ4EmNcwVGq3ZRuVABb+oRfT1B+Ka9IE8k=;
        b=CjUmW4rmHhSRYykpBGgMpBDSY0XSQAquqaqap9WPUTQ7ljkruHwhR3DRTPQmkpC7Sw
         8jDwrFqdt8jKuAUtNbJnQfkM6KfBLs3EvhS6xALOhRWGyDWff68ATc0mgnHS72L/RRHa
         nq5Iu88RSodzvbKDg9kG3F8WAZldctpc28Jdo+9CWpv+dZFni/hFsIl4onRynyMgriq+
         OVl9mi9ogKOdRWq2Vzfq92lWDGM7uBlAmaxn54XFYH8HPSsGOYE4SF7c0jq5b9QbT/6R
         E+hQK6V9ObN7VrUQYLipHNb/QvagpBtsFqWMAtsA3WtgpNHlpy8lsih3N6TJQY+XiOoh
         Js0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064879; x=1719669679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lA5SnMtVhJJ4EmNcwVGq3ZRuVABb+oRfT1B+Ka9IE8k=;
        b=X1B/m+d8aHqKkC6lxskvHKRjzD3gyARIGNu3/L8dalBmHEFiXyyAFQ4TOO7+Ut2pXl
         XgOQB2DhiQie0jyKHO11q5uU8yI5s0WQ/2m72r8rxXOuSI1ZpbkGurFMnrRQvCU/s1uw
         SYjTVLmtaVy9Y0h9liYm4jgYUaVKD3PlFxN0ZHc3AmcCCymnZxdWVFpKrPr65r7+gc1S
         WjN/cwI3dQe8EOB/zE9Me/posqnh0SyHaF1CsB0MyvQpJwrvjGo6vtKW+NQqiBbwMDLv
         h+ndpEedTotvrNk5BnzO/s4o2zUdljimuSju/xn+JFPShVnsaHiiZ6C34gJeNKN36wWN
         MBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy9GIHIYm0vAVOo8YVJAhHSr0GIw2YZSsjI4XZPBjf/L7WKtDVgfombTOx0zjxdAktjYYrSrQIrCu6bA2CH0rLX2SP8zpwfET9Mk33B0/sbqQ5SuUiTH9RXOdpjniic2QzpiQDrAkWG9fYVnBRmeOCKhncOQpZQg==
X-Gm-Message-State: AOJu0YzGlZW6IHACDA4ZiEYW4qpZKz7g6y4LrnvBtt+aQsCli74r/jQE
	d9CRayaqHODBY7OmM9rVrO29sutNYReu+QKZBAVqw6euo/XNP+5F
X-Google-Smtp-Source: AGHT+IGUV0qFTomyL/WYqqWowX4elU56jWmHT8HLyEZ8zCX2IRpIDfw86zqynqlRnnsH6M9PkbF43w==
X-Received: by 2002:a17:906:52cb:b0:a6f:5f:8b7 with SMTP id a640c23a62f3a-a6fab62a997mr798048066b.21.1719064879424;
        Sat, 22 Jun 2024 07:01:19 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf549166sm198715166b.132.2024.06.22.07.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 07:01:19 -0700 (PDT)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: arm: amlogic: add support for Dreambox One/Two
Date: Sat, 22 Jun 2024 14:01:11 +0000
Message-Id: <20240622140112.2609534-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240622140112.2609534-1-christianshewitt@gmail.com>
References: <20240622140112.2609534-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_070121_229082_BEF20D64 
X-CRM114-Status: UNSURE (   8.24  )
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
Cc: Emanuel Strobel <emanuel.strobel@yahoo.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Dreambox One and Dreambox Two are DVBS/T2 receiver boxes based
on the Amlogic W400 reference board with an S922X chip.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes from v1:
- No changes

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

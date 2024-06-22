Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134E4C27C53
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Jun 2024 14:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcqLM2NOoe0cF+ZIodT78R9KT9WkTf8+umFUox1hYD0=; b=r0KegkR5S216pA
	+cQ9nONk9aRBsp413HAjR/UclkTd9YKIdFwN/5WpuehG8Wb7iWUDQcIU77HHxbGZEcR5KGxbBeW+A
	REzNW/gOxWlAP7CbZaRz8ZQqSav1rN9ANH8bHEGRvsqMVGLbPkDFdy/MuMFoL8QAupo/zBQ7Sy/tf
	cXRbELQNOJYQNqUBvVKB8xvnfox2zHUGBEEoEkjcb1eHDeQK5jj84o2q5N+nzeEByZjE8i3/bJlId
	iyHK9C0TP+23L2dqP5cZyREQWuPPDokkalx1+ocZnjw65hg0iiI4lwJsfttZypjqDgVlvY0P19+f9
	+ylm1J1g2ETdU02dHGnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL1Iz-0000000CCaB-3S63;
	Sat, 22 Jun 2024 14:01:25 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL1Is-0000000CCYg-2pCX;
	Sat, 22 Jun 2024 14:01:19 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a62ef52e837so348860466b.3;
        Sat, 22 Jun 2024 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719064877; x=1719669677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzSErGL7EG0GwxTTihW2ZGVx7A57o+5iWBzaLRdIdFs=;
        b=IK7qCI29WihxNzTMdaGAMftEuFdYesDkZ90pnEOYsjhhHvNx8tj+DF/lVkf4rTYXr7
         3pYvT0P586IyADR9Uk+Yg/TLl6aZ4rkWtBwwqtYE8Q41NE8dWQXdrEtp+yxB1SZGvEtS
         jwllHfVQJ3Ed80eodxP1bokT0wsQ6jX7XEZUpGo1Shu9OPluN70feEpk8ipXJtTo0txe
         Le5AInzj96X0i/Zq58gtHe7ySmsCKnMFtIucBO01nYlRgCH0cEt/z6COekENbWXPUaBq
         WlKPOSkodtdhcFu0Fostzmj6ZzrMgV+mrgeqBNEkSSEpd+FatAaVQPZvstRs6AMmiDni
         m82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719064877; x=1719669677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzSErGL7EG0GwxTTihW2ZGVx7A57o+5iWBzaLRdIdFs=;
        b=lM/BRMO+S0ajr0zu3Pdy7uHJquQ2jWimQM79z36qiqt3ENDQNHbap5tAhiwVfhu8GU
         P/b/GO0Pg1e66wKmbo2gfybNV9LCIX/3WLBBQxHc05kPrKVWloehGVKNCVG8nt/KHTV/
         mEgNypuiKU8d8ogxCPu17ifkRniC+FrvlVzUYWZoisulNOt640CW6sW2Vjthx4Y1x0re
         9Z4yDFa295XGJ3P6VwHdHXPCms4t/XxM3JS6NhFBHiF8o7BlwiEcSTUN+el6eiVLDSNe
         V60U8/iasyUixR/kA17ZSPE4/ZTg9ab77pon40S5WeJ8l/eO26SEJ5fZ7si22nO7G0nN
         twtA==
X-Forwarded-Encrypted: i=1; AJvYcCU9y+L6fohsOznFeTdyJzNxSzCxhYbEupxTTeVXdSyq9j4KO277agGnraJwlfnkIim9KOj2FyZG16gGjOejd+MQyaIX4cE7W4oxLPfiGJ2+znUOCpIzrhNXwPQMCCDa+Q18avkOUxvM88SHW5cv7PNB9Fueen6EgQ==
X-Gm-Message-State: AOJu0YzVFAM4wVg12YErzMCOqm5wXMomJ/Udaa+U/PHids7QiujGmf10
	PJA31APWrp1A0nyA7eMFBuL66KESYNReTC2z9kXttCyM3kn6L9VlPyBEwllI2TM/iQ==
X-Google-Smtp-Source: AGHT+IGSzgQci76PPWu3XEOEhCJsUeaxFcspKllKriEC/thW65d45nZKtOz6piqObtlVIYUCIsxQYw==
X-Received: by 2002:a17:906:d013:b0:a6f:4e1f:e60b with SMTP id a640c23a62f3a-a7242c48e6cmr27180066b.36.1719064876807;
        Sat, 22 Jun 2024 07:01:16 -0700 (PDT)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf549166sm198715166b.132.2024.06.22.07.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jun 2024 07:01:16 -0700 (PDT)
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
Subject: [PATCH v2 1/3] dt-bindings: add dream vendor prefix
Date: Sat, 22 Jun 2024 14:01:10 +0000
Message-Id: <20240622140112.2609534-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_070118_738682_3F6148CB 
X-CRM114-Status: UNSURE (   7.21  )
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

Add a vendor prefix for Dream Property GmbH

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
Changes from v1:
- No changes

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

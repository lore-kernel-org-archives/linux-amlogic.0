Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9552BC6FD1F
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Apr 2024 08:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5tnrppXGUDSAyUoEMNeDMUkRwmq+froUlEMwOSoenA=; b=NMlXMz3wm7E/AF
	Cql8WLipLygEddtAaoi8bYdQMz1inmp/4YfFbE2LuF7OoCSOUOgc435cWDPuwd63vukLT6NvVbutC
	crj9M6KPJuq3rLIjieG8qJJMgEVnbKQPZ3uArnwSA/Om5ZBXTebHSCoxBpo8dU04MPMWgzysFGULZ
	M6qtSRw9x5emNSuj1KWOnV2lW0hAFU6a2JdDQUL9pGyl5STv8ptH5Ia1Yd3cJeh2P3sne0KrbC757
	v2a1cE7fpObQK53ioS6W8cL3BU4kQvbJ+pxwegAFe/31NchpWQR+V91MHJbrQLtPAyILxYnyp6+SY
	PSBPXU5e84pbY9s6zpdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrwIo-0000000F2Pr-1SYJ;
	Wed, 03 Apr 2024 08:49:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvKW-0000000EcoC-0YXB
	for linux-amlogic@lists.infradead.org;
	Wed, 03 Apr 2024 07:46:47 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-343620589easo731689f8f.3
        for <linux-amlogic@lists.infradead.org>; Wed, 03 Apr 2024 00:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712130402; x=1712735202; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
        b=h2+gx2Z9kakX8+G7ZkciDIkc4LFFI2AS4NzRWpayCT8ApmqCitCPdqhdF66+QHr4dD
         hGxG4zuQoTc+0gNwCK8ksx/D9n4qwzaGpO1SC1HRQt6OZk5xg3NdXQxbfVf2DX4pHYqJ
         6km2b2PVHitBGMPIGYM/9GImtFIkp6VLoFAPtMgYOEE/eoxOurGGqN6iZV5WeQZgkcXg
         4fgYGBRHycE4WkUyXJCFzU0Fd87WpGnTXrEC2YxS2ijSJqT6ZExwhKnJOJ/HAMPgoMDI
         rL+ryLRtnNHTQdLLdbQHvupAqzMdLjPBYYlypGVmRqVQ3pdXynnZoB140YwRVBcXG7GY
         o0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712130402; x=1712735202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALpBomvj7h++qduRiPAlY6JUwZx9tyV38eEVHtgwhRk=;
        b=N1ndc4uNYb/i5pSMUw8/YoOq7fCRQL2zL5wr62Nou+fx/MsfOTEiAjDa34MRa1ih5/
         VQcid1/2GSy4fVJhLIhGM+h4Y1UbL8m1M2kury5kb3/0ZlpVz5YgcNw0O5MjQ62Nok54
         yajSp7a8yQ/8zbwzX8/YH39GUd6b6r+zFAxqFRu+vHRWEdUWPh/41jUxDsEN8g7llePI
         NrpFO4E65LOHQ3FuGeJVmj/LU2xo3/4Tyk6v+FIFeeUHm2pL3QrI8woCnOKaEFDkRMXu
         zYqetHbdWlUJYA9C24G26l58LQvFDJDOuvBvbym9a5g1c+MZsmP1+H1s0u9kffNwQu/b
         WO/w==
X-Forwarded-Encrypted: i=1; AJvYcCXx26cwGM/JBhMvfD2VWXmsfnjICATbzAWvevOedWnhk5Ok/luuGvaC6PflxXz+XDKqaRiab3MtSV1VXsckBpSmoaPUBvC9zwsC3Ajz3ARDJ/I=
X-Gm-Message-State: AOJu0YxTcPheCbhC815qio+V0H/czXnq0zrvybl76TJQof4LLIeQwHaL
	VW3hVmgyD+fhgl3PM0/8t7APcamilzSkYx3mmd0sKBw8058YyP8bSCGUObM0Gi8=
X-Google-Smtp-Source: AGHT+IFpo5g4fDFTNor1Pe0aeivWgmpXOELK6V5rSuDJZCAtGNmUdkMpcWyHvS/4yOhpE/5AVNdHSw==
X-Received: by 2002:adf:f48c:0:b0:343:3538:4ee4 with SMTP id l12-20020adff48c000000b0034335384ee4mr10426871wro.45.1712130402349;
        Wed, 03 Apr 2024 00:46:42 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id cc13-20020a5d5c0d000000b00341b8edbe8csm14021282wrb.87.2024.04.03.00.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 00:46:42 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 03 Apr 2024 09:46:32 +0200
Subject: [PATCH v12 1/7] dt-bindings: arm: amlogic: Document the MNT Reform
 2 CM4 adapter with a BPI-CM4 Module
MIME-Version: 1.0
Message-Id: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-1-99ecdfdc87fc@linaro.org>
References: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
In-Reply-To: <20240403-amlogic-v6-4-upstream-dsi-ccf-vim3-v12-0-99ecdfdc87fc@linaro.org>
To: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Nicolas Belin <nbelin@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=886;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=N3wP+RQ7VRT4++7kCDqamWluNf4gtoR05YTHGQbChM4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmDQldDTI+SzRhJHYhYdxII9aDRXpw4ZQGmnVanvis
 mpDKm3uJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZg0JXQAKCRB33NvayMhJ0aIrEA
 CAjaaiTIpkxGPcKnI9vHfiZrWIDEIV5Fc17MC23AFXn9y6vUK8I6k8t8tjcY70647b9i10lUOnDW+u
 QTmTVl2J8iqRbWeZ0NUuJkvdiCgHXbuD9N3sJ6rRln1tpGfl6tzAsO1qDOmSoFxIzN3d1LMcisZ9IG
 EVOso7m5sSQYUpp1jUnx1mXDc1GS77MvuIvE7nwv1vmrkyUh53cxhK9wrFByd2ze7/fShUf2PNzW+X
 QDeYZbKG6/wq1fPfSCgK7mOS+IjpavXy8aWAIdNoKVvxK8vcv4EuGB2L7ityGXeqEu7h6CIFVQ1VoW
 oefOSy/kh9jS6GlK+SJBfSdsjHwidkgecN077CdoDspmvB0OSJTN094d0aVTTdZKLc2zbywRzs6TIz
 1IHqKljLDCfdlcuI/8tWs0x7PH/cJuXfwYZ+soy/2LONuf8tgFdVXUv0mHoh516guNw7vOry4s08iN
 IXPc1pYAakMqeuEo4oqLXAIrcZfJtQ7vNW+0miLYAa4LSP7ZzC5fcoNpik5doys5EZDbIDAJyHBnIN
 duMPHjicb1tOpnatuxPEIypWYT9DuaN5h57UxiUJ9FuDmEXZxSM8XfrmiNACLVNJmIa/j3792PWKEE
 RfyY3lIrcz8qTs59bJCSHXyezl31JWRG8Svl2gQBFRQN62IEUU7hiTBe9aCg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_004645_661855_CF5030F1 
X-CRM114-Status: UNSURE (   8.07  )
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

The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
compatible module such as a BPI-CM4 Module, document that.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 949537cea6be..b66b93b8bfd3 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -157,6 +157,7 @@ properties:
         items:
           - enum:
               - bananapi,bpi-cm4io
+              - mntre,reform2-cm4
           - const: bananapi,bpi-cm4
           - const: amlogic,a311d
           - const: amlogic,g12b

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

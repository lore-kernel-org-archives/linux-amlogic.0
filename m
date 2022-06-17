Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D9EC43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jun 2022 07:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G/v5hGOYS0yFIGwzB3Xs4r/WMZqgFAiLspP0edufkQs=; b=YVnS2FWjfZ3uca
	8ykpTSiFAgnrpKsGxDwpuIfBBpxXfk0xtjAfox1Y69mMKo7TUbu0VSfvrcSfJ/3JnvV52mYiX76LY
	IYywqK/S/UziuudaLwKiIudYPieUteroJ1RTkMPWiFNS16kHJTmTVtjp7kwtST1xSZZFdYCmWS4Y1
	CRVAnoYrm9B6xuDFxW75FRikvniqD+tmyRYTGB37/C+OIFIj6Q2xzOb9Ko7ODFZg0zCS6sutddXZV
	qX4C6x2TrKzfQpf8tsDli54aWk7z8pDTC6jV+aY3/ojUuzx00lo3KGrvcuYEVeback1jFMmlDLce/
	tJVnscF2MJEuaR44+Trw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26Zi-0061b7-3O; Fri, 17 Jun 2022 07:39:26 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o26OH-005x4e-6S
	for linux-amlogic@lists.infradead.org; Fri, 17 Jun 2022 07:27:38 +0000
Received: by mail-ej1-x636.google.com with SMTP id n20so337009ejz.10
        for <linux-amlogic@lists.infradead.org>; Fri, 17 Jun 2022 00:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RkyY1zQc+wkSzumHL/lljaTT+2/4ZERv1EN4Z7asU2w=;
        b=xERG2VxM4tcRxozPKAOVE49PUr0ZVUhCJHIGIY8BjQGk16LdIwHM+gIw5vQolLskpA
         JeM396Ryxfx+qwBxi9Geuw5JWz+A/HKj1fLrxGfnvc7PtBrIrFDD5PXTiGmC4ARJANQr
         DCKlus8fiBeKfsjDZNWOJX6XG6My5D8QsQ+xFiwSb+3sx6kDZ59nQuz+6a0AdsEgcXAJ
         h5ns4pFg7UtkY0x4MyaiAyMjXv/U6e1BDiQFGRTcd8639EL9e87Mb0yyUA5LXKBygaZU
         Q2ywaRXOvyifokRlRYhavFhFVx+p8w7n51fQTi11aJYwhCn7GK3gepLsJcEbSERzuse6
         jPwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RkyY1zQc+wkSzumHL/lljaTT+2/4ZERv1EN4Z7asU2w=;
        b=zz0oXjItZShGY8rTLGgDcvjs9ebAPPCQPIAQ8OAb20W9eHGhb4B6lQ/H9+7AYSus4J
         OeNxeMSr/C8v6pnxzcHsLMGrUug+IjnogiQYAGc+IlsAqnhPkvqzN1RO1eJTkX0JTQmW
         nQXLecAYfr0dMjsogrskgyZreRDzSbXTQvyjbJJsxvtGYFXZtvVqX2pliWqdyNY+uob4
         4MCOJTSyyQAbCIIDA1si6Zh8N8vTpBYXMg5mzmUPw8LEXWteAqdatLcYt/gAlKHq8Fy6
         tif1CiNJTRkIBBObT1OrOBxqZd9kAc1MWt4F+aoekWOV7VAONw/khkUTWIVwPcngD9rc
         eY8A==
X-Gm-Message-State: AJIora+w9/wmqyGVDdxHUHlDRq2heorlMQ4A0czN6ZAr7xRQyKeyQrr0
	ISAoprxPI634BT7NsHVPGFHwyA==
X-Google-Smtp-Source: AGRyM1skuitnOMjblYlPNwwdPN/hYdQiT4LHsSWSQTM/yaG4ViqU+Z/1sy7nX1EYlZS7F7oG10IIng==
X-Received: by 2002:a17:906:33db:b0:70f:12c0:4ade with SMTP id w27-20020a17090633db00b0070f12c04ademr7911034eja.320.1655450853755;
        Fri, 17 Jun 2022 00:27:33 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d227:8f3c:286a:d9d8])
        by smtp.gmail.com with ESMTPSA id n9-20020a170906840900b006fec56a80a8sm1762556ejx.115.2022.06.17.00.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 00:27:33 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/6] dt-bindings: display: meson-vpu: add third DPI output port
Date: Fri, 17 Jun 2022 09:27:19 +0200
Message-Id: <20220617072723.1742668-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220617072723.1742668-1-narmstrong@baylibre.com>
References: <20220617072723.1742668-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046; h=from:subject; bh=LQlD6Fu3ObIBtey05krAjcgHoTrbx+0w6dwgfJGEYig=; b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBirCyrycIYT5c95AzVhdINNgW+nDNvrU5WWX82Nd9Z I9hXFSuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCYqwsqwAKCRB33NvayMhJ0aBmEA CiyTyjR1VeKCUk6d+hM4cmyr5iuMn3U9gb5MpoCunBiqjrakoFPCMcqSVEpcqPA9x7IhaB9XJmrKwR VvYXEmIfNtFf8kUDsbbpwa1oisLAvbEw+kklacItIJ3nK2t4tLTljpQFeYgY5ZVENj0c1c49WX9GOq Q8imHKf+JzBRX+SmfOZnGnFS4GD4SqVl+Em+YSzIao68s9VyFxA+RNCv5Jblh2fB6nhJGO9DGsEvo0 NdzdM1DAwftoaVumZefuwzVpZ3stCQe8eiOLa5477MQAyrcIYm2j9dgm6iCnLQxiS5jNhhbtD6j6r0 56zOHNOzd5PIzl7nR2VPluzEs2dwqPg6hCSOfGqDnIxwB7n2pQfwYPTLkAz+TkHFcuLhgrLGV6snPV E2o7RT06OLYigLDikb31GoAF45yQKYiukBnrK51shwdGIxMywmtb1mYNIaR/Y1MPNm2hkkwAtBSzN7 hWS0VQGvG9tzqWm2fCA+qmyFUk8N2yw2hQ2eVaDkta1Un02Guw07WQl08yh8wrYqMQL/3d6cdBhkuP iEyXEGeZ63MpTInEfh+Q163dd3ujrp9JZ1GIqcr5WvjKA9rL0Br5k2NiSOSfKXyPZS9KxUglN5pR+A o2s6Pg0aBIL/dlFyVeSIvp4Y07nhY3rhAopdbKNM3mBVm6pXsNOBVI2gjnEQ==
X-Developer-Key: i=narmstrong@baylibre.com; a=openpgp; fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_002737_326177_9F97FD39 
X-CRM114-Status: UNSURE (   8.58  )
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

Add third port corresponding to the ENCL DPI encoder used to connect
to DSI or LVDS transceivers.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.yaml       | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
index 047fd69e0377..fdb42b14a099 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.yaml
@@ -96,6 +96,11 @@ properties:
     description:
       A port node pointing to the HDMI-TX port node.
 
+  port@2:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      A port node pointing to the DPI port node (e.g. DSI or LVDS transceiver).
+
   "#address-cells":
     const: 1
 
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

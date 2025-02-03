Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5BBC02192
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Feb 2025 17:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8T5lfLav9rkgNnm6s6uXUu76TViEUIR5i85gf5Hz5sw=; b=AeDqIGlYv0aBAo
	mFYZKBDx708HbCpO17DrXIQyZKPEFr+w4wmEJHzaz21VQl5kBpop5QP/HB27DzSQtFm140WYNlaQR
	sD58amqPabGbdgi5nPThj/NcF9LZWz62//rYKgHOwzbnaJmDL9hHI6wQfz8sFtVfRU+e6QNUM4ylM
	MXPEWl7lxz3Vs2BBBMb7YWmBLXISQlSHkMZWNmSeRlVHkXXcEB3tbeDTbQOrUWOJZan4w3wKRm/BG
	tkgLLV7NmcaJyS5YaN3RfMwMgUZoNftwy8g6s95U2XX7NYuqo61Nzc/0mzg+eoewey1j7AG7AuKIk
	dTRUQAjD4hBBHXUMjmYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0V9-0000000GAEx-2y3d;
	Mon, 03 Feb 2025 17:44:51 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf0V6-0000000GADe-1Yzg
	for linux-amlogic@lists.infradead.org;
	Mon, 03 Feb 2025 17:44:49 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738604685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdYSrp7Ifw9Djz6sdTXRJ3gQa8DUAzacW2HnJguzAfk=;
	b=gFHMjG8wR5tiQJX1El+bJtjdlSoKh1o/I1zo+fxv+a8wTzgN12xCqAMNPPhK21dHq6/4q8
	YZZobfrNWBWcPdPqmPafXnD0pJNEG0TBhL4X/kapPSOJHhnkocuKgJ4nB9/YW+o7EZBUu8
	BU4Xw8kbu8ORS4lRpuAmMBRAfXP+XIuhF5SCrOGummJumzi3p+oYAIgfquOIcQaAJlKlrE
	qCIFNDnTgyNiDKr/s3NWcwtPSjYBtcg8WSSqpQyVWjiKD1FHSe9z0u00Xi6QoDDH3fMjCr
	F2kxqW5hZrEtTlFbF+iTRCwWYwSBslgwG65aS3Lt7OTtoiXm4wawY6Alyg41gA==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v4 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
Date: Mon,  3 Feb 2025 17:43:45 +0000
Message-ID: <20250203174346.13737-2-funderscore@postmarketos.org>
In-Reply-To: <20250203174346.13737-1-funderscore@postmarketos.org>
References: <20250203174346.13737-1-funderscore@postmarketos.org>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_094448_565672_9D5A4D6B 
X-CRM114-Status: UNSURE (   6.43  )
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
Cc: devicetree@vger.kernel.org, Artur Weber <aweber.kernel@gmail.com>, Karl Chan <exxxxkc@getgoogleoff.me>, linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, funderscore@postmarketos.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae..3403362e0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -73,6 +73,13 @@ properties:
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
+      - description: Boards with the Amlogic Meson GXL S805Y SoC
+        items:
+          - enum:
+              - xiaomi,aquaman
+          - const: amlogic,s805y
+          - const: amlogic,meson-gxl
+
       - description: Boards with the Amlogic Meson GXL S905W SoC
         items:
           - enum:
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

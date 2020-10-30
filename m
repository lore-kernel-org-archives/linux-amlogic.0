Return-Path: <SRS0=7VJA=EF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 478F1C4741F
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:37:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 704622076E
	for <linux-amlogic@archiver.kernel.org>; Fri, 30 Oct 2020 14:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yU/Vjs/Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PKvJHqcN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 704622076E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PDz5j0PqdMIf61gSJjGwV6MRg2FCT6DHKzbdMJeWUn4=; b=yU/Vjs/QS1284XZsGwMrmvTdV
	k3RLn9tsZx3x4XYOD45Pjml+etzP/fv5ifYWkrPgkBw7JTjHt6O/2k/GElTN98yxRuOWeTyFmCqkp
	j7N7jCe+2SLKum2HzvZAGHJPm760v7thOU29saxMCWjzwIeBSCORT2NV3O6ZckCRZ9VPNch43B+Aq
	cW9Pp9gAYEHgtKIx1pV/Qp8QxI+o33Va17rOyuxKJDBUDwAMr4gz6MPi1o2/nOADCOsx3nrC2l1Nn
	OqErhzcrat0DkSpLB5W7SPU4QZrJgCyM5c0NOHBgrIP2hKd04nVWKAiRW1DwSRTBYEANdNKLmYK6k
	T8kqg3muA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYVX9-0000MM-25; Fri, 30 Oct 2020 14:37:39 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYVX3-0000K3-AW
 for linux-amlogic@lists.infradead.org; Fri, 30 Oct 2020 14:37:35 +0000
Received: by mail-wr1-x435.google.com with SMTP id n15so6750056wrq.2
 for <linux-amlogic@lists.infradead.org>; Fri, 30 Oct 2020 07:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
 b=PKvJHqcNYdJW++F0cK3QdV1zjaBzxTRCv5vhX4WWc74HsnkNOW2boPcbIEAfum+fBi
 B/P5FaDTDLDZChtNdf9wwJl4BVBpNRTymjwisnPGtxZZDgV+bZdti6RZ05YHlxPId9ZW
 bW8JMK6AHibUdKa0nvDqmyyGGx6BeCS5UC1BKuOwbaX3kUDdL/qsiiVX2a/q6m4CmnXp
 SSHXiEZZD4rbLZGzwGrHP0BGY4oJzENhhdR716+8wI3YGc+oK9Kp4UcT8M7YNlkvwCvj
 iotghBj+ZqloR71rF4GFxqcpz/owyfaaF4Jjpwujdp6oJIhgcPQiWk+1lhsMJkwh5B08
 H4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LzZh3XDG0mukcB0i6UGoQqeuQTlDt+ZadapYwoHki6w=;
 b=AMNzbTjkvT3XZoVt678b5aVST2N/jCJ3rd8pdE1PcSL48/jGyUejXt+622G0kv2Tlb
 +Y+et2FZ59fKfzqYKynXLFPIL54eZZRP8ikg0S0W/hdZezsv9hHMs1GkSnKR7fekQNHf
 KAeAS0Wnjvm3t5+dChXfa5cFVC1XgNCnSQcKhSb7XQ9yVfvbKrqMcGSvuLYAq4Bpm1GX
 ofwSB/rfjhbY9S1roJkOAsQ3j98T7P1/i7PG+GdoCqx2D42FVxF6kofEQHfzw3Roc0TE
 DgqcTDXEbmVRiwABp9unSlpLOiJCMDvRv8JhdtDldRhVYPfug776Fr8/+Z9Gk7q178qR
 s3Mw==
X-Gm-Message-State: AOAM533dmb08Dj+3Cm3k33LsgN6GcN2bqxb6OntAEm1dtnnasKXnciru
 jCn4+K77G2jRs8Lcy+LOmT3fSw==
X-Google-Smtp-Source: ABdhPJwfmKHE9tpJbPP/m+MZUzeVqC6HJIZFOAipny4H8X0b0Mu1A+//qbtSHVOIRt8w+qwQ/uSX+w==
X-Received: by 2002:a5d:4747:: with SMTP id o7mr3689083wrs.423.1604068651798; 
 Fri, 30 Oct 2020 07:37:31 -0700 (PDT)
Received: from localhost.localdomain ([37.172.114.188])
 by smtp.gmail.com with ESMTPSA id y200sm351481wmc.23.2020.10.30.07.37.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 07:37:31 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: hverkuil@xs4all.nl,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/4] dt-bindings: media: Add bindings for the Amlogic GE2D
 Accelerator Unit
Date: Fri, 30 Oct 2020 15:37:12 +0100
Message-Id: <20201030143715.577641-2-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201030143715.577641-1-narmstrong@baylibre.com>
References: <20201030143715.577641-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_103733_529598_DE035A0D 
X-CRM114-Status: GOOD (  14.12  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GE2D is a 2D accelerator with various features like configurable blitter
with alpha blending, frame rotation, scaling, format conversion and colorspace
conversion.

This adds the bindings for the GE2D version found in the AXG SoCs Family.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/media/amlogic,axg-ge2d.yaml      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml

diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
new file mode 100644
index 000000000000..bee93bd84771
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2020 BayLibre, SAS
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/media/amlogic,axg-ge2d.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Amlogic GE2D Acceleration Unit
+
+maintainers:
+  - Neil Armstrong <narmstrong@baylibre.com>
+
+properties:
+  compatible:
+    enum:
+      - amlogic,axg-ge2d
+
+  interrupts:
+    minItems: 1
+
+  reg:
+    minItems: 1
+
+  resets:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    ge2d: ge2d@ff940000 {
+          compatible = "amlogic,axg-ge2d";
+          reg = <0xff940000 0x10000>;
+          interrupts = <150>;
+          clocks = <&clk_ge2d>;
+          resets = <&reset_ge2d>;
+    };
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

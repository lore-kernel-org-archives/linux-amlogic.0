Return-Path: <SRS0=kcVe=53=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A23EC2BA2B
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 16:57:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C88C2075E
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2020 16:57:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pmsPcFK4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="RWrw26nq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C88C2075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oRVuZRpmPjiGs7qxEpDijBkgwOY9npq8yY9EMUOsyOE=; b=pmsPcFK4aRaEh6
	jAsMnQLurZDY20cqk1WcpuPOzvoeP6iiDx+Lcg+vVangqWW8H12i36QiqXH1riTlG3nuH8yoT/a7Q
	F0+JSpsdqYJAX+j1fRFOQJYTcdwSnjvYI9+qCrvZ9e0a2nTmDIn0UlMe5HR9vZ46L+nR+nWMwmXhd
	Jx4VODUBHy8HYBnk7yLtex5O3u+TZ1DCRKL4L7ubM+R7sufNy8QRyaTxoNX3nEd5wlorN6BdzAMeU
	Hk1ZqUHjYTPQ/VmnMaQJLKTnXi53jVVrGYEQp43vptiobXG/y0ST6iWkzXHnmUpFNpqEDYfwdZ/gk
	u8DSB+sMB/PP8/s8C6lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jNJRk-00015I-VX; Sat, 11 Apr 2020 16:57:32 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jNJRi-00014X-GP
 for linux-amlogic@lists.infradead.org; Sat, 11 Apr 2020 16:57:32 +0000
Received: by mail-wr1-x444.google.com with SMTP id h9so5595810wrc.8
 for <linux-amlogic@lists.infradead.org>; Sat, 11 Apr 2020 09:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHtQD/meuXaYe8UaCWq5ou0S7rpgnlSgQuuCrxXrgqE=;
 b=RWrw26nqS4KT9PlkFPDn2JxIpRqcyPHhXMFaV2xV/LRA5u0k8ivXmdSjtFyCEqZfs/
 w6d951CQrL1mkIvQKsxH9o9MjSCclbzSWvG8mH72tmFcKpKfRqa3g1YP8QzUIoSPuWRl
 VfC7wxNrZMh142P0OaR5q4xJ3A8rcTAIzhZSXShlqTSlELXp0V+oV4zQjnrmXwL8gBp7
 8Iy1gSh8L065we/ErvRTUYKpFeXymglr0A96fJfQmniKcFkQnfRxAr6e07HealZfhgrm
 H0r7FiZGM1Np9CXQUXmq3rMU4WLM/x6xnx8oh3NXwpxvXewCfyiF5eM6LzfF1sZdS2hU
 IflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XHtQD/meuXaYe8UaCWq5ou0S7rpgnlSgQuuCrxXrgqE=;
 b=CFBFO6hbfNc/Oau8Qx+IYcTrvfqJOP30y5Pm0sWeJFsohKA2mM7BC91fwP8rSvwnsX
 Jj1iVMF8aEd6Ke/TZge85kOhDlFb6VM3aWuuQUZBpoJKejfijRBSMPBP5VrvhPAMJ1zA
 SBrTmmkHjn2cjbIeSik212BqDsRPi6kZ34aPxN5jXy0EF+MOSHxCXmBGzUpxWmUdc33K
 ksDYK9y8Kp+ky2UqNJUGIwLGeDX1DQ/DFa2hI+cKTNDzt0uHVE15r6y5XlpjlBy3dW2+
 FUC8f1EviK4UJ7/bpne7/WGXaYbsBobOZCeRI3D63Bn1iMhfwbZdF2ZghBraZylKIucj
 iinw==
X-Gm-Message-State: AGi0Pub5CLX23MZM+JGTXeAMi8ljGhytLq40Lgn0sQLuQKUlWjDx1Oar
 dJU/CBQitdPHThGAH/ryepA=
X-Google-Smtp-Source: APiQypI831li2YGPKN/VZUe6xPsQn9Sks+evd0nSUfRQDu+keljhtZbYvFFAXX996GgtLV3jKygrbA==
X-Received: by 2002:adf:80af:: with SMTP id 44mr10792605wrl.241.1586624246453; 
 Sat, 11 Apr 2020 09:57:26 -0700 (PDT)
Received: from localhost.localdomain
 (p200300F13710ED00428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:3710:ed00:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id z11sm7781992wrv.58.2020.04.11.09.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Apr 2020 09:57:25 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: robh+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Subject: [PATCH v5] dt-bindings: gpu: mali-utgard: Add the #cooling-cells
 property
Date: Sat, 11 Apr 2020 18:57:00 +0200
Message-Id: <20200411165700.1576314-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200411_095730_570226_E568894D 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, Qiang Yu <yuq825@gmail.com>,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The GPU can be one of the big heat sources on a SoC. Allow the
"#cooling-cells" property to be specified for ARM Mali Utgard GPUs so
the GPU clock speeds (and voltages) can be reduced to prevent a SoC from
overheating.

Reviewed-by: Qiang Yu <yuq825@gmail.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
Changes since v4 at [0]:
- Added Qiang's Reviewed-by (many thanks)
- re-send because I missed the devicetree mailing list in v4


[0] https://patchwork.kernel.org/patch/11448013/


 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index f5401cc8de4a..4869258daadb 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -107,6 +107,9 @@ properties:
 
   operating-points-v2: true
 
+  "#cooling-cells":
+    const: 2
+
 required:
   - compatible
   - reg
@@ -164,6 +167,7 @@ examples:
       clocks = <&ccu 1>, <&ccu 2>;
       clock-names = "bus", "core";
       resets = <&ccu 1>;
+      #cooling-cells = <2>;
     };
 
 ...
-- 
2.26.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

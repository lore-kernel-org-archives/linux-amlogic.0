Return-Path: <SRS0=3i0R=UH=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31D7C28CC5
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:04:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 825C9214AE
	for <linux-amlogic@archiver.kernel.org>; Sat,  8 Jun 2019 19:04:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Bbu3QNSJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="QZjMrwAW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 825C9214AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zn5IleF41sCPBI6Icx4RIwBsQGMim/WqKcFlSS+QHd8=; b=Bbu3QNSJ76OxAZ
	D4jSg1z+Qj/jGK1VbjOfJ7tVmDockx/C8lE45tLPnwum7uTPgjdmREJqBArCI99j65z81dqfG3AHw
	tcPYtJmAHMoF6U2UwkomyvPH2aj0eSw7Dk9mmWEuBNhPn9Trd3ZSQPwlm4jSr4Bh8j7CuTpsp2Ob4
	pnEQsV5w1Oia8TbStQtoLHrA0ndYIpzxWZzUxH0r4+M5OH8jr94Ghfccd9N+jQoTK4P2oiW8LnN+K
	pNmHlIgpRaAi6aFCWXO+Ro5gm6ApLgRop4LLv1QK7GxwIbHEhGZcgw+SMId7cfcH2A8+m9pTSsTC7
	NUZVImLkORTykO6lHIQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hZgdm-0006sc-D7; Sat, 08 Jun 2019 19:04:34 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hZgdX-0006f2-M8; Sat, 08 Jun 2019 19:04:20 +0000
Received: by mail-wm1-x344.google.com with SMTP id h19so6291214wme.0;
 Sat, 08 Jun 2019 12:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hdxuEQn0STw1aQ9FCTiwldIwv18/WN0vzmjlgvEyWyw=;
 b=QZjMrwAW7hCZwc6hnQh84HpuiO6yrbow8vNYRKpEE9KI7iw2G+ykJX1PMWWU+N9jI9
 a00fgOVApYpMeyzxjRQa51vXYSakp8nSwddIhyGxS9Vne08/vL9jAlDJWGXOi5Mdrnaz
 fiIoCgRYSEHi7JkMwRRHlpIenmBp+axyv7i4vXoE+0hs9gW6n9jrQuppbmxf0I+83jLm
 p0u/IAtMr+I/DrmRLl6hIp3Vu4xIAjEAMzt2XVFtFmYNZxr/HoeZ4eQYx/fnpNd1DTRr
 yfy/5vG9azl+hA701qnzFjRvnShlwivzTzzKbEKkFNf82stauX/Q57AqkWLbWavRxlxN
 oMUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hdxuEQn0STw1aQ9FCTiwldIwv18/WN0vzmjlgvEyWyw=;
 b=pSCh/8JB/rd90Vhe4uf7bqVhj3fMMHD4p4yeXEt7oLR1i0h9+VYfig+Ed9FBFPik5t
 6wIKxXi+vUaVAj4YenT1D3zseLJLDGz9HjT01u+xX2VJUnuRF9qZQYfkpopbDwexaMxt
 j0b8MZXjCU9DWL++n44Bs/ZDGwDR3VhtKxwINVAw/hwiuTJGQTC5kYDjOdI65aeXFAI4
 HNbxn1CyAa3t1U1/ZoKwnYNu6iBycrUc589gKpiH246asMhdWSLs7GaclaR+auitCw4u
 r0gWwHnwGoOvLge8/0ukAdS95kDpvxNZ39HHfXs8/GVuPg3lHDmnTvhOx1/wukFpZ36A
 25ww==
X-Gm-Message-State: APjAAAVYk2lL9GEqb7GzqzwmAFok2PqPMCDqfqzIag09jV7CF7LJrWiu
 17N+F0NmsaXMU7o4okXvcew=
X-Google-Smtp-Source: APXvYqyk9WF0R161lhx1mz1DHCVnXYdH0tEiA9AwdCPfVQqF2JAODnTvW3Gp+I/yuDzam//4iu5drw==
X-Received: by 2002:a7b:c8c3:: with SMTP id f3mr8372277wml.124.1560020658223; 
 Sat, 08 Jun 2019 12:04:18 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300F133DDA400D12EFF43FED1E981.dip0.t-ipconnect.de.
 [2003:f1:33dd:a400:d12e:ff43:fed1:e981])
 by smtp.googlemail.com with ESMTPSA id t6sm5655062wmb.29.2019.06.08.12.04.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 08 Jun 2019 12:04:17 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com,
 robh+dt@kernel.org, mark.rutland@arm.com, khilman@baylibre.com
Subject: [PATCH v3 1/3] dt-bindings: interrupt-controller: New binding for
 Meson-G12A SoC
Date: Sat,  8 Jun 2019 21:04:09 +0200
Message-Id: <20190608190411.14018-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
References: <20190608190411.14018-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190608_120419_720869_D31D9D72 
X-CRM114-Status: UNSURE (   9.64  )
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
 Jianxin Pan <jianxin.pan@amlogic.com>, Xingyu Chen <xingyu.chen@amlogic.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xingyu Chen <xingyu.chen@amlogic.com>

Update the dt-binding document to support new compatible string for the
GPIO interrupt controller which found in Amlogic's Meson-G12A SoC.

Signed-off-by: Xingyu Chen <xingyu.chen@amlogic.com>
Signed-off-by: Jianxin Pan <jianxin.pan@amlogic.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 .../bindings/interrupt-controller/amlogic,meson-gpio-intc.txt    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
index 1502a51548bb..7d531d5fff29 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
+++ b/Documentation/devicetree/bindings/interrupt-controller/amlogic,meson-gpio-intc.txt
@@ -15,6 +15,7 @@ Required properties:
     "amlogic,meson-gxbb-gpio-intc" for GXBB SoCs (S905) or
     "amlogic,meson-gxl-gpio-intc" for GXL SoCs (S905X, S912)
     "amlogic,meson-axg-gpio-intc" for AXG SoCs (A113D, A113X)
+    "amlogic,meson-g12a-gpio-intc" for G12A SoCs (S905D2, S905X2, S905Y2)
 - reg : Specifies base physical address and size of the registers.
 - interrupt-controller : Identifies the node as an interrupt controller.
 - #interrupt-cells : Specifies the number of cells needed to encode an
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

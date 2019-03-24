Return-Path: <SRS0=t5ee=R3=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3A0C43381
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:12:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 873F2222C4
	for <linux-amlogic@archiver.kernel.org>; Sun, 24 Mar 2019 15:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f2kxsT1p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="VEk475Mg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 873F2222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PvfayI77I+QqV1awxhkrwCSwsktCvoNUe8+L0qOFFaw=; b=f2kxsT1pTIe+Dl
	Z1korg+TS01QWZ2P0CTcb4N/9SQgH1Dmn+Ix5p1a9vYw5329QcJ9b/4KpSGE/Sf3DuDq3HTuKLN09
	HxKzTB670W1HB+wlzDvx5fCibk9m0JkSqqAlDrE6TJkMVmFkDUZykMcNyFTAVK3ElmpXse1C0pxU5
	fO44954w2znHFSduNrk20c1lCpNyWMCflQhqZWLEkcw7ulpQD6y8452wBM+9ywQDNrJ2UCXMXEcbN
	T3oDS0q9IbTXdDBOG9SS0hdgbsuMax+q6AYpS3nsQafY0vC6WX26OKZQ2yMGjISL4cntAHHu4IQYK
	FudnspH3JU/7AhHSvhXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h84n6-0003cu-VR; Sun, 24 Mar 2019 15:12:04 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h84mi-00037j-MI; Sun, 24 Mar 2019 15:11:44 +0000
Received: by mail-wr1-x442.google.com with SMTP id y13so7325166wrd.3;
 Sun, 24 Mar 2019 08:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/aX+bb8PFceeKnvljRRNWRZVPF9zpndQkTw/LqXznMw=;
 b=VEk475Mgy7dLwJk30j06KI9541LPbsq8gvsrWCdXCZpPYZUS0Wtg6M2j0/RS68li/v
 RTvKOhrNLE3VnmOCWPNk6j4GcKqo2wsdc6PI/nGZmWPBegFy8tnSULpVXtFYKZCZ/M4L
 B16um84ARIIDSa6jdw3hn/O690DhMuwJXkW4kaB1eBzQ3WcAlzbN0i50tQPZjuVVVyJa
 2dSTgx31QNj/IZEdQ7Bw93HaUNV1EBH4LLBeohUdMxA5ZbyUTxRnIW7M/fA27BF4u5yM
 kBPiMmIg++r7WPyCM+U+j/YoLBBVUgc3baXVdAd/v56VDW+dwMDR8Zg4NiiYvqja6B5x
 SG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/aX+bb8PFceeKnvljRRNWRZVPF9zpndQkTw/LqXznMw=;
 b=Eob1XElf+/GtU5sVQTToCm+AISdLRI9nfS8ggAhlIKgGlByqxWQ6zSpAB0cIaejw6v
 zddGkr0SwbvQBNU1VKyPrRq9REYAhtxr0T/EamJizMF/jJ7801AyudrdNVZiXf0n7a9K
 oKzohkyxnYRPAnM0HIFb7FWsHDRtIc63CufANWYNDpKO6AG0zskW43Q4p95eqfr8jXuk
 RwoVJNixlAfmD/q7lWOS1XqS779s367n7Hq8y5Xn9lQCri90PDXoZS8K3Dusmj+kYg2b
 4rrZVfLBUoBlMF0U7B/DXtN7HO3xOdPT6xp0XscZa/daWGIPI55zMr/blxlVPp0mnxJX
 xzxg==
X-Gm-Message-State: APjAAAVTRuebkD0ukTg/YhFyNT3nHiJa6MhmPEPTLmPpKUJgpovAnKR/
 YGkdn/2z0tKfGyR5MmrdUgI=
X-Google-Smtp-Source: APXvYqxScdwrM4eIEsBPhkRN5sSNAwwKtmhAIR2fLlKj8HN8jHEN5luPKHUVA8y9/ShP4v4ACpzGfw==
X-Received: by 2002:a05:6000:1286:: with SMTP id
 f6mr12715748wrx.93.1553440294374; 
 Sun, 24 Mar 2019 08:11:34 -0700 (PDT)
Received: from blackbox.darklights.net
 (p200300DCD7399900428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:dc:d739:9900:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id 66sm13697730wmd.3.2019.03.24.08.11.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 Mar 2019 08:11:33 -0700 (PDT)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v2 1/4] dt-bindings: clock: meson8b: export the VPU clock
Date: Sun, 24 Mar 2019 16:11:01 +0100
Message-Id: <20190324151104.18397-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
References: <20190324151104.18397-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190324_081140_739803_3F446D8B 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The VPU clock is an input the the "VPU" (Video Processing Unit), which is
one of the components of the display controller.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 include/dt-bindings/clock/meson8b-clkc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/meson8b-clkc.h b/include/dt-bindings/clock/meson8b-clkc.h
index cd11628f50f8..2ac9469a1c27 100644
--- a/include/dt-bindings/clock/meson8b-clkc.h
+++ b/include/dt-bindings/clock/meson8b-clkc.h
@@ -107,5 +107,6 @@
 #define CLKID_PERIPH		126
 #define CLKID_AXI		128
 #define CLKID_L2_DRAM		130
+#define CLKID_VPU		190
 
 #endif /* __MESON8B_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

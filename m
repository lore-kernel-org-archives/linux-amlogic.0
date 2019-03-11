Return-Path: <SRS0=n5rD=RO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6F9C43381
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:52:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E10F12086A
	for <linux-amlogic@archiver.kernel.org>; Mon, 11 Mar 2019 10:52:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="M3EzkT8x";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="DT5flpFw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E10F12086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVfhQA8PyZ9rgNkkjrX4JB3PIbgaLWlkme6J5+lvhEQ=; b=M3EzkT8xf9bRh6
	c5314v0GRDpjzlsrZzFvcelxweckQ2LMmPnJaqBUBY/j+IM0gVbQYTSYSXLBGOSotK0hRd7zYGnqf
	3efsoKsyKFAEv1mdLWLxyTHzdBowSX/SFOGZdJ7iJGntqotUCCyM97R9dZ+LM+J4uWAgLm5I/EcWJ
	2dRKGHIhmgVU3j0ALnx/qz0lHxeRFANpRFl3+PGCcUr98BGTl+PgaGnXwdVPzKmE4cSzgPDmQk+A9
	y8CtUypl6FtKaIqR1dYMrouybLgjqaxA1VbnicpWcwa2GfC628Bo3Ho1ZvJf5qJo0ttDdX//2h6GC
	tSwg/HIPVYCKj/wqKifg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h3IXK-0002bD-8b; Mon, 11 Mar 2019 10:52:02 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3IXB-0002PA-0x
 for linux-amlogic@lists.infradead.org; Mon, 11 Mar 2019 10:51:54 +0000
Received: by mail-wr1-x444.google.com with SMTP id i8so4544098wrm.0
 for <linux-amlogic@lists.infradead.org>; Mon, 11 Mar 2019 03:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/qPZJ9y7I83wmDLxVKAEdGxN22MAvtf/M0ZxQoUgaFI=;
 b=DT5flpFw57egQ5UUul7uBSZaXmDq28HIBP+nnDSeL6yfseI8bJNPZl9lUN/husao6i
 TMKWFhosDHAUsVtLZalThSjSXd23rFwsIfw1sgmFdn+0Qdj6cKIXlIvO2IC/UPk3t5eE
 6fPsZZf0ZUN/uFNoXAZbR19iI2XcFAzFvojs0EzGzxIFrM5xTfAz8ZZggqmntDwIDG1t
 aw6TlCBkMv12Uqh+uo5ZN7BwoDcJKnqqRbH4TCYpr62Kz9WZsnQ5sPBltfrTzT05q88K
 ueiNN1+GXG9mlV/if5YnBnA22AQLFyagfo7hh7uHSs4E//TqbRyQwaXgnfU8ns6cyRfj
 m9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/qPZJ9y7I83wmDLxVKAEdGxN22MAvtf/M0ZxQoUgaFI=;
 b=LMOJF5TpyCfJ9HD0SnfrBnbs9breVdP9n8h8yFftDyXWkq1nmxYxrG2LDSCa7Ue//D
 CTojsnUpxoknL2Q/eax80/xvB+bx1KyZc2TBxmwLy4gbqn3fIUywmhpTy61DlZTOifRQ
 WFrfRjuGaV4+dikLIQAa7lmY648OyGgGm+SjoTKNluToLgLqOGT8ltqeiWWos0vF53Ph
 pnP2ZXgevtieMz+4APySSDfo9m+jCsZfimHnuH3XDf/D8AnH932x2+z3svZVuocmIQ93
 xcQps+M/yUHlU06NfLAiVMBJk7uEGLaZW8ymd13Q/z4A6cTVUjoUGzb57PigGTJ9O+oQ
 rnLA==
X-Gm-Message-State: APjAAAU9MbzaSl4/LX4wGxSOjGj9oRmVQxt+Oac02mAqb1yF3ovbFVv5
 duUUnFduXSScfEyd6bZb1RHa3w==
X-Google-Smtp-Source: APXvYqxFU9h0O2eocnzVNl5VKam3j7xcr9ndLKPHrimBVP7g+5gE7CP8S0LRSCDuJXHWaTiW+qYg/g==
X-Received: by 2002:adf:db44:: with SMTP id f4mr2841183wrj.31.1552301511727;
 Mon, 11 Mar 2019 03:51:51 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id c21sm6902640wre.35.2019.03.11.03.51.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 Mar 2019 03:51:51 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH 1/2] dt-bindings: display: amlogic,
 meson-vpu: exclusively use amlogic, canvas
Date: Mon, 11 Mar 2019 11:51:43 +0100
Message-Id: <20190311105144.7276-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190311105144.7276-1-mjourdan@baylibre.com>
References: <20190311105144.7276-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190311_035153_072362_BFE8D657 
X-CRM114-Status: GOOD (  14.06  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

When the DRM driver for the meson platform was created, the bindings
required that the DMC register region was provided.

Through those DMC registers, the display driver could configure an IP
called "canvas", a video lookup table used by the display IP.

It was later discovered that "canvas" is actually an IP shared by other
components than display: video decoder, 2D engine.. and that it wasn't
possible to keep the canvas code in DRM.

Over the past few months, incremental efforts have been deployed to
create a standalone meson-canvas driver [1], and the DRM driver was
patched to optionally use it if present [2].

This is the final step of those efforts where we simply remove any
control over DMC that the meson DRM driver has.

Please note that this breaks compatibility with older DTs that only
provide the DMC register range but not the amlogic,canvas node.

[1] https://patchwork.kernel.org/cover/10573771/
[2] https://patchwork.freedesktop.org/series/52076/

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 .../devicetree/bindings/display/amlogic,meson-vpu.txt        | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
index c65fd7a7467c..419444e2b4d3 100644
--- a/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
+++ b/Documentation/devicetree/bindings/display/amlogic,meson-vpu.txt
@@ -60,15 +60,14 @@ Required properties:
 - reg: base address and size of he following memory-mapped regions :
 	- vpu
 	- hhi
-	- dmc
 - reg-names: should contain the names of the previous memory regions
 - interrupts: should contain the VENC Vsync interrupt number
+- amlogic,canvas: phandle to canvas provider node as described in the file
+	../soc/amlogic/amlogic,canvas.txt
 
 Optional properties:
 - power-domains: Optional phandle to associated power domain as described in
 	the file ../power/power_domain.txt
-- amlogic,canvas: phandle to canvas provider node as described in the file
-	../soc/amlogic/amlogic,canvas.txt
 
 Required nodes:
 
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

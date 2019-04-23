Return-Path: <SRS0=V5Bc=SZ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3B07C10F14
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:16:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9663C206A3
	for <linux-amlogic@archiver.kernel.org>; Tue, 23 Apr 2019 09:16:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Oq09qLdx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Lab7Tm7n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9663C206A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNK66OeBMCMCydNd3jke8UFuhJCKyXS+UBldqllaKiY=; b=Oq09qLdxFPoU68
	sz4/mEBbvzcTdu83NMMEfGZoKWd/Ce6sXTNE49/snpbN4tCmk/p0dUxqTdgtkl/Lr0TSeBmJB7ISu
	67TSQGtIyEDWAf1FHeDlf0Bdz0aixkILo64rOBqc62Hq9140aOZAMQQUUvB8NAmCsW9Q8f40RV9TN
	rFfVu2gyIIamGk9/BxybZgvjVD0C1c+0M7OfMSTc3aZh9qihMOv2stAGCrksyCStoLgjwrdySaN0Y
	3TEXrngR4JKzEiiUnSCui8aVZXEtPYUS4/N9XyclbFDhtbJ6nPxHMbHR25BGkvZDmSElXCpnQDG9N
	1pqIsqUpCgqPJ3K3aFmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hIrX8-0003yf-Gv; Tue, 23 Apr 2019 09:16:10 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hIrWE-0002lT-2e
 for linux-amlogic@lists.infradead.org; Tue, 23 Apr 2019 09:15:19 +0000
Received: by mail-wm1-x341.google.com with SMTP id 10so1270241wmk.0
 for <linux-amlogic@lists.infradead.org>; Tue, 23 Apr 2019 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EC6v0kUAyj/2brMf9x5R3hSBJyp+HfoUAkCNqMMNaGo=;
 b=Lab7Tm7nF9QRs6JBbo51tx+bcO5b4j2yDygfjjpYi+XjeGi0JTEI3bbic6Nt77CpvJ
 Ft27qMsxK/DXYPaEAwodn7V2vUFWvxMOutJ6d7RK/7pjSpfn1hCBUeCKsqZ+A1CjQwP4
 joJn6Qswevb2g6wrRjhwZ2xRI1HhLI2xWnGJkpj/zGijaj5u4qBX57nZGAGHmxFv/qx0
 WclxwHEKLhqpLXa5xnODHnifxraP/KDX9G3qnVEnqVqVybCRdYZQEjk2bwO1VwJYzkwd
 OwpK0mNtRqw4oKTAkp6ShwqxzgRzouhrM3ol/7xUmGb9eNFSgxnlK1w720UDKdWizAiD
 yCdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EC6v0kUAyj/2brMf9x5R3hSBJyp+HfoUAkCNqMMNaGo=;
 b=hQH4fMBL0KFzppIkgKMS7fnFPwyxHhH53GK2jMhaeK+Q1OIUNYjIQb51WjVloAGbbu
 PJjTEFt1zZt/v0ATEb4sXTaZdYezqutv+RBcaVOT8197qfGwEKM4H1XKM5sKysGJ9uN5
 i0fYCJgUeEoCNwbBY+J+95TvhF8/YEt0HCJk68l0OtBu/zHBvzhgZJpCd0wzKjily526
 NxrchHJ5Bmkk1ZgJphlz88KHKUuxKwkLajGCNkVGwj7H0kKo0QnJQl76IjfKTVajsFa0
 /xjFfC7VPNi5vrmE7QR74NpSeoAVTNBvbHF4OUiz+YyxIVpLsywRVbYpd1E+SY8OWgwp
 0ATA==
X-Gm-Message-State: APjAAAUJGiY29j0taPCqhcHZBN5uPOM3q7Qjirh/Q40u0SuBXmg5G+61
 CC2DyN+eCQdA4EBt4T+mh5kIEw==
X-Google-Smtp-Source: APXvYqw+xNP3dzeZOjMjukP4lbpIKy8d0ouYgm4rGBsLaMjZvgWtx2MuJn0e1dY1LrkUXGLUnq+50g==
X-Received: by 2002:a05:600c:220b:: with SMTP id
 z11mr1483409wml.73.1556010912638; 
 Tue, 23 Apr 2019 02:15:12 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id t17sm12241272wrr.26.2019.04.23.02.15.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 23 Apr 2019 02:15:11 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: khilman@baylibre.com,
	devicetree@vger.kernel.org,
	jbrunet@baylibre.com
Subject: [PATCH v2 4/6] dt-bindings: arm: amlogic: add G12B bindings
Date: Tue, 23 Apr 2019 11:15:01 +0200
Message-Id: <20190423091503.10847-5-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190423091503.10847-1-narmstrong@baylibre.com>
References: <20190423091503.10847-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190423_021514_387829_3E82EE33 
X-CRM114-Status: UNSURE (   8.21  )
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
Cc: Rob Herring <robh@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add compatible for the Amlogic G12B SoC, sharing most of the
features and architecture with the G12A SoC.

Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/amlogic.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.txt b/Documentation/devicetree/bindings/arm/amlogic.txt
index 061f7b98a07f..94bbcc646e10 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.txt
+++ b/Documentation/devicetree/bindings/arm/amlogic.txt
@@ -61,6 +61,10 @@ Boards with the Amlogic Meson G12A S905D2 SoC shall have the following propertie
   Required root node property:
     compatible: "amlogic,g12a";
 
+Boards with the Amlogic Meson G12B S922X SoC shall have the following properties:
+  Required root node property:
+    compatible: "amlogic,g12b";
+
 Board compatible values (alphabetically, grouped by SoC):
 
   - "geniatech,atv1200" (Meson6)
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

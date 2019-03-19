Return-Path: <SRS0=/WbR=RW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11090C43381
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:51:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5F0B2077B
	for <linux-amlogic@archiver.kernel.org>; Tue, 19 Mar 2019 08:51:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OuhhblUX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LPqwZncP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5F0B2077B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8w/TOTQnstcEWucJMb0+WAiNy68fxHnTZEwyRd8XFI=; b=OuhhblUXi4aCu5
	54k2dTWbMOSJ5BMrdHMvRC11U0mctCgb5f4EB8npKNCmi9/3mpgpKFDrURZfxOF+ikslVVASQEFT+
	pAHQ+rkp42nLTxPVoM2NNLxmTh1CzSUiELrPo8twDFZtjfj8s/SIzodr+EvG5eNAmJ4kgKwfBaYbs
	Iid+Le8UoK+PeB+u7Y7QQ/WJdvAR3Qe4m4apE0QmEPF4jprCeGuY1PWdVJDJp1Cwh5w7bEi9xWxlz
	95aZiDrCDzrYdj6DL0cGGIYPdydMcuBp929RcRS2OEp0zvtXvcDCIC2BVgyFv27ev3Fsnx4wGUOG1
	EXKp/NZGwoSkX7w5qs+g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6ASs-00085u-Kj; Tue, 19 Mar 2019 08:51:18 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6ASU-0007cO-Sr
 for linux-amlogic@lists.infradead.org; Tue, 19 Mar 2019 08:50:56 +0000
Received: by mail-wm1-x342.google.com with SMTP id z6so3958802wmi.0
 for <linux-amlogic@lists.infradead.org>; Tue, 19 Mar 2019 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
 b=LPqwZncP48YbBVdGto3gLx4EesNFzYGcq3CWvVdtZF/9cW9yE/v5xmftFjqXquxr3f
 yb9Nkt9FB7yQbQPs4wagzhglDWFIBh9730VZniZdgVIcQnzhIKWjtqpcajgtbEq+iTgW
 BPfOVMCkzkiKLB8uzgrny4vnemApV6hX3LuCHAxYLd+qp4SK9cBlYuVdYg5BmZkVcALW
 /euhWk5CZDZjuH2n3hK9F+QE5a1uIW4Y8SzRKGXg1cOzhxkqSAKZivJaQ5XJvqJvyj2H
 vvKJqWFhZ8tkvi/KQwYhuSbjM8Xzz77SUBCNpjNr5YxEYSUo3xEfH86+5p7sB6kcy+UA
 Ov6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SvHHOPdjX31+8rEIKUG20XZp/bt/In6fypqaOoH+9BU=;
 b=hDTlwomqrCvkACH3oo2wx7JnHM49vQblrW9A9ki9zLYDy8jGcUVgrIeumCmjl/qCMd
 DfrmTB0sWrX6WfJhmVMFrCxz+hYfni2OrBSX3aoRnZyxGs9cCmG7XIIKy0uq+ku3MaB+
 hBIGm/1nFFwvj2hBk0q/dF+C3qrijd312RX6ddi7Tld+ee3B6thYK4mr5vmK+S6+mwrl
 7x7/VgVSLnz/wMMb0c4Nrrl/GwM56mgPnigqPFKmiz58Pr0qDpgWff9sS7WAEb+f8aq7
 QuAQKaeOdEYBhKTyE1W/Sx0WrPO/vf1BtQVlmUK35hINhsWJz3KR7BsRfBjvpx1s8r5A
 d/Dg==
X-Gm-Message-State: APjAAAXe+Ip7JCCb3NKcNr13efEQmzdUIA+hL3U+Yw40Zuj5A/Ibwjrj
 1g4rCp2HOXKHumx4IV14TtP/Ug==
X-Google-Smtp-Source: APXvYqw83qHRKWh0mRm2INlgYcqK32PwGK7PWt2hJbmf1chMs+hSs96ZfVB7FWfICvoe7jKj03H1VQ==
X-Received: by 2002:a1c:9d4c:: with SMTP id g73mr2710540wme.48.1552985453234; 
 Tue, 19 Mar 2019 01:50:53 -0700 (PDT)
Received: from mjourdan-pc.numericable.fr (abo-99-183-68.mtp.modulonet.fr.
 [85.68.183.99])
 by smtp.gmail.com with ESMTPSA id n4sm9411047wrx.39.2019.03.19.01.50.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Mar 2019 01:50:52 -0700 (PDT)
From: Maxime Jourdan <mjourdan@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: g12a-clkc: add VDEC clock IDs
Date: Tue, 19 Mar 2019 09:50:43 +0100
Message-Id: <20190319085044.8581-2-mjourdan@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190319085044.8581-1-mjourdan@baylibre.com>
References: <20190319085044.8581-1-mjourdan@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190319_015054_933542_3A4DD826 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Expose the three clocks related to the video decoder.

Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
---
 include/dt-bindings/clock/g12a-clkc.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/g12a-clkc.h b/include/dt-bindings/clock/g12a-clkc.h
index 30303728fe09..82c9e0c020b2 100644
--- a/include/dt-bindings/clock/g12a-clkc.h
+++ b/include/dt-bindings/clock/g12a-clkc.h
@@ -133,5 +133,8 @@
 #define CLKID_MPLL_5OM				177
 #define CLKID_CPU_CLK				187
 #define CLKID_PCIE_PLL				201
+#define CLKID_VDEC_1				204
+#define CLKID_VDEC_HEVC				207
+#define CLKID_VDEC_HEVCF			210
 
 #endif /* __G12A_CLKC_H */
-- 
2.21.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

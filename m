Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E0AEF36E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  9 Mar 2026 06:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3WTI1X/O/VibN/voLXvMeMJTjuX54bos6d6SKTCReA=; b=4P16W6X9Rp8qhP
	uRsP0HmtC8zny6tt6Qi/PE4sPb0gik27OCugPU9xyjzWRkas7c+ywOGSFiYSf+CTVpUgEQvSc2Ccp
	0aI2aM4LMVHTqiev+adlyEehgLAGkrViQ2w77Hr8iLfRHtWw/WgCZ8ygD8pgFukw73jC2jOQPbg1i
	H8qFWKsVfY9iPXVmkhmZ+lBYzdxfuAb3ii4xH6iBIn/55j2AHJvoobYAAFCYySipPIrha1tNTb52w
	cRXiJyQn/y6v57Md+JO+LGBkj8uyBE7Lhs/6m1UQ9TwNHPaHBCgkYnw41+D6sfeeLoeRh7752vaBL
	kJ0cjLOcq08AlZbJMLxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUBl-00000006jop-3QTi;
	Mon, 09 Mar 2026 06:34:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzUBh-00000006jmT-2nmT
	for linux-amlogic@lists.infradead.org;
	Mon, 09 Mar 2026 06:33:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B68744532;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 574EBC2BCAF;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773038036;
	bh=kdSXp5Qbia4qiLAhNtnkaEIWENtU3D2yrCCRDU+8y4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ABFdHHwoxTuS5hm4CnFs8z3xh7X/sm24v41Ttjqi5KiY6Mn1BF6Nh5OcGFL28iVhI
	 h/gwHs+xA3zDS+VX1XEISmQCoKnz9zhI6zb0iw2rf2QaLsj9LpmDYvrtcDKGmAOJQ1
	 XHzWKUBPJRxr2vewlcuB8A622V1ZDo/dBBF9u98ooi6LUX+hNZ1aIxnBJoX0uddb9B
	 FPJJOJIh32wRWgpW+T2Ir8so7BbcewFMgc737GN3C+CUiEh3c03B107vU9QrTsJhov
	 mVh1oTKLPcINXwfUHko0wV1LNBaQh+RducdP5G81iGA5njN6KO+o1V5uwpNaHfxbXd
	 o1GC9oMSCT0XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A89CEF36E0;
	Mon,  9 Mar 2026 06:33:56 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 09 Mar 2026 06:33:54 +0000
Subject: [PATCH v6 3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
MIME-Version: 1.0
Message-Id: <20260309-amlogic-dma-v6-3-63349d23bd4b@amlogic.com>
References: <20260309-amlogic-dma-v6-0-63349d23bd4b@amlogic.com>
In-Reply-To: <20260309-amlogic-dma-v6-0-63349d23bd4b@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773038034; l=791;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=3ILqFEE9mmDp095lkKeN49I2hs9aNRjaPs7y2SEtITs=;
 b=dpp+q4WX0hQqa+7YFFEA+AwJwuICD2ECPr919QZfbaonE4AGi/uNsfvHyuJYnUDPQEV2FG8uc
 JoL1CGU0GnABlUWm8WwjuuF1+6N9NXFT9UgLnFMK69KW/IYnBp+wNIW
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_233357_760789_BDFAB6EC 
X-CRM114-Status: UNSURE (   7.76  )
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
Reply-To: xianwei.zhao@amlogic.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add Amlogic DMA controller entry to MAINTAINERS to clarify
the maintainers.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..e9c52dfba2df 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1316,6 +1316,13 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC DMA DRIVER
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/amlogic,a9-dma.yaml
+F:	drivers/dma/amlogic-dma.c
+
 AMLOGIC ISP DRIVER
 M:	Keke Li <keke.li@amlogic.com>
 L:	linux-media@vger.kernel.org

-- 
2.52.0



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

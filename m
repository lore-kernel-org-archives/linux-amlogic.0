Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A7DF532F5
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Mar 2026 08:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S3WTI1X/O/VibN/voLXvMeMJTjuX54bos6d6SKTCReA=; b=s66EgSSRBTrHI/
	eJ7+mYHfNn7aU6vexY2YgWrtlAOJuWhtG7Mouabgr2QWO2COTJERcK2xlLz0x/LXD8UoLy5AraSEE
	zJfNK1BeQxon3JHef+aURpd5j0Jd54fBWUwEGxiGGXILXTtn2gw1YuMSRpaXUtOhEgEAQv4+sgu0O
	KiaVxn0Gb97QVXB5IzEhUmn0UZxrcDM780ge2SToxZh/Ff4GFA2poQDPsSjZkMhwBLc5TnOjvgoh+
	6VXfaVtUqt0EEwHBfgObHR7Y+RrZoUs57Ut4VMdQMl+O/KaD/AagG/CiMHxOQqToV7G9BHGL/5LXN
	UEFsJrIAATEwK1e3ueKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4x7t-0000000102l-1Jyo;
	Tue, 24 Mar 2026 08:28:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4x7q-0000000100y-1ZEQ
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Mar 2026 08:28:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A8294456C;
	Tue, 24 Mar 2026 08:28:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7D09C2BCC7;
	Tue, 24 Mar 2026 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774340912;
	bh=kdSXp5Qbia4qiLAhNtnkaEIWENtU3D2yrCCRDU+8y4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YQRc0Cwr1K1+fgNCuAKep8SvNufo2jBYVViAtCLoGtfoIs+TtU1hkYpaAJKOpzr5B
	 JtNtZ00J30dQq4KO9jdUgAIdYGMkvP6bKWY6oXApNfneupt3pBLkvlSlGH5XU3Mdfd
	 SkxRanIO7ame3Il7NvJQ+zGUn4wHCCEwQXhCm/dtHQ4aYcwxKBtCMMd88XN3BDI0e+
	 nlYBOZEc6NsZFbjwOSukggBi0gWkjtu8G7Zx69mLoVMz/n1YlZmSfs9P/jkZ0z32HN
	 2PGkBvjiVDhUWHUElARrNMPE1YumV8AFPuyNAB7QVM06tD4nPsj43Q6hRYEFwdJw/I
	 qJd83dYo4rNQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4A7F532F5;
	Tue, 24 Mar 2026 08:28:32 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 24 Mar 2026 08:28:29 +0000
Subject: [PATCH v7 3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
MIME-Version: 1.0
Message-Id: <20260324-amlogic-dma-v7-3-f8b91ee192c1@amlogic.com>
References: <20260324-amlogic-dma-v7-0-f8b91ee192c1@amlogic.com>
In-Reply-To: <20260324-amlogic-dma-v7-0-f8b91ee192c1@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774340908; l=791;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=3ILqFEE9mmDp095lkKeN49I2hs9aNRjaPs7y2SEtITs=;
 b=w338/xjTz4xrKx9K3hjryxkE89qUnidqboaxn/njZvmrHoCV8B2ZHYjV9GnO/TGvyA+SGPtJL
 XBYQezm/JeNDTE5H77kndmJvNM+77h5ks4H1yPlh2WMNAwh15v9g5SN
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_012834_444537_C88B6AE7 
X-CRM114-Status: UNSURE (   7.56  )
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

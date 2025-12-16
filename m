Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE0FD5C0D6
	for <linux-amlogic@archiver.kernel.org>; Tue, 16 Dec 2025 08:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVBO/NFPpp9PlYNAycDQewT9FmseAri4a8KPVQOgJpQ=; b=XUJuxjZnTL2ifW
	B3jfoDxWDVGW8SIBXzCAtR9ngPPEpfLuF8tcFINpZfIEkyuko11KZLyoU6eCkCL0rAS2vgtXdwdq7
	7MG9ejQkegRdkq9P3adXl365pUTZWNkskcPUNyoOHsZpnAhyh33bMGh7TRSTxVgFrFYRVudJ4jNGb
	HWCxB2YPDl6/nq5JcDU4ITr4CoUj4RkD7B6bHPVBu3FgF16rLHNgM+4rMXgoD4xE6c0lVt37Y1/uX
	iujeqzwpb/YSn0j+lCI3vEr0KrHHOyD+sEwlZ7z7r72vSFbox/cfjzizjeUzK2yQFf1VTdtCwc3ay
	IYfGrkGcjqndvzTbjj7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ1l-00000004tKO-0vBw;
	Tue, 16 Dec 2025 08:03:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVQ1i-00000004tJU-3ZCc
	for linux-amlogic@lists.infradead.org;
	Tue, 16 Dec 2025 08:03:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D983A444CB;
	Tue, 16 Dec 2025 08:03:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3C80C2BCB0;
	Tue, 16 Dec 2025 08:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765872201;
	bh=uqORFx2rOlGaU1rPovioax/w0dRcQGqNILNOAxN6eUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CnPf5Gv+/gj4b4XzQiZWd7V26J+0IAtigmCzuuxhwCvZPthj9k75Uxrtyzq0eEwUw
	 XBX3uILfiNA/kuLhisga6pQjwFzwm/QU7OF8P6B4RjNOmYrkDFTspUW7NnLVbVL0vI
	 sL9NsIhrkrjlWwa8/lbqVwu7eM/saKGSIy7C7iQULoNPNq9J2rS+BfDG/aiL2PMJT0
	 AIRnQGrB3leg7OngwF8WnDJWhMG1ljGSDq/afM7lGZfXRifO8Rl2g0eYk3RouPBgIu
	 hsr20YdbAhGlA2rZc3JtPX9VsOqWmG4JSeAfnfcmw23LxrWRH94jusTWaPe1csL195
	 GYJp2m9jvG0rQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972FCD5C0D0;
	Tue, 16 Dec 2025 08:03:21 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Tue, 16 Dec 2025 08:03:19 +0000
Subject: [PATCH 3/3] MAINTAINERS: Add an entry for Amlogic DMA driver
MIME-Version: 1.0
Message-Id: <20251216-amlogic-dma-v1-3-e289e57e96a7@amlogic.com>
References: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
In-Reply-To: <20251216-amlogic-dma-v1-0-e289e57e96a7@amlogic.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-amlogic@lists.infradead.org, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765872198; l=796;
 i=xianwei.zhao@amlogic.com; s=20251216; h=from:subject:message-id;
 bh=gtytR4NUYl71zEdxW3qz6sET8405pfbFKpANdMYABG8=;
 b=3oYzCundtIihsisvn6/mvf0uZASrPiKzqf4iJ4R33WfBYEDEpv0qPCL4lp4j5YJqYcBLpJwRO
 vUiH197Ico/A61qhC0l2iPk6K5PaFf0MWw7Dqp7P7dGDNYtKTbNnkDh
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=dWwxtWCxC6FHRurOmxEtr34SuBYU+WJowV/ZmRJ7H+k=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20251216 with
 auth_id=578
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_000322_911623_E65D9836 
X-CRM114-Status: UNSURE (   7.46  )
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
index 5b11839cba9d..f522a34c780c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1305,6 +1305,13 @@ F:	Documentation/devicetree/bindings/perf/amlogic,g12-ddr-pmu.yaml
 F:	drivers/perf/amlogic/
 F:	include/soc/amlogic/
 
+AMLOGIC DMA DRIVER
+M:	Xianwei Zhao <xianwei.zhao@amlogic.com>
+L:	linux-amlogic@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/dma/amlogic,general-dma.yaml
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

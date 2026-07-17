Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347BFC4450A
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2026 03:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vWUuLr7mTMFouuvOV238jJh3iPbW0g0Ln190Cws5+Qs=; b=K57cSbv8D6B4u6
	zZgUnj1QX83ZrS9sOOPK34j6nwIEFh84dU2VqVZ6VnWHXc+sIU3pGhsC3YR0J2kjtvMCMCuG7nmb/
	F4sDDB3xXSnB5wCBlvDJarR1mzQeuMVtFKH/FSqJGFYb/U6dPrhML5OPkney8IO6MBUss1gRi2ugL
	EKsucw1P2ZQsTemK1btkHNSZ3AOLo9m9JqC/oVIWAEOC52k1mJTr9BCB5E+BrpvGMl/uUIRDHwCUT
	NxIq6fo5hGpK7WFrL49tz/OE5aGOdcHO729iU+r5OJihd5+G2UFrl5E7hIVlmZguJEShAo/VzjUen
	mmU0E6zwawUxu7LL5G+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYto-000000010q6-15lz;
	Fri, 17 Jul 2026 03:06:04 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkYtm-000000010pj-2UdB
	for linux-amlogic@lists.infradead.org;
	Fri, 17 Jul 2026 03:06:03 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-382ef647e20so6837579a91.1
        for <linux-amlogic@lists.infradead.org>; Thu, 16 Jul 2026 20:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784257561; x=1784862361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mZVR56XOREeMXVCUwfvytwmladieL4xpwdBWK5Npchw=;
        b=IL5NAV15jn8WUUqEWCU9PWPjww6HNyRtG3dF/wgWzysQlH2kZpkC2rvUg/GToMdW7E
         VXe1dA5XMcQqX4P9t7bpCTauvGLSiauhf2O3yME20BQovs9dGLiylPVIGKpnj5rcP6ze
         9jmYmTR1PdwOW8Sufl0Elply+GAaKh8iniUIGy5OAMKLmrQ92uNRCwWSfsQMCmk3jiMQ
         AoZ4CmUdJtrkm3VIGirZABcsC88podgoiQLvsDxYoKmApx0RWPWGKndgE5K1ADJRgI73
         dccHR+nHypkEGJ7crE+0lYBggKdB/CstG24NAhmB7pVxZLQVxFlhfVM/2dZDgwasx0hJ
         fOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784257561; x=1784862361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mZVR56XOREeMXVCUwfvytwmladieL4xpwdBWK5Npchw=;
        b=lttm1KizrrUgLzsyIjdTCHuBxdzRNBqaA66IZ+J58iQLpSmPPUnBC/yq+9o/gIC9uz
         Jdsf2B9aUWPPfY3gPnTSMRsLMTaMguLXyG0MKtDvBBKBmOUEu7yeUc+MydzerhFEZarG
         1BPSW3oPl89vzrG/Af7JBx0WGjaCxjl8Znbq+3/DQlpbNZIBSEoFcDJTqA3UDVhCvXjg
         /PDixECpHFeMx92DY069rFVzMo7HwDm1D126EabF792pk5Q8S7Vkj8WCyc+CpnNbBvwI
         yTiDIa46OWJOgIHtsvYLHQOIABjIgnc3yVd01M70hm7YiYlSz6xY30sQl7T48TzXAV/B
         7DmA==
X-Forwarded-Encrypted: i=1; AHgh+RqWjp/az+zbVa6JVfjOKqsajlblOKMf9JUYqAECWRhrvRrsIzn3Mr8F29IQt40Fmn2iPMHhheg406NwLYPa@lists.infradead.org
X-Gm-Message-State: AOJu0YzXH7IDB5Dg2tXsKX0r4AWq0eBl9Viyjpnv/zVaLfxFHXyCp9KD
	BRHkTQxlL1CwXINA4LaqzjhIl3kB7k/PZYPYbz8DbzV32dkk3t8HQBOR
X-Gm-Gg: AfdE7cnLKLDLXIx4mChoE/SGrzpq5oyE24eOU6L9/Weno7fiAMm4O+pptPnQE6iXUEm
	kYc7hmLet43xE3IrZjh2AsPy0yKszxyMh/917z/mZSayb8g7xleqR/2du2z7ORz9cyguGqRrlxL
	tpeYSg4vpkQVj7MD8o9rMAydikVUbA6bTNv9U7KEeTfxJ9QwdD4Hp4cVVWdOyKZyzNOijs8iLgz
	H4Wy2MgrgCj/E1o81BSRMVDfxhQ+39x8N1scvELY0s31Ypdt/F78h7zyVo1e5+1mT6urcKKg7u1
	vfD3Vg3bRd0OapYdja21clyQDqszgKnefcgZs4wXf4Jz4eDJW9vh+oa3BecL1PZvSJocLcTTPey
	cGv6i5CeE6QQyY7hueYSHfjhsq+aXm1mIQ0CiAMrj3zb8vKbmuXWGmQvgNuHoEGd84OUgBsLUaS
	3xBHYyRcXEGaqdWJUuOaK2wr3lhtVTzTrQSDSQGK1qn7kgnv1Z/fbXNOsaubwJNZgNxxJKE0Xkh
	TaI2XCg9z62jmCSeIqDoyCsYtww65pxEG9c
X-Received: by 2002:a17:90b:58cb:b0:381:5bd6:eb19 with SMTP id 98e67ed59e1d1-38e4b47765dmr715137a91.18.1784257561268;
        Thu, 16 Jul 2026 20:06:01 -0700 (PDT)
Received: from OMEN ([103.184.238.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe1014sm1424650eec.7.2026.07.16.20.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 20:06:00 -0700 (PDT)
From: Alfie Varghese <alfievarghese22@gmail.com>
To: neil.armstrong@linaro.org
Cc: gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	dan.carpenter@linaro.org,
	error27@gmail.com,
	alfievarghese22@gmail.com
Subject: [PATCH v3] staging: media: meson: vdec: propagate devm_clk_get() errors
Date: Fri, 17 Jul 2026 08:35:58 +0530
Message-ID: <20260717030559.167-1-alfievarghese22@gmail.com>
X-Mailer: git-send-email 2.54.0.windows.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_200602_636523_CA2F3A55 
X-CRM114-Status: GOOD (  10.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

vdec_probe() hardcodes -EPROBE_DEFER for all devm_clk_get() failures.
This masks the actual error code returned by the clock framework, such
as -ENOENT when a clock is not registered or -ENOMEM on allocation
failure.

Return PTR_ERR() instead to propagate the real error to the caller.

Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Alfie Varghese <alfievarghese22@gmail.com>
---
 drivers/staging/media/meson/vdec/vdec.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/meson/vdec/vdec.c b/drivers/staging/media/meson/vdec/vdec.c
index a039d925c0fe..fba1e7f88d81 100644
--- a/drivers/staging/media/meson/vdec/vdec.c
+++ b/drivers/staging/media/meson/vdec/vdec.c
@@ -1026,24 +1026,24 @@ static int vdec_probe(struct platform_device *pdev)
 	    core->platform->revision == VDEC_REVISION_SM1) {
 		core->vdec_hevcf_clk = devm_clk_get(dev, "vdec_hevcf");
 		if (IS_ERR(core->vdec_hevcf_clk))
-			return -EPROBE_DEFER;
+			return PTR_ERR(core->vdec_hevcf_clk);
 	}
 
 	core->dos_parser_clk = devm_clk_get(dev, "dos_parser");
 	if (IS_ERR(core->dos_parser_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_parser_clk);
 
 	core->dos_clk = devm_clk_get(dev, "dos");
 	if (IS_ERR(core->dos_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->dos_clk);
 
 	core->vdec_1_clk = devm_clk_get(dev, "vdec_1");
 	if (IS_ERR(core->vdec_1_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_1_clk);
 
 	core->vdec_hevc_clk = devm_clk_get(dev, "vdec_hevc");
 	if (IS_ERR(core->vdec_hevc_clk))
-		return -EPROBE_DEFER;
+		return PTR_ERR(core->vdec_hevc_clk);
 
 	irq = platform_get_irq_byname(pdev, "vdec");
 	if (irq < 0)
-- 
2.54.0.windows.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

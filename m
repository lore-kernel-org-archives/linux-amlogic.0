Return-Path: <SRS0=PsYD=QE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410D0C282CF
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:47:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11A012177E
	for <linux-amlogic@archiver.kernel.org>; Mon, 28 Jan 2019 15:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="usY2bNl6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="heyLqA2C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11A012177E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C4I7W7IC/BrPeC1pP0jevah5wt4iHNTxRsU3CiWX/5U=; b=usY2bNl6DACCHy
	Yp/r4H/kHqO+A8n6yJLS6Ut0LhMDM/mUgFoLF56WxfYHGWIkzuuQN2BWgj9ilH1wIyjLhPABd7xAk
	EZbWfuta5hWlYfqAzzmw8MW9FTnD6Nlp1tFCDEsSgqufGLM4RdJgTl+M0YYJaczp68YExJzWotpHc
	dFQBKZuk6yGpzWZJxmy83RWcn4I4sxYQiF1j44ewUNhEi0qpIa8al7i6Jv8mo8AZN+zwM1w5cai9/
	0KXs0Ol1+5gbrWyvxK4sKtlW8ogMSvI1BdhmGwU1WVVjZjehtLCX1gOQTfhuYVz70VCCxCdDA7Afa
	YcRzGGflG4RveVPkzTcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go97k-0000TJ-Qu; Mon, 28 Jan 2019 15:47:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go97h-0000Qw-DZ
 for linux-amlogic@lists.infradead.org; Mon, 28 Jan 2019 15:46:59 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDA0B2147A;
 Mon, 28 Jan 2019 15:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548690417;
 bh=fbFe8DlZvj0NZ61TLj7w1CkS7E42p1s7wUWOC2ZTcIc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=heyLqA2CLY1ZjoiAk/+NnpMu4utADR6WSxkUdhuhGTsw52GfEnpnvekKassvOSwpB
 GjpMNAwgNKV3OeHB3pWufVHjmVfxsHTNmZRqf23PC/qhhIEyWWEq1IFzVqjFi0R9cC
 RI1k89mRpuCMybDN7EYYbIFs8vMMbe26eE8VWX1I=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 079/304] iio: adc: meson-saradc: check for
 devm_kasprintf failure
Date: Mon, 28 Jan 2019 10:39:56 -0500
Message-Id: <20190128154341.47195-79-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190128154341.47195-1-sashal@kernel.org>
References: <20190128154341.47195-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_074657_879128_AC4919B4 
X-CRM114-Status: UNSURE (   8.97  )
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
Cc: Sasha Levin <sashal@kernel.org>, linux-iio@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Nicholas Mc Guire <hofrat@osadl.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Nicholas Mc Guire <hofrat@osadl.org>

[ Upstream commit aad172b017617994343e36d8659c69e14cd694fd ]

devm_kasprintf() may return NULL on failure of internal allocation thus
the assignments to  init.name  are not safe if not checked. On error
meson_sar_adc_clk_init() returns negative values so -ENOMEM in the
(unlikely) failure case of devm_kasprintf() should be fine here.

Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
Fixes: 3adbf3427330 ("iio: adc: add a driver for the SAR ADC found in Amlogic Meson SoCs")
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/iio/adc/meson_saradc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/iio/adc/meson_saradc.c b/drivers/iio/adc/meson_saradc.c
index 028ccd218f82..672a5dee4a9d 100644
--- a/drivers/iio/adc/meson_saradc.c
+++ b/drivers/iio/adc/meson_saradc.c
@@ -589,6 +589,9 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
 
 	init.name = devm_kasprintf(&indio_dev->dev, GFP_KERNEL, "%pOF#adc_div",
 				   indio_dev->dev.of_node);
+	if (!init.name)
+		return -ENOMEM;
+
 	init.flags = 0;
 	init.ops = &clk_divider_ops;
 	clk_parents[0] = __clk_get_name(priv->clkin);
@@ -608,6 +611,9 @@ static int meson_sar_adc_clk_init(struct iio_dev *indio_dev,
 
 	init.name = devm_kasprintf(&indio_dev->dev, GFP_KERNEL, "%pOF#adc_en",
 				   indio_dev->dev.of_node);
+	if (!init.name)
+		return -ENOMEM;
+
 	init.flags = CLK_SET_RATE_PARENT;
 	init.ops = &clk_gate_ops;
 	clk_parents[0] = __clk_get_name(priv->adc_div_clk);
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

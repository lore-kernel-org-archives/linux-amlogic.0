Return-Path: <SRS0=DoMk=PO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68016C433EF
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 18:28:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DED1D61040
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Oct 2021 18:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DED1D61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mailbox.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qp2jvSSbW6jtlGA/4J1l/QRmhSpqmFlzZice3YNaaCM=; b=b6O+3x5ZXHCJfG
	ToMsqpUwq3g1p/EJQQtL0NwYkrFdxP497jVDvREHp3wt/4LdhCiTomIx0pmMz+4WKjd9bfPlWzu7d
	zAc45SnimB3S6oKxtBMrmEy60fBZZra2ADZFZZKYEHtM+SziBprprB53Sgyi6MdihxrNkJn2dptQ7
	cuaeV/i+Q/1WmeuyhhBgZ5vPL9MDHJjoOtSSZw8ZQ/I4fu8QEaB1GwmJK/Z4xdkIQAFPEd35lifsm
	4amNvEz821JfqBbE0z/l88hH5FDuqo0Ixw6QmxRnIvqTvQLevQVDkJ/e+iNfMlmLGQhrk/VsMfKUi
	r3capZZdbbkM9UHAEiYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfRBm-002la0-E1; Tue, 26 Oct 2021 18:28:46 +0000
Received: from mout-p-102.mailbox.org ([2001:67c:2050::465:102])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfRBT-002lSK-Os; Tue, 26 Oct 2021 18:28:29 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:4:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4Hf0gs0zCvzQjx0;
 Tue, 26 Oct 2021 20:28:25 +0200 (CEST)
Authentication-Results: spamfilter04.heinlein-hosting.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1635272903;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ryQlrEDioZG4+xad6o3RcnbusIS4YhCJw9QSvKXY1oo=;
 b=peiAJo7Iw9hS0WazEEge66oCZtajiUtRLjzhpsayekSpUhmOYkcHI8gbzmgdQTvIO9sSdj
 mu94cfV/JFKHF5Oz2ipwYTqxPYGtGt+4T3mmvWKzhodVHMOavpvu6TUZwdpGi9AXJscTrt
 qc0OyizEbtEGaQwG1yZT+i3fhhe2YwH9ZiIU972e/YHUlaYQxknNd/Jpstw5LhzvQHS2rd
 o0b2AAOrsJHWDxABn8hPQnS+vte0FB25dbCsQISDs2Zv8i1GyFMYdcBAZypMCyIjIrCuDa
 tzuGhPL137eRTZzWwUKbkCUHNANtCuUBIs2JjoHmPlZJOgmDUkLzqHA8/hZbXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:date:subject:subject:from:from:received; s=
 mail20150812; t=1635272901; bh=5EgXE6bxTwConVMtzgdm1wPI+dWZkofST
 YmV1fWOES4=; b=a5Nk2zaulje6/P42RRGc8sMAf+LwFVUe+y5T5zAcUUjz1ScZx
 Klw2nqrCGwVfL1Xc7EFZwBsd0Y26+Hz1pMurmSeVlpvm9ZYGF3sjXYjTMiouy/Ao
 IT4l7HusaMpQfQx09dVNxIJnduR/T6LFFL6+jDlni+e3Wk00b6VTu1coOT+DDIXH
 4atrsxZcb2W2ivGZM5zZwozAm3sF+CDi9IUWpaRz1iWWY4UeZAPhT1UWRFujT02u
 iVo9qksk9VKc7Y3AGQXAkCY4gAF6AU+lKXCWnS3pPLe/POzEFITAQ8jLTFY41kvp
 KW16k/5KL6JtqWkapB9RzkWfOWOIL5pNAbPQg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
From: Alexander Stein <alexander.stein@mailbox.org>
To: Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Alexander Stein <alexander.stein@mailbox.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: [PATCH v2 2/3] arm64: dts: amlogic: meson-g12: Fix GPU operating
 point table node name
Date: Tue, 26 Oct 2021 20:28:12 +0200
Message-Id: <20211026182813.900775-2-alexander.stein@mailbox.org>
In-Reply-To: <20211026182813.900775-1-alexander.stein@mailbox.org>
References: <20211026182813.900775-1-alexander.stein@mailbox.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: B36971315
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_112828_003491_288F09B7 
X-CRM114-Status: GOOD (  13.13  )
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

Starting with commit 94274f20f6bf ("dt-bindings: opp: Convert to DT
schema") the opp node name has a mandatory pattern. This change
fixes the dtbs_check warning:
gpu-opp-table: $nodename:0: 'gpu-opp-table' does not match
'^opp-table(-[a-z0-9]+)?$'
Put the 'gpu' part at the end to match the pattern.

Fixes: 916a0edc43f0 ("arm64: dts: amlogic: meson-g12: add the Mali OPP table and use DVFS")
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
---
Changes in v2:
* Separated from DT bindings patch in v1 (PATCH 1/4)
* Added Reviewed-by: Neil Armstrong tag

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
index ff987e7ccff2..517519e6e87f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
@@ -58,7 +58,7 @@ efuse: efuse {
 		secure-monitor = <&sm>;
 	};
 
-	gpu_opp_table: gpu-opp-table {
+	gpu_opp_table: opp-table-gpu {
 		compatible = "operating-points-v2";
 
 		opp-124999998 {
-- 
2.33.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

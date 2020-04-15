Return-Path: <SRS0=3iKr=57=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC546C2BA19
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 09:59:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F9C220768
	for <linux-amlogic@archiver.kernel.org>; Wed, 15 Apr 2020 09:59:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KWfnCQKY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O+a6HRSY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F9C220768
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YcAgiWjYRzvW8Hgxf5Y9somxVpAUwIPsv7rUAeUMbp4=; b=KWf
	nCQKYC5ahKFdVpn5thZPKPjIiGtc1paZvDDiJbZKnfWY9DJB5mv6x1GYAhSe7Ct/AM5CuhUX31fDC
	h2J4o9/rzORe6m8/5UPa6Td70HY8bQLxIhqK08Frp1D09HkJ1d/hNhuh191fBWn4wZqpmrJVg622F
	9wnpIVYu5r7qU7MV4eGTpmFyFmueDx/XGdnmoJI+PdrLJFkzCZzxXiU1zMi7QF5JGZJFUi1/+VRYX
	UX7qo3EmI1V4X8xnGwGSXL3QshrNwRV92RweXvFNVzrpakfs2hPqsF5f4bnWANA+EIOfFOOIo5Uxa
	3cUVohCvnb9YkV5YI0w9WJssQFcN98g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOepe-0007mJ-G8; Wed, 15 Apr 2020 09:59:46 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOepU-0007Xn-Du; Wed, 15 Apr 2020 09:59:37 +0000
Received: by mail-lf1-x143.google.com with SMTP id r17so2166085lff.2;
 Wed, 15 Apr 2020 02:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=63vRFQmPky+5Sun2Opkz9FUwUHHMbnn+8rcnJyfbXrg=;
 b=O+a6HRSYtexYUcRf2vogJPvF/gD1KELnuZj6kV7IzsLHhvD1ryxo8ZXyhMxj9oja2I
 T3mKdn9yFI5+RKfmhbvG/nbjMxrVSpPhpXgZJAboj11pvYuLsGQSReYdnaLgOCHE6G70
 bM789lHrYlz91lpKf5MMGdPttYhx6aCoBWj482d6qI2D++FdHz0GPAOhRJOhGqw84OjZ
 GL+AOHaLE9BipLjl54B36Jn9AdGtgJE0TeS6xZnq3WKfUPqz+/Me09yAa5zw2gjZIE5s
 2Dw/JWCO54aVJPPX7f6DTt9e3njJ9IJIkxbexcOSKvXRgIdiO6mFVGSiO6BvJNNAfsKe
 1IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=63vRFQmPky+5Sun2Opkz9FUwUHHMbnn+8rcnJyfbXrg=;
 b=U4ttXR/SJRt4BSbmtmDcGkBMRW/zDd4t/xojrtdrvFrMFCAJ3v7v0x82nOB2q5osp9
 F22nmoG7wTaXvR/onwB8/jCh0yWlsLxDrZfYOcyhrZOtKJNeO0B2p5NYUIPuqnYdSaGX
 B3zFJgE/ymkiJ3KbkG902Z4kC/zAScverm72dlK2xWNyY5SkcDQ1gDMkZEVwcreAaMll
 HGmi9V6zPfPnFEOwcfDcFCBJUz2wGIup7jT+TjKmjYCFTWaEnmK14zfmTzrcwmsBLe3W
 I/bXjZVL79E342ipdSlTpebNc9XYBVdbR/JyUBurzQLDJ4/oJjThqXNBGtbprZpM6d/D
 nPwA==
X-Gm-Message-State: AGi0PubBrCsDUZuC+UM0EmF1eZJPhg5srRKPNEdHuRQru78uzYJ7Upz1
 7grNXNl00DVUVif0VXL4DTtBE7yX
X-Google-Smtp-Source: APiQypKvCI1atszqVmdui44gkRzNjRuvl0XeDay9w1RcX0HQfX4ZxaC9Ip6qE2cjuqz9J8NIMZa19g==
X-Received: by 2002:a05:6512:304e:: with SMTP id
 b14mr2479583lfb.119.1586944773169; 
 Wed, 15 Apr 2020 02:59:33 -0700 (PDT)
Received: from localhost.localdomain ([87.200.95.144])
 by smtp.gmail.com with ESMTPSA id m13sm12290424lfk.12.2020.04.15.02.59.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 02:59:32 -0700 (PDT)
From: chewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: meson-g12b-khadas-vim3: fix missing frddr_a node
Date: Wed, 15 Apr 2020 09:59:27 +0000
Message-Id: <20200415095927.3780-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200415_025936_497746_4014DAF4 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Christian Hewitt <christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Christian Hewitt <christianshewitt@gmail.com>

The frddr_a node was accidently deleted when creating a common dtsi for the
Khadas VIM3/VIM3L boards, preventing audio from working on the VIM3.

Fixes: 4f26cc1c96c9 ("arm64: dts: khadas-vim3: move common nodes into meson-khadas-vim3.dtsi")
Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
---
 arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
index c33e85fbdaba..c6c8caed8327 100644
--- a/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi
@@ -154,6 +154,10 @@
 	clock-latency = <50000>;
 };
 
+&frddr_a {
+	status = "okay";
+};
+
 &frddr_b {
 	status = "okay";
 };
-- 
2.17.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

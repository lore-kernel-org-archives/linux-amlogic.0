Return-Path: <SRS0=xuy8=ZC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F3AC43331
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Nov 2019 02:44:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EC6421848
	for <linux-amlogic@archiver.kernel.org>; Sun, 10 Nov 2019 02:44:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n2xsr7Gl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="NkkOtPuh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EC6421848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGBIpLf/kRtTZf5SqfIl1YZuFdu9Nwcopglex0zdyMc=; b=n2xsr7Gl/cgyR+
	X1+34fmWi1H1mxkXKN1fy8Hy/WUKnhr7jyBwHiLkv35lO17b2M5PwjM0NOxsECfGiDATiBLUIXgty
	A3l+Qh23vcMf3YE/AU999iwwYXrrfexkZOgWqmCxba4Ur293Nuvi5OHbJl7Hhyxdvt/bl6izbVWQx
	GguYp/eYhP13YzgL7Qqf80NfQ99gTg8MzozE93xebfCdiyzlLSTbmKeV5I4KhBem8LUdhBCU3gF+J
	HuOxbOBzEucldqu2Zeh9dpiA14/vo3YIqz9+rIzKVl3FcrFjVz8wXqwZXjDJKPCLY5jRmYstSa50K
	lMO1M57hmWBJZitx48AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iTdCv-0001bn-78; Sun, 10 Nov 2019 02:44:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iTdCs-0001ay-TX
 for linux-amlogic@lists.infradead.org; Sun, 10 Nov 2019 02:44:04 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B02521655;
 Sun, 10 Nov 2019 02:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353842;
 bh=CGJbKln3Rkg2sxB7qY0MAuLx3+hEzsvt48vMiraYkKs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NkkOtPuh3D9aHujc6Y70hHLwYQm9ujsLtTRrTR44dj0Bq5Iyo3wgIlDxh/aLFGTMH
 Lx2Rcj4WKJRq0Qhs+BhAkphEyIzNkbcgVurYq8Rwbg9Ov8BHXKMtMGS9NXt2mCHEAM
 ZRvN74fPrmZIxTqSvLcJNODB7F34LMgJJtjcbEEU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 130/191] ARM: dts: meson8b: odroidc1: enable the
 SAR ADC
Date: Sat,  9 Nov 2019 21:39:12 -0500
Message-Id: <20191110024013.29782-130-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191109_184402_975869_C6E93197 
X-CRM114-Status: UNSURE (   8.25  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit fd6643142a0c5ab4d423ed7173a0be414d509214 ]

Odroid-C1 exposes ADC channels 0 and 1 on the GPIO headers. NOTE: Due
to the SoC design these are limited to 1.8V (instead of 3.3V like all
other pins).
Enable the SAR ADC to enable voltage measurements on these pins.

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/arm/boot/dts/meson8b-odroidc1.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/meson8b-odroidc1.dts b/arch/arm/boot/dts/meson8b-odroidc1.dts
index 8fdeeffecbdbc..8a09071d712a5 100644
--- a/arch/arm/boot/dts/meson8b-odroidc1.dts
+++ b/arch/arm/boot/dts/meson8b-odroidc1.dts
@@ -153,6 +153,11 @@
 	pinctrl-names = "default";
 };
 
+&saradc {
+	status = "okay";
+	vref-supply = <&vcc_1v8>;
+};
+
 &sdio {
 	status = "okay";
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

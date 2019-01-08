Return-Path: <SRS0=m30L=PQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF83C43612
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 19:27:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFBC22087F
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 19:27:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MTMibf8t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnxmGGXH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFBC22087F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ds2gxJr8TuQg6qPpuXU0it5/+Sj1xOAtKGAz9EZ1Q54=; b=MTMibf8tGY8Jwh
	6Ix88A8/C3+5SplzCL8hagZsc2oYT1iktFw8CJssVw/HFDK79Okw/JmiHL2YDx0l2umGcT38sXN+/
	cLND8PxJP3LedxhUYwHZ33Of94ktupaUHC7Zzpec1nBxBMyNzvbshYzCWrujA4CrjaTHlEqUxQF7H
	3F+k47DshJcyExUZT7HvEjdJTlWc17abmTFxIJX5wmdG6dKqVVarcRN2EFbmlKeb9u0+DTqnVbX79
	zmutajbZPCCtVXPIDY1dEKFJgrjjibHy+ZCsj8lTmi/ZxaM115C66e/VMRDXymu+CdOMVukspIfHi
	MqQtj5wQhshf62WdzCDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggx24-0006Nx-ML; Tue, 08 Jan 2019 19:27:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggx22-0006Mo-2z
 for linux-amlogic@lists.infradead.org; Tue, 08 Jan 2019 19:27:23 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6782A20883;
 Tue,  8 Jan 2019 19:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1546975641;
 bh=/yiKT8skie3SGWtl1V7G2gUA9sKuNHe7Fc33UHpocGI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JnxmGGXHSLR+BI9fXXuAD41pVJHoku6WANqSY0Mve9PODos1qfDvMGeFg5BkpCbdG
 3/zlrNLP6pcc5OtyyaNc2MMdaoLj2F8oxXDpuTojJgPIN++iubRylhHxEEbtpx5fHV
 WUUdBNUoP4CdDY/8wP3Eme7mkxHOWiz26lnXNpz4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.20 027/117] clk: meson: meson8b: add support for
 more M/N values in sys_pll
Date: Tue,  8 Jan 2019 14:24:55 -0500
Message-Id: <20190108192628.121270-27-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190108192628.121270-1-sashal@kernel.org>
References: <20190108192628.121270-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_112722_165509_C39FA083 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sasha Levin <sashal@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

[ Upstream commit e36c7e9898f2ba34becf37bda37b70e984b0bf4e ]

The sys_pll on the EC-100 board is configured to 1584MHz at boot
(either by u-boot, firmware or chip defaults). This is achieved by using
M = 66, N = 1 (24MHz * 66 / 1).
At boot the CPU clock is running off sys_pll divided by 2 which results
in 792MHz. Thus M = 66 is considered to be a "safe" value for Meson8b.

To achieve 1608MHz (one of the CPU OPPs on Meson8 and Meson8m2) we need
M = 67, N = 1. I ran "stress --cpu 4" while infinitely cycling through
all available frequencies on my Meson8m2 board and could not spot any
issues with this setting (after ~12 hours of running this).

On Meson8, Meson8b and Meson8m2 we also want to be able to use 408MHz
and 816MHz CPU frequencies. These can be achieved by dividing sys_pll by
4 (for 408MHz) or 2 (for 816MHz). That means that sys_pll has to run at
1632MHz which can be generated using M = 68, N = 1.
Similarily we also want to be able to use 1008MHz as CPU frequency. This
means that sys_pll has to run either at 1008MHz or 2016MHz. The former
would result in an M value of 42, which is lower than the smallest value
used by the 3.10 GPL kernel sources from Amlogic (50 is the lower limit
there). Thus we need to run sys_pll at 2016MHz which can ge generated
using M = 84, N = 1.
I tested M = 68 and M = 84 on my Meson8b Odroid-C1 and my Meson8m2 board
by running "stress --cpu 4" while infinitely cycling thorugh all
available frequencies. I could not spot any issues after ~12 hours of
running this.

Amlogic's 3.10 GPL kernel sources have more M/N combinations. I did not
add them yet because M = 74 (to achieve close to 1800MHz on Meson8) and
M = 82 (to achieve close to 1992MHz on Meson8 as well) caused my
Meson8m2 board to hang randomly. It's not clear why this is (for example
because the board's voltage regulator design is bad, some missing bits
for these values in our clk-pll driver, etc.). Thus the following M
values from the Amlogic 3.10 GPL kernel sources are skipped as of now:
69, 70, 71, 72, 73, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98

Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Acked-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lkml.kernel.org/r/20181115224048.13511-5-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/meson8b.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 346b9e165b7a..a059db63907c 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -42,6 +42,11 @@ static const struct pll_params_table sys_pll_params_table[] = {
 	PLL_PARAMS(62, 1),
 	PLL_PARAMS(63, 1),
 	PLL_PARAMS(64, 1),
+	PLL_PARAMS(65, 1),
+	PLL_PARAMS(66, 1),
+	PLL_PARAMS(67, 1),
+	PLL_PARAMS(68, 1),
+	PLL_PARAMS(84, 1),
 	{ /* sentinel */ },
 };
 
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

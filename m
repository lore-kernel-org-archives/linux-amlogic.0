Return-Path: <SRS0=m30L=PQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F87EC43612
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 19:30:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3FB8E20645
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Jan 2019 19:30:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iF81KPOr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSg4O2mr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3FB8E20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lbsVlPNLrKFJnLafie89OnNvod1nAhQf8gHofo13rEc=; b=iF81KPOrzfbdvh
	VuOWF+SCjgdxX6kchYCGEvctPg5ozFV0n8du6jLJ3aV0wYCYuvypPA+nrUcExKOg0n29qCQ72rXhz
	ldrmTdpAWqaitUaVF53bbaf9UMo4th0HilJxkMdc1mq+ST3a/JaDRUtBlxg6sgQQGnPdGsp4lXAW7
	QalqO5HEBi1g/w1m/KdRhZdBWs+fr0BFa+efasQQE5fka6KpvA4BDFJPXftt830aNbtWX1TsQzP8C
	qPc+InaGHC/Mzv2dWoVyqhWEVJn+cEzsFHfVDFtsf9n15fObWZTYG/8gk2QX4Do/tAErzuMAXhbKE
	6L6C6lieEF3ccdVIA2qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggx51-0000j4-77; Tue, 08 Jan 2019 19:30:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggx4w-0000Zs-5B
 for linux-amlogic@lists.infradead.org; Tue, 08 Jan 2019 19:30:24 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 031E82070B;
 Tue,  8 Jan 2019 19:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1546975821;
 bh=DjmsFRFUWKVngoXY2X+mP62jscbsOIGcYfnwvsX/qVQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PSg4O2mrFGW5PCvuHR2nzaxrtD6WfMl69SzJcQWqf+sFO1fTnfilIr5zSNjeCyNIH
 2RMwcyxv97k1UUObuGzWudYe9pn18kVjJsMHP/TOr6XQ1BtPZzI/7pspqxWmAhhLAJ
 w6Eyf6YurXL04m6H80cdv8xTxVeA61ZsBv203fQc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 21/97] clk: meson: meson8b: fix incorrect divider
 mapping in cpu_scale_table
Date: Tue,  8 Jan 2019 14:28:30 -0500
Message-Id: <20190108192949.122407-21-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190108192949.122407-1-sashal@kernel.org>
References: <20190108192949.122407-1-sashal@kernel.org>
MIME-Version: 1.0
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_113022_550135_A70B4E05 
X-CRM114-Status: GOOD (  20.00  )
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

[ Upstream commit ad9b2b8e53af61375322e3c7d624acf3a3ef53b0 ]

The public S805 datasheet only mentions that
HHI_SYS_CPU_CLK_CNTL1[20:29] contains a divider called "cpu_scale_div".
Unfortunately it does not mention how to use the register contents.

The Amlogic 3.10 GPL kernel sources are using the following code to
calculate the CPU clock based on that register (taken from
arch/arm/mach-meson8/clock.c in the 3.10 Amlogic kernel, shortened to
make it easier to read):
N = (aml_read_reg32(P_HHI_SYS_CPU_CLK_CNTL1) >> 20) & 0x3FF;
if (sel == 3) /* use cpu_scale_div */
  div = 2 * N;
else
  div = ... /* not relevant for this example */
cpu_clk = parent_clk / div;

This suggests that the formula is: parent_rate / 2 * register_value
However, running perf (which can measure the CPU clock rate thanks to
the ARM PMU) shows that this formula is not correct.
This can be reproduced with the following steps:
1. boot into u-boot
2. let the CPU clock run off the XTAL clock:
   mw.l 0xC110419C 0x30 1
3. set the cpu_scale_div register:
   to value 0x1: mw.l 0xC110415C 0x801016A2 1
   to value 0x2: mw.l 0xC110415C 0x802016A2 1
   to value 0x5: mw.l 0xC110415C 0x805016A2 1
4. let the CPU clock run off cpu_scale_div:
   mw.l 0xC110419C 0xbd 1
5. boot Linux
6. run: perf stat -aB stress --cpu 4 --timeout 10
7. check the "cycles" value

I get the following results depending on the cpu_scale_div value:
- (cpu_in_sel - this is the input clock for cpu_scale_div - runs at
   1.2GHz)
- 0x1 = 300MHz
- 0x2 = 200MHz
- 0x5 = 100MHz

This means that the actual formula to calculate the output of the
cpu_scale_div clock is: parent_rate / 2 * (register value + 1).

The register value 0x0 is reserved. When letting the CPU clock run off
the cpu_scale_div while the value is 0x0 the whole board hangs (even in
u-boot).

I also verified this with the TWD timer: when adding this to the .dts
without specifying it's clock it will auto-detect the PERIPH (which is
the input clock of the TWD) clock rate (and the result is shown in the
kernel log). On Meson8, Meson8b and Meson8m2 the PERIPH clock is CPUCLK
divided by 4. This also matched for all three test-cases from above (in
all cases the TWD timer clock rate was approx. one fourth of the CPU
clock rate).

A small note regarding the "fixes" tag: the original issue seems to
exist virtually since forever. Even commit 28b9fcd016126e ("clk:
meson8b: Add support for Meson8b clocks") seems to handle this wrong. I
still decided to use commit 251b6fd38bcb9c ("clk: meson: rework meson8b
cpu clock") because this is the first commit which gets the CPU hiearchy
correct and thus it's the first commit where the cpu_scale_div register
is used correctly (apart from the bug in the cpu_scale_table).

Fixes: 251b6fd38bcb9c ("clk: meson: rework meson8b cpu clock")
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lkml.kernel.org/r/20180927085921.24627-2-martin.blumenstingl@googlemail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/meson8b.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index 74697e145dde..50060e895e7a 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -568,13 +568,14 @@ static struct clk_fixed_factor meson8b_cpu_div3 = {
 };
 
 static const struct clk_div_table cpu_scale_table[] = {
-	{ .val = 2, .div = 4 },
-	{ .val = 3, .div = 6 },
-	{ .val = 4, .div = 8 },
-	{ .val = 5, .div = 10 },
-	{ .val = 6, .div = 12 },
-	{ .val = 7, .div = 14 },
-	{ .val = 8, .div = 16 },
+	{ .val = 1, .div = 4 },
+	{ .val = 2, .div = 6 },
+	{ .val = 3, .div = 8 },
+	{ .val = 4, .div = 10 },
+	{ .val = 5, .div = 12 },
+	{ .val = 6, .div = 14 },
+	{ .val = 7, .div = 16 },
+	{ .val = 8, .div = 18 },
 	{ /* sentinel */ },
 };
 
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

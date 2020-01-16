Return-Path: <SRS0=aHVS=3F=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FFC2C3F68F
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 17:16:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEB402075B
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 Jan 2020 17:16:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tn+RmIlU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="2q1yay3I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEB402075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1M2OEZS2yO5jxc13c3HMlvp80cL99i33bnPiiPS3X08=; b=Tn+RmIlUAgfTA2
	07BZQ3ProdLe1Yjq8Vl68xQgWHPBHEsEvDjXmHTPDuTkj0Zxv1qJx4tj7NSB5Kobwse64gxkyKuoz
	8mfRBfL90sPld2Wqusj9VM4wcWSU3qkIZALyjHOb5VAjD3HO0x2uoj8KQB02yEPvSWuKbCiaANBNx
	xoctlKTzoZaxn6hIvpiJW3K7cEV7tT96suQdBDJ9CuD6uAGXpCKFgFOPwQod7/hVVK5ASRQhRTrxz
	FZON3vHQxZBUDVRqlvw0IAAGozk5gArNHyq9aroua+0PruDd5yMa1NIK5r6NA3FtDku2JPIb8Lmde
	z3nkEgm78R+UEVx5D5fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1is8kP-0001YM-JV; Thu, 16 Jan 2020 17:15:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1is8Xg-0002dP-Fi; Thu, 16 Jan 2020 17:02:55 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 31988207FF;
 Thu, 16 Jan 2020 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194167;
 bh=MQIb2TfQCnGj786/+uVtJLgMv3bGqm+yX2Xf8zS8jPE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2q1yay3IUFqpIo1JvkM6UInijVXHK09e4/BR8BY/P7TDuZh41HHuHoadmDMaMnX0z
 tK1S+g+8dBC2OpBpCJHSi1NYGphkZ2T++tCYEx9iIp7wOZYkjpNLN41bisDQ2eQJdF
 u50Q7oi0MQuPDMB7048czD6UtnfceZeR2gb0nAIw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 247/671] soc: amlogic: gx-socinfo: Add mask for
 each SoC packages
Date: Thu, 16 Jan 2020 11:52:36 -0500
Message-Id: <20200116165940.10720-130-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200116_090248_928748_D9ECB4B8 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: Sasha Levin <sashal@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Neil Armstrong <narmstrong@baylibre.com>

[ Upstream commit dce47aed20c7de3ee2011b7a63e67f08e9dcfb5e ]

When updated IDs on f842c41adc04 ("amlogic: meson-gx-socinfo: Update soc ids")
we introduced packages ids using the full 8bit value, but in the function
socinfo_to_package_id() the id was filtered with the 0xf0 mask.

While the 0xf0 mask is valid for most board, it filters out the lower
4 bits which encodes some characteristics of the chip.

This patch moves the mask into the meson_gx_package_id table to be applied
on each package name independently and add the correct mask for some
specific entries.

An example is the S905, in the vendor code the S905 is package_id
different from 0x20, and S905M is exactly 0x20.

Another example are the The Wetek Hub & Play2 boards using a S905-H
variant, which is the S905 SoC with some licence bits enabled.
These licence bits are encoded in the lower 4bits, so to detect
the -H variant, we must detect the id == 0x3 with the 0xf mask.

Fixes: f842c41adc04 ("amlogic: meson-gx-socinfo: Update soc ids")
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/soc/amlogic/meson-gx-socinfo.c | 32 ++++++++++++++------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/soc/amlogic/meson-gx-socinfo.c b/drivers/soc/amlogic/meson-gx-socinfo.c
index 37ea0a1c24c8..1ae339f5eadb 100644
--- a/drivers/soc/amlogic/meson-gx-socinfo.c
+++ b/drivers/soc/amlogic/meson-gx-socinfo.c
@@ -43,20 +43,21 @@ static const struct meson_gx_package_id {
 	const char *name;
 	unsigned int major_id;
 	unsigned int pack_id;
+	unsigned int pack_mask;
 } soc_packages[] = {
-	{ "S905", 0x1f, 0 },
-	{ "S905H", 0x1f, 0x13 },
-	{ "S905M", 0x1f, 0x20 },
-	{ "S905D", 0x21, 0 },
-	{ "S905X", 0x21, 0x80 },
-	{ "S905W", 0x21, 0xa0 },
-	{ "S905L", 0x21, 0xc0 },
-	{ "S905M2", 0x21, 0xe0 },
-	{ "S912", 0x22, 0 },
-	{ "962X", 0x24, 0x10 },
-	{ "962E", 0x24, 0x20 },
-	{ "A113X", 0x25, 0x37 },
-	{ "A113D", 0x25, 0x22 },
+	{ "S905", 0x1f, 0, 0x20 }, /* pack_id != 0x20 */
+	{ "S905H", 0x1f, 0x3, 0xf }, /* pack_id & 0xf == 0x3 */
+	{ "S905M", 0x1f, 0x20, 0xf0 }, /* pack_id == 0x20 */
+	{ "S905D", 0x21, 0, 0xf0 },
+	{ "S905X", 0x21, 0x80, 0xf0 },
+	{ "S905W", 0x21, 0xa0, 0xf0 },
+	{ "S905L", 0x21, 0xc0, 0xf0 },
+	{ "S905M2", 0x21, 0xe0, 0xf0 },
+	{ "S912", 0x22, 0, 0x0 }, /* Only S912 is known for GXM */
+	{ "962X", 0x24, 0x10, 0xf0 },
+	{ "962E", 0x24, 0x20, 0xf0 },
+	{ "A113X", 0x25, 0x37, 0xff },
+	{ "A113D", 0x25, 0x22, 0xff },
 };
 
 static inline unsigned int socinfo_to_major(u32 socinfo)
@@ -81,13 +82,14 @@ static inline unsigned int socinfo_to_misc(u32 socinfo)
 
 static const char *socinfo_to_package_id(u32 socinfo)
 {
-	unsigned int pack = socinfo_to_pack(socinfo) & 0xf0;
+	unsigned int pack = socinfo_to_pack(socinfo);
 	unsigned int major = socinfo_to_major(socinfo);
 	int i;
 
 	for (i = 0 ; i < ARRAY_SIZE(soc_packages) ; ++i) {
 		if (soc_packages[i].major_id == major &&
-		    soc_packages[i].pack_id == pack)
+		    soc_packages[i].pack_id ==
+				(pack & soc_packages[i].pack_mask))
 			return soc_packages[i].name;
 	}
 
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

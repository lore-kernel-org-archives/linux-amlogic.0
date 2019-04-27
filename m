Return-Path: <SRS0=mq8D=S5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99153C43219
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 01:41:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BABC2146E
	for <linux-amlogic@archiver.kernel.org>; Sat, 27 Apr 2019 01:41:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="em08vE0F";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="TzVkHgVZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BABC2146E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgKIAMR/+bEf1Z8CSL9HjhBK75mc5Vmm/Z/m1/faFO4=; b=em08vE0Fd0YB9u
	qNAMPVMVqmGpyoZWDkwfFUUgCmJ1/D8I963MSUeJf+D5MQlPH/zhjj8TKj+FHX7OMjdV5scxmziT9
	XAf8WGb3IsOmYTUrittoc3On2IyhsAYeRoJkgUl8od+HO33cw0Qp2UK0Eto16WI3f0C7D6s/8SnA8
	F4WUhTirEvYv0z++W4sc570PsyvIaAe48SN8j/OzjLDKX/G1JHu2iNr7PdETfpWRX8JSDvXyw12wJ
	8+2k9VDu8mueEjXFYlT1DGz3DhwHMqQs2Vqi4kQLOk8ZXr76lcwSUmwQsNdLwADigtk4ZCxCxVoEQ
	r9qC736wSa4p4GRgIHjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKCL4-0000df-Sm; Sat, 27 Apr 2019 01:41:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKCL2-0000d7-BP
 for linux-amlogic@lists.infradead.org; Sat, 27 Apr 2019 01:41:13 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3DC4420873;
 Sat, 27 Apr 2019 01:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1556329272;
 bh=IiKAiFW+hYK5C10wwntKSzHbQfUCwg+iYamz3Y4IRnI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TzVkHgVZzwa0+chjW/6sCBCCwfseB2T1+0Cz81tMEBRQTRn7RybpNPVE1pORkK8eQ
 0U7/IyeRacLw7XXfxn6EONo1aeatyC8YiDYXJM7lUeUr5XNiVODMy37fxq9F7sfM23
 SoYZbX2sPm74/aUIb1/3TWZZVd19UodqswIYsMVU=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 13/53] clk: meson-gxbb: round the vdec dividers
 to closest
Date: Fri, 26 Apr 2019 21:40:10 -0400
Message-Id: <20190427014051.7522-13-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427014051.7522-1-sashal@kernel.org>
References: <20190427014051.7522-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190426_184112_403258_FE832E79 
X-CRM114-Status: UNSURE (   9.62  )
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
Cc: Maxime Jourdan <mjourdan@baylibre.com>, Sasha Levin <sashal@kernel.org>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: Maxime Jourdan <mjourdan@baylibre.com>

[ Upstream commit 9b70c697e87286ade406e6a02091757307dd4b7c ]

We want the video decoder clocks to always round to closest. While the
muxes are already using CLK_MUX_ROUND_CLOSEST, the corresponding
CLK_DIVIDER_ROUND_CLOSEST was forgotten for the dividers.

Fix this by adding the flag to the two vdec dividers.

Fixes: a565242eb9fc ("clk: meson: gxbb: add the video decoder clocks")
Signed-off-by: Maxime Jourdan <mjourdan@baylibre.com>
Acked-by: Neil Armstrong <narmstrong@baylibre.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Link: https://lkml.kernel.org/r/20190319102537.2043-1-mjourdan@baylibre.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/clk/meson/gxbb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 6628ffa31383..4d4f6d842c31 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1571,6 +1571,7 @@ static struct clk_regmap gxbb_vdec_1_div = {
 		.offset = HHI_VDEC_CLK_CNTL,
 		.shift = 0,
 		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_1_div",
@@ -1616,6 +1617,7 @@ static struct clk_regmap gxbb_vdec_hevc_div = {
 		.offset = HHI_VDEC2_CLK_CNTL,
 		.shift = 16,
 		.width = 7,
+		.flags = CLK_DIVIDER_ROUND_CLOSEST,
 	},
 	.hw.init = &(struct clk_init_data){
 		.name = "vdec_hevc_div",
-- 
2.19.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <SRS0=UlVA=OW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE066C65BAE
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 18:11:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8545420880
	for <linux-amlogic@archiver.kernel.org>; Thu, 13 Dec 2018 18:11:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bF2yxIyg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="gRJ6T3mS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8545420880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=tAge2+r+42HOZlP1eq9FLvCCObC8+4Xa6x80G2E1uIg=; b=bF2
	yxIygXd2mVRetANGXleI/IlfudUccex5WK2D9S2cDO2jHx+NiUG1yPCe2R6N5MU7MPGhj4UfacVCe
	FzE+S+emO57987K2BH17OE1V2CyjZzuPDM8mZRnQLQl5KWglRw6N0nk4uf0tuzFlXoeEwHPFsy8eT
	zxQuLy7W0vtOu83vgarZib53+mQzmrcOzwbZk/rBNQeZCBym3ALaDcwxwG669WtOurZP69smEYD8C
	bvgJXTJkPccc/SP+VuQPMIm0I3IuIHHiX27V1626AYEHr9QuEvbGJK2AjQP7Q0zLrHceqG+O3HBRH
	81qUL5hb6cCXaMgXMJbJhEkWoZFqtVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXVSC-0003u5-UZ; Thu, 13 Dec 2018 18:11:20 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXVSA-0003tF-5M
 for linux-amlogic@lists.infradead.org; Thu, 13 Dec 2018 18:11:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=d5nEPPG99hGb9NnBzfz1aDvxs86ohilkb71VFmHkFtc=; b=gRJ6T3mS2Ugs
 2QrsVhC5GraQjbi2z3riV7v5YL77UA/YrbeufmzVz/74Oj4gG615hIfWBFklEPTeEaqBPUtnpjm4E
 93dMcBHem9Qot1n8ClHLNFu/2NemQd2hYGjeUuKsoUjvDP9CQgZBCjoMPTBQm+vNbMs3CvHjHGxRM
 1gSLI=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1gXVRt-0002Ow-GE; Thu, 13 Dec 2018 18:11:01 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 3188611254D1; Thu, 13 Dec 2018 18:11:01 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: meson: fix do_div warning in spdifin" to the asoc tree
In-Reply-To: <20181213154428.6070-1-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20181213181101.3188611254D1@debutante.sirena.org.uk>
Date: Thu, 13 Dec 2018 18:11:01 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_101118_349761_A0F4DCC6 
X-CRM114-Status: GOOD (  13.03  )
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Carlo Caione <carlo@caione.org>,
 linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: meson: fix do_div warning in spdifin

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git 

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From 165be3c260f88a5f8c55d89458ad1f1d9efd701f Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Thu, 13 Dec 2018 16:44:28 +0100
Subject: [PATCH] ASoC: meson: fix do_div warning in spdifin

Even if this spdif input driver is only supposed to be used on 64bits
platform, there is possible problem with 32bits and do_div, as reported
by the kbuild robot. Just fix it.

Fixes: 5ce5658375e6 ("ASoC: meson: add axg spdif input")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/axg-spdifin.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index 09f385a2bbba..01b2035fa841 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -146,8 +146,8 @@ static void axg_spdifin_write_mode_param(struct regmap *map, int mode,
 					 unsigned int base_reg,
 					 unsigned int width)
 {
-	unsigned int offset = mode, rem;
-	unsigned int reg, shift;
+	uint64_t offset = mode;
+	unsigned int reg, shift, rem;
 
 	rem = do_div(offset, num_per_reg);
 
-- 
2.19.0.rc2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

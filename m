Return-Path: <SRS0=Bf+g=TQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A93AC04AAF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 11:14:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C53C206BF
	for <linux-amlogic@archiver.kernel.org>; Thu, 16 May 2019 11:14:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aSTacajK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="bvFFOeci"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C53C206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=wdt+s8TeRpK9WnAPxRrE2Tb5IddQr0JVXDpC6qxF9UA=; b=aST
	acajKf5V4qTvQNtOwh1Xm6IOGqCiXWqGmZJy8FFto8j+ZeBWyoPzIPQ1G4qPrKW17NqjE5SaFXUXj
	mqLIzq9q8cSHRIxuiJDr/WyLB3nVtCCq8+xRLfR6GdoO2yMBmVkaELJUjnaKK/mKUrM/1dbqlGP0j
	Riq+SDbR1iNmHzgyTmin4PxQnuv5Ck2PKBOBRMULARhgCrKzrNMpPZGpWY6g0blWsO8Yn9MKjGkrX
	+jM9cQt6qYgT3vAdX6s0S2CMQE6ijD13aeXvbPiR8kNmUkUHOoszVMrHR9F4Va2VAStZpujc0YbUR
	PFgaHFddsNahza0KKvolz98EAQgLK6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hREKv-0006rv-0o; Thu, 16 May 2019 11:14:09 +0000
Received: from heliosphere.sirena.org.uk ([2a01:7e01::f03c:91ff:fed4:a3b6])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hREKn-0006js-Pb
 for linux-amlogic@lists.infradead.org; Thu, 16 May 2019 11:14:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=PRtfzYSKqOYpZelyhxsJ4vKt9MCdhGadv8d+copgjEk=; b=bvFFOecigq3s
 /KB4RFJF70ICxBJDGD4TVcX0fs3ytykbZlqxhyhvpZy9js0sDEVFLJagc44uAicJCGHCMN1/5c1kQ
 oTAnaaJ+846WJzBehU40hldMrSwKygyL113bbois+boJeekbsX4Z3T9FbTRXwe/RHe98tsPQuhKPu
 cCUz0=;
Received: from cpc102320-sgyl38-2-0-cust46.18-2.cable.virginm.net
 ([82.37.168.47] helo=debutante.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpa (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hREKj-00066h-Fe; Thu, 16 May 2019 11:13:57 +0000
Received: by debutante.sirena.org.uk (Postfix, from userid 1000)
 id 6E96D1126D48; Thu, 16 May 2019 12:13:54 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Applied "ASoC: dapm: allow muxes to force a disconnect" to the asoc
 tree
In-Reply-To: <20190515131858.32130-3-jbrunet@baylibre.com>
X-Patchwork-Hint: ignore
Message-Id: <20190516111354.6E96D1126D48@debutante.sirena.org.uk>
Date: Thu, 16 May 2019 12:13:54 +0100 (BST)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190516_041401_973052_C0A95B4A 
X-CRM114-Status: GOOD (  14.47  )
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
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

The patch

   ASoC: dapm: allow muxes to force a disconnect

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

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

From c3456a4b2142550944f73a87a8f338074508b249 Mon Sep 17 00:00:00 2001
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 15 May 2019 15:18:55 +0200
Subject: [PATCH] ASoC: dapm: allow muxes to force a disconnect

Let soc_dapm_mux_update_power() accept NULL as 'e' enum.

It makes the code a bit more robust and, more importantly, let the calling
mux force a disconnect of the output path if necessary.

This is useful if the dapm elements following the mux must be off
while updating the mux, to avoid glitches or force a (re)configuration.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
Tested-by: Neil Armstrong <narmstrong@baylibre.com>
Tested-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/soc-dapm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 81a7a12196ff..a4d6c068b545 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2245,7 +2245,7 @@ static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 	dapm_kcontrol_for_each_path(path, kcontrol) {
 		found = 1;
 		/* we now need to match the string in the enum to the path */
-		if (!(strcmp(path->name, e->texts[mux])))
+		if (e && !(strcmp(path->name, e->texts[mux])))
 			connect = true;
 		else
 			connect = false;
-- 
2.20.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

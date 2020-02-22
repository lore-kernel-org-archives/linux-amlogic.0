Return-Path: <SRS0=iFsO=4K=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AA53C35671
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 17:02:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E0FA20702
	for <linux-amlogic@archiver.kernel.org>; Sat, 22 Feb 2020 17:02:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IyZIJEeR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E0FA20702
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/6HEuELZlvmVjY/9GutWn0Yz+om41+NXNo+Jw1YL/jE=; b=IyZIJEeRigZqd5
	3URe11Cwm/rMFAOE+l4lW9Q2JXj4OAS3rw4PqE3xvl3EYE1uEuNOsu4tWGK3/xeYVANo3jH5Aesrt
	PlhJh0JFitMrhU1rVJIu2bh8p9tnFTJMRPpi+MR9ytKYCn8ywDydXPscD9FcfgZe774Ar3vF8d33C
	VJCpG5W7wa72jRvc+XkR33W9Q9bJJZ+9T8d3XhiZZF4M+AA8uuik4BfDRqiOIra7kqwc3glLjWPNG
	1rMVUXeZVskkA7oboHB652jGc9D4bSDw0NP2IdV+HiloplYg5sxIWAWGoLhogYpwCGyuE5AIg4lTx
	XA1yeNWmH4Ql6F3bdTpw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j5YB0-0005dX-J3; Sat, 22 Feb 2020 17:02:50 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j5YAq-0005Vg-F6; Sat, 22 Feb 2020 17:02:41 +0000
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Feb 2020 09:02:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,472,1574150400"; d="scan'208";a="229476526"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga007.fm.intel.com with ESMTP; 22 Feb 2020 09:02:35 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j5YAk-0004NG-Ra; Sun, 23 Feb 2020 01:02:34 +0800
Date: Sun, 23 Feb 2020 01:01:54 +0800
From: kbuild test robot <lkp@intel.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [PATCH] ASoC: meson: aiu: fix semicolon.cocci warnings
Message-ID: <20200222170154.GA119396@e50d7db646c3>
References: <202002230135.WpIL6nAs%lkp@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <202002230135.WpIL6nAs%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200222_090240_517922_E413C856 
X-CRM114-Status: GOOD (  10.15  )
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
Cc: alsa-devel@alsa-project.org, kbuild-all@lists.01.org,
 Kevin Hilman <khilman@baylibre.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

From: kbuild test robot <lkp@intel.com>

sound/soc/meson/aiu-encoder-i2s.c:129:2-3: Unneeded semicolon


 Remove unneeded semicolon.

Generated by: scripts/coccinelle/misc/semicolon.cocci

Fixes: 3e25c44598aa ("ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC families")
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: kbuild test robot <lkp@intel.com>
---

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.7
head:   b38c4a8a0291c31a660cd77761202ebb18332fb7
commit: 3e25c44598aa44134207ad7b3c5ad6b586135777 [134/139] ASoC: meson: aiu: add support for the Meson8 and Meson8b SoC families

 aiu-encoder-i2s.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/sound/soc/meson/aiu-encoder-i2s.c
+++ b/sound/soc/meson/aiu-encoder-i2s.c
@@ -126,7 +126,7 @@ static int aiu_encoder_i2s_set_legacy_di
 	default:
 		dev_err(component->dev, "Unsupported i2s divider: %u\n", bs);
 		return -EINVAL;
-	};
+	}
 
 	snd_soc_component_update_bits(component, AIU_CLK_CTRL,
 				      AIU_CLK_CTRL_I2S_DIV,

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

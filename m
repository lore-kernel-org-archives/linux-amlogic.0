Return-Path: <SRS0=azZJ=IY=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55834C433C1
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Mar 2021 22:01:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E45861A2A
	for <linux-amlogic@archiver.kernel.org>; Fri, 26 Mar 2021 22:01:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E45861A2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ANAIBUEolOQOccCBq4S2PcrXsfFTq+q1dLWb+9a3djY=; b=UVuuTwfQ98Tswcw4IIc+JNewh
	6v0Git4cDfFl+skfoUR2XGg7OhICzRgon6VpQHcXrr+v7FkbXWOBfaK5P8c93PSSl5DsDDGVnLP6p
	dCP+nsBCRT06Ho8OsllynHGOPlQUr91vKc96QXQ+c4fny89KdpxMS6rzEtPkn7zdF8sq6C+nk7qiv
	nPErEdahG/LJxwJVUBHsYPeFD113B0JTWLE7m82Knzvm8T9VSrr00PZW7gwoUNEzmzw6CK14sBxXA
	BsEmDZhfSIZB6EUaH+so4/kfDHOIaH+ZI/yAlCHZzNlAKkjy24Mj0umwxBwoUd1aJppVZEMZpr8le
	G6ejJ/eyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPuWB-004Pkg-Dd; Fri, 26 Mar 2021 22:01:23 +0000
Received: from mga04.intel.com ([192.55.52.120])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lPuUw-004PSD-CK; Fri, 26 Mar 2021 22:00:12 +0000
IronPort-SDR: zBQfQp7Av4TfnZMzwAzr20axKCOSY8NOGGAGNmEDOdvUgTX9UDu/iToRl2uC5aiRNiHynvgujP
 4mO8B72a/6kg==
X-IronPort-AV: E=McAfee;i="6000,8403,9935"; a="188957080"
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="188957080"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:03 -0700
IronPort-SDR: k452R5PC7AuTzdInNTE8FTULNhgjX0aHe3MyRhA+Ej9wOWt/t6+uqk55DgmPxKs/5hfHBexVxP
 vwMEv0glsvyA==
X-IronPort-AV: E=Sophos;i="5.81,281,1610438400"; d="scan'208";a="416706715"
Received: from zcmahone-mobl1.amr.corp.intel.com (HELO
 pbossart-mobl3.intel.com) ([10.255.231.203])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 15:00:02 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: alsa-devel@alsa-project.org
Cc: tiwai@suse.de, broonie@kernel.org, linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC
 support), 
 linux-amlogic@lists.infradead.org (open list:ARM/Amlogic Meson SoC support)
Subject: [PATCH 06/17] ASoC: meson: axg-tdmout: remove useless assignment
Date: Fri, 26 Mar 2021 16:59:16 -0500
Message-Id: <20210326215927.936377-7-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
References: <20210326215927.936377-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_220010_434831_0B41EF7B 
X-CRM114-Status: GOOD (  10.21  )
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

cppcheck complains about potential null pointer dereference but it's
rather an unnecessary assignment to NULL before walking through a
list.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/meson/axg-tdmout.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/axg-tdmout.c b/sound/soc/meson/axg-tdmout.c
index 3ceabddae629..22d519fc07b2 100644
--- a/sound/soc/meson/axg-tdmout.c
+++ b/sound/soc/meson/axg-tdmout.c
@@ -55,7 +55,7 @@ static const struct regmap_config axg_tdmout_regmap_cfg = {
 static struct snd_soc_dai *
 axg_tdmout_get_be(struct snd_soc_dapm_widget *w)
 {
-	struct snd_soc_dapm_path *p = NULL;
+	struct snd_soc_dapm_path *p;
 	struct snd_soc_dai *be;
 
 	snd_soc_dapm_widget_for_each_sink_path(w, p) {
-- 
2.25.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

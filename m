Return-Path: <SRS0=v0PX=OO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE901C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Sep 2021 23:13:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DBC561164
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Sep 2021 23:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DBC561164
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YU4wdBBYpXN9j5DqS3BeHeKUWMSOmDPIoJVQD+KY6MM=; b=fe4847IgHTFNir
	MHjq/3FPR/2DvDxA+uPzwvywI8Y0A6Th0T6R3ThiV5kr+vCVFFwkE2gdC5d5umio5e0uWrdGH4rRJ
	GfyX4dtit1E9T1N+aL6fhPH8uqEmETsNtvLpY4k0DQeTVfHgkMdlmXPaTxDfveSyI0pblZ1tFnrPt
	MWjcvVtQcSjcO/PihfizHkZjKFZDHGzGU3dyT3LeuqmpI+KXT1ZnIef8O74fVcDOA9Vq8be8J0x+/
	jzR+qEfAaeuEBP1L2LMtsp6kA6QYT7oYmfEKE2XBZnwfzlP5xlmKCrsGd3EM1MSuykMlbGPeI8KEf
	Ck8Is2Gq8br4HhScopOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTuNC-00FjZI-Ty; Fri, 24 Sep 2021 23:12:54 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTuNA-00FjYi-0Y; Fri, 24 Sep 2021 23:12:53 +0000
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id CAB6540189; 
 Fri, 24 Sep 2021 23:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632525162;
 bh=tN3HRU0OzmhV6dgn+LtnaYkAOlXirG8kC8RmA1sdV9Y=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=N9L52LHKq1rdOqh9YigHzUlVpJItzEVS5nvj7EoDu2CRT79tXWjXSaxFWyr/2Wwt3
 TEziT8Lr/mWxgSY6oNk0t5hw/k2jMTUEWFpiD+AHp5+a7wb/w5CYPPXiRcEDaJGBjM
 PXE7vcEAlbIP463nYQ5diD6lDiR1ZESaKMzni1wSZqJ5pe6JNPePKddYOVV84fSHR4
 ++xyD0y3oxqM9U2U1+J2aOdSAY0PJ4ZpBhoG9CWInRLbKoGalFfk1nqvo6fuo3yRzo
 b6C1Ue/bjfhEy1DefWEEriA07PhVe8GEnIbGVtIPVNyXVijyKrrR3dryJ4d+yMrN07
 3/qII+187lHFQ==
From: Colin King <colin.king@canonical.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: meson: aiu: Fix spelling mistake "Unsupport" ->
 "Unsupported"
Date: Sat, 25 Sep 2021 00:12:42 +0100
Message-Id: <20210924231242.144692-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_161252_231267_24F18E94 
X-CRM114-Status: GOOD (  10.81  )
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

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a dev_err error message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 sound/soc/meson/aiu-encoder-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu-encoder-spdif.c b/sound/soc/meson/aiu-encoder-spdif.c
index de850913975f..97da60db2c4d 100644
--- a/sound/soc/meson/aiu-encoder-spdif.c
+++ b/sound/soc/meson/aiu-encoder-spdif.c
@@ -113,7 +113,7 @@ static int aiu_encoder_spdif_hw_params(struct snd_pcm_substream *substream,
 		val |= AIU_958_MISC_MODE_32BITS;
 		break;
 	default:
-		dev_err(dai->dev, "Unsupport physical width\n");
+		dev_err(dai->dev, "Unsupported physical width\n");
 		return -EINVAL;
 	}
 
-- 
2.32.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

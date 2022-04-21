Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E9DC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 12:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ggHOHo1C6bjiuqK2a4NywaOFTF1rSGtQ0LOJkTIxSA0=; b=QX7rDmyj8yg8iJ
	1iyqI+MSlBYUDcMhs4o8WcGQOQDohgIKBuh0J3ZPXTPhtIcPdcLkTzIq0RIUZcmifmJbl+5geED+G
	gZ+UZlRIidhCi1WE9ZKnwyTDzNg2qy3VDCtGVrsboBqtYGItk3oYYvbcgyEYUkboqqgESPZRfj8Qe
	BNf95QdW6r9WvSPCSyIJA4GovfmnXLZDbzQKObfbhNRTzMx4Ybdr8u6HJqdTea6lA2FEZsKDAlF3f
	KoWsDg7qaELCnq0HnJj0oPWygSg21A0QudEZIYDSfeWi2AOzKGCW0thkLXdZnVfdoT//yyiT+c+zY
	0VZB7w/EyJie2aB7QQ8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhW4x-00DQFd-S3; Thu, 21 Apr 2022 12:38:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhW4u-00DQDv-QW
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 12:38:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BB4161C52;
 Thu, 21 Apr 2022 12:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8FCC385AA;
 Thu, 21 Apr 2022 12:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544711;
 bh=9gG00Iz3mqrENTaoa8y0Hwexr4oltLYzXVcfADEk/Ik=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fnvSsUIKfsyGCNerlTj3QWr2p6hVZj6P5fSUUv6NR2sevztCHZ02st4XIUv1A7huf
 tjOqAqHFC2mRySTU2PzKUKSWeFwX4F+nK5wgcysM5g79n/hY/Rrn+QqWoMirBAzilr
 D9WfH6uPHqeiaotbrcJhwOO8Bl0glqJaXNkstQrhOBMdHU3p8Lc4rSNO0xkM8Apqze
 a0UjkQobVqprRe/a06chOX/SJBbNKc3FlUn2yF4R09DD0h/rvcKyulqB6uAmGC1qz1
 dBuSyNKy6aVzV85EuTTsTd4MbVF/Er2V3ZthNO36nGU5w/QSHPau8HOD0m832EQQME
 n7og+pc/jC8BA==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 2/3] ASoC: meson: Fix event generation for AUI CODEC mux
Date: Thu, 21 Apr 2022 13:38:02 +0100
Message-Id: <20220421123803.292063-3-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=882; h=from:subject;
 bh=9gG00Iz3mqrENTaoa8y0Hwexr4oltLYzXVcfADEk/Ik=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVApr1wxoy72crF0ib0G+aPDqqU1bdbsIAyVBhhP
 +mnhnfKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQKQAKCRAk1otyXVSH0GXgB/
 4w6oXHaBHrqC0AwyuE6hLaIx8oM7InBIWuBxen2KO1BfHYIQZOT0EMRGa5YVO92HlZH9kCmRZ092eA
 1tpCJyeDW3+i38hGi6Mma9VyN6nMZPgjallrvc4u8+p7hUk4LbOdh3Yyg2Pu5bJILTKpk1SYwZvCky
 uH5vmmgW+iYeMSZHCNFvD0Gs/gyRn4doiSN9T22qcgP/vYwT7W2QjC9YD09TURzhqFXACYTbLM7Pb/
 JZJ714tx2Z0g6QaMuiZocMcL2P/olpLhRq1i6cvOfL6wQo0gyfZ9aoSfF/d3dx1Esc8+vWm+aOO+3g
 rmLZlfiEgn3N5gwumqOGURp3Tvuj3j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_053832_913197_36953F65 
X-CRM114-Status: GOOD (  13.19  )
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

The AIU CODEC has a custom put() operation which returns 0 when the value
of the mux changes, meaning that events are not generated for userspace.
Change to return 1 in this case, the function returns early in the case
where there is no change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/aiu-codec-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index c3ea733fce91..c966fc60dc73 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -57,7 +57,7 @@ static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(aiu_hdmi_ctrl_mux_enum, AIU_HDMI_CLK_DATA_CTRL,
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

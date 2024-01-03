Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A71C47073
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jan 2024 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnR9SvzumFWGuhOzAKboErW+BW7wFLvpbywyVzL0dlQ=; b=eu2eB+JKoy6hkR
	hJ4UyLtKLk/1qXjnVBds6y8qxgbxWxtTfbK1Vi+tgDFpMfakKVCLk3hS/zO9LUxFPlwwZcxQGHejb
	mwW4AQUEgbmt3J87OtXxAeGH0PQpllXDwHbgVcKXf/JGKvBLFzySvuE7c3TwhQSkRZdft2wiH0Oz3
	5V0p5Dt7uxWAzIatDM7TSqm8WdQwnFdpzaZd6fyJqwgQ3nloHQYZV16shhwja0BsCdZuUWgnZjfvH
	neh6PMKMQtY9tTmbz+W6kME4NzlF/ymGmNjP+yGISqju5n0hfOTppS8Jf1Pg5dWw+aUs38I/EaF1h
	3WMtLK0WcTV5vsFQVJXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL65n-00Bmj4-1L;
	Wed, 03 Jan 2024 18:35:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL64Y-00BlDu-2X;
	Wed, 03 Jan 2024 18:34:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1AC36B8158C;
	Wed,  3 Jan 2024 18:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F39CCC433C8;
	Wed,  3 Jan 2024 18:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306872;
	bh=k+wZ9DUmK1WPFz8OxLLNZ0ZWpbB8ZluB+bNJACGBqHw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mN06hYTJYP4vUJkzIVyJggMtNhH5bjGEC6hbcWm2nZoVDE75nJtA5usZkUEJxobtk
	 OSbPcKja44zFBMGKrJxFfsW8cNTRIuwl5tluLRTqn7GoyXqVzych+HD8AHJOpRCxPj
	 JR3MoBhNhf1GOqAZizk0oo89SDeoTunakH2oqAawKchZqc3WrEVgWmkzI8O9l3tjwB
	 JffOo/wQk4Q3yO/bzmLW03GkQ96c1KPcGQSlAFQb0a1kx6Vam1tN4iBjUQx1aSHfZl
	 GnFLAOGvT7j4bBgqej52HoM86B8nVOOnKWLhJLHVo8XnvI5rdhpFYM/ug+pxnQw8pv
	 cia96wv1Stc6w==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:04 +0000
Subject: [PATCH 4/4] ASoC: meson: g12a-tohdmitx: Fix event generation for
 S/PDIF mux
MIME-Version: 1.0
Message-Id: <20240103-meson-enum-val-v1-4-424af7a8fb91@kernel.org>
References: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
In-Reply-To: <20240103-meson-enum-val-v1-0-424af7a8fb91@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=932; i=broonie@kernel.org;
 h=from:subject:message-id; bh=k+wZ9DUmK1WPFz8OxLLNZ0ZWpbB8ZluB+bNJACGBqHw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllaiofg5sZ5UECpsyDPRJXOqEZ9mf0sLO11M27
 kloJ0lo/iqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWoqAAKCRAk1otyXVSH
 0EXVB/9EPTFgsfoqfT5+k9WPYlVvILzv7DRCBrrX4Dk30LFrjy0hOPaay0t+wOgCgFgqVDUcqJI
 LwFTPUnsmA7j5yRuN+SMrAnnFfnQEyuPPV/EFxkREUXU/aCyQKFLmW7OqHmrUwS9htAziujJjrG
 Ww9xm5TT7dpYbhiOpbIFJcRfsDyY3iO2g4BHveT7FZxe4NqiHD7SuRpk6Fye1iM/aF4XgE20rxC
 0n/ft7mDMd1x2vtbccdNl29rtTK2PZd+UwixHb7cG/mkxMcTqlM6MCCvrHnrjU3am5eW2J81emb
 EAzSaCZpR8PwygqGkgKRcUz9e2Bp2lrNwqW1bF/hhufwivfC
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_103434_989002_287C52E8 
X-CRM114-Status: GOOD (  11.17  )
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

When a control changes value the return value from _put() should be 1 so
we get events generated to userspace notifying applications of the change.
While the I2S mux gets this right the S/PDIF mux does not, fix the return
value.

Fixes: c8609f3870f7 ("ASoC: meson: add g12a tohdmitx control")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-tohdmitx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 51b7703e1834..b92434125fac 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -118,7 +118,7 @@ static int g12a_tohdmitx_spdif_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_spdif_mux_enum, TOHDMITX_CTRL0,

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

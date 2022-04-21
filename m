Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC233C433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 12:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ag04lSU7DSWwqmyN+cGo5+VFJ3C2LbYkVEwh2/CMM04=; b=x7l7ugwFj8rkJs
	2TRb+Ig/VlvJMqkq9ev8GhGq7PxNRm2Y8oWY7ruBvL6UHPgXJPEcTHjawYEM9sqq6Y9JyFbzsnEoN
	MXUGMmBBKXi8+iU3TDuPJBVQzmmBTaOwq77aDQkLT68344v7cxMAOsnP347hRWeQApk75z7RQyIvp
	6QFvBVGKkppnFj5IlUWsQL9ZqqNRiqi8vA6ycp8TYrQw8TD3sK/XJTdwlwjSjUuh8ZSS2tIWUhiOB
	J7rI0w+gEt3+Vm+75sppU+Sd1QwvYDjmshRV38kYUC4sOO+CPYPjztl2xIFzonHRKMq3cYa6EIRdQ
	L2Tmm7qYIsbqa/bm9EQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhW4z-00DQGf-LN; Thu, 21 Apr 2022 12:38:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhW4x-00DQF1-08
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 12:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 986D061C19;
 Thu, 21 Apr 2022 12:38:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B60EC385A1;
 Thu, 21 Apr 2022 12:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544714;
 bh=8YPHXaRtSEaf4QmzNC1DiRPUEOqPzBSOCJG4xUj/XNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aTFVI+mPoPGYzrKcxRXCcedlMrolSF+EwWSMs9p4Q+uCNB51pttUbaIxxaMQtHP57
 WVvmnVF8Crai4UHIlsdmAeDJkClj3pdulFBgBrgjZ1U0Aq9WRaBx98qZ8CuYVy+3XU
 FBT5Dx5YlWqWV4ddvDYOKYgTZq3EUrOXHF9la6ZfgJjDQAaufmWNcVyz3QxgpxGIcz
 M4Uhg67QpQuPTgDw79Cvw/IT4He6nlSGBHPuR8TWFgcsXyaJeMn5esGtIp08U2NnAx
 NLfo8pzDJraYu5K76nijjg06qK+QVlXM8HHnXxOfxpTGLZasNb1faolQhF1cLCxn54
 r47weTklTzZMw==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 3/3] ASoC: meson: Fix event generation for G12A tohdmi mux
Date: Thu, 21 Apr 2022 13:38:03 +0100
Message-Id: <20220421123803.292063-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=878; h=from:subject;
 bh=8YPHXaRtSEaf4QmzNC1DiRPUEOqPzBSOCJG4xUj/XNI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVAqrGKZDzol51LSW4SKkqGhg7ji4Y0a8cn4Kt6W
 IKhGBhuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQKgAKCRAk1otyXVSH0Fg0B/
 9v7Rf24dGzpVoJdodOBOPhdQXwfavmcTOTf0ns1kBUw/MnqXt//tXdxlhtG9gaWFsO3MKcXF4sPO3o
 7cRe/Yrb1ebF0j2iBT7JPkthvt6UnakayOUyvfhF3vtzLz5uCvgGw22qU/YUQT9XeB+xe2fqp91IyB
 8SROYXxK3XoEwsge95YlRxip2j+9Iukhp5vey9yVTgZwkAmgv0cYlEIYkZUhw26mxRtPHDZTByA7Df
 FnR/5+3dzHK1izoGzNrbxXQ9Ux2b5UJc5h9EAdmSg3aZe6BhoJtM9qxk8V8NhpvUBem3yURuklNvOI
 K4Hi5l1szFobj39+b0soTpFY5MtE27
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_053835_133269_0D379A8F 
X-CRM114-Status: GOOD (  13.50  )
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

The G12A tohdmi has a custom put() operation which returns 0 when the value
of the mux changes, meaning that events are not generated for userspace.
Change to return 1 in this case, the function returns early in the case
where there is no change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-tohdmitx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 9b2b59536ced..6c99052feafd 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -67,7 +67,7 @@ static int g12a_tohdmitx_i2s_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_tohdmitx_i2s_mux_enum, TOHDMITX_CTRL0,
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28462C47079
	for <linux-amlogic@archiver.kernel.org>; Wed,  3 Jan 2024 18:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3NM3y/NzHmLF22cn7XvrdFOWHNne5t86pg6EzKM0Ud4=; b=HcByuGOBWGaQeC
	UsCNsQyAGunbbYcfrBGjy3xr/cJgpVvMKRREynYFmpa6phZmj22y23zIOrK2ugGoxoT0jTF4jj3lM
	w3TsDN1a9rtxWrsUktPyxv8u4gyLnnx2DCbHQyy0BncZRMZpYNJ7sDWmhet74fTJ71dJMPNx4ScWb
	6AaziJOKtvzFc79vK3mS/LAhcQtO5cqo53VbIQ1LcO1gQhJxp50tkCV/8sFV68SlAkB8SjzY9H6OR
	SdbHGG72LacPa76XS6jP3cXkqr6sSuIzrsWPJiVp9QpVW+KE4/MOyFG/9zW/c2GRvmFWPyMHYDqZz
	kArUSXDULsKhUjYWR7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL65m-00BmhW-0h;
	Wed, 03 Jan 2024 18:35:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL64V-00Bl9s-2f;
	Wed, 03 Jan 2024 18:34:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1082CE17C7;
	Wed,  3 Jan 2024 18:34:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B266BC433C9;
	Wed,  3 Jan 2024 18:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704306869;
	bh=dDDot4LPRcgoDYuhIQlX528kffOfH+AmewxKynD5EdI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=D3/Pk1umSny2A8IZwjZfAIKV5pHBczxBvTftsMewDZ+JzbCSb0VDHB/gvc/LTW8n4
	 Ux0Fyoxb4Stqm3xpZeW1bdtWWWjflUUKpTe3FsQ3sO05BXat6QzYnOyWh83JOv3mrH
	 uegVKZiyU0HBnJ31gbYPdjrQoc+F1trLh86eeoVGPyKUXcu+CHwPxqD9+Mt1PWBJX2
	 sEsjivyiK8bTyNYSYc9XqeTcZ6+9Qv9Q7+FXqjB9dM3VpUhmvcIIMANPG/cALnCq33
	 pt0b0pOWxVnYpdGRmch3ijPkF7xt8DnfScdRSOfN5ik2WtkyOL+2oSd5N8cfPISpR4
	 /SQV8J3hWJKOg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 03 Jan 2024 18:34:03 +0000
Subject: [PATCH 3/4] ASoC: meson: g12a-toacodec: Fix event generation
MIME-Version: 1.0
Message-Id: <20240103-meson-enum-val-v1-3-424af7a8fb91@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=996; i=broonie@kernel.org;
 h=from:subject:message-id; bh=dDDot4LPRcgoDYuhIQlX528kffOfH+AmewxKynD5EdI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBllainucttS7OoBLV5md2JR3xlj2GVea5XjFl06
 dLgG8hp3R+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZZWopwAKCRAk1otyXVSH
 0P6YB/4jzW3f4QaPPP68INJXXLHuXZAFWMvx6FTQuOqj8wqVrOLFFdLieqJQcNa01wBLV0QgR+p
 0giUSm4S4Y8D7/QASlWUBaKhSiOsGRSEHQnp8vqA9QeMCvN6gtvZWzfm/4IAhHOugTh7FOUYrbE
 U+t8zCxvfXyvxARb6Jvh6mFM6XtxykTKKmaGD3gETbU1jvzTUV1igKFRZ7rg57RT4URS03zygeo
 gRzawACQtEfB3AIUaQ198HNe0cF959n2z2OjoqPfKLzVXpVEaQyzh/ZGdPo9QkNU3IQahnnDpO7
 aDdjoagBml0WpiHz044OI2k4kL49tXmDGx/Huftxb6cbG03f
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_103432_064099_DFE32407 
X-CRM114-Status: GOOD (  12.85  )
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
We are checking if there has been a change and exiting early if not but we
are not providing the correct return value in the latter case, fix this.

Fixes: af2618a2eee8 ("ASoC: meson: g12a: add internal DAC glue driver")
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/g12a-toacodec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index dd7f07de2685..531bb8707a3e 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -104,7 +104,7 @@ static int g12a_toacodec_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(g12a_toacodec_mux_enum, TOACODEC_CTRL0,

-- 
2.39.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

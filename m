Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839A2C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 21 Apr 2022 12:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MdRgUsOd3YWJGMRi+K0N0gOK7bjy5IQL3LipOXIBu1s=; b=ZnkANQ+zHnvfu9
	h3uhkIaX0aA6b/6O6ktD9e58T+FVOyxthugbu/3UlYPGYTj89AzFLEuOQxZ5+eZUfSo2ZUuvHp2P4
	eWcOiASrLqZ/wPeYp9eZIJg6m58LsmoRHVm9TdCCEgF4BUmvbPfx7PdUkV6zeCqm8pC/59R8fZ8GW
	33Jvs/NEEUp6fV7MQzu2QVxp2Pfv6Hn3WASqdyFYA0IOh/M+ci7k+w2cZR7ZIa+IJulfLFxD5W63J
	tWLicOWXSvsriruYcaNY9cMiNczhFQG4E9XOyZl+hIgk8Zg3IH6UfASmymTZl7WnW6Qlj0EtnZYN6
	FmX3XV2bAvlzU7SVVICQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhW4w-00DQEm-6c; Thu, 21 Apr 2022 12:38:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhW4s-00DQDB-Uu
 for linux-amlogic@lists.infradead.org; Thu, 21 Apr 2022 12:38:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D37C61C7A;
 Thu, 21 Apr 2022 12:38:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1973C385A1;
 Thu, 21 Apr 2022 12:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650544709;
 bh=OAGA7Y/uNQUjSjKTEofTVl2s8bD0Pc4pFUCJXL6t4Hg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u8C5QyDCsa6Uq27aCJ+R5b2TP+Nw8d/YH5qcatDyP1wPOv6YV7XdTJA4hjf3Pumzs
 CPx2LluIje6liQkNebv6T4BYqohtl0fhizT9svnqBTr9NtLWoCS3eyEZle/xw3T/KX
 LM28q8ctg//X7V1yNJpMzHwPQ1jFV6EXakRT+BDYEGA3pJaCp4hmXo2p9LVGL5Fh02
 6RhZXIBaTibHYg/hxqM2ySG/1O5fuop0HztJ8p7keaSB/shv0ayrKzfSSUipN0OY+u
 atPDgwed4S9iT/taQe0FjfU4koPxusy/ywQDjIHW6ks1DA99bYxbj2rypqHQeAHiaf
 CzJPyiarWbSfg==
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org, linux-amlogic@lists.infradead.org,
 Mark Brown <broonie@kernel.org>
Subject: [PATCH v1 1/3] ASoC: meson: Fix event generation for AUI ACODEC mux
Date: Thu, 21 Apr 2022 13:38:01 +0100
Message-Id: <20220421123803.292063-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220421123803.292063-1-broonie@kernel.org>
References: <20220421123803.292063-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=884; h=from:subject;
 bh=OAGA7Y/uNQUjSjKTEofTVl2s8bD0Pc4pFUCJXL6t4Hg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBiYVAo08szkcs7B1kQq8R3+DqTe3rqtlh2eGGB8ri0
 44bNiymJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYmFQKAAKCRAk1otyXVSH0HfBB/
 47HI2ir0hJfTo3YLT2NgpB0PithajCfZfEIo3XL0wsVkO08LimJc05KrL4Y+iTa4PCDuR/G4kGPw+a
 zVCKjtt0suLWB+zqMeThD1Lwc/jm4K9+saDhshLO+r0r97J4BU1+CT8InXQzBbA2KnDBzOrsc8FCY6
 Y/9mW2qHGltq3TeGEao5XnQIbVNpAQhTcbm0pwNh9tHdlh6o1WMiwIgKlj4yeUcXnOCD5DjSnlh4da
 E04hozdqcFstNVF3wu9IdHHnTgHD0RVFbm5V3VTPrPdaRK+dder+K8gg3gQsq0YbMqqFLh9e+5fQ1i
 SuIg/n8pcXSkdoX8Y8OMz8f4QEgsd7
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_053831_069264_94B00970 
X-CRM114-Status: GOOD (  13.29  )
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

The AIU ACODEC has a custom put() operation which returns 0 when the value
of the mux changes, meaning that events are not generated for userspace.
Change to return 1 in this case, the function returns early in the case
where there is no change.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 27a6d3259c50..442c215936d9 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -58,7 +58,7 @@ static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mux_update_power(dapm, kcontrol, mux, e, NULL);
 
-	return 0;
+	return 1;
 }
 
 static SOC_ENUM_SINGLE_DECL(aiu_acodec_ctrl_mux_enum, AIU_ACODEC_CTRL,
-- 
2.30.2


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

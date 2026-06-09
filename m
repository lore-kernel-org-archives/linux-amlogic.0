Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF33CD98C4
	for <linux-amlogic@archiver.kernel.org>; Tue,  9 Jun 2026 12:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mX6aAb3OWMPqV/sKzUneNvOr4LOMzTteM/XM8QLIfPs=; b=0Z10V2QZxAP8c9
	S2VdszCcX7UgJGo7f91tiv+nKOcHmSCCviFi5mYxnkDxOLugiKsHMF/PCglSWjvtA8J6qx4NnaFoO
	jgmid7ftmOF90zvcMBImMQ/wom6DMOeJaUFONa+IutETkM359vYcWTfgDLRgfOejEshIFr3vDsSah
	qcUe0OuY1lrmH5Od52I731v3boKNTptiS2FD9XK9Tg6NtNFcf14dmoJCHmBhdLe1OwdNqehq07HcI
	NQo2x9gEuoopngBGolCvOBFbcPeEEBt7kUMuqPOB7Dp07XJ641rQ5DK/n5F1DjUwGxYtgomkyScbh
	7YEp0A0X9LUCC3J+38ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvrG-00000005Ylc-3Anr;
	Tue, 09 Jun 2026 12:47:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWvrC-00000005Yi0-3ZR1
	for linux-amlogic@lists.infradead.org;
	Tue, 09 Jun 2026 12:47:05 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2bf1cda2b17so40072935ad.1
        for <linux-amlogic@lists.infradead.org>; Tue, 09 Jun 2026 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781009221; x=1781614021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ehwC4+p6kz8win9+9tJOLmuWLTHCo6mGAGt8WUYA5c=;
        b=ozdR+eDnUtZ00srJCOFAT9hugo5/+47/li9wFt0M1Z3mHLe+mVghCnL+l1RBCUcRO6
         46Yg/gNHtYeKegmHPv3UlihO2fAgWzL/hXxP6cWVc2ZDSuxKsUQWnsZL5AjhxUxM0/D8
         hlj9BeQ74+bnUIkQaOxd80qCKtS44qti27JtqTW1++Qit77oECc/i4BCzJ3KUxJBax/T
         5LtO35p2J2enB+scSa+7VJb6GNgMPgu3vCj6SfV3/fiyBlLxtUyspqSuSpNXGJDTCUmf
         Br84cjvDgfQchj0GvE3SMd4AvIiEuG7tUZB6sshjs+ViAHi1gI9UTFGjT7adTyPCILL2
         FoaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781009221; x=1781614021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3ehwC4+p6kz8win9+9tJOLmuWLTHCo6mGAGt8WUYA5c=;
        b=ZUOaWOJKy6qE8R215ULyO71y1jc7c6Tg2rHG9jnl1dDE9qKEuDRBJ7mFiH5Z3t4x5O
         cGoDUCFzPysl9eqIshROECwS4c5MUdJ8sCea3D0lERwndRVNSksb7LaFLr2c2CjZpk6j
         zRnV9nGrwPLLrSXTmrYiu53DeG2qL9D0xsURDMsX2pj+5CUaeIJ0rGNSw0ISiyyvNMA6
         qaIjB6DbEcOJT+JQU6Yjjp7HsSXQ+E3KuokJGcMNkPLb6ZNP3x4la9qj1luavcKxWn0e
         ky86DFUWkxarJao/ZycUN37FzLVkrcsBKsVIX0L8RBziV4Hj/4khXodIW12YcDpSHfrS
         a3+w==
X-Forwarded-Encrypted: i=1; AFNElJ+h5h2SuBgpn8NPh+USq5/z0/0zJyCu9YiV9pkedRfhj09YDepVXPZp4rh6QbovC0lbu+846P4SXs/0bSeU@lists.infradead.org
X-Gm-Message-State: AOJu0YwsHv5acv54O+3w+3GTI+2fZqi+58JZKzFRhLOOvbhyTpwMRlBG
	srWBulH6CLS6y9aJq8f1Oc0UMnYY3jnNLqJcgbhTgC+Yp5c3+mDLKUEk
X-Gm-Gg: Acq92OFbXQjt+cneMlA22ZCwfGfnIUCTWDt0nNmF1ZMoJZnXLf4AA9ECw4YOLbLAx/d
	k3gX8WP8KcLmxW93bKrjB44YfjIuidt+dQyYO2/lvnNbXDTFxJPfxHtICyyAyBNnS55sO8pJzaQ
	uZxi72Q0KZhKeLO1sU9e0brP7IjJozSCGloYtytGsAx2BWhXyRJdZetJ+czbYFy2VBECYGbP5RQ
	P5KGanagE3yxNz/F6hzNsorZiE8nYaXkn3IYATc0Wv3wNIKGb8ChuycFk01XL/Co+azWcuDyvZH
	GpdFRptgnikuTPvUVMLwoJmjMl28HQHAOCOuiEhyJyRKVxNwYIF8Fy7uFbt4HNiBKmZBe3Rjyhq
	xIboes44xpflkHavec3uwCL8qobFRHJoeYkSN8Bq8y7cP8UzM6EmtJOjJeRgXDWmhOV5Sg5+GjC
	yODyhOhzuQ6h2nKDL1mWnC8vINt6aR1DQG+IaVcjtgZCjhUsJnYmG+hoHVIhOJLPuku07w6RF+1
	CO/BgCPJjksgYYwVoA1jeS77H4=
X-Received: by 2002:a17:902:f650:b0:2bd:2c3a:2a36 with SMTP id d9443c01a7336-2c1eb7476d2mr171953745ad.0.1781009220767;
        Tue, 09 Jun 2026 05:47:00 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16629d40asm204686345ad.64.2026.06.09.05.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:46:59 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH 2/4] ASoC: meson: aiu: Validate written enum values
Date: Tue,  9 Jun 2026 21:43:14 +0900
Message-ID: <20260609124317.38046-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609124317.38046-1-sammiee5311@gmail.com>
References: <20260609124317.38046-1-sammiee5311@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_054704_109516_00D15B29 
X-CRM114-Status: GOOD (  10.77  )
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

The AIU HDMI and internal codec mux put callbacks use the written enum
value with snd_soc_enum_item_to_val() before checking whether the value is
valid for the enumeration.

Reject out-of-range values before converting the enum item, matching the
validation already done by the G12A HDMI and internal codec mux controls.

Fixes: b82b734c0e9a ("ASoC: meson: aiu: add hdmi codec control support")
Fixes: 65816025d461 ("ASoC: meson: aiu: add internal dac codec control support")
Assisted-by: Claude:claude-opus-4-8
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 3 +++
 sound/soc/meson/aiu-codec-ctrl.c  | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 483772ba69cd..94c5d6533523 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -36,6 +36,9 @@ static int aiu_acodec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DIN_LRCLK_SRC,
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 396f815077e2..60bb4cdfee52 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -28,6 +28,9 @@ static int aiu_codec_ctrl_mux_put_enum(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int mux, changed;
 
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
 	mux = snd_soc_enum_item_to_val(e, ucontrol->value.enumerated.item[0]);
 	changed = snd_soc_component_test_bits(component, e->reg,
 					      CTRL_DATA_SEL,
-- 
2.43.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

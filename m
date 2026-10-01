Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90648CA5FD9
	for <linux-amlogic@archiver.kernel.org>; Thu,  1 Oct 2026 16:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d2U0HtXYtJX3sq4CuMmLbfEq1tLHcWkLyNeVtLsIH9c=; b=mRzu8kfNVGBz1I
	uYQwmnwIa0eqFMItmEAOglhyIsBnlGDSCAzJUyoGad6F+X8yDxCeRbGWLMcdCutY8v9h2iTsoxbtW
	rVFTL8y/VSutpY0gGdpZpzTzLSYfYfk9bLjgD2F52lYhXL/h8VVEMf7ps1DmBrGCHxGjEqHaZ5x8i
	Pu0ZS8pkLUfjbQbsJn7dGKoUycEJkgriSZ+Ih/RQhizHrVVPV9wltGNbe90BJaBVxRgS7HluJnuNv
	kLcVVCwWuGLgM6MoT70JwLoj77QFiDFUtL+tCqTcjSjaAz91hjh94Vks6OihFOL5cf6wQ28BuLibm
	8HtqbyXbYGib3YHzs0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJJ4-00000009dxO-2aj2;
	Thu, 01 Oct 2026 16:06:50 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCJIz-00000009doc-0Rp3
	for linux-amlogic@lists.infradead.org;
	Thu, 01 Oct 2026 16:06:47 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso26084295e9.0
        for <linux-amlogic@lists.infradead.org>; Thu, 01 Oct 2026 09:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790870803; x=1791475603; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=Bqf2DZNjvGdaU03V2ip0Bws/o2ca2OdCtXJhyYvHjbdXeK3unrBvtL7jwovLeQdAPf
         2a9EAFUMmz7Dav+mus7+4bfA7tGsgJuWv0om9d55YtxzjjE6zx/Z4d7PBfGeqc/sVDt9
         uu7Fl/0Xkytz2Sn/gcpG+VWsAd/XX7wEshNa3cy9Q20WnUGUgy/ylmCb9BKwVbYE3PsR
         kPP0kPThYisVKA2DKNSXowGPQDVMd1O2johTbFoow+58GjhzrqTS2n4fRDB7H8M8BDMb
         q9tX0PG2wXgJKqAccSx3OmoUZjB+TfzfKsU7Mn+sOrEmlAYVMCr81BHRlhIydANAzghd
         wqvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870803; x=1791475603;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9NdGvaoqz2WRckkIB56KIhvOpKEAjaPKlsALwuODHM=;
        b=gzLQr8VcpnuNXRswrKHKhIiuLeJwMq/alwFgxyW2m+GhQq3rvF+orOC5smQ74m6GEk
         Pj9C2bNyV/3q3RoCpcqWBOkWNsTvp+bTdCPm89XiJWebLjIr/SQMYPULGkodSDcySILX
         SuTmAnwSYBLKDXdqZAk73JH/+aGrlJ9PDeXbQqcDm2V5974YE1gTVsy8n9Gsz/jLPFiw
         IZA85EgTtLdz5RrwUjLAvaORohbOcTs9Gg9StZZCfdl8QIGbps+leKkCvawM72NCvM9V
         L/QrXrbycHc9BeI5/kSIV3tQpfc5sQloB6nLq3y/AYFyqqKc1hrsMhA5PXy2pssj6ayo
         9ivQ==
X-Forwarded-Encrypted: i=1; AKwUvBxP9wrx9Qe6Ksvb58+ADN+Yl5+tvv/K27teYqf2s1JJ/mtQeLdROKUK51ePTHLM9KYlNYavgmn4POUcjwzN@lists.infradead.org
X-Gm-Message-State: AFuF++npNdFr9l2ZL3LCLBpcZI81SHMi4tOQLx2LC+YseS7IECHjH4XI
	F0iW5TU3ntSnxklWUnYc++9GfFYqch31HnkTj04RmX5GqELKbrJCkOLfXpQxtc6LYs4=
X-Gm-Gg: AYBFou3T5aY4e21AbDMJ5w33F2CpdzlaP187lG1f2ddEqyA7o/OFr29QQZJABUpp/ZT
	FMYMdo2aC+2mA5b6wKB0TWFPFmeCC1x4+dhb+3/pQp5eZ4xdlQQ06Ngd/EyBsY9wkmoBC1QGztR
	BzgaaOOVjd/ae8KFDjg2sWHn45pp5s5+Bofk1lv2EfVcx/n0Awnx+FPMFMo1YjDYqu4iDgQKC23
	BVFX8l4Ikg2vIhC3aMTe8FF6xB29X59jMUwzcoKlPvl4BRrf+NVZjKEBYOeVPsu/+uZSN7C3hH6
	dwJLQCrU+km0XfovSMIq8YTI0rb9NHwPXEYwg/Zt8nyRTbduny1o7nAgWciaxCdflMZRskGQIbs
	zO1PJOaWJa2cEavVn/CFHdSvX0q8LmbKf+QbZspYeA8v1UI+NXQ14NzJBB9y0EDEs/IhAhpIpnN
	+DmdqcVPhENj4u3M/lXDkBgo0CHWZQVzu1YmORSQEEcnburPmuE8eAhUvGJMT0fehk
X-Received: by 2002:a05:600d:8495:20b0:4a0:251f:dabd with SMTP id 5b1f17b1804b1-4a0276bca29mr1048545e9.16.1790870803622;
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01f93ad0bsm52969705e9.4.2026.10.01.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:06:43 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 01 Oct 2026 18:06:31 +0200
Subject: [PATCH v4 6/7] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Message-Id: <20261001-audin-v4-6-2476646118b5@baylibre.com>
References: <20261001-audin-v4-0-2476646118b5@baylibre.com>
In-Reply-To: <20261001-audin-v4-0-2476646118b5@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2158; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=LpjoGuK9iC8d6nWMcbRFPHmETDEIt3zJCl9m6XfbdMs=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFn7WrlFLqls2D3/ss7M453XpCf1M03b9P/4rsqyRY+NO
 hw63bIndZSyMIhxMciKKbKwTL/3u6BU7aFxwskCmDmsTCBDGLg4BWAiHkcZGZZvr9qQ0HIlw70k
 /1mL9g6rXafOB7HPynRvX8jW8df1hDnD/8TDQby3bNlksp+s/d1+ve+JJMuF5XksSoEOIrs3edR
 VMAMA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_090645_222968_865ED30F 
X-CRM114-Status: GOOD (  12.10  )
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

Slightly modify "gx_card_cpu_identify()" by making the compatible matching
string an input parameter. This allows to easily support also AUDIN's FIFO
with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..7e9b34e02275 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -66,10 +66,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				const char *compatible_match, const char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -96,21 +96,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
-		return  meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, true);
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gxbb-audin", "FIFO"))
+		return meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
 		return ret;
 
 	/* Or apply codec to codec params if necessary */
-	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "CODEC CTRL")) {
 		dai_link->c2c_params = &codec_params;
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "I2S Encoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

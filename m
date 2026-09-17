Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBB6C982DA
	for <linux-amlogic@archiver.kernel.org>; Thu, 17 Sep 2026 21:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMBMiOoinV/BR7B4GhvzYDxcRxj8h019L1u4mFOZZfE=; b=G+tlZr0Bsjx8BT
	of4kDXqMhsFKueV8lokGmwbixE6MomRM3MIY6RK9khr3sGdfOQItp2pcRiH0rPnKillEb8LMzQZZx
	CSy0v/9JxLsT4kI71qG0qKoPcQz+aTSiVWKEZ7Ir+8LIYOOjbUWyN4lvJeY8N+91Wb02KuyrGM2l0
	S0enFoEmDYsuOHaEP/jvPIon7nIAsKvyV6E/LEMAemAmRIAgKokeXfiHmnVv0gYMS0AL7wvmQsdyT
	DNZzC3HkyOHNJQ7ZB7QcpS6Sj/UKxnKBn0x/4waPmmRM2PspmOzuGCAKPWXfx8i7yiheTxSA8TkNG
	+03ozXrp4Ls+Jf2Bjk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFr-0000000CW94-3mhT;
	Thu, 17 Sep 2026 21:02:51 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7JFm-0000000CW5R-2MXV
	for linux-amlogic@lists.infradead.org;
	Thu, 17 Sep 2026 21:02:47 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912e4ad9so375485e9.2
        for <linux-amlogic@lists.infradead.org>; Thu, 17 Sep 2026 14:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678965; x=1790283765; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=A7KVN2E2E60TcnyG0bw/dOw9l08mQoJ5wWDaDjAEbjyrTfLj/YjaAu7je0fXNayCvD
         tL41gM6Y648GpmR3PYetTytr5mdNcJxdqmeIUVKeJIVd5iL8e6dOr8MzFsC7Upm36ae/
         /961NjiDPJlLDqU50XCrPbKEBRUueauWJ/dfFaT6kc47GHzDnaOxU1mgcTSQJXa313YA
         QGIlJ+ok0FM3vWi/hJpwA4cAoxekJvtl7D1x7RV+doJoBmeYd3bu37UXdwfgogbvXIga
         q8ruMnmYYBh8RdIp9BEhJOi3OGHGOsrMjNo2gVshKMpMSvlxSyV7WMgzZU1057qeqIY0
         YVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678965; x=1790283765;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pQfq1mATHoXVEi2yZgGnZpynXkHV46ypp/DnWHom6Nw=;
        b=RByZ6fVzJPbhBCfdKUgjX+xBJKrOc416jcgXRWxBh9d2CZkGuLE4TU3zVBGRDaNvGu
         9vT8mxgjiU9lJDPmJiVyM/YwPrhc7aA7O27Mo5j1F4BvER2/pByoV0fJ7+fFF3/fTZCW
         4GyQH/dudkvrxLOKTaSerSUJ2BagW5iFet9kLsD10WNKSye26jHApyC3kjeANWS1/YLX
         UqB00TQWs9S4P3nGLZRkkhc/Lj1LKYK6P5DJHgbDaTdnyhuSUtMwKfggvfPuJDoFEpj2
         yIFKMtdcfwquGI3Me+s/JRI9S1eZ8bg2Gmwtu7G/7wlr/Iy34Hb7Y0nWHjm+VvCDImVw
         JR8w==
X-Forwarded-Encrypted: i=1; AKwUvBx0i2YC56lteufcvPIe+LCP4MFAEZ7Txb10P2AH9wj+eMb3G5KhCye6OrCn/i0x3FdZkyRYY9r6Kwk0l5SY@lists.infradead.org
X-Gm-Message-State: AFuF++nr+d/J46SZ+B8XOVQd+TNJesj5kzake26j2iuEpMUxghtm9RrN
	hMkOkWuUt0SvMDsd0YZqOdYQ8wwN/25DG5rDm9PT/vskZj5jIpihN1cumz2JkmM4Esk=
X-Gm-Gg: AYBFou3accb/qK/z/Ux51Y33y+UYhC5NzVk/3l7cO9AN6wwXAni+7Xx+w7FNunQxvJL
	QbykhI24ADbEQj3F4Xp8lhY3bVd7i6q4yfgSE2+oxH38UdMg2LRPNzGqlN5XmuFu9ix7FN/EVFY
	AwV/edI6JLjtnoQP7Q9lP0r+QomzOAwwZ/ypYUxyqjjt3bUkMg/Tjvw3Ft03A7Sujegn/g7jtob
	obgB4G2X9HNZiEEXzV+OwgUU1rzrGG+NgSRiGkLhOGL2ops7SRKHYgo2fQ/UJ/Beb6afPtr64sq
	utNGnKEsDSgXKfUYsV/AYPWpf60hzm05RiPUgj97TwOsA2N+fT73BETsAoT0F2qwGYTB164Quvs
	fAQS5x24ePsHaxzy1NrrVaGxUCrrHuCJUDwM8a5EalkH0uZBUJdEq8gAE5uGTw2+Y70AhC/eoyH
	e0jULelua7hrWS//oVphvqfZQcbxyigWSr+za3RJJk3d0JzK7u4yMZkhzQP7T453Qt0g==
X-Received: by 2002:a05:600c:3b98:b0:49d:1f10:8b9f with SMTP id 5b1f17b1804b1-49fc56dba0dmr2100645e9.7.1789678964981;
        Thu, 17 Sep 2026 14:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:44 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:35 +0200
Subject: [PATCH v2 5/6] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Message-Id: <20260917-audin-v2-5-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2156; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=vu+Bm1uBGIa5rQR0KJvCXwwxy1648qk7OnTjRUBnopY=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQnNvBO8UVQ8+9qB99/VbLAl3fB9mMG7qDv2Yxp5U5
 frLok6to5SFQYyLQVZMkYVl+r3fBaVqD40TThbAzGFlAhnCwMUpABMJ0mZkWOu4oW5S2wKu3Rzr
 Q+/P8zi2ftoWrZUGXCl7/jeey3uy8inD//RNdj9qdysuEMmYfGw9S67zmvPuhY+4dB5MXj71EvO
 So3wA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_140246_621260_AA4807F0 
X-CRM114-Status: GOOD (  12.16  )
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
index 932be0a09306..35bc47254752 100644
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
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "gx-audin", "FIFO"))
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

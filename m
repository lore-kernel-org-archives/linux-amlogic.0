Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371FAC88E5A
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wDzScwBS0izC88gYQm2u2juQKGOrw29HMjq+CyXwP4w=; b=R7kt/v3jzdOICB
	m0LPL+xkai0M2y4WNxQKJ26fV1dUiiei8UNUZjQuxOgIeIYLCDpkw0mfIs1X4f4OSALBonwAt4wD/
	uUVeS8oMfZhHpOlUhJTwm2JyaO3zwR8Rp6kBQ28pEkET2/x8LY4fbooL4420+9g5BvLltFoKFx5we
	JP66tmuZwUOKr5pl02elgY7jTL+KU/2BNQegK7DWtjQh8FhBQuFkQ+OpXjgDLGMLLbgFHqiEv+gSC
	4OihnFsqnRdepFI4U2nPbEybdkzTmpFg8yH8NgnsP6IQIaT5ZfnLdkmGSl8dauKdf1RxNjkf9a88s
	H52K8apcgM5i1lICBqjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Ws-00000000FNM-0HOt;
	Fri, 11 Sep 2026 22:15:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59We-00000000FE1-2dZT
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:18 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso17610925e9.3
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164915; x=1789769715; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=Xq9JfhgnGRz0I4B79Zd8pdoXY9H1pbKQ+QlQvEByxRrVog1PgYWo9WPCZwcDfM2EgH
         FS4WTrV+lwBoAxUM9KZJppDT6VTWG7ZUZff9LgHJWTV69wX/b0fHBCe6ep2Qa5X52j9l
         cd4S8QYFsVXIYpUX7zJEVg3YOrMiSj0ah8bO+gDaUwq/rus3LljheJ6NRVEtfKsjaBha
         JIBichTuuqXzfE5kPTs5lf+rmJMXzOGkh91LX3TzYHVskzIqpt4iTaEBbEvV9pWLKxpq
         X/o70e6tM/KMIE4V8hvsfzUTa7wMH57LfL/Wx/IpN3uhQUClOGB38Oi0/tqDu9mb5mSc
         ZH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164915; x=1789769715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0a21Y1nKSOFECTC5sqA3T0CqQ+Krc+hIIInAv6Qgnz4=;
        b=GLQBqxavgCl1X4y99SnU+bPt10ByMgM2bXjBHziOt+83x3P6HtNN7LmPScNd3bN9Sy
         slkqKSbIOOIoO2fKQ1k4LmasbeqnVHu+UWv7UZqhf2JbvvSrRi7CzxGh5+3XdNQ24opj
         fxivhhOHLJnaKqRYhb93H+7nmDJa/UaHanybUvnQsFJmn9TtMXUMJ/hgVYirgTmq6ZHo
         PBqWJD1ZsFzswXu7VGLAWAmY9vBCQuXuwYpNJvE8pqxcMXP+bhlC0f5O5iPRcWocCzaF
         VVC2Nrm+D8rwwGk58I2Nj7aYeCsunscH7sBuUHrFSAGuNDIFURO2+vd2/YfN/KEO+HXN
         KmDw==
X-Forwarded-Encrypted: i=1; AKwUvBxlaXoabBFYdHq6mDrSf9qyLjdANDux/vuRyCjVbFbQfYXhXqMbxw0NFtzH9A2OVyC8X4/EWExQfZXTCQZ+@lists.infradead.org
X-Gm-Message-State: AFuF++mafCUr15s+SzeFdXy90U6VJqDAqQUW0HVy6IOs2N7h9X2EG6E1
	PB2AZlI6VItlcrgaLmH1Q6TG5yP+ApZzMEEWyCdwbXxXdeANWkOuvi8aNmvuTaXMjhQ=
X-Gm-Gg: AYBFou0d8sjCkAZIshn3ex8JUxrf2ZlVYL97BZspQ/oIglqmH4H34b3J4Nac92+6Ono
	l8mJdD2WJUMWd9Wp9Gub5lDavcQfAS7ed0QGBYAjV15K6JSm4r6hi+ZOkcIxshr/fyVeSeb0Qqp
	wz4aexMg7n6IQHQEI+OEzgpcoJbCSTut63R7BJ0lWdkL4MxeyHjrTP1VM/ORetX3rVaAHJ7hiTI
	AOhUwr0d3dAZNBwDsOs1UOZrm/THY62TzYvW2eDUc37EO75YZRnfSwn6PWWemj5DOuDARRbzybM
	eR0RBtA+imia+PZJLtZuaZVgAINf9Mqy7Vci/dbniLyppMglMpb14/LMA6yEoetSpeF4vPrDXin
	mCxyCxVtlSUKH93roCfzBEGo2XkcxIsZe6DYtcWCSCwfjdS6dqP+sJuNCf1KoBu3aM9L2XPCRF+
	PGBjbJs2AsTkIDAyXRlTdfOvFNR6tMYV85d6bOWz0dvqgHJ0XOiBKYFrDI+E3rdQajRQ==
X-Received: by 2002:a05:600c:3484:b0:49d:433:c3b6 with SMTP id 5b1f17b1804b1-49e619d1eb8mr73755815e9.27.1789164915060;
        Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:14 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:34 +0200
Subject: [PATCH 4/6] ASoC: meson: aiu: add I2S Capture DAI
MIME-Version: 1.0
Message-Id: <20260912-audin-v1-4-7fbefe928711@baylibre.com>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
In-Reply-To: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=Uvy6WjK33Ql5QDc+7YeTX2qUEcUUi+n12SinkXVNwt4=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanPN62R2qhj3RZtv5n7/dkGxo+2X1bUTYtJ8z4T+/
 b708KljHaUsDGJcDLJiiiws0+/9LihVe2iccLIAZg4rE8gQBi5OAZiIpQ/D/3iO1Y+uhQl6r8y0
 vMEWZraRteTfueBJYvK/nk9Ky7q69zwjw5V01nCFvvMVs85emf4ja2+hp4tZqPejMzzTP2ifKA2
 MZwUA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151516_707991_AB76A83C 
X-CRM114-Status: GOOD (  11.91  )
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

Add capture stream to CPU_I2S_ENCODER making it able to handle both
playback and capture streams. Captured data is formatted from
"audin-formatter-i2s" widget, buffered from "audin-fifo" into an internal
FIFO and then bulk transmitted into RAM when the FIFO is full.

As for the naming of the stream "I2S Encoder" is kept as base following
the same pattern used for the playback stream and with the goal to minimize
changes.

Supported format for capture is currently limited to S16_LE because it's
the only one that has been tested. According to the manual also S24_LE
should be supported, but this is kept as follow-up.

This capture support also takes advantage of the following commits that
has recently been merged:

commit df3c987ab3d7 ("ASoC: meson: aiu-encoder-i2s: reflect bs quirk in hw constraints")
commit e82159384a50 ("ASoC: meson: aiu-encoder-i2s: use the core symmetric_rate handling")

They ensure bs_quirk and rate symmetry across playback and capture streams.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/aiu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 535fbf7c1639..14d0e20a4bd6 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -153,6 +153,13 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.rates = SNDRV_PCM_RATE_8000_192000,
 			.formats = AIU_FORMATS,
 		},
+		.capture = {
+			.stream_name = "I2S Encoder Capture",
+			.channels_min = 2,
+			.channels_max = 2,
+			.rates = SNDRV_PCM_RATE_8000_192000,
+			.formats = SNDRV_PCM_FMTBIT_S16_LE,
+		},
 		.ops = &aiu_encoder_i2s_dai_ops,
 		.symmetric_rate = 1,
 	},

-- 
2.47.3


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

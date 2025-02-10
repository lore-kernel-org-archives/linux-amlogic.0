Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CC5BC0219E
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Feb 2025 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObXXfoJwEZxAv50qWTc/zQnx88aZKByAVESS99av8o0=; b=aLqTxrSgTCd5uS
	tL+rsuQZbj5wAMIuJZMDhFzKTOOcEY62Hlq4I4JlrW3Zy56QNkylZzBVSX6Vd1J0F8D9DIX9EpBUq
	MFNdsz7a+IOFTOqs69vLnANj4Vs7nI2mE2yq+8cnS/HiGTnpsyXvJtr9NW37n9qypSEBvaIjV0LEq
	O/TcE9EW6caOAQ9VTmcS/Y/xb7gnIDlvEv37gicohLTvUgNZDQViKAL7Y5a5t16FPDd+6g3GP+3+A
	Lcjg/ljOtF0x2j1PdKaMmJ+ZbkGYRYdb/exygQuNBllt9GAR9RvkgrN2HlLnGj4jWEwekRmSjnneC
	G78GKgkedOZEU9Y+2mjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thVJ9-00000000EHc-3psh;
	Mon, 10 Feb 2025 15:02:47 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thVI9-00000000Dyk-1dKt
	for linux-amlogic@lists.infradead.org;
	Mon, 10 Feb 2025 15:01:46 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab7a342ef4eso428536166b.0
        for <linux-amlogic@lists.infradead.org>; Mon, 10 Feb 2025 07:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739199704; x=1739804504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWn8LoEHwMNZQ9TBj9gyzvn+gEM+LQNUFBCn0O8RbT0=;
        b=TuCPoZmrZdSKH0Mo8FeR7yyTACZDaYS/lo0OHNyAM1aA3fO76sKIC+yTMVrBrHeGx8
         ySBWCZXspPjb5x3ShM74Ylq3xLu4HYXePHURI2Rhu+9Qf8Rz5GE8DySRnH6mgvTdglPa
         2PXW4/cjt4D/lF60nh8ROPW1D+X1FbmHVyl5pfyJSjvjbB1dU16/5YSi05b49umYvSot
         4bpbHumlUtJ+B41V+xy58EjdA4S5oKUPOr8eswxbYKpYPWsBCbCOh+ys51dEDamVu2x5
         HMBFjIlpdi/BV/Pbm9jjPoAaCaNneeJ18YEiKEfMBiksjb6qopLs6DGaTmsIJCNTmvpS
         dKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739199704; x=1739804504;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWn8LoEHwMNZQ9TBj9gyzvn+gEM+LQNUFBCn0O8RbT0=;
        b=QwZV/BjOYXMxgF7eyHEP6tjDf52JTAjuMS59NbALsHc6RZ7BtP5T4y25pk6ytrK4dU
         KJu112yyF8IiXzJANV6kcaJBbpvP9w+6XRxGnH2Pr0OxNBUbBkb+V9mpV3BkGQD0ljA7
         vJebxShZaq8EurMxryCvI1oBYZdgnf+sL0PA8RcGrCYVDDjxzkecCx9nOU3+ozKT66or
         zqPEOTJJe4Ms2KeY8k0xEFk1UoCaNaO0feMcMskjUAtU5JT7UuXb/sg35ZFLXk3fzr5w
         guXSfIbCIra/gtjziFyirGJKLKzFFDPzn0yCaKJXBMtfa9A2wzlM3bPB9oK/1d2TGNn4
         Y4NQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2nFBKDVcpqnPPPNL5jW+Cgt3XbMTDl13P9GDF7CIt+JiFPMdwMdupnD4NSMI+T/D7K9Wy8dGS5Pq9qB78@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz/2Jn3T6D7qQ3X3OjuHVUhLbdgkKh9acx1j/lhT4/hw2/GjFy
	tOCPCq5T3rVymWL5qMl5RIezA/dZQ/90LMnadn1yGHVFlhZ3rBZZpfCKGevUXKgVT4ItCOAI7Ph
	tt1fIFw==
X-Gm-Gg: ASbGncs/C/LT0aeVqAafjDqB579/8c2T8kyEKJ5CwYbJa8TUcP22Ng7Vp6J+Ez0NGaD
	wzjkEsUKt8tN6kazIc0vUVEGytjlWv3oCLpBquBaCGVyJgcFw8oAaSK0GoHVp/+OGGibfsN5hL3
	ZzKbf2U8Ofr1boqQEJG7oxFXqVGyAvBsFCTyRId4/68rI7QcNs5cPE0o5OBkHGsYjS84H68h83b
	AZ62JTz/PalhuW2Cy+7xRp5qEYe8mI5dJdjDDQJIpIAHXtWNXvjuvqhrc/Z5c9xwQxT8I0AFUtf
	glDLMcF4XZNvquaiqr05Zw9zgSvw
X-Google-Smtp-Source: AGHT+IEIeHQTJ8/QtRwBWcSl9TO92kHxG7avnOm8/eWBRmULID8JOaosNQ6nHBBvafmVZG0xlTQNtg==
X-Received: by 2002:a17:907:6eac:b0:aa6:5910:49af with SMTP id a640c23a62f3a-ab789b1f93cmr1478824566b.24.1739199698834;
        Mon, 10 Feb 2025 07:01:38 -0800 (PST)
Received: from localhost.localdomain ([151.41.218.186])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bec717f7sm250400466b.81.2025.02.10.07.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:01:38 -0800 (PST)
From: Valerio Setti <vsetti@baylibre.com>
To: jbrunet@baylibre.com,
	neil.armstrong@linaro.org,
	khilman@baylibre.com,
	martin.blumenstingl@googlemail.com,
	linux-amlogic@lists.infradead.org,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Valerio Setti <vsetti@baylibre.com>
Subject: [PATCH RFC 4/6] ASoC: meson: add support for AUDIN in gx-card
Date: Mon, 10 Feb 2025 16:01:27 +0100
Message-Id: <20250210150129.40248-5-vsetti@baylibre.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210150129.40248-1-vsetti@baylibre.com>
References: <20250210150129.40248-1-vsetti@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_070145_433932_7C4F5866 
X-CRM114-Status: GOOD (  13.04  )
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

Extend the gx-card module in order to support the audio input capabilities
provided by AUDIN driver.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index b408cc2bbc91..c59bb18b0951 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -67,7 +67,8 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
 				char *match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
+	if ((of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) ||
+	    (of_device_is_compatible(c->of_node, DT_PREFIX "audin"))) {
 		if (strstr(c->dai_name, match))
 			return 1;
 	}
@@ -96,6 +97,8 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
 		return  meson_card_set_fe_link(card, dai_link, np, true);
+	else if (gx_card_cpu_identify(dai_link->cpus, "TODDR"))
+		return  meson_card_set_fe_link(card, dai_link, np, false);
 
 	ret = meson_card_set_be_link(card, dai_link, np);
 	if (ret)
@@ -107,8 +110,11 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
-		/* Check if the cpu is the i2s encoder and parse i2s data */
-		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder"))
+		/* Check if the cpu is the i2s encoder|decoder and parse
+		 * i2s data
+		 */
+		if (gx_card_cpu_identify(dai_link->cpus, "I2S Encoder") ||
+		    gx_card_cpu_identify(dai_link->cpus, "I2S Decoder"))
 			ret = gx_card_parse_i2s(card, np, index);
 	}
 
-- 
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

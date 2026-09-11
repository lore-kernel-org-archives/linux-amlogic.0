Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9CFC88E53
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Sep 2026 22:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kt1L76mAJo/kaJihxSuSMIpnty0derJesvSexkKQvSc=; b=3TsDeiPpg1/IzQ
	Ls0S7VOHX6MUXYer/xBaQwEJTAxu+0ufioiD3eHHDKSwSbYzhCRnlp4iRD3BLD9rbSckZtDsRbC+g
	I6aUZsU1aeFqYv/4Js0mzl9yZ1xIUbsCugbosfsHftjoSr5yuL43zhv8z+6LU/cw2Uby9C6eJtV66
	nCYC1KcKYJaPrgQk3iFNNu/wYypG/a8ZSZBlI8aGelmG8VYnwQ1p7nkMsCmEeqATw3hnMfM1gI2Tw
	+6/m7HU2q7Ja+0cmST27WocBq/9cIzQa0rdyOww7Sy+dfvane5K7acBGKZfR1a0OGQ2J/+enaKAU5
	QWNh8ZMCsVlJMFB/eSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Ws-00000000FOG-26So;
	Fri, 11 Sep 2026 22:15:30 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59Wf-00000000FFE-3BGO
	for linux-amlogic@lists.infradead.org;
	Fri, 11 Sep 2026 22:15:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49d05d51553so13775115e9.2
        for <linux-amlogic@lists.infradead.org>; Fri, 11 Sep 2026 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789164916; x=1789769716; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rx6csCYnBIAKkWZ5xnYlxeHA4bLs6tcrZbjQ0G65hTA=;
        b=nDwwWYnEngUKLduOovXQ36h1muGaxBe2DZbrg8mo9cWHRRmdB9M4VEPYuTOyWLO/3F
         t9WYrIJVad917550etHcwLpVdMY7DuPPo+pZ9oXhP6HGqDao8IFUXzq6D1sLNkxjfpSI
         mAYhbGw+v+mN61k4GberURRVL7I1F3vnwuj6j2LotbLEXwDnH8xfGKKD3/g03Kwji/fo
         n2r4x+HbLvj7pNK6Jv9wtrStU0A5M3XnbRBYwWl4ASi0BRnaRqbpt3LAEsaPwi2Aywvk
         nj90ZZl4dNnrd/3JHgslTutjWGFECyF24rxVRI9BFfqZP8HHdNMRQDa+BUu4l9TOIXtw
         DIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789164916; x=1789769716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rx6csCYnBIAKkWZ5xnYlxeHA4bLs6tcrZbjQ0G65hTA=;
        b=B6BLHSjwjprx3FRdBCZVPHNTu+2F4zseAfxtnkuirMzdFfs2hi5DpdO5lhNY6SIxyE
         J59kSQqXDNFEnsubCZQpiExKZeUuAVvZowdkaGMq95sQfbDx6f9qe+Im7ZjTRTTY66/3
         k4u4TNCGUrxsRBR8IQThZ6sz2IeXIlT1jyzCc3AWZax40TxnXNg6MMxqkcQqch0N/+IV
         K4bq1BgkFICWKO5BJKx1Dq1SqiP4nnSXbaL8A4wr/m4U8sxOAv2R/IJZaoEqJ1Rg5frh
         gi20p9aKErVmL4pj1CYxCN9d4h+EtexDSU+Gmxt2h3wCyt7oWK2rrUqtJKnKZOaQNM0z
         0ZDg==
X-Forwarded-Encrypted: i=1; AKwUvBxToxch+H5RXA95L6TIe7cn7qlBSGnbzMRF5t70/8RN7Jpwbv4C4WtJRzTAkXaywEJchCC1J5OxUzofMIm9@lists.infradead.org
X-Gm-Message-State: AFuF++m8+sARprywqwXZEAxL+uWXdSgCBc9xXyxSMYCzxYhOPLCL6WeQ
	NuF3EvtCe5qEe9V7gjqEj/C7oYm9n37fno+ZL3yKU9QmEkU5H3+TCQGmOEMkfpB1BuUbemfXcf+
	KUr33rNkuTw==
X-Gm-Gg: AYBFou3HoNRCV2DFQzAnFQ9wp8Rpl6VV7+yWnv+kplmrPXVY5gOpQwxhrTmxMo9gXL1
	K2StOttMt6nPvtHigZQXVZIMS9wshKUTJ1BXOyyo54KS4wL0FvXbQxDFfTWYkY1VbKDO2rAuFsu
	I113m0C/1Pr/W5TVr3ye6C/EyFl4c+yByPoqu1ApCyCtUghbTDqOOnx/ONKt/2lEmyda+UPegaU
	tQgKMyNvvFkKrlzaWgNHQtD017IaH8DHePcdVmZy48kPrbNrRA36T0BSWJZ+00lqGFG2wdX5DxM
	0slOPe1LWV7t6D8tex1KkbstIWHTOlahgQTsqW2cQDHc3N+hKngrk1RrSt5klYd0/qyXaB5Tl6F
	eLgJc1rr5glnQ/t39KvYa2+753bXjnquH3665xu+fKrNjrK6B2H9huDh7z7Q3loax9N7CnXruVs
	vlG9MG8mZWtPxSISNWHM16Mf4jx8cZL6yE9VV0HCEhNyyy1JPmivZVk0zMFNr7fmr0iA==
X-Received: by 2002:a05:600c:34c2:b0:49c:fc6e:a3dc with SMTP id 5b1f17b1804b1-49e619d87ecmr78261575e9.27.1789164916192;
        Fri, 11 Sep 2026 15:15:16 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2a419sm202882745e9.7.2026.09.11.15.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:15:15 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 12 Sep 2026 00:14:35 +0200
Subject: [PATCH 5/6] ASoC: meson: gx-card: add support for audin FIFO
MIME-Version: 1.0
Message-Id: <20260912-audin-v1-5-7fbefe928711@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2176; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=6fSYtC/gN4yRWzT4VG1S6kcjUzyFoAinugRVvinR+3A=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlLanPnF/HWmOcoLhLc2aG2y6DOYPfOConb106Fss1Z+
 2z95GubOkpZGMS4GGTFFFlYpt/7XVCq9tA44WQBzBxWJpAhDFycAjCRReGMDNsvL96RqhvU1Piv
 1CHgfe2NXe9suU6fDf2gmDCh41u6z2JGhgk+6q2L/vmtyXV7mvuuaEL6yVSdTdcdDS9l+Rce9Jz
 +hB0A
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_151517_836954_7BD5B3C9 
X-CRM114-Status: GOOD (  11.97  )
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
string an input parameter. This allows to easily support also
"meson-gx-audin-fifo" with minimal changes.

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 sound/soc/meson/gx-card.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 932be0a09306..132d9771e2b3 100644
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
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "meson-gx-audin-fifo", "FIFO"))
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

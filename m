Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E058F3ED4F
	for <linux-amlogic@archiver.kernel.org>; Sat, 11 Apr 2026 14:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsSuG3IpGc5TVLE2I1mHVCUEEsJDyXvOboij5+I6O9E=; b=eK6XZN0Nq6FZyU
	T/3kJjGvhGV7JOa/x7+KUqM8xkHSfjdcFQQTXqMjuV7YpTeHjuO4gSaTg4dia2uVBQ2iXpDkHQN2X
	6yYMVLVUVWp254x6YBA1OIP7mwT1/HOpNXITZbVr9T7WMZdzxzel3aLGOpf86jvNiopWz7/lDp5Fh
	7sb8TcJnqfscQyDvnGAgsK8nBxfbcJR/+E8QO4YC5XPr1+rD/JqkS42NraYNqf25jqhXzfVf8N8Br
	0kSiQnSVXYFFPxcfVVNZ+VjYcrBpkVw+a9QFdoyHaguyXeNjI2YvlpxXeEUpDGmtMkkbZLn04e55o
	vSoeuz/+iISh4zaZTLAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZmt-0000000DXxU-2eu2;
	Sat, 11 Apr 2026 14:58:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBZml-0000000DXjC-3clN
	for linux-amlogic@lists.infradead.org;
	Sat, 11 Apr 2026 14:58:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so39703515e9.0
        for <linux-amlogic@lists.infradead.org>; Sat, 11 Apr 2026 07:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775919490; x=1776524290; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DII7aCMHxbnEfo6qVNehUuDSdlZbo8e6WaMr0UUHHGk=;
        b=FIViirpVlGARNCBAxEt+vnrme2bmXqQ4LG9FNuX4rsEafJXdY6R0dQErOOq5BSFnMx
         Tu8lLGQEHXXgTRKtAMUCLMP4voe95dpQJwUyktGaGmKa0qEZ1fyA8GULXjPldMWABskf
         OeRhG0DHvBp0uC57ttBHQWFuok33xwt9FaoUpH7ixZqN9Uz9DuKqxJWubRVHS10Kq5cu
         Fj8TnWk4B7lx20JK/hTs2goPmQIKKHqW800m8XdrfzkJ3oZkIr/14/Lq35Ft3f0uT01p
         s45T/JH3lQF6ANTRNqs+6DbiHQZPF+jEl1J45+rszOSQLDCprJRThuQX8VjD7nliOZAg
         z9yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775919490; x=1776524290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DII7aCMHxbnEfo6qVNehUuDSdlZbo8e6WaMr0UUHHGk=;
        b=k9aAfsZZgUV9F7WVwa+rqEybUDT9ui0h5cxd3p7e2OjEXk3zO3byPdyNsvpM2TpPza
         zOySgfILFwe5dTYCy2FAQrLivcaNdaYkF+ST8lBwslLKjOaegb6yl15FlFbH7Gi7qVNx
         FDXdKV6+TN9SfYj9KHkmyN0RqpjCpfmeaIWHzNAF29a85z5fEeicj77ITqN0oe33pRqD
         DbyBy768wy8qkN1plU2Llk/QavzEIjnssabq5Qs02RtrmxxloAt6iXE2ksfT6L8wpEfj
         Ldh+AiPpKRaOfVwrTVrgm3fKmHMGT1zkh1pkgVFH2EkZ84Vex6Xp4aArUpgmtIqU4E5u
         v70Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVlylc2SBQaUwZfSS2pixZDAActPkj1cZOYBEDKkvFnutOfGwBaYa05kPv9LVAl/A0MlzvZjNonzBszcM0@lists.infradead.org
X-Gm-Message-State: AOJu0YxfgtY4cKJjY0Svu14ZfpF5PBQ2ep6Zx6KKauP204lJQMBBZzg6
	3MeJUfFKNXd3Nas5VfULfg37n6kgfjAXh5KZopmyjZqWU8bn81tPAyj/h4e5AlUPaS0=
X-Gm-Gg: AeBDievljDtdgy6vtF/7+cg4qR6ZtErZBhvi4h3sPSdOUaZ5TlzBhd5YUyoxkcey+c5
	rtXU8lEpdcAuW0oKoMxr3r04UnCyquVfh4KShrP1PQWQNa40t0eTq8chj+tXXAlTaO0kMUWjSLz
	F8lZUKLaCw2kVBIUjfvYLeJSYupI5kNUB0POfWUf2+w+oEY/OCXAH4lwUxBmPJ/+y13HJtzBPvc
	l9+vNDrQjy9fy64CNfSiequ4Nvr7qT5n5xlY9coXupcXJ0C+omv8oh0YIwMm0mXwJjiQXR9YadP
	RikdeU0Epr+taQIXduq5KFZN7Wb4O+jEgr72ZPwdZk05U6huG8d47MrwkPC42KuNOTy6E33RKBu
	CcGXM3yc/HQTcXmRUXYEarfKp8hmSK3aP98M7X/Wadr1nd/Rwx7zDttKX9GuQfWoYMHsViv3LgW
	JOSul8Rs68j6eg2eoov9xG
X-Received: by 2002:a05:600c:30d2:b0:488:e192:6fb5 with SMTP id 5b1f17b1804b1-488e19270cbmr11503025e9.24.1775919490161;
        Sat, 11 Apr 2026 07:58:10 -0700 (PDT)
Received: from [127.0.1.1] ([151.61.248.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5dc7070sm48882375e9.10.2026.04.11.07.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 07:58:09 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Sat, 11 Apr 2026 16:57:34 +0200
Subject: [PATCH RFC v2 09/11] ASoC: meson: gx-card: add support for AUDIN
 FIFO
MIME-Version: 1.0
Message-Id: <20260411-audin-rfc-v2-9-4c8a6ec5fcab@baylibre.com>
References: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
In-Reply-To: <20260411-audin-rfc-v2-0-4c8a6ec5fcab@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Valerio Setti <vsetti@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2163; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=2ntYm7/hmH/uH7c2NHvmQVtKZ8poNaDp8J/gvOxFEnk=;
 b=owGbwMvMwCF2z3ty7kUrRgbG02pJDJm3EksmrahWzn5x4WJtQN9LV2MG+cX3n90/v2bLvk2Pc
 56rXmW06yhlYRDjYJAVU2RhmX7vd0Gp2kPjhJMFMHNYmUCGMHBxCsBE/mgx/K+7ttJNs2e2wi0/
 j5oX17Y4BPCdOmtw+cEkWbmYU/HcskaMDI+OnHHQteZYLetsyuvQYCp/q3T7pBKJ8ze1v4kfnCj
 lywEA
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260411_075811_944596_2DCA1594 
X-CRM114-Status: GOOD (  12.20  )
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
 sound/soc/meson/gx-card.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index b408cc2bbc9193ae56d02b4fcd05af8df3f93d80..1e48dbbf7324dfa6ca66026d944422dadf4204c0 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -65,10 +65,10 @@ static int gx_card_parse_i2s(struct snd_soc_card *card,
 }
 
 static int gx_card_cpu_identify(struct snd_soc_dai_link_component *c,
-				char *match)
+				char *compatible_match, char *dai_match)
 {
-	if (of_device_is_compatible(c->of_node, DT_PREFIX "aiu")) {
-		if (strstr(c->dai_name, match))
+	if (of_device_is_compatible(c->of_node, compatible_match)) {
+		if (strstr(c->dai_name, dai_match))
 			return 1;
 	}
 
@@ -94,21 +94,23 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (gx_card_cpu_identify(dai_link->cpus, "FIFO"))
+	if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "aiu", "FIFO"))
 		return  meson_card_set_fe_link(card, dai_link, np, true);
+	else if (gx_card_cpu_identify(dai_link->cpus, DT_PREFIX "meson-gx-audin-fifo", "FIFO"))
+		return  meson_card_set_fe_link(card, dai_link, np, false);
 
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
2.39.5


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

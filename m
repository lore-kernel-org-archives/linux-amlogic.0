Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84583C433F5
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Mar 2022 19:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7bzuF9yQh5PoNNj6kxOF9RFHitN8rNwptEp/kCZCDe4=; b=T/bINcpi7lthK/
	efpDptSTsDNOnpwt3Wli/ncnCpUeDamEG3zMlo6yYgbHYuzotzhgk75TxRQTYzmF9xeSDtr3zIp+q
	Ml1ASuswEtLpBwWbCdlpuBTDQNzQSvdps1OF+9jHqdfg5205j20oXiKtf7+KVy1p0Rv3GmfMAh7a7
	VpVGfkSR7sqCUQtY/DtqTl2JetHUPN41yqo8PaXQxAOrwtLCbacuh/rDrVbw0IlgE0KAQk+0ZvcVC
	c1IxYq+1MljgGBtzxVRZDfddMcaAXKG3e/4jQLKEM+SKAScqsMB/NI99cPQTGTQcAoqkPKyzKdE5p
	No1idCUU0ufyUOv80WBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRf4U-005qsV-3f; Tue, 08 Mar 2022 19:00:34 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRf4H-005qrO-PI; Tue, 08 Mar 2022 19:00:23 +0000
Received: by mail-wr1-x42a.google.com with SMTP id j26so19675738wrb.1;
 Tue, 08 Mar 2022 11:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc:from
 :subject:content-transfer-encoding;
 bh=BrK7bDjpNNfbNfWHDDgIDYJgMsjhI5oc67ZcgDStByU=;
 b=e9JIQtEI5R4Pw82Q7GiVcSHmHvhDspmi4O1tsaetcGCtBaN9BUMuTL0z538e8pqnl9
 hje6B0n35FNnVNbO8c1yQ/4qJntF4bC6QPq+y07wI7/owtgOXtdhcdXqpz/T5Qle1Mbv
 0WBI/UkQhynUHbLKCECq/xsmRsGpJGrX2nS0/hnc4RJ+8ipn+cwTL9kd5x1mONvAg5SI
 5oOozD4a2Cm1XEswO+kYbOJM+XI/p52kx3DI4fAbepQpzqUy3GMMSSbaozBW833ia7+e
 mOSWmQhSdija5mSXTYwI6S+p1T7+iU3ZwyH7L9r23RVBkprBehPkNuMRzDAzPlhQJYeV
 trDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:from:subject:content-transfer-encoding;
 bh=BrK7bDjpNNfbNfWHDDgIDYJgMsjhI5oc67ZcgDStByU=;
 b=qorhSM4MZjZXNk0L1aNdptLI51DhqWQES0P38s2R8SmyNRylqV00MFE+Dla84SKNAQ
 9vxptwdXaFN2viBfmChHQ0FbkFQFSmtCsxayBznSaAIpHxAlGdINiGwlP1pI0ILBFByr
 sucs4OWLEfeCP/ASa9+8Zt8y36K4RM/bH3YfHLb60Reu6ejpcRNdAL8n0pc4u/uGQPnH
 3f/YvL+VWO4KU0P2xFUB1crmGZkY7l6mGHGUiyz7IewZGC7z5T4TvgLPqNptoNmb/1RT
 za1fpJvSScaawiLrrnfHVAb2byEgTv0+cJSwDziYJJuorePjZQFlKkO//bv9Up5m2iLw
 8Q4g==
X-Gm-Message-State: AOAM531O3DdZTLSOn+fgCxtANJNSZyyMW4zeklCxy8MyJ+n7WA+K2SMy
 iStiBqx/L+m9IldcwwRcVXQ=
X-Google-Smtp-Source: ABdhPJyG5uJSpcng8hHCapbm6cigma4b5tpf8v55ugHdYhR+9V6enUL/sDZaOk/SQs3ypuqYOBp1KQ==
X-Received: by 2002:adf:dc91:0:b0:1f0:728c:8faf with SMTP id
 r17-20020adfdc91000000b001f0728c8fafmr13673390wrj.287.1646766020389; 
 Tue, 08 Mar 2022 11:00:20 -0800 (PST)
Received: from ?IPV6:2a01:c22:7b54:500:3175:f9ac:af86:a778?
 (dynamic-2a01-0c22-7b54-0500-3175-f9ac-af86-a778.c22.pool.telefonica.de.
 [2a01:c22:7b54:500:3175:f9ac:af86:a778])
 by smtp.googlemail.com with ESMTPSA id
 bg42-20020a05600c3caa00b00380deeaae72sm3516970wmb.1.2022.03.08.11.00.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Mar 2022 11:00:19 -0800 (PST)
Message-ID: <7d6c2755-77ac-86db-899f-7342ee9e69b5@gmail.com>
Date: Tue, 8 Mar 2022 20:00:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ASoC: meson: aiu: fix duplicate debugfs directory error
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_110021_883683_1A645B7B 
X-CRM114-Status: UNSURE (   9.71  )
X-CRM114-Notice: Please train this message.
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

On a S905W-based system I get the following error:
debugfs: Directory 'c1105400.audio-controller' with parent 'P230-Q200' already present!

Turned out that multiple components having the same name triggers this
error in soc_init_component_debugfs(). With the patch the error is
gone and that's the debugfs entries.

/sys/kernel/debug/asoc/P230-Q200/aiu_acodec:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/aiu_hdmi:c1105400.audio-controller
/sys/kernel/debug/asoc/P230-Q200/aiu_cpu:c1105400.audio-controller

Because debugfs is affected only, this may not be something for stable.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/soc/meson/aiu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index d299a70db..c1a2aea5f 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -68,6 +68,20 @@ int aiu_of_xlate_dai_name(struct snd_soc_component *component,
 
 	*dai_name = dai->driver->name;
 
+	switch (component_id) {
+	case AIU_CPU:
+		component->debugfs_prefix = "aiu_cpu";
+		break;
+	case AIU_HDMI:
+		component->debugfs_prefix = "aiu_hdmi";
+		break;
+	case AIU_ACODEC:
+		component->debugfs_prefix = "aiu_acodec";
+		break;
+	default:
+		break;
+	}
+
 	return 0;
 }
 
-- 
2.35.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

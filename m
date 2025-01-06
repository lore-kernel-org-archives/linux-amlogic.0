Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84124E77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rfDMq5qvtk6flxNSGrNFe12MQPqkc4cUWG681Nfnz8I=; b=F6EEK/cbBO3t4X
	6diS7AN1hjzP8CY8Q1DcJPzKrdgUt2AORqDtdmeY/iQujTBdLctOlSd5G4kb658sZdwjbyxq/fncN
	blpxhehqZ6XFYGP+ba486wAcjhyDx/1+OZQXuPUP9eIPo4Hk3HJRvAXYJh/StkBlOEQmu60Otaony
	KkB2A8q/EPCwfH38Ze3Kb54AFQLzl/x8xJQsbnv6r6ALhTlxbcu5AtEgLTfG6w13fJpC0XbXG3rLq
	ee543hIUY23IaW9uMGCux6++TNnCFKaikClgm0nhGbgpYn4SvnrJ5wlHtlZAIJ8XOWJCdkmsO5E2g
	k8L1Fi7L87Hd8B8tIK9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnra-00000001WnQ-1sNC;
	Mon, 06 Jan 2025 14:13:50 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnrX-00000001Wmc-3RHp
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:13:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aaee2c5ee6eso1641065266b.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:13:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172826; x=1736777626; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJsdF/HqDSazQeuRYtol4zBsSURNokKA1EzOunr3pJI=;
        b=FdGLsNXmFS0JfpP2NC/aNf2y6I9eQwLJRvXdkRlTjAc/qwwqFeiKwYrXzE1ae6+qqh
         dBW7y3/HAzFpivKQl0+fNnlZtuHLXWHZpHCmW0DOtL1Ozipr+N4XmWGha3/dkGncgpx8
         cJ/kpnrR+4RBX6jBXqvVG8N1brdXH2T5JVM8nUv5H2SIecEpt8bSMECMhF3rDleW1oZy
         ssTr/pwRRcQUiNlHhuDiig3F/h6OXg+PtdKslCIhIYOYA2qi0fC5QSBcS8lU6oV6TD5L
         9Y9VyhJHvSyVkZHahlL5QyrUpToSNpDEqp+FJlXrJMGun5ZDUz7/cLslPcTGrAHtrFsO
         Nxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172826; x=1736777626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TJsdF/HqDSazQeuRYtol4zBsSURNokKA1EzOunr3pJI=;
        b=MYDYpyTNO/EuTeinuppyI7liCx0iY9p4RlV8Kt97ihILrF9mmtKaTqoOcfENHM/q7z
         stl+3SAmkbUOnYO/rHgpfwYHnuJRUSlZcjm93J35EYcrdC/JPBMepsHc0GnkCqK+B9d2
         pIslSi56lethQ0dPsBmj89VTCs/0Ic+2Mkq+WmXW7lVIcir/gDScHbYrpIgZNVkZbAHC
         k/8e3/oGHPOPIq6oGAQf7JbVUTxdLKuxqrFc+R3CImiZsYAXQ54F9SwLwiz5+5V38wXn
         8qx2CZVkbr8kJV30ky4gEmlZOqbRc/SFzK3aAmZBrkv8g10zpZBkx7B+gb9M0Sugi5rj
         DN4g==
X-Forwarded-Encrypted: i=1; AJvYcCXXn4uPuazwQ2aVwN0X5yI3OpbbowpTpHD9B7Gs8lOlgB4U17aQ8zduhsQbxfINejItCOpWuRPsEAYozGE9@lists.infradead.org
X-Gm-Message-State: AOJu0YxSKXTX1BSDzaZZYLvgpqbkYylX+03SPT4dfvsDazxfi20jPhLq
	tvwUNep+WoyD9TYRJO2gVzKaV09IbazPTLh/lOOsWn7nvCjkaD/5
X-Gm-Gg: ASbGncvni/pZ++8MrTPqSJYznU2U9eYmaT3q0zIyDqY9plR9fK7Tj19XsQPgXplTGZF
	Dg/Nk839veQRbxxvAQ09knCxNHmtQAhaxH4Ql8R9so8wADvz3eP+VcayO2rcQJcCJmH2SDQVHo0
	Iy1xzoQwBD44gIi+bCV5JPEROy01/V9D5oKHVR+bfuhFc9MZmlxb8JVJGl/fuqM3Yi8B7KhxWNk
	bNZ+/MCZYdzZ6O74vCNffXrgKQiBkh1FA8ZZuL3mHIVdeVWKNIqmeyyAJZv1q0wNjHbDSbMj6cP
	Lves8oFIph7Mi+vJgDzADPQytRvTDauVlBw6G3xcd2cu0AyuXpPH/6m2MxgwuRE4P8j/TOvvb4d
	bFkm84w==
X-Google-Smtp-Source: AGHT+IHIuepFynI4A05OgDhT0oqn0GIfPBMm7sdjUOMILAaYgE1oj9VYbYzk1jxK2bfrwjvAPu4g8Q==
X-Received: by 2002:a17:907:6e90:b0:aa6:5d30:d974 with SMTP id a640c23a62f3a-aac2d3286bfmr6068129366b.28.1736172826189;
        Mon, 06 Jan 2025 06:13:46 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-a9f2-7d00-0000-0000-0000-0e63.310.pool.telefonica.de. [2a02:3100:a9f2:7d00::e63])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aaede7ef3cfsm1811342766b.77.2025.01.06.06.13.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 06:13:45 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-sound@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: s.nawrocki@samsung.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	jbrunet@baylibre.com,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: [RFC PATCH v1 2/2] ASoC: dapm: add support for preparing streams
Date: Mon,  6 Jan 2025 15:13:16 +0100
Message-ID: <20250106141316.375984-3-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
References: <20250106141316.375984-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_061347_868448_F893E5BF 
X-CRM114-Status: GOOD (  11.74  )
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

Codec driver can implement .hw_params and/or .prepare from struct
snd_soc_dai_ops. For codec-to-codec links only the former (.hw_params)
callback has been called.

On platforms like Amlogic Meson8/8b/8m2 the SoC's sound card
(sound/soc/meson/gx-card.c) uses a codec-to-codec link for the HDMI
codec output because further digital routing is required after the
backend. The new DRM HDMI (audio) codec framework (which internally
uses sound/soc/codecs/hdmi-codec.c) relies on the .prepare callback
of the hdmi-codec to be called. Implement a call to
snd_soc_dai_prepare() so the .prepare callback of the hdmi-codec is
called on those platforms.

For platforms or sound cards without a codec-to-codec link with
additional parameters (which applies to most hardware) this changes
nothing as the .prepare callback is already called via
snd_pcm_do_prepare() (as well as dpcm_fe_dai_prepare() and
dpcm_be_dai_prepare()) on those.

Suggested-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
---
 sound/soc/soc-dapm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 99521c784a9b..ac8eef217dc4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4013,6 +4013,13 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 		break;
 
 	case SND_SOC_DAPM_POST_PMU:
+		snd_soc_dapm_widget_for_each_sink_path(w, path) {
+			sink = path->sink->priv;
+
+			snd_soc_dai_prepare(sink, substream);
+			ret = 0;
+		}
+
 		snd_soc_dapm_widget_for_each_sink_path(w, path) {
 			sink = path->sink->priv;
 
-- 
2.47.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

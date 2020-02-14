Return-Path: <SRS0=pzWI=4C=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218E0C3B19D
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF5424654
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Feb 2020 13:14:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oU6AVV53";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="crz6YhDt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF5424654
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sFKcanj/czdUthpXAwRBI5B4iZ3Ut2xDjRzHGKx8Gdg=; b=oU6AVV53IWArhx
	B6Xm3MHGntThGU02jqUNmsV1erv1FETYXdyyQ3k8e/vFTr6QQLUuZjCVHZVYSwDOKRgVddhLXJ8dn
	Zw/Ht7jcSmPOp7Ymic4d88On+yAhQIUfbbqHgjjPWNABDSpIeE7IHLVVtcTMhCDSL8ScTbhyYXm42
	z3GslCLUq0n1yz4ZBJZ4fiQln71QeRQfJ1noi+Fcj+wbiaEZdALoUCiJmLLxtuXNkTgPcjMm/5e5t
	LdDtAau3gU1M7iri8n4FAUunIdcJjN8uOiSadxMYR/Pzl6ViqUDoqld+Bwm4Glx1DbAuX2noD+u2Q
	mj9shKJrQgL5AUFoc6UQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2anI-0006PK-OG; Fri, 14 Feb 2020 13:14:08 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2anD-0006MG-Mp
 for linux-amlogic@lists.infradead.org; Fri, 14 Feb 2020 13:14:07 +0000
Received: by mail-wm1-x342.google.com with SMTP id p17so10566449wma.1
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Feb 2020 05:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R5hDX2fKXXUqTN4gPhmTaSqEJNj3ED130xdKjaE+HMU=;
 b=crz6YhDtrV4g8O0/zuiDTYuG8zBCm32KRjK1pD7VSdJPhUVaoAYvLpqkt3v7PIzjH3
 obkCAkhtBFnXK0ExU10NKjBrPtLnGlHTsfOGNOgSjcQhRYEOeRtAg1kX/YRO+Cpa9CLE
 SyXdc2npbGM93qpvkjgJrD/mv/tT2utWUvKQKBvK9rmNbTqeXFFI5Ah27zYZyLJdsPlH
 abrWcUMYrrH+AJtI+u6RxalK5ymeul/ch5gXVOK15AQlgMEAY5XYjtclqy18QKxpgTHN
 EzYMvc6y+368tLzlLAASePwT+nXO3iliU+BhwY4QgFIoei+DzzeE7FcVSYd8tUstN+zy
 snGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5hDX2fKXXUqTN4gPhmTaSqEJNj3ED130xdKjaE+HMU=;
 b=DSoSm8s5PpwyxivC7cjHIg3VnVQK3GQeLL24uIrWp8kUHe6XkBTMtTGNfBhXKG/ro/
 6i9ZhVvRf0q4zqCyZ1tWWrA6yZO0o9qZsqsIEUfLkTOt0dGKn+hI9YNIFIlgr3odCwf1
 DqWg0I+nT66bCJ2N8vEQqh+dRgQecR+5msNbSj4Xz4NZ+qqsuxjjoNUcHAmfneh5oOUE
 qPnaIcg65vKfwYv3NpElMLLwr9gKO4/wWcPIwZ0E7VWPgFfPuolIMh6HBn6qpOVb1bsP
 ldFFvKZChKAS0mqvVYJtDFTFB8MYXlVJz6CLZEU8U47egOEpRIHTms0YWyRVl9NAS1/2
 G6vA==
X-Gm-Message-State: APjAAAXuinHM0NR1+Kw+eBSF8ofOCsw9iv4HyTyp9ajx1v6EZaXvkpco
 K06vAiaIHifx2lnmWtMNz9a/TQ==
X-Google-Smtp-Source: APXvYqwgaIoCglawV5EQ+iFySvSsaN3OWiu9vP82DWE/KGYV9dscwOSz5sA+BE7GOlaYfgmLrE+ljA==
X-Received: by 2002:a1c:4c13:: with SMTP id z19mr4579049wmf.75.1581686038936; 
 Fri, 14 Feb 2020 05:13:58 -0800 (PST)
Received: from starbuck.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id w7sm6760792wmi.9.2020.02.14.05.13.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 05:13:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: [PATCH 4/5] ASoC: meson: aiu: fix acodec dai input name init
Date: Fri, 14 Feb 2020 14:13:49 +0100
Message-Id: <20200214131350.337968-5-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200214131350.337968-1-jbrunet@baylibre.com>
References: <20200214131350.337968-1-jbrunet@baylibre.com>
MIME-Version: 1.0
X-Patchwork-Bot: notify
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_051405_091442_ED093275 
X-CRM114-Status: UNSURE (   7.41  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Remove the double initialization of the dai input name as reported by
sparse.

Fixes: 65816025d461 ("ASoC: meson: aiu: add internal dac codec control support")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index 12d8a4d351a1..b8e88b1a4fc8 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -128,7 +128,6 @@ static const struct snd_soc_dai_ops aiu_acodec_ctrl_output_ops = {
 
 #define AIU_ACODEC_INPUT(xname) {				\
 	.name = "ACODEC CTRL " xname,				\
-	.name = xname,						\
 	.playback = AIU_ACODEC_STREAM(xname, "Playback", 8),	\
 	.ops = &aiu_acodec_ctrl_input_ops,			\
 	.probe = meson_codec_glue_input_dai_probe,		\
-- 
2.24.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

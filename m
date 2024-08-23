Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C60C52D7C
	for <linux-amlogic@archiver.kernel.org>; Fri, 23 Aug 2024 16:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41SKLz3jYCghmlCJNpigCGB6g2XJjeU2b0qpJ4Iq33g=; b=wFHXpDHN93XlxK
	SIYUVvZA+XHmQaGtl1DCGAlEdiY2HwpXzdDNAMu4ysFEdUK7XX4Ct7JcCADSzItXR0YHk2dse2tTq
	Q8ow85eOFyXoeB0fbtj0lKcBySou32lkzntOTNVbuefWa7lSQKfVrm/EA0qbTuV3PZ3Q9nCPY0bUx
	nkcOcvgPIChqW/1ORYcvpp9bjaIvrUkF5MKNvFUlTeHJC/X2Esw+7izydAuyTmdRDOyR26oRJza7K
	1olNcUeh7sv+O1tGhx6/3lLsWNJWqZYWcn+Rl6QcOSIve17tQwQaP59S6c/Kz2jCfMBzf4Z3ws9qd
	gzWObp4pqb4vPyIlZeUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWkv-0000000HRtR-3MGJ;
	Fri, 23 Aug 2024 16:03:17 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWk7-0000000HRaa-1qpt
	for linux-amlogic@lists.infradead.org;
	Fri, 23 Aug 2024 16:02:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-533496017f8so2882559e87.0
        for <linux-amlogic@lists.infradead.org>; Fri, 23 Aug 2024 09:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724428945; x=1725033745; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+byIGe4g18ARlIGzsWCBhessTlbszeK6bqUvyBPezWg=;
        b=YtRHWAP3B2yQdtRkphOfUO1je4fXpqeep33X7h174xR4JX8kZq2vkN+01caa/AC86x
         ZSStZ0MonHwyuXJmZeMKp0JqYi/nc2J7p/7LjErhKpTRbEh9CnbZdYvAVF3eyu/GjwKP
         Bw2nftfzPcdzLtMXhzglLocAd8SYBz+R/brAFLhDCmagdAXKtYkzmVeHUYwV8DhZ1N0+
         EAGpPPvzrjysaHiS44VS38HbnY1y0Mw3zZQhORMBm0cyydE9VoTwJ5TDLVj9AgfeaPI5
         S2GfqCE5L58z8nZcAFkUSSzhp/qnk0ZRMjPI3p0GKuLoy8C7D60ouKjIEcKklhD3nvMA
         iN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724428945; x=1725033745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+byIGe4g18ARlIGzsWCBhessTlbszeK6bqUvyBPezWg=;
        b=dwZA6qoQwJqww4RO5i+CsqJx8jKrLNGMtaV7g53l6gFo1iSPtxlHPaZED2v6oOvIxi
         WWRNcKUNVNYAtDChamgDMU3hykQCNVqy/dOElLxgN9rtVeacy8P8HmlFuDDPSOaLucog
         Xu0BJcDMdwqgNtOR6Ac0GFy5LEivF56hQ2nFgByWRM5yFrzdjV1QAUgQwliqhUQE2cke
         AOfNHylRoWZBPYZJLG9DP0zIfhdHjNLUIgwBaAeabLUVZ8cruw+mAfDSUXIgwIMCI+3q
         xiA3zolGrjneXFsxd1d6jDJK1JQR2oWX9HQEpTLOoFVMLA58s4eLxs66Qd/hc7tOw3//
         27VQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCf/5RHpHFwEz3ULgGTeivhqeKRF/M+O9U51oXwBu9TcS6R9Ev1UjcdCI3VMWU62oIMrsyamk8nkAZWxob@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLjiaS46Y/MPtFJzMxSbNtIfgtrrxBDx0oM27ZQGlj/XS/oBT
	m0osC2PyjJn3uUtL5dhQRvehazYAmz2MnzjbjVWDxxVOUS40jnbtgkC84iBfhZBy8II+G3y0XWg
	hbb6yS96bSIqiPFRplYz2SNxzzl3quVaMPZGPSA==
X-Google-Smtp-Source: AGHT+IEbEoxnoSIsIcOXGYvvsido0gU280o9EgFhYynNtmAq+4AgzMA3KAh37jKek70/MtZreE52cxmgz9LwgewK5p8=
X-Received: by 2002:a05:6512:e9d:b0:533:47ca:974f with SMTP id
 2adb3069b0e04-5343883a0e6mr1568421e87.27.1724428944837; Fri, 23 Aug 2024
 09:02:24 -0700 (PDT)
MIME-Version: 1.0
References: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <f74e326bd7d48003c06219545bad7c2ef1a84bf8.1723053850.git.christophe.jaillet@wanadoo.fr>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 18:02:14 +0200
Message-ID: <CACRpkdYUaqtqQ7mggRu6BFTs9cP-jsvqFhHv939jGSjZ4F6MCA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: meson: Constify some structures
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_090227_519978_12314D91 
X-CRM114-Status: UNSURE (   7.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBBdWcgNywgMjAyNCBhdCA4OjA14oCvUE0gQ2hyaXN0b3BoZSBKQUlMTEVUCjxjaHJp
c3RvcGhlLmphaWxsZXRAd2FuYWRvby5mcj4gd3JvdGU6Cgo+IFRoZSBmb2xsb3dpbmcgc3RydWN0
dXJlcyBhcmUgbm90IG1vZGlmaWVkIGluIHRoZXNlIGRyaXZlcnMuCj4gICAtIHN0cnVjdCBtZXNv
bl9iYW5rCj4gICAtIHN0cnVjdCBtZXNvbl9wbXhfYmFuawo+ICAgLSBzdHJ1Y3QgbWVzb25fcG14
X2Z1bmMKPiAgIC0gc3RydWN0IG1lc29uX3BteF9ncm91cAo+ICAgLSBzdHJ1Y3QgbWVzb25fcGlu
Y3RybF9kYXRhCj4gICAtIHN0cnVjdCBtZXNvbl9heGdfcG14X2RhdGEKPgo+IENvbnN0aWZ5aW5n
IHRoZXNlIHN0cnVjdHVyZXMgbW92ZXMgc29tZSBkYXRhIHRvIGEgcmVhZC1vbmx5IHNlY3Rpb24s
IHNvCj4gaW5jcmVhc2Ugb3ZlcmFsbCBzZWN1cml0eS4KClBhdGNoIGFwcGxpZWQuCgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtYW1sb2dpYwo=

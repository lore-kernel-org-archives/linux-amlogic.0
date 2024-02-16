Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E471C48260
	for <linux-amlogic@archiver.kernel.org>; Fri, 16 Feb 2024 11:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UGVoQpQn7BDpoTT/Rfo8fUadDLoaiqrXt3YZDeC/Byw=; b=FDOHeUNuODI2Zj
	d+IhouR/LdX6Ly47E1nOXqewW6rYuuweso9xvqpEcEbaF3olIWwZBUW3p1c5ihSR0oriLDU+8mT6K
	5B39Uj/lq6SxwX5t8YdRTLB9uUF7akGizFMpBAw3c9anrPceYRYlylcuQBq6wTH/seeniJzN4JKPS
	X5yt0Vkbuy3KYaa9mZhxU32nKDtbnKZmfFor7SODX65+XhuSIwslmx0l5ExCtNeu+YugUUgfjQtay
	gk8ACcyuyosFjIJy10HnQW31qLxKD+Z2qzNZ4StI/6HZMzVOx3wk6b9t4IZqfXUr7YlglSuXC1S4y
	Jh7UKjcQOnLOaAj3sKKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawgR-00000002CbT-0NHJ;
	Fri, 16 Feb 2024 11:47:11 +0000
Received: from mail-yw1-f172.google.com ([209.85.128.172])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rawgN-00000002CaZ-1vSl;
	Fri, 16 Feb 2024 11:47:08 +0000
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-607d633381fso5611997b3.1;
        Fri, 16 Feb 2024 03:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708084023; x=1708688823;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQ7tnAKFUkQOj4UEtgJN4h/6u4fraBJnTp0nHjLT6cQ=;
        b=QM7tcCQtrlCtYqVwDmaS4MPBAo4NxlY82MjRAJ0452GV1D4iWhEFfkujeehPuXcDZk
         B8kDMyQdAGCThybw8yNIYoftV7b74du4Y6Y0ofRriWB2aVYIHliAt78nxTH7QJvco7cF
         N3TaMiZXtKBv6OBw7DbhTUqK5j/CSoLd+KseawUWNsPudfTfqj6/U9KJP22hRwA1+n0Q
         l9azctc9xXSbd0kJ/3oe9p+GNdxlila4njlN8+OMMPu/f9BRUn8bJAiFU3aRhFqe+ZcK
         fMICKFmpFmHal1JYk1slL3FHgu44ZWUwa91I6ADxD7Qs9iLZo1/w6M1t9zsfOwpeAVHU
         UL2A==
X-Forwarded-Encrypted: i=1; AJvYcCVUo5JV4QCD+u+wIBndCXICTbULuSgD+ti2vzRmo/aJdYCSl47xwFvtx4wufFDNlFlWW/xjSHL3WckJnayulvp9mzmBe/k28F1zNAd8MNROtg6vdw/ahcv1rNnRacCdoQPhNTMWb5TtKXQx/SfwVyXlBcyCQcMqt+HRpTQTW3xgV0ZC1BATHYMpM4RRAwqRcvMyJx2xCbU=
X-Gm-Message-State: AOJu0YxcPGSrgSX6lUTeXP6S2yKfQcX/Gf/ax+YG7aLmgnEVoZS6/gLN
	hBdhsiGvJAw3Ui+yIjM5DEWpDuwdSTl7kZOM9FUAtkFkdaPyLR9P2gMomWSiJiU=
X-Google-Smtp-Source: AGHT+IFwBZza/xkw/bqBxnpzNr+1Jfvl1UQUeI9Xp/yOSRNqMhXZV9vweCJWtNa+l1QTlOo8MkAvYA==
X-Received: by 2002:a81:914a:0:b0:604:f681:a1 with SMTP id i71-20020a81914a000000b00604f68100a1mr4922904ywg.16.1708084023131;
        Fri, 16 Feb 2024 03:47:03 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id o124-20020a817382000000b006078781907bsm303582ywc.139.2024.02.16.03.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 03:47:01 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dcc80d6006aso689228276.0;
        Fri, 16 Feb 2024 03:47:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU37D4ST3qi3UwNtE05fwDt9tYr538VIuWrleE/6f8tss3rE4wEUViNQTLtPvB2kgJwjIktVtGyAlpK6tLe7ymyYcHWV0aZQ7EdDQxK899YJB8cXNFKjhcO61hduvl/6j1DctSg4MzRubvbMlwGTvuwcuEMeVfK0uzrPrA5Afl9Pd8JMOPHVZVJFumlXjoX+GfkDBr4Pro=
X-Received: by 2002:a5b:708:0:b0:dc6:cc35:35e9 with SMTP id
 g8-20020a5b0708000000b00dc6cc3535e9mr4412013ybq.35.1708084021189; Fri, 16 Feb
 2024 03:47:01 -0800 (PST)
MIME-Version: 1.0
References: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240208163710.512733-1-krzysztof.kozlowski@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Feb 2024 12:46:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXzObEqExtJZpUpXLfCWB5fW9ZhekbbotcxcMrN+uj0Ag@mail.gmail.com>
Message-ID: <CAMuHMdXzObEqExtJZpUpXLfCWB5fW9ZhekbbotcxcMrN+uj0Ag@mail.gmail.com>
Subject: Re: [PATCH] clk: constify the of_phandle_args argument of of_clk_provider
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-stm32@st-md-mailman.stormreply.com, 
	NXP Linux Team <linux-imx@nxp.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-phy@lists.infradead.org, 
	alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_034707_522484_9209E6FE 
X-CRM114-Status: GOOD (  17.61  )
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

T24gVGh1LCBGZWIgOCwgMjAyNCBhdCA1OjM34oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraQo8a3J6
eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPiB3cm90ZToKPiBOb25lIG9mIHRoZSBpbXBsZW1l
bnRhdGlvbnMgb2YgdGhlIGdldCgpIGFuZCBnZXRfaHcoKSBjYWxsYmFja3Mgb2YKPiAic3RydWN0
IG9mX2Nsa19wcm92aWRlciIgbW9kaWZ5IHRoZSBjb250ZW50cyBvZiByZWNlaXZlZCBvZl9waGFu
ZGxlX2FyZ3MKPiBwb2ludGVyLiAgVGhleSB0cmVhdCBpdCBhcyByZWFkLW9ubHkgdmFyaWFibGUg
dXNlZCB0byBmaW5kIHRoZSBjbG9jayB0bwo+IHJldHVybi4gIE1ha2Ugb2J2aW91cyB0aGF0IGlt
cGxlbWVudGF0aW9ucyBhcmUgbm90IHN1cHBvc2VkIHRvIG1vZGlmeQo+IHRoZSBvZl9waGFuZGxl
X2FyZ3MsIGJ5IG1ha2luZyBpdCBhIHBvaW50ZXIgdG8gY29uc3QuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cgo+
ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3I5YTA2ZzAzMi1jbG9ja3MuYyAgICAgICAgfCAgMiArLQo+
ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3JlbmVzYXMtY3BnLW1zc3IuYyAgICAgICAgfCAgMiArLQo+
ICBkcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jICAgICAgICAgICAgICAgfCAgMiArLQoK
UmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+
CkFja2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgoK
R3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdl
ZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0g
Z2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNo
bmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2lu
ZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRz
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

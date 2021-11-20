Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD3FC433F5
	for <linux-amlogic@archiver.kernel.org>; Sat, 20 Nov 2021 23:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CYBEBLpwbw/G4hSUS2sFF22ghQAOPkymDtItCJb3ww8=; b=kQeS+mH1gJ9a5d
	YT0Wdg+qVRCZ/vT44av475uI3ZYk+O+LOvjsvjQreP1Ag2f4czPQtvBKuMH6eHBeB1d2/1Pr19Tz0
	vqqf7nxuyWeaMz8+oTq0BAL3BuIM9eZVdNypvkaQ0ORsvVtkgNajvLIg23hqTaOQWeJblRtUhm8Zx
	DmEO4k0alWXE/zcKfB7nmcUheyTsic0FqwDu4N5LJrb8hlsBeLOSnf489dVAGYO5XE4o3S1CjsgKV
	kPnQqBiIlwfANGANc/y0eBjHubZvuFWDLnmWS3GMr1NHjM0oRr4fVd4jNzzXo9ZByYa3e4+qW/9VI
	Bgsytxh6ZUr7mv1ywbDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moZsx-00D3pS-Dw; Sat, 20 Nov 2021 23:35:07 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moZsv-00D3oc-3J
 for linux-amlogic@lists.infradead.org; Sat, 20 Nov 2021 23:35:06 +0000
Received: by mail-ed1-x52e.google.com with SMTP id g14so59181329edb.8
 for <linux-amlogic@lists.infradead.org>; Sat, 20 Nov 2021 15:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mHtQSj11k7VuMznmMKnh6/LXN6T5gxNJSVkExRwgo38=;
 b=oe+qY8jXhpFIPdIuJ46r8t+l4fXZVr0owy4RoE7UmfeBkCmHEoA/LR+ndZTf8j6deu
 ePM1fwDP/rNWpq4GX2SkJ31SHFRMClOgEoNxqpy9osa+d8dUuC1v2B1x4im7yl/5svVs
 q14TxWiGUGeOJLfi1VuPP/uBIvcBZj7c9BLXMHI7Nn3UB2O74kVrok3XHP5GC2uACQfW
 3e66yqObqna4A5nGnHQ7TiK+tfG9l5hiifz2WsaoWEAgsxORUTRCz6lCikJG/M8jrzpB
 oEAQJJ2BA3rWLhRns9yylVjCIwUNsmPmB380jqArZ2YhLNewqF7toAoj3vMBQ4qf0/W3
 s2Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mHtQSj11k7VuMznmMKnh6/LXN6T5gxNJSVkExRwgo38=;
 b=OMlzVZsvNB+ju+uIJMkVJssOYtBvpe8LS5UGrEd1hnAeUtovtuVaZ0hHgeM85bsbwY
 W3w/6JO6km47dbpXDE0ZvDnbF0/PNyadwscScvbs9Fp9cHzMqIU5IjrCVszt+ol8WI2i
 +pwmsl6z+qnZCn0kP3+pI5603Kr/R3Qrh08sWTyX4yr8wwIJ1qjs5NG0HypzQzJ1HyWU
 FbQYhN2XE15FLdUqA8M+/bHhUXUh0FGawtx3M+126VpEm7KUBwQJel13Fho02EMvdhRg
 RPH3aD88VKkcUuY/wZzbMwcWz0GcaTxLYK61rrDV5Lv+53HvGl9tQ9RREsQ4ExA9mvzr
 lMjw==
X-Gm-Message-State: AOAM530GbLP8VuS972tRsN95jb8G9N9kw6P+HU7prNU/yCdJbR/vn9+o
 0V+aeWbxMwehd/6SLiE6Km15DMuGAC7g5R73VEmvMFlZIDc=
X-Google-Smtp-Source: ABdhPJwK9QpyBEvxzH8bMLZpZxGHDV7efAgsJ1o6DA+L2b42i+vMvbry3bEUxaeBSfdJk9prfR5Or5JegRPUH7AdiBs=
X-Received: by 2002:a50:da0a:: with SMTP id z10mr43945848edj.298.1637451303501; 
 Sat, 20 Nov 2021 15:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20211108134628.120474-1-u.kleine-koenig@pengutronix.de>
 <20211108134628.120474-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20211108134628.120474-2-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Nov 2021 00:34:52 +0100
Message-ID: <CAFBinCBcS=MC_cZQVPBYzFGKmfjpkBKKDO7sa+Yeb8pUzB-O9g@mail.gmail.com>
Subject: Re: [PATCH 2/4] pwm: meson: Drop useless check for channel data being
 NULL
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, linux-pwm@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211120_153505_169438_FD7E0DE9 
X-CRM114-Status: UNSURE (   6.64  )
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

T24gTW9uLCBOb3YgOCwgMjAyMSBhdCAyOjQ2IFBNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSW4gbWVzb25fcHdtX2ZyZWUoKSB0
aGUgZnVuY3Rpb24gcHdtX2dldF9jaGlwX2RhdGEoKSBhbHdheXMgcmV0dXJucyBhCj4gbm9uLU5V
TEwgcG9pbnRlciBiZWNhdXNlIGl0J3Mgb25seSBjYWxsZWQgd2hlbiB0aGUgcmVxdWVzdCBjYWxs
YmFjawo+IHN1Y2NlZWRlZCBhbmQgdGhpcyBjYWxsYmFjayBjYWxscyBwd21fc2V0X2NoaXBfZGF0
YSgpIGluIHRoaXMgY2FzZS4KPgo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1
LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+ClJldmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVu
c3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29tPgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5n
IGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

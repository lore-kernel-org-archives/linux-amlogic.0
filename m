Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB861C0015E
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Jul 2023 19:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VY43TaA+Dvao5HYIFVXCwz+YtXTrilUAw1I37ucptek=; b=zinlzV/c7byYC7
	lOJH9fpVnamfEefCfNr6Y4sVVLF9ttjWKT8+47ffo6GS2A1QomMJL9vW7an8N4XuNOdX4LPk/UInT
	7bYogdjn0dhJcBGqNUd/EZ/8at7vpuq42xYxljKo/hhlWslBN/zxP5NAdS1rZntpALMi8YgjQsgpx
	SCGvF7y5SzmeRlW+lrlZcq9MDi+nEKGVSy+Tux8GKbwjhtO9Dpv58X+BdicIhhQGi+B5C5GHuDaPn
	oHW7YpXfeQTpMYnYvlN4Er7KGZYZNdY2ESinUJy2MRlWLqgoIVgo/9KCqyfV81V1vcJZ+Ka9zjAwJ
	zqfTAl9DrPURHPtCkRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPpCw-008Zu0-1F;
	Sat, 29 Jul 2023 19:02:30 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPpCt-008ZqV-10;
	Sat, 29 Jul 2023 19:02:28 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-99b9421aaebso446749966b.2;
        Sat, 29 Jul 2023 12:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690657343; x=1691262143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mbwxOo0rYZaBf7rK29/+zBVbIyIuQuXZw1K3yD81hfw=;
        b=qqgKsyvm1cURFa0kmIdwXTlP4iWRb4n0WSxpNHt/XPzwWMaAwrdIRW4b2QmL3loEVw
         X8uYLYwD18cr6aq6R8+QJAuwKZirccUnOmn0Sxrb1i2dPobTOrKIzroLlTEwgGAdbpwS
         J2am7zwSVmYTk2JnPc6hkGvM2MmTy4g0qlgsWF7G0krgyvhmlmieRBkI/iMw4dHUsYjl
         7J4xdreUdwjdablWi7ce79vG+5rPllGMvNiMOnmNi5JJIP1i/WEFuFGbSocVQ21VXI+f
         NXrmKzV71NQ38IraKdOmfk7UzRORBad3bxNed2QPWNEB9udPl+6LvcXYPPTZuSXDyJ+F
         SA7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690657343; x=1691262143;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mbwxOo0rYZaBf7rK29/+zBVbIyIuQuXZw1K3yD81hfw=;
        b=lDhiKT75TcvCdgoPioJncv8x5bX7ggOkrDMWXDiauHoLJeWGuD9iGR4bwaChyBvncE
         cdoM3TgXUU6Wpu0E9dml1s1rtdTTXBMgg1Bhnr/xjr/fUTmBc/DsUM81e3R5sEfkmkQ4
         ngi3Z1VchsdDjVhfF35kLr04M1RdnXK5SByDpnFYAQgii3eRcJGZELl7CH7aL++tu9O7
         UYtKGXBhGQtRU21ErsaWsovsSnUgcSQUZMcaQOmfCxv7J9t0ZlvfNxs5jEa1QkNwiMeW
         VZ1UnwqCcNAYe0jfhRF+N4Y+KQTgeTEkvjAa9Fn54CcW2sHyIeaQmJFbTbsh16oRpOBu
         o5QQ==
X-Gm-Message-State: ABy/qLaY9/d6Ezs+E5WJrk2s9tHGqXygDIYcg+P+qHeA6z8KjVhhsOpb
	gcXOZyu/JzigGGP06y61SqoThWdGMy9+fqF4RoQ=
X-Google-Smtp-Source: APBJJlHKcmz/y1QtxHjO1aYGSheR17Kiu7PBj4dt7wZEWJJm3KSZezSQA20D0SHQZNMoiudt8fsVxA7ivGeg2xJb1UQ=
X-Received: by 2002:a17:906:32cb:b0:99c:3b4:940f with SMTP id
 k11-20020a17090632cb00b0099c03b4940fmr1296569ejk.27.1690657343026; Sat, 29
 Jul 2023 12:02:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230727070051.17778-1-frank.li@vivo.com> <20230727070051.17778-34-frank.li@vivo.com>
In-Reply-To: <20230727070051.17778-34-frank.li@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Jul 2023 21:02:12 +0200
Message-ID: <CAFBinCAXph1VS=zYTs=7A10BFKeNJ1SCyRXorTQ9rCxXjX64QA@mail.gmail.com>
Subject: Re: [PATCH v3 34/62] mmc: meson-mx-sdio: Convert to platform remove
 callback returning void
To: Yangtao Li <frank.li@vivo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_120227_348771_74BC4D24 
X-CRM114-Status: GOOD (  11.48  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgOTowMuKAr0FNIFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZp
dm8uY29tPiB3cm90ZToKPgo+IFRoZSAucmVtb3ZlKCkgY2FsbGJhY2sgZm9yIGEgcGxhdGZvcm0g
ZHJpdmVyIHJldHVybnMgYW4gaW50IHdoaWNoIG1ha2VzCj4gbWFueSBkcml2ZXIgYXV0aG9ycyB3
cm9uZ2x5IGFzc3VtZSBpdCdzIHBvc3NpYmxlIHRvIGRvIGVycm9yIGhhbmRsaW5nIGJ5Cj4gcmV0
dXJuaW5nIGFuIGVycm9yIGNvZGUuIEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIChtb3N0
bHkpIGlnbm9yZWQKPiBhbmQgdGhpcyB0eXBpY2FsbHkgcmVzdWx0cyBpbiByZXNvdXJjZSBsZWFr
cy4gVG8gaW1wcm92ZSBoZXJlIHRoZXJlIGlzIGEKPiBxdWVzdCB0byBtYWtlIHRoZSByZW1vdmUg
Y2FsbGJhY2sgcmV0dXJuIHZvaWQuIEluIHRoZSBmaXJzdCBzdGVwIG9mIHRoaXMKPiBxdWVzdCBh
bGwgZHJpdmVycyBhcmUgY29udmVydGVkIHRvIC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSBy
ZXR1cm5zCj4gdm9pZC4KPgo+IFRyaXZpYWxseSBjb252ZXJ0IHRoaXMgZHJpdmVyIGZyb20gYWx3
YXlzIHJldHVybmluZyB6ZXJvIGluIHRoZSByZW1vdmUKPiBjYWxsYmFjayB0byB0aGUgdm9pZCBy
ZXR1cm5pbmcgdmFyaWFudC4KPgo+IENjOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPGZyYW5rLmxp
QHZpdm8uY29tPgpSZXZpZXdlZC1ieTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1l
bnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LWFtbG9naWMK

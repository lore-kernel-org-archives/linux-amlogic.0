Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15258C05027
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Feb 2023 21:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jQgIzt+/To4KvxeEJfHO3qN+l/bFjBBJKTk5CVMZB1o=; b=phRf0c6K8LdSBs
	2FdQpvA6WLsdZlmo35sEA+V7oG67t6hjN60hSx9BzihY7dm5lfHZewrF0kNs1APtxBlt0mJx/btE6
	YET3gicO4i2vFNYymP9seQXx/O6KmqLpKd8es8OPqmezksTePqQsu3YL3d2Viu6BQ25WqIoNnT1VS
	NHcHIBzaET1uIB0cjiu0o3sFASy6WvlmuI/tKfqWB60X1a7+n8QJOFyC+BkopkRK2xk5HM/hZpASZ
	/koirMvq1naBYUYMk8apDYsHUSHRVdgnuyjUIX1LbCA1zqMIBME/6qmsZNmOEfbO0QlYmxMXlyyuK
	2S+BPh3I4wL1SU37lDIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTqsN-002J2Z-KQ; Sun, 19 Feb 2023 21:05:39 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTqsD-002J1L-Ln; Sun, 19 Feb 2023 21:05:30 +0000
Received: by mail-ed1-x534.google.com with SMTP id fd2so4345272edb.8;
        Sun, 19 Feb 2023 13:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gckypSBLD+AFrNIVEmiJhH6SMsrkXaBzRl4paLZn3Tg=;
        b=QEdCvQ0dbyxTiS7S+VABIMl+WlhdiYM1ol8WVyhlkzOrIY4uQrUlEIuLslpQkrqh1J
         eA3pGID8gtpTE4Wh8rG+uzDcIbUyePj2QXLJiwztkhGcOiCeycZdhoyx323xMLiRpM0F
         GL1pGUJOvK55Ku+euR13T78Aykl7th6a3G8Ou8GQfJJhA26JNmpkqdVExfLpBi6lZVuH
         RfzloS+UgxEi7f5OZdVerzEAl3eyzJdMr9upLpbeKWCbxacrGFB2xcH2maMVPmKErmQy
         4UbFXizohH4pn9Va+2Z8SLZf1iL9MEDWd+QrvrCITvB8AbaPO9tCziXnzWqQGdb/6DDP
         EJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gckypSBLD+AFrNIVEmiJhH6SMsrkXaBzRl4paLZn3Tg=;
        b=5AeNZ0Z2oYFfboqEpP7US927xronOcBDaFsPfRGZi4gjSnZbI5v+SIt7Ya9U9iL7mZ
         sRQj0nC0AiUdDzFF4MJRgyvLjR7WGoqqDKV0v6iK++HijFQbGGyPGmH3d1tQgFWdhFKv
         QT6MgAbCAxTSTXD8Vmgxf398ocW6/7wuO/0rWyCawLutkHuu6DfQVJ5ioDZjdMS8rjb6
         9Q+QD6jRi87YoesvYKxzoovIeJHdhSWPpUIYlbuYrKQI3s980xOssq1VZsG36DvlpByt
         U4ci4JxHaY1aijFHj71sDW15PtOqfeFdDrzJeYvn727WKrYkkbhdrevoKRSwZAcPcTLL
         kI3Q==
X-Gm-Message-State: AO0yUKVyc1bjFq/X6M/zKfPrHbzMwS9mfT3hADyM0CrI+u+YbjHBLEEn
	0CxzpgSYURU7j/QQ5mK9pTK1Y9sjpv+HWeD458E=
X-Google-Smtp-Source: AK7set/uVWtKRGWj12laE3Fq/wLzIoMTR7wc7M+/DzoDZFu4xlDnA4wFchR0GJrOLecR9SzdozUaI8QhepuQR0ofw60=
X-Received: by 2002:a17:906:195b:b0:889:dc4d:e637 with SMTP id
 b27-20020a170906195b00b00889dc4de637mr2974085eje.6.1676840726910; Sun, 19 Feb
 2023 13:05:26 -0800 (PST)
MIME-Version: 1.0
References: <20230219204439.1641640-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230219204439.1641640-1-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Feb 2023 22:05:16 +0100
Message-ID: <CAFBinCCF_wSt6qd125f=7wzCPm21iz6ZbJ2oHGnPNBJy30y_DA@mail.gmail.com>
Subject: Re: [PATCH v2] iio: adc: meson_saradc: Better handle BL30 not
 releaseing the hardware
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, linux-iio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_130529_753017_F7B17554 
X-CRM114-Status: UNSURE (   9.65  )
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

SGVsbG8gVXdlLAoKSSB0aGluayB0aGVyZSdzIGEgdHlwbyBpbiB0aGUgc3ViamVjdCBsaW5lOgpz
L3JlbGVhc2VpbmcvcmVsZWFzaW5nLwoKT24gU3VuLCBGZWIgMTksIDIwMjMgYXQgOTo0NCBQTSBV
d2UgS2xlaW5lLUvDtm5pZwo8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPiB3cm90ZToK
Pgo+IG1lc29uX3Nhcl9hZGNfbG9jaygpIG1pZ2h0IHJldHVybiBhbiBlcnJvciBpZiBCTDMwIGRv
ZXNuJ3QgcmVsZWFzZSBpdHMKPiBsb2NrIG9uIHRoZSBoYXJkd2FyZS4gSnVzdCByZXR1cm5pbmcg
ZWFybHkgZnJvbSAucmVtb3ZlKCkgaXMgd3JvbmcKPiBob3dldmVyIGFzIHRoaXMga2VlcHMgdGhl
IGNsb2NrcyBhbmQgcmVndWxhdG9ycyBvbiB3aGljaCBpcyBuZXZlcgo+IGNsZWFuZWQgdXAgbGF0
ZXIuCj4KPiBHaXZlbiB0aGUgQkwzMCBub3QgZ2l2aW5nIHVwIGl0cyBsb2NrIGlzIGEgc3Ryb25n
IGhpbnQgZm9yIGJyb2tlbgo+IGJlaGF2aW91ciwgYW5kIHRoZXJlIGlzIG5vdGhpbmcgd2UgY2Fu
IGRvIGFib3V0IHRoYXQ6IEp1c3QgY2xlYW4gdXAKPiBpZ25vcmluZyB0aGUgZmFjdCB0aGF0IHdl
J3JlIG5vdCBob2xkaW5nIHRoZSBsb2NrLgo+Cj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KT3RoZXIgdGhhbiB0aGUgdHlw
byAod2hpY2ggbWF5YmUgSm9uYXRoYW4gY2FuIGZpeCB1cCB3aGlsZSBhcHBseWluZyk6ClJldmll
d2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPgoKClRoYW5rIHlvdSEKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

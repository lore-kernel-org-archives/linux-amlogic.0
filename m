Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD8F3C001E0
	for <linux-amlogic@archiver.kernel.org>; Sat, 29 Jul 2023 19:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3f2AyqnlOc1lqv3xFdA4wqSTmR/NBDxO+Fd+f1NaTQ=; b=Jb/w6pvSZ0ea2V
	YWdFCwUwf/mdSFtW1/jh8JP4DpjhPOar6evqoMZr403vmcUywryuxynj4Fx4xHmOEKBrG5sBsU6eG
	Dy6sSN1Ah/NQzTo/Sq/HT2PaSPuZj4V4BHXm24nJI6FGU9+AUdZEQG1xTuHrF12cu8mxMJG52Vyx6
	/P0dVy/XOf7aR4ZaXknEeMT8S8Q4Zh9P+Y2n7vLluC6Jgqk6kPzWetEqEl8CVIpOiH/+mLA61eDKH
	1fdy/VQtKICdg9sSd8/i7QmcBTroJH3VCL+Strrsk7NYC9RSuJMbOu4j2//RM+Pi7OKb1pqhTyOnS
	CUTA+L2O60ORIZ6Ik+cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPpCh-008Zlz-0J;
	Sat, 29 Jul 2023 19:02:15 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPpCe-008Zk1-1G;
	Sat, 29 Jul 2023 19:02:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bf3f59905so237475266b.3;
        Sat, 29 Jul 2023 12:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1690657331; x=1691262131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRRM3V/fhfbk4swxDnRjXiwrMJ1xOP6GUPvikr85J0I=;
        b=AiS1B7fs+dGM33XXRn4MrbV+dKh0ChRaqW2YQngMkIlOch1whnjCy7fVH1b7QMUoAy
         KpLUo3jbA5/dMVYFEr6rxh7DJiDvzUrs4Wu70B3e462bFo8Pz0n1jCFnCgYMOFsskClQ
         YzFHyLJvMD1AuIj6zpj//pFVchpTn4T+bXwlHwUqsBhM2o1InQig8ETmLSrwfvlKhBhO
         gkcz17BcONg9oKfH5DDWHyjG6CM9BSMvVL66MX3jpBQ83d0fX+ZvLM92T2ID3kCsV2FX
         Um3MdmQr3mssQBDYmZXzN0nayioQWdnTqkW2gpVmWAxARhH6/oTUvuOcwVMzjL5hn4WF
         McqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690657331; x=1691262131;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gRRM3V/fhfbk4swxDnRjXiwrMJ1xOP6GUPvikr85J0I=;
        b=G+zCQri+LU0/22q2N4cCNCNfXl7ZY9e6Sk3u3mcskuYuWUb8e0LOZBXtrWakXh6UfN
         CdaXw7VxF72R+DcWqgnPLaTtfsLGNxCxb7avbe+j1cEjLt4NA5BnJIGJEzFyy5LE3mAI
         7C7d5coQGrysolcMDGRBfxwbP2TTUBjW0Y47hPXQBZeTW8IfOqh7k50mkLAaG07FNP5K
         9UEsGuyyf2xQjjWxD9lno2MQ1Deyt6fRNDd4Q72BXlb2QR8gGV0HZLOSQeEVgXkm6txi
         ecmJ3mVuBiJqEninU9rrUCZdqHXcbFMjmNhq5raRPT+nSVV5pLUDUfbnIU9VWWsKkX+D
         TyzQ==
X-Gm-Message-State: ABy/qLY+hXjFBe5y+jO7JnNk7Bvl6i6n+DwjmHL2qYAXKq30IfxMkjJu
	e924xB1DOlcpgcvwqGCai7Yo/MrroqIgZOLvMw4=
X-Google-Smtp-Source: APBJJlEXZ9ayh2OJoMb4eASEbHvDZRxUGjPivvxsURfvQuCXy+aTYhdrRqL+AAl8WxAv2JZWxF5jPwgK0RQTUVgR7A4=
X-Received: by 2002:a17:906:73d3:b0:973:fd02:a41f with SMTP id
 n19-20020a17090673d300b00973fd02a41fmr3053590ejl.40.1690657330825; Sat, 29
 Jul 2023 12:02:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230727070051.17778-1-frank.li@vivo.com> <20230727070051.17778-22-frank.li@vivo.com>
In-Reply-To: <20230727070051.17778-22-frank.li@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 29 Jul 2023 21:01:59 +0200
Message-ID: <CAFBinCA+xf+nOt+E-jUxW72mW_GjCL8GXPOgxkNAM5TPbJw4kg@mail.gmail.com>
Subject: Re: [PATCH v3 22/62] mmc: meson-mx-sdhc: Convert to platform remove
 callback returning void
To: Yangtao Li <frank.li@vivo.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_120212_432719_E6442EBA 
X-CRM114-Status: GOOD (  11.38  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgOTowMeKAr0FNIFlhbmd0YW8gTGkgPGZyYW5rLmxpQHZp
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

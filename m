Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F1DC64EC4
	for <linux-amlogic@archiver.kernel.org>; Thu,  9 Mar 2023 21:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2NrM7pmOEh9ne348vbKNPjKLxtZSVeZWBNHLyV1iHU=; b=gStUytGWCIBMeZ
	AWFjzDn+MlnnLg59H02MyFsAoOc3S/3qt1PyZ+7LmoxBuNKLGrYD/Ev9hHnGDlkKxUa1O/jNo7EHB
	1okfim8vy8Bfhvzj4Gx26mpuCxw/RaEzcTQ8nzQcQ0NojHdexBswcyB7pQPCbVYqm+nOCr+FrgiBm
	brREUrf6M4S7yRBBwHXHgQ2w0J1r5WUwDptdm14SKr121eFx66r7or1U3hS+1FxHiF4s2PIWd/PUm
	RjItppRDm1gXmiesAKozFhju6GZKiN2ikn9au3LqjFpLS2h4hVgAFgGFPfb0BKw9lk2QrFmwwGMAD
	wh32A56xF1u73IkkvAaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNyU-00C2GI-TC; Thu, 09 Mar 2023 21:38:58 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNyS-00C2Eu-5R
	for linux-amlogic@lists.infradead.org; Thu, 09 Mar 2023 21:38:57 +0000
Received: by mail-ed1-x534.google.com with SMTP id k10so12595605edk.13
        for <linux-amlogic@lists.infradead.org>; Thu, 09 Mar 2023 13:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1678397935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQC5hfxWVbHEWl8ZrfP9KMO777ra0RwsEH2B4bfOP3U=;
        b=kjQCLsRXGgyzJBWjk4vVLXzh7JIlbWei6AQr6j1+/0QcBHPeUqwGqZwZXj6EODsd+N
         +wYCB9M/xrVXwYGLVvD3pCmyKMyDavsoJeR4H7yyP1fwM3TKvTcaOsVdx30RksiFj5u7
         ESq3Bnv5Sve2TIexGRVJuhBQOAJ/+DcLCjBJc5XtIT/2Z30r47xnjBbXuzPjTdEokK3H
         wBWaNnlPdC/3J3FPqbkhNsF0y2Bb2ktZ24R0oJyF98RTZNKuyuu3DAX/k5LlC8bfQD56
         2l+vMTmvAbQVKdwEuJ2qhYkuYTMzVgS5YpBdlldhfm/YfVZI8jgPRjEdcxAfP6zl7DU/
         8cig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678397935;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQC5hfxWVbHEWl8ZrfP9KMO777ra0RwsEH2B4bfOP3U=;
        b=6OiBZCOgr5vQ3QvYE7Ag0chE2BpvCV7fQzm205DRK3+PbOf3sh1dGtPFZpXcO760I3
         wMkqGIrHye08mGHZDGyT+2Yt7ki0l2xS8y4h1+E+o+a7sri5m0rUBN7NBteiHZ0RNBaH
         exgVL053SJ9X0KkQouVL1h45fzmgOyztSHV9jjn30nPbGY6w5VVEkhZNEBScsi+yVHlZ
         Qsd5F0Itig+VH9TDyDKIqiRoyv95wtbeeUmDlzY75Wo8QalkEIyUB8WtoUCSbVb5gjOi
         KFgTFyEr0ErSpHPtSFyfMLPGKl+/Vv+0F/8aPnCdDOZIulVJ4VwqMGuG9autcKnPdX22
         dFBg==
X-Gm-Message-State: AO0yUKUFdkjEymHUfrHjCO2TYvCM72G3Vsopq9mLx/aM9i6wJZ4aL0lc
	/3nzyt8h1WU86vduMEEHhl+IGcRJFCKTsGQQPaI=
X-Google-Smtp-Source: AK7set/2FGl4AxcL636YWKlVcDAS8iU/ZLVUhpEENhPuAiGKHfPH1cbKN1phpXLfYBUYSPukogm9WWUPjHtZ1VIHffQ=
X-Received: by 2002:a17:906:b48:b0:8b1:3cdf:29cd with SMTP id
 v8-20020a1709060b4800b008b13cdf29cdmr11938018ejg.6.1678397934737; Thu, 09 Mar
 2023 13:38:54 -0800 (PST)
MIME-Version: 1.0
References: <CGME20230309152453eucas1p28e1870593875304648243c9dead4b256@eucas1p2.samsung.com>
 <20230309152446.104913-1-m.szyprowski@samsung.com>
In-Reply-To: <20230309152446.104913-1-m.szyprowski@samsung.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 9 Mar 2023 22:38:43 +0100
Message-ID: <CAFBinCAiTWhh7hOdE-FgOO_neXfQirkNNcVp8VTh_v4dm=2riA@mail.gmail.com>
Subject: Re: [PATCH] drm/meson: dw-hdmi: Fix devm_regulator_*get_enable*()
 conversion again
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>, 
	=?UTF-8?Q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_133856_223629_7F303DE5 
X-CRM114-Status: UNSURE (   7.46  )
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

T24gVGh1LCBNYXIgOSwgMjAyMyBhdCA0OjI04oCvUE0gTWFyZWsgU3p5cHJvd3NraQo8bS5zenlw
cm93c2tpQHNhbXN1bmcuY29tPiB3cm90ZToKPgo+IGRldm1fcmVndWxhdG9yX2dldF9lbmFibGVf
b3B0aW9uYWwoKSByZXR1cm5zIC1FTk9ERVYgaWYgcmVxdWVzdGVkCj4gb3B0aW9uYWwgcmVndWxh
dG9yIGlzIG5vdCBwcmVzZW50LiBBZGp1c3QgY29kZSBmb3IgdGhhdCwgYmVjYXVzZSBpbiB0aGUK
PiA2N2QwYTMwMTI4YzkgSSd2ZSBpbmNvcnJlY3RseSBhc3N1bWVkIHRoYXQgaXQgYWxzbyByZXR1
cm5zIDAgd2hlbgo+IHJlZ3VsYXRvciBpcyBub3QgcHJlc2VudC4KPgo+IFJlcG9ydGVkLWJ5OiBS
aWNhcmRvIENhw7F1ZWxvIDxyaWNhcmRvLmNhbnVlbG9AY29sbGFib3JhLmNvbT4KPiBGaXhlczog
NjdkMGEzMDEyOGM5ICgiZHJtL21lc29uOiBkdy1oZG1pOiBGaXggZGV2bV9yZWd1bGF0b3JfKmdl
dF9lbmFibGUqKCkgY29udmVyc2lvbiIpCj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgU3p5cHJvd3Nr
aSA8bS5zenlwcm93c2tpQHNhbXN1bmcuY29tPgpBY2tlZC1ieTogTWFydGluIEJsdW1lbnN0aW5n
bCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0
CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

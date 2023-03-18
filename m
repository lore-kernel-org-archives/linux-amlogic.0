Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9784BC7618E
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Mar 2023 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rcEJiX4zw8wvtHi4bNb2E6t3lWqQe5I1VAnPNPeVR4=; b=KiSkNeyhAWMDBL
	ItSrhK2IDrOZqSt26IEJoeY0Pqxq1ex0La9rdEbYorIvySQyfFIly1TC1pvEJdEohQetiPsfcT8qJ
	h4n6CHCwGZgJmR4HcNKsutiv+pjHS/krJFamxokWbvGugawziVBtsbGlFTug1nLApQ/anZwu4vMRk
	SXRfZgVsiVL5HnAtIX6Q0+vA0P2WizcDgsEN3yNl/ajshp+YaN5vzmMj9Z3n0STjlhgkcn+Fy6dU7
	H0E1xMlIsX7B8LyZOwIFty9Xi8TYHmo32XWg/ySVns9jaSzEORosB0iFUwuCyNYaqqhb2n1zyP928
	TYLchc1Gg8B4dCUuf/jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdcYh-005Hx4-1e;
	Sat, 18 Mar 2023 19:49:43 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdcYd-005Hvz-3B;
	Sat, 18 Mar 2023 19:49:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id cy23so32589006edb.12;
        Sat, 18 Mar 2023 12:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1679168977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yfKEdToulTysU+esB/uzX0ZdOPt4WxM4XvZcXLSv8yI=;
        b=h44zN9mfuQCQ1MCRoGXU733OfMvosfWJNB5WeGSImPRPMd2gLaeogSMp/1d89BkGKf
         AiZOf66WFbG6ueLE6YgoQGKVqDUfqrANREbe2FZevWLsvejp/hiIetyUG29SEM3Iq9PE
         8vvVfciVvpmUEL2f8kcIQ6WIAsMCjtOR65p9covW44bODJ2iCT3X/3wL2my+tw8mTQdl
         sS/FY0j9jXrFM4DnRVPVggzbCZrFtyY2ojeeR6AjVscfvbgdB1DxSorY+Nf1iyG95IEZ
         WcNTMkIxRiMyZNFocsZm2kWlrmW8EchnwQuJonSaPYWoyfgEeVr9gRThEm96oaE+CkgA
         BR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679168977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yfKEdToulTysU+esB/uzX0ZdOPt4WxM4XvZcXLSv8yI=;
        b=5PMWEASHPr70TpWj6C8gLYKztNssOnb3SFwcoDuqTc/92/XKGDfcqFTVF9h1pwy8Et
         I749TF/FAglAJjX+FRWaMDvlBGuFoldctcoJJLty4jBJtU+LyYfvtsuUy6cKi1jxsxV+
         6vxlaHbFCtXuWB6yhtZXcPGy2cjy0+KGGuhLSCK5fuVzxbQePamRI2tqcOd2Ll8PFEGh
         jdcbuj6ITT0jUZ04HIQiYBrJWl3NgtRVIyTjOM7ezGwcrx5TM71Gb1w7cmuo8dOoFxzK
         z48gWzqeIpzXScBu33r2N1wdV5UJygv/cqsaVhocVLCnw8u8oC/TODSJSYZmzuxIezag
         6V1A==
X-Gm-Message-State: AO0yUKUPwzC9tIvzPg+AwVKrF9cVPWwEKSqFo6pOMYnRLWwuxpqx21w/
	XS9YowuAoKWgYFBROdK/zfRtziqX3D6XwGCmk6M=
X-Google-Smtp-Source: AK7set9FqByvnQcoOHVr+gpZ+4mRtJ68Gkcw8mLsonHmM2IOgcrO+SZRKC6k1sPDJiihys/dRZPlZmAma/+Ti3I8xyw=
X-Received: by 2002:a17:906:fca8:b0:92f:cbfe:1635 with SMTP id
 qw8-20020a170906fca800b0092fcbfe1635mr1773569ejb.6.1679168977495; Sat, 18 Mar
 2023 12:49:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230315150745.67084-1-u.kleine-koenig@pengutronix.de> <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230315150745.67084-115-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 18 Mar 2023 20:49:26 +0100
Message-ID: <CAFBinCA49o8U=7M+AJF+ik=x87QhmJC7a1pcASdf+-A1Qi2=Zw@mail.gmail.com>
Subject: Re: [PATCH 114/173] ASoC: meson: aiu: Convert to platform remove
 callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_124940_029017_CE3205D4 
X-CRM114-Status: GOOD (  12.36  )
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

T24gV2VkLCBNYXIgMTUsIDIwMjMgYXQgNDowOOKAr1BNIFV3ZSBLbGVpbmUtS8O2bmlnCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gVGhlIC5yZW1vdmUoKSBjYWxs
YmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBpbnQgd2hpY2ggbWFrZXMKPiBt
YW55IGRyaXZlciBhdXRob3JzIHdyb25nbHkgYXNzdW1lIGl0J3MgcG9zc2libGUgdG8gZG8gZXJy
b3IgaGFuZGxpbmcgYnkKPiByZXR1cm5pbmcgYW4gZXJyb3IgY29kZS4gSG93ZXZlciB0aGUgdmFs
dWUgcmV0dXJuZWQgaXMgKG1vc3RseSkgaWdub3JlZAo+IGFuZCB0aGlzIHR5cGljYWxseSByZXN1
bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhlcmUgaXMgYQo+IHF1ZXN0
IHRvIG1ha2UgdGhlIHJlbW92ZSBjYWxsYmFjayByZXR1cm4gdm9pZC4gSW4gdGhlIGZpcnN0IHN0
ZXAgb2YgdGhpcwo+IHF1ZXN0IGFsbCBkcml2ZXJzIGFyZSBjb252ZXJ0ZWQgdG8gLnJlbW92ZV9u
ZXcoKSB3aGljaCBhbHJlYWR5IHJldHVybnMKPiB2b2lkLgo+Cj4gVHJpdmlhbGx5IGNvbnZlcnQg
dGhpcyBkcml2ZXIgZnJvbSBhbHdheXMgcmV0dXJuaW5nIHplcm8gaW4gdGhlIHJlbW92ZQo+IGNh
bGxiYWNrIHRvIHRoZSB2b2lkIHJldHVybmluZyB2YXJpYW50Lgo+Cj4gU2lnbmVkLW9mZi1ieTog
VXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KQWNrZWQt
Ynk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5j
b20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2lj
Cg==

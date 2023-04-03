Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDFC9C76196
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 Apr 2023 20:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HsrqkswKP7n7/ylJ5tohJ1OQmQ7Hc9I1a9Q5AldteVs=; b=ZT1Bs8+Zd2rvbV
	Akih01nLRWqtKbOa8R8TA9byTbvDyZesq36o7iA/2oX/Tuy2kh0whTcjLzdojxsjfIR0WlXBXfGjy
	f24A5m/Q+DpmETgq4bb4MskHQrSwM7vBM5oGxnbjh6epSnSfR8tYBLMX4PfFUzDM+iICyo4Qprny2
	2WiPYgi79bgGPUmhe6rofwbBF4tWI9eDRyzYtw7CaekC8xFVIJu8MN8TndL0utu9MJXzByRp40Xyk
	a+S/NeRN6ETyfRwLn3Z/0vgaTeT2HKiHZvVkTnI1DFx97lJ4sF3uSkobKFiL3EEKB61c6CUmftID/
	8o91mvH86YQQ3oJ4j4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQwy-00Gg3z-2w;
	Mon, 03 Apr 2023 20:38:48 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjQww-00Gg18-1w;
	Mon, 03 Apr 2023 20:38:48 +0000
Received: by mail-ed1-x532.google.com with SMTP id w9so122342582edc.3;
        Mon, 03 Apr 2023 13:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1680554321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3F5+gh390KLS9RWOvvtlrwxg2Y0TraLv5K4Hb/H8OQ=;
        b=NEMhvrK570NYfHKHHwOAfmuEeVZApvKpl8+iN1zZSaaAv5qDjNOQhvVITYO5nCMg4p
         AaMoUv7H9IJZKK6kbJGWgNlyr0gZ7vLYAiY4ojUYdjTpnShjdT8XqiwmcmTRAsD7J1Q6
         jbN9A09WoawGsW4SY6woOKyFOw2JqhSs03w649lwv9VLoLtAkjjsPdRQaBhMhowpd4oM
         VzoU/5XuIXc6TGBI4hz6C7Ao91hZJiQNTSWJSWKql/YMZcsPrxjCyIhLB/Z1LMpeQIr3
         vuU4VP5frHjMDHSpeYgwXGyLwo+lHzN00JCd3mTVuBdZ5WNjhLK0HG3ihpxPmR42HMmc
         /sVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680554321;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3F5+gh390KLS9RWOvvtlrwxg2Y0TraLv5K4Hb/H8OQ=;
        b=o1g2PP/pNowZ7phmu8gEy0Y+MhK3X0mAW+MpI6i/ZVtO5FAjFgQRJsTQ7dRvC3+TLs
         qvQ+ehYAWW4ClsJzflqndrNV1pWvuButh/Vl48H+Ov2a5dZ/Clhq6t6wU/O029tj6Zkx
         nafDYwHH6s1OrADX3VD8bTupNc5UZXlOFPMp6hIP1vhrNSUqMsPr999aJQ9toYHF/ZQH
         hECVlvdOuRre0VahagxKLHnKco5cLGIx0891aZ5sdicJEBp3OwK/9yi0Pyg4sWjDE8XR
         crAWG8bO4qB4AaRRKSh/MzEBcuHYwfUUyNWTGf5FStBHE1SYENsYzqhF0ybPpEZ36/Yj
         7lew==
X-Gm-Message-State: AAQBX9cQaJoUQPVoKyKh6+X3FRyQ+7Xn/kumhRUkjKyrYu1NkDlVPbgC
	r4y6Mgx67jaPX1jCrK0dbfOP0xbT4FBxSNpTuyk=
X-Google-Smtp-Source: AKy350aKb1gVyrTMlWc2SVlN/6Abvr+c2pXRCZ62TGHslwYEHjDydpW7wvfnTYk7uuxoUrkxTUA+BU0oyRYCGKRpts4=
X-Received: by 2002:a17:906:3746:b0:8b1:cd2e:177a with SMTP id
 e6-20020a170906374600b008b1cd2e177amr18564878ejc.6.1680554321707; Mon, 03 Apr
 2023 13:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de> <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230403154014.2564054-13-u.kleine-koenig@pengutronix.de>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 3 Apr 2023 22:38:30 +0200
Message-ID: <CAFBinCAsiSLwKho_7M4XoLXCk64XriwmBuosmMnWu=a1z97A_g@mail.gmail.com>
Subject: Re: [PATCH 12/24] staging: media: meson: vdec: Convert to platform
 remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-media@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_133846_635680_CB23303B 
X-CRM114-Status: GOOD (  12.43  )
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

T24gTW9uLCBBcHIgMywgMjAyMyBhdCA1OjQw4oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBUaGUgLnJlbW92ZSgpIGNhbGxi
YWNrIGZvciBhIHBsYXRmb3JtIGRyaXZlciByZXR1cm5zIGFuIGludCB3aGljaCBtYWtlcwo+IG1h
bnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBwb3NzaWJsZSB0byBkbyBlcnJv
ciBoYW5kbGluZyBieQo+IHJldHVybmluZyBhbiBlcnJvciBjb2RlLiBIb3dldmVyIHRoZSB2YWx1
ZSByZXR1cm5lZCBpcyAobW9zdGx5KSBpZ25vcmVkCj4gYW5kIHRoaXMgdHlwaWNhbGx5IHJlc3Vs
dHMgaW4gcmVzb3VyY2UgbGVha3MuIFRvIGltcHJvdmUgaGVyZSB0aGVyZSBpcyBhCj4gcXVlc3Qg
dG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJbiB0aGUgZmlyc3Qgc3Rl
cCBvZiB0aGlzCj4gcXVlc3QgYWxsIGRyaXZlcnMgYXJlIGNvbnZlcnRlZCB0byAucmVtb3ZlX25l
dygpIHdoaWNoIGFscmVhZHkgcmV0dXJucwo+IHZvaWQuCj4KPiBUcml2aWFsbHkgY29udmVydCB0
aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUgcmVtb3ZlCj4gY2Fs
bGJhY2sgdG8gdGhlIHZvaWQgcmV0dXJuaW5nIHZhcmlhbnQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBV
d2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPgpBY2tlZC1i
eTogTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

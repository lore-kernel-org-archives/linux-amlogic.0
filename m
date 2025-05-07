Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A31AC3ABBF
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 May 2025 13:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CyKgfAHKssRDyFpVVhqR7QI20FOOweKxf2Yz+9TeqKY=; b=CRM1527PGLHrae
	gvqAY/LpLh8pL3uHoT1KpypDa+Ab8RmKjuHFGaB2Lmkwffi0+MwydqvbDH0MQL1jHQE0fdXvglnCV
	nOcuT7rVXc48pclX59eTNJu7nuJrxgFeCtE/KVs0ZY1EBMzCGiGKjjNswONHuo3ZPEX7NS3xOnrXg
	i4mtFNuUKscI1FtTH6xIs5ktHGsSgyERP5oywNhPh8egqPgPDxiYr6ppfozlauRQ2VsFo0ZNcGMCs
	tlF9IOynVAOCqQx66S85jnkS63Ruxcyl87HM6BHE7O82/uvaOsmFieSzAO4k1QhV4V5KkeU0j7l8V
	B4/roe+BZCePM//DM0Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeRW-0000000FVBF-1Nq3;
	Wed, 07 May 2025 13:04:10 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCeRT-0000000FVAn-1xJv
	for linux-amlogic@lists.infradead.org;
	Wed, 07 May 2025 13:04:08 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-acbb85ce788so348281466b.3
        for <linux-amlogic@lists.infradead.org>; Wed, 07 May 2025 06:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chewies-net.20230601.gappssmtp.com; s=20230601; t=1746623045; x=1747227845; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4+LmSgXiLryF/j8oR/d0abK66q0D8JYbtiWsJTdvXQ=;
        b=fprEREzJjcSabd4dOlA1d5apbrdSzQDLscgREZ9Ltl2dDGH1y6OdHmoRkL8IKyBR5z
         qfxGKeat7oymQ4uxWuHY4VYUp1MOz5Pbi8KA48GlgMVX0KLuDCm5ATc5t1BNToZy3gw4
         nUHKh6KFyxyonsD/ncd49uKQHrWzO+yAnCiLy7m7yYXIPVKPxfFEqPQIUeNgp+bKOFPI
         +TX5xjLtityeZmzfP6e34a+f/CVf4+8YcFxN07wny41MyId0KdH03VT0AlOrDfhiAAjI
         7Ije2kKBlD+4PHShASg0lOxSkBzOJnICExMAjQtaCixAjT1tBKgzeiK1GkqkI2H5+hT7
         dUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746623045; x=1747227845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p4+LmSgXiLryF/j8oR/d0abK66q0D8JYbtiWsJTdvXQ=;
        b=jQBOrF+ZmiuZngda8xJo4SLbkP1+hLcrQJI/NT3wl5pDyr4OgRpqrtdWrPtq+yelUF
         /F+YIhds9csSYy1LPKZGtj+3ly8R57l5TWrLp1LaQ5yTP+XHi0pVd3HLS85nUZRqvFso
         fVabHn6+kO6nYDClHrazBOkhWgtZP3vbepL9cis+f9ZxCDrD0mVEKNdQGBy1O5CwWeXz
         7APSsgsUY87bq9NmDiHLjsm0R/h1+lIlYbCuqTKHfMNTsoh+JhIUTalvJejpWqRPelNr
         YKJjjqkAwZoXA2yRsB/cgV/Ii2fiaTB+GOCO7WUqWX46VV4xBjtVGAaCZO6qwJgxwcYS
         s7KQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1ISAbp/yW+bDZGvoHAZXO/dlPenxWeQfAIl3dpX2uZNQsj8tqAMMngRXgjUQEDJQottAyHBsiTdpDQNlj@lists.infradead.org
X-Gm-Message-State: AOJu0YyyKI/CuFwYxAdPhpFjhf4gN6KKU3Fp5ATrVH3kHN2yBU3yu81O
	j2jCocod9ZuUKqwiGQE8flICfjiQ/n0uy2FlGmh8LHQNlXeQq8fLmo8Nls4uKrvG9/FjDX57CV3
	eSFyL2t4qiRoo2GpJBhz6Ge2vvg4wy1NEP2Kc
X-Gm-Gg: ASbGnctaAaxMCFB/5UED9Q/mG7FHwr2hgjU6QDJlokQCwPQtxgX+gY1wshu2DsCeWMr
	LLX5oA/DbvsjqmfBBqgDlO3QVHbX+RN8oxbuD2eGqCre21XBP2oW2ZcPDxMBzrkroFxY3gjEV+3
	KGLg8+f9bwf61Xh2a08xU=
X-Google-Smtp-Source: AGHT+IFzajSvRmyDEs5hHY4lL+t8+2vMhkjYGb7OU5fT3ekq5YUVOD2BAWbTh9IUJt7dgx74MkVuHg/PnkykKXwE4ik=
X-Received: by 2002:a17:907:9709:b0:aca:c4a6:cd90 with SMTP id
 a640c23a62f3a-ad1e8bc315cmr333347866b.5.1746623045257; Wed, 07 May 2025
 06:04:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUiLubXaPGZsE6y_X6mBTD1ZK-2w82fbRD5z8+MKvDZtZKOtA@mail.gmail.com>
 <f073dad7-337e-499a-8cb5-9dae0842de17@linaro.org> <CAEUiLuYBVyLm4HgJG88r1J8RcUu38uEVPbV5c+-ArqjU4aUOAA@mail.gmail.com>
 <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org>
In-Reply-To: <3783aef0-a7a0-489f-add0-21e1fc2bfad1@linaro.org>
From: Wayne Schroeder <raz@chewies.net>
Date: Wed, 7 May 2025 08:03:52 -0500
X-Gm-Features: ATxdqUGrMJl_qwtuZFp4N1ILboK2S9KpJF6PNjsTlAh7u7oPIil0F6b7Kp5_KIE
Message-ID: <CAEUiLubVazb4rgfBd-r-5AtyfBVaMFmy89OO_UZB97FM43if7w@mail.gmail.com>
Subject: Re: Odroid n2+ usb broken on reboot
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: u-boot@lists.denx.de, 
	"u-boot-amlogic@groups.io" <u-boot-amlogic@groups.io>, 
	"linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_060407_770960_80CDC4D3 
X-CRM114-Status: GOOD (  15.25  )
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

SXQncyBoYXJkIGZvciBtZSB0byBxdWFudGlmeSBpZiB1c2Igd29ya3MgaW4gdS1ib290IGFzIEkn
bSBub3QgbG9hZGluZwpvZmYgb2YgYW55IHVzYiBzdG9yYWdlIGRldmljZXMuICBJdCBjZXJ0YWlu
bHkgbmV2ZXIgbGV0cyBtZSB1c2UgdGhlCmtleWJvYXJkIHRvIGFib3J0IGF1dG8gYm9vdCwgYW5k
IG5ldmVyIGhhcy4gIE9uIHJlYm9vdCwgdG8gcmVsaWFibHkKZ2V0IGl0IHRvIHdvcmssIEkgaGF2
ZSB0byBkbyBhIHVzYiByZXNldCBhbmQgc2xlZXAgc29tZSBhbW91bnQgb2YgdGltZQpiZWZvcmUg
ZG9pbmcgZGlzdHJvIGJvb3QuICBJIHBpY2tlZCAxMCBzZWNvbmRzLiAgSWYgeW91IHdvdWxkIGxp
a2UgZm9yCm1lIHRvIGRvIHNvbWUgc2NyaXB0ZWQgYm9vdCBjb21tYW5kIGFkZGl0aW9ucyBiZWZv
cmUgbXkgZXh0bGludXggdG8KZ2F0aGVyIGRhdGEsIEkgY2FuLgoKUmlnaHQgbm93LCB3aGF0IEkg
aGF2ZSBkb25lIGlzIG1ha2UgYSByZWJvb3QgaG9vayBpbiBsaW51eCB0byB0b3VjaCBhCmZpbGUg
b24gdGhlIGJvb3QgcGFydGl0aW9uIHRoYXQgbXkgYm9vdGNvbW1hbmQgZmF0cm1zIGFuZCBpZiBp
dCB3YXMKcHJlc2VudCwgaXQgcmVzZXRzIHVzYiBhbmQgc2xlZXBzIDEwIHNlY29uZHMsIHNvIGl0
J3MgcmVsaWFibGUgdG8KcmVib290IHJlbW90ZWx5IGxpa2UgdGhhdC4gIExldCBtZSBrbm93IGhv
dyBlbHNlIEkgY2FuIGdhdGhlciBhbnkKZGF0YS4KCk9uIFdlZCwgTWF5IDcsIDIwMjUgYXQgNzow
MeKAr0FNIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDA1LzA1LzIw
MjUgMTU6MTIsIFdheW5lIFNjaHJvZWRlciB3cm90ZToKPiA+IElmIEkgYWRkIHRoZSB1c2IgcmVz
ZXQgY29tbWFuZCwgaXQgd29ya3MgcmVsaWFibHkgYXQgcmVib290LCBidXQgaXQKPiA+IGRvZXMg
bm90IHdvcmsgb24gYSBmcmVzaCBwb3dlci11cCB3aXRoIHRoYXQgY2hhbmdlLgo+Cj4gT0sgdGhp
cyBtZWFucyB0aGVyZSdzIGEgZGFuZ2xpbmcgcmVzb3VyY2UsIERvZXMgVVNCIGFsd2F5cyB3b3Jr
IHdpdGhpbgo+IFUtQm9vdCBvciBpdCBicmVha3MgVS1Cb290IGFuZCBMaW51eCBpbiB0aG9zZSBj
YXNlcyA/Cj4KPiA+Cj4gPgo+ID4gT24gTW9uLCBNYXkgNSwgMjAyNSBhdCAyOjA34oCvQU0gPG5l
aWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4KPiA+PiBJIHRoaW5rIGl0J3MgYSB2
ZXJ5IGxvbmcgdGVybSBpc3N1ZSwgVVNCIGxhY2tzIGEgcHJvcGVyIHJlc2V0IGF0IHByb2JlIG9u
Cj4gPj4gd2FybSByZXNldCwgZG9lcyBVU0Igc3RpbGwgd29yayBmcm9tIFUtQm9vdCBhZnRlciB0
aGUgcmVib290ID8KPiA+Pgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C474C7619A
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Apr 2023 20:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UkISyozh7t0okdiQj6nkmCNkKZdgop10f58SxJIMDNw=; b=cPG1u48FNhA7ta
	A689H2kYhP7eUxrf7tMx4ySTvAVfSPEKhOE1sZgJWuX9CfAZ6shIw8O4AQQw4bAXGsMa3qUnnHF8r
	gITZolxx1OyEt8UnDcmPgfUNhQBiMF6ZbtfD2jSt+4Z6eDD+QSOJHbyIFfJQYQWz9WKDfJHCwulax
	wKYRYffulv5veTZK9/XonTvT2Dpa8byyikVW8QZaFgPK62Nbzd1caa/68X3BTPXNbYlsdSjJF20ih
	CxXBrMwbwO8LzbqL9NmKBBVWMTBqeELTHYTf/o32zvtUI0vYVWolFTmdAEOo2j151sQuvRhGT+hAy
	ljf5D5AUkppJ0WhaqBHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhNB-004IgC-2a;
	Wed, 12 Apr 2023 20:47:21 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmhN9-004If5-09;
	Wed, 12 Apr 2023 20:47:20 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-504dfc87927so1230281a12.0;
        Wed, 12 Apr 2023 13:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1681332436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adW1liiXa5DTitRWm/MrMHr2aySyi2H+5VTArVZMM8I=;
        b=JsN8WGSr9uDtkZ0rsGDDGjoppXwP8kEuYggVlfSAxHbuAdVW2r07ASK7bI66v/x/fD
         bnHb81PY6SLdg2WSKm0gRkOLay4I70XgkEAR9/+Eq8Wa6koQ2tL/P4ValKcIb/UGHn4i
         b7tE+PRUDJpeZKWH8yXeCZyocK47W8BIZQEGlaW61gKOjK/ahl0/SeSHDN0XJa5zqwHY
         2PxxbLcLE3l8BQwtTR1BaaGD8P8MYyb+EpDCsis2heEqs020zpycawkpmTLGEOagnREa
         rlhcBQeM0u8wFhDuq6/rXbvvylKH4jsuErp8i/fi4X73URI8/QOEMQASSEMPIIUY+WZc
         80ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681332436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=adW1liiXa5DTitRWm/MrMHr2aySyi2H+5VTArVZMM8I=;
        b=XTloyXBehlGw9lPKxs0JnVFYPROg7bkGkPheUD5AROqRuDdikjszdL1Bz84YMJkoXr
         115Dp1tP6zXGKrFrk/qesCzd9RBjSE3YZ87ZIx4bqJj04qWUDrPljI2jK+oTgjee5FxD
         qO7xg/euBtphtFfHxEqD2ii+IrrbzaxVuV1F/fzG2ZG/VV2yYzS31h7PlYD04txLBYA+
         TiXLIw+ehSVMsFsJXqIYU1z+Hgp/69EKPdohY2w7LbhwoI5p48hYya/Agh4dVSg2GHrL
         G9EDkomIIWiRILO2+bSMeZ43xzZAH3Qe667o3pWwYUtc4zXfqZpxeNlhRy8ok+/+hVPX
         1W4w==
X-Gm-Message-State: AAQBX9dn7oa/QDFBbVeLQIitKMhEadjwEfLXewR1jIrIcMAHltTGjPK2
	KPMwOCyVYQP2BYqIttPEF0x+K1G/fHJ0t7YXXPo=
X-Google-Smtp-Source: AKy350aKT9mhtEZLe3+/dPU6KZVDXqdCUxJb6NrFLui1rsW9oEXUrBYezlVHH3CazHEPRcBuD1JQT57SADw4Xty6DjA=
X-Received: by 2002:a50:cc9d:0:b0:4bb:e549:a2ad with SMTP id
 q29-20020a50cc9d000000b004bbe549a2admr8415edi.4.1681332436206; Wed, 12 Apr
 2023 13:47:16 -0700 (PDT)
MIME-Version: 1.0
References: <29973c8a-2b14-3d0c-bee8-8aff36c265e3@gmail.com> <f7291bab-eb51-3f2d-4eb4-78f6330242ef@gmail.com>
In-Reply-To: <f7291bab-eb51-3f2d-4eb4-78f6330242ef@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 12 Apr 2023 22:47:05 +0200
Message-ID: <CAFBinCDs=EQo8-HSSbaprfJB+93sz+Ng1H=MX3hBG_00PTko3g@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] pwm: meson: change clk/pwm gate from mask to bit
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_134719_083687_4ECE8C1A 
X-CRM114-Status: GOOD (  10.21  )
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

SGkgSGVpbmVyLAoKT24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgOToyM+KAr1BNIEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQ2hhbmdlIHNpbmdsZS1iaXQg
dmFsdWVzIGZyb20gbWFzayB0byBiaXQuIFRoaXMgZmFjaWxpdGF0ZXMKPiBDQ0YgaW5pdGlhbGl6
YXRpb24gZm9yIHRoZSBjbG9jayBnYXRlIGluIGEgZm9sbG93LXVwIHBhdGNoLgo+Cj4gU2lnbmVk
LW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KVGVzdGVkLWJ5
OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PiAjCm1lc29uOGItb2Ryb2lkYzEsIHNtMS14OTYtYWlyCgpbLi4uXQo+ICAjZGVmaW5lIFJFR19N
SVNDX0FCICAgICAgICAgICAgMHg4Cj4gLSNkZWZpbmUgTUlTQ19CX0NMS19FTiAgICAgICAgICBC
SVQoMjMpCj4gLSNkZWZpbmUgTUlTQ19BX0NMS19FTiAgICAgICAgICBCSVQoMTUpCj4gKyNkZWZp
bmUgTUlTQ19CX0NMS19FTiAgICAgICAgICAyMwo+ICsjZGVmaW5lIE1JU0NfQV9DTEtfRU4gICAg
ICAgICAgMTUKPiAgI2RlZmluZSBNSVNDX0NMS19ESVZfTUFTSyAgICAgIDB4N2YKPiAgI2RlZmlu
ZSBNSVNDX0JfQ0xLX0RJVl9TSElGVCAgIDE2Cj4gICNkZWZpbmUgTUlTQ19BX0NMS19ESVZfU0hJ
RlQgICA4Cj4gICNkZWZpbmUgTUlTQ19CX0NMS19TRUxfU0hJRlQgICA2Cj4gICNkZWZpbmUgTUlT
Q19BX0NMS19TRUxfU0hJRlQgICA0Cj4gICNkZWZpbmUgTUlTQ19DTEtfU0VMX01BU0sgICAgICAw
eDMKPiAtI2RlZmluZSBNSVNDX0JfRU4gICAgICAgICAgICAgIEJJVCgxKQo+IC0jZGVmaW5lIE1J
U0NfQV9FTiAgICAgICAgICAgICAgQklUKDApCj4gKyNkZWZpbmUgTUlTQ19CX0VOICAgICAgICAg
ICAgICAxCj4gKyNkZWZpbmUgTUlTQ19BX0VOICAgICAgICAgICAgICAwClBlcnNvbmFsbHkgSSdt
IGZpbmUgd2l0aCB0aGlzIGNoYW5nZSBidXQgaXQncyBub3QgaG93IEkgd291bGQgaGF2ZSBkb25l
IGl0OgotIEkgd291bGQgaGF2ZSBrZXB0IHRoZSBCSVQoKSBtYWNybyBmb3IgTUlTQ197QSxCfV9F
TgotIHRoZW4gSSB3b3VsZCBoYXZlIHJlbmFtZWQgTUlTQ197QSx9X0NMS19FTiB0bwpNSVNDX3tB
LEJ9X0NMS19FTl9TSElGVCAodG8gYmUgY29uc2lzdGVudCB3aXRoIF9TSElGVCBvZiB0aGUgbXV4
IGFuZApkaXZpZGVyKSBhbmQgZHJvcCB0aGUgQklUKCkgbWFjcm8gdGhlcmUgKGxpa2UgeW91IGRp
ZCkKClRoaXMgaXMgcG9zc2libHkvbGlrZWx5IHBlcnNvbmFsIHByZWZlcmVuY2UsIHNvIG15IHN1
Z2dlc3Rpb24gaXMgdG8Kd2FpdCBmb3Igc29tZSBtb3JlIGZlZWRiYWNrLgoKCkJlc3QgcmVnYXJk
cywKTWFydGluCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==

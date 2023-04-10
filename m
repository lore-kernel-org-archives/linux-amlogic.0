Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F7B0C76196
	for <linux-amlogic@archiver.kernel.org>; Mon, 10 Apr 2023 23:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yJi8Z0UtOJ7Hnh/xRSiYyaBJwi7SPMedqXqagDPQPo=; b=LakIxRutLxVv5m
	DV4JKQlVEVz2dC9+YquoVB4BwDyRdMmZ+qDklv7WxjIMu2JmH08+HbUhl9YNYffQl/0pCt8LB7tQu
	kT/Vn0o7+F0I3aF0bIC34CiQbKbgMGFUnyKEdSIz4hnO04laI9+GP2gBeeXKvh13Ayzz6CaWOMo/L
	S1rVcmVNsIROQwbk9dA0XJsYLq+rEphvLCG7WqgKJI5jhFy9NlJJqyGY4lW6Bb/q48rYNdzvsY6Rx
	dw/ldMjjlBNGm0gSZ/E1GH8vz4b0rmllMdWKtZjWy6yJhtr/VGZ+bqyt1LGIIPX9ma4kh3bZkCvgB
	QS4FxN6xh2anYj7q1WZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0vd-00G4OA-13;
	Mon, 10 Apr 2023 23:28:05 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0vX-00G4K2-1O;
	Mon, 10 Apr 2023 23:28:03 +0000
Received: by mail-ej1-x631.google.com with SMTP id q23so6574334ejz.3;
        Mon, 10 Apr 2023 16:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112; t=1681169274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52mSxp3d2SGZP6hWb61sFRa1KWoxrjnPGG+f5rToeBI=;
        b=n4W2GGXp5Tyq3bUY6CKzmVrqBW2JbGeAJh1kbAfEKfXvSJFgokbmZ0UliPgnGlar/b
         BdQbxF79jzKBpbCu2J/tRK0+ChvtZjC833b9/EGeMEgBGdfwFN+xr6/Ya8b3ezMMZeFC
         G+Z2bJwVUTmLKbVXjol5mCFuUzfRQ+f+jHIFPg/tUc0qfY+E5Mf0oPruxfevngKaZtXF
         0hxVHIcFJPPEMfgOH6CJTEU1Cb8+M/pMyXAGn+6A1uoK/Ibgc+HpdqWjkIQXAcSNw5pu
         FW4krzr17cQZSf3/uh7ERhoNcdrMM/F+Q0VxJy17EdtkDrgtwPNUkqBZxfmAm46mBbbG
         5+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681169274;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52mSxp3d2SGZP6hWb61sFRa1KWoxrjnPGG+f5rToeBI=;
        b=d9obLly+7uf19bpKW9Chv3xS/vgeO9Ci0ao0uqPzN6iiY3B5VHQ/y04Qw8IteXVFvM
         /spsanoGWAnfMDKJuVJQm+Rc7wk5QDIL9xUK2klFXU6b1XlPka+dsOAegLAoLOhI9qws
         MqeFKdLi1PCZYIZKf/2w4dIfml30hOkOgfQAfTtCQxGietjY352VfTpMM52oLsgfcOK3
         06DNUKGJTJaPdRwikp0Nz+GG/RNEZZT5vW24jBsFXDwVWSBSIPHPxkIKUlwoxjLZmP3E
         dt6aOjTaUCBQsQ5HnbUnWvRkJ5r2KY3/5ta8HrmD09xj7sWDghF0axhNmv5QCE2j6Ud3
         DMQA==
X-Gm-Message-State: AAQBX9fxQGFP90nmK42J2XGFoW74/599PACsQ8Zg+8Fobb3rs+Aw9R6j
	leaGcHHhrBRj/5llasZPLLVmQrBQUEYl8jfDsnY=
X-Google-Smtp-Source: AKy350aTwPPRdnWCaxTzXduln+So6jSYYFDnuI5ZZZ7DxSB/ilfqNWJIVuSDWLVDZ0+uEZtC7/SxJR1ts8OysYy1NfA=
X-Received: by 2002:a17:907:8a0a:b0:949:d4ef:f6ff with SMTP id
 sc10-20020a1709078a0a00b00949d4eff6ffmr4785012ejc.0.1681169274267; Mon, 10
 Apr 2023 16:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <275c72a8-b9cb-e675-f1c0-4da658c3f98e@gmail.com> <08085ec6-0450-2477-e35f-5af19c1de857@gmail.com>
In-Reply-To: <08085ec6-0450-2477-e35f-5af19c1de857@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 11 Apr 2023 01:27:43 +0200
Message-ID: <CAFBinCCaca-VKmxv_SaPxOzBrix98Nj+VDaD1bfqSwvDBg+eKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pwm: meson: make full use of common clock framework
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	"thierry.reding@gmail.com" <thierry.reding@gmail.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, linux-pwm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_162759_488547_81535D34 
X-CRM114-Status: GOOD (  10.16  )
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

SGkgSGVpbmVyLAoKT24gU2F0LCBBcHIgOCwgMjAyMyBhdCAxMDo0M+KAr1BNIEhlaW5lciBLYWxs
d2VpdCA8aGthbGx3ZWl0MUBnbWFpbC5jb20+IHdyb3RlOgpbLi4uXQo+ICsgICAgICAgICAgICAg
ICBpbml0Lm5hbWUgPSBuYW1lOwo+ICsgICAgICAgICAgICAgICBpbml0Lm9wcyA9ICZjbGtfZGl2
aWRlcl9vcHM7Cj4gKyAgICAgICAgICAgICAgIGluaXQuZmxhZ3MgPSBDTEtfU0VUX1JBVEVfUEFS
RU5UOwo+ICsgICAgICAgICAgICAgICBwYXJlbnRfaHdzWzBdID0gJmNoYW5uZWwtPm11eC5odzsK
PiArICAgICAgICAgICAgICAgaW5pdC5wYXJlbnRfaHdzID0gcGFyZW50X2h3czsKPiArICAgICAg
ICAgICAgICAgaW5pdC5udW1fcGFyZW50cyA9IDE7ClRoZXJlJ3MgYSB2ZXJ5IHN1YnRsZSBidWcg
aW4gdGhpcyBjb2RlOgpZb3UncmUgcmUtdXNpbmcgdGhlIHNhbWUgc3RydWN0IGNsa19pbml0X2Rh
dGEgZm9yIGFsbCBjbG9ja3MuClRoZSBtdXggYWJvdmUgc2V0cwotIGluaXQucGFyZW50X25hbWVz
Ci0gaW5pdC5udW1fcGFyZW50cwotIChhbW9uZ3N0IG90aGVycykKCmJ1dCBmb3IgdGhlIGRpdmlk
ZXIgYW5kIGdhdGUgeW91J3JlIG9ubHkgb3ZlcndyaXRpbmcgaW5pdC5udW1fcGFyZW50cywKd2hp
Y2ggaXMgd2h5IEkgZW5kIHVwIHdpdGg6CiB4dGFsICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOCAgICAgICAgOCAgICAgICAgMSAgICAyNDAwMDAwMAogICAgICAgIDAgICAgIDAgIDUw
MDAwICAgICAgICAgWQogICBbLi4uXQogICBjMTEwODY1MC5wd20jZ2F0ZTEgICAgICAgICAgICAg
ICAgMSAgICAgICAgMSAgICAgICAgMCAgICAyNDAwMDAwMAogICAgICAgMCAgICAgMCAgNTAwMDAg
ICAgICAgICBZCiAgIGMxMTA4NjUwLnB3bSNkaXYxICAgICAgICAgICAgICAgICAwICAgICAgICAw
ICAgICAgICAwICAgIDI0MDAwMDAwCiAgICAgICAwICAgICAwICA1MDAwMCAgICAgICAgIFkKICAg
YzExMDg2NTAucHdtI211eDEgICAgICAgICAgICAgICAgIDAgICAgICAgIDAgICAgICAgIDAgICAg
MjQwMDAwMDAKICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQogICBjMTEwODY1MC5wd20j
Z2F0ZTAgICAgICAgICAgICAgICAgMSAgICAgICAgMSAgICAgICAgMCAgICAyNDAwMDAwMAogICAg
ICAgMCAgICAgMCAgNTAwMDAgICAgICAgICBZCiAgIGMxMTA4NjUwLnB3bSNkaXYwICAgICAgICAg
ICAgICAgICAwICAgICAgICAwICAgICAgICAwICAgIDI0MDAwMDAwCiAgICAgICAwICAgICAwICA1
MDAwMCAgICAgICAgIFkKICAgYzExMDg2NTAucHdtI211eDAgICAgICAgICAgICAgICAgIDAgICAg
ICAgIDAgICAgICAgIDAgICAgMjQwMDAwMDAKICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAg
WQoKTXkgc3VnZ2VzdGlvbiBpcyB0byBzd2l0Y2ggdG8gc3RydWN0IGNsa19wYXJlbnRfZGF0YSBl
bnRpcmVseSAoZm9yIHRoZQptdXggdGhpcyBjb3VsZCBiZSBkb25lIHdpdGggYSBzZXBhcmF0ZSBj
b21taXQgYmVmb3JlIHRoaXMgb25lKS4KVGhlbiBrZWVwIGl0IGNvbnNpc3RlbnQgYW5kIGRvbid0
IG1peCBwYXJlbnRfbmFtZXMvcGFyZW50X2h3cyBhbmQKcGFyZW50X2RhdGEgKGp1c3Qgc3RpY2sg
dG8gcGFyZW50X2RhdGEsIHdoaWNoIGNhbiBtYW5hZ2UgdGhlIHByZXZpb3VzCnR3byBhbmQgbW9y
ZSkuCkkgKnRoaW5rKiBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhIGNhbiBldmVuIGJlIHVzZWQgdG8g
c2ltcGxpZnkgdGhlCnNlY29uZCBwYXRjaCAoYnkganVzdCBoYXZpbmcgYW4gImVtcHR5IiBlbnRy
eSAtIHdpdGggaW5kZXggPSAtMSAtIGluCnRoZSBhcnJheSkuCgpbLi4uXQo+ICsgICAgICAgICAg
ICAgICBjaGFubmVsLT5nYXRlLmJpdF9pZHggPSBfX2ZmcyhtZXNvbl9wd21fcGVyX2NoYW5uZWxf
ZGF0YVtpXS5jbGtfZW5fbWFzayk7CkkncyB0aGUgb25seSBwbGFjZSB3aGVyZSBjbGtfZW5fbWFz
ayBpcyBub3cgdXNlZC4gU28gSSB0aGluayBpdCdzCnZhbGlkIHRvIGp1c3QgcmVuYW1lIGNsa19l
bl9tYXNrIHRvIGNsa19lbl9pZHggYW5kIHBhc3MgdGhlIHZhbHVlCndpdGhvdXQgdGhlIEJJVCBt
YWNybyBkdXJpbmcgaW5pdGlhbGl6YXRpb24uCgoKQmVzdCByZWdhcmRzLApNYXJ0aW4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0094BFF8850
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Apr 2026 03:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BGLQwdzIaWbdQKZPDE6WaDuBl28HnG6rORLTWWGP99k=; b=0ONenqkoOqwDPi
	HQ+XJNDTTzXboSayo3n3m9Sb69/f5aoo5fjO1rVJkkfUA5B4chJJDOcfePJXtMne2PSj/w60Uhk5e
	DtQ5BO8cOjnwiykzueZnYpzNsVErI9hy6KIWgNovv8iQgExwGfvOMW3Y3qhkpqTksTRIjttQ9j9U4
	41OCj6mGePy+C1j/oTzt7I/wn2w794+lqBSfFonItKNK1RwNlR9VUXNHwTTtf5WjtCKhZRpg2jJtK
	KaSo9AYihn/5qO0w9faXOf2ASVxNejQ0TeicZAvCvW7b7rPtv0eMO93PtnviQVSy47qy/69+ds+8L
	ZfyzWiwXSBwHEgy2qY4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGqaE-0000000FEfQ-1chf;
	Sun, 26 Apr 2026 03:55:02 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGqaA-0000000FEe1-2d5S
	for linux-amlogic@lists.infradead.org;
	Sun, 26 Apr 2026 03:55:00 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so50248405ad.3
        for <linux-amlogic@lists.infradead.org>; Sat, 25 Apr 2026 20:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777175697; cv=none;
        d=google.com; s=arc-20240605;
        b=HRGhh+Ar0pabCPSVuw8v4WIW/qzSzOx9xmLrQxsBUxL4YsPXm1Xyd7thSdgOdWXb++
         6I295qZ7J4f6BRI0jNJas7lkUOs6QRktj9jJhjl8gm2gVg0AX2F5mD30zwVeTgTaJb6E
         MHTgTtGB9ix7uwm/R/IzGmlLunmYC+cJKhy23C/Ng6LmD4JoR0R/ZBt57CuRfVow3uWP
         sBBXgSu47f9kq5mlTWrkhCeUg3tsNYchVmDP3TmfM6rxZtKVC6lC3ibJA+i4MKwVIdu5
         phhtEAupLpZc5xBbLzRhBGMwf+LBT23bROgJBWOZi99LNAgwg6zsaiZ7/wTNUTctJSxM
         1ktw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1BdFcpz+AcaZJuHG5kH6Dp7Mwp/lMapbOHRN2wu9PUQ=;
        fh=9H8+IwuwIXsbRDiLWqiO4aCoXW1gSlTHqWcGXiEBfwo=;
        b=XK84LHO4sDwuHLCWcwKc2+jEFIEx+QYr0asfYW2qsbjTkWwg/tVkCnEMSP4BMWs6O1
         NEL2MlK07f7TfkskdDu7fIDHeG/KnIdKWDLcsQSyZ+Q1OTJSkBvdwzYnG1ZJF3G6E/OS
         OaGtCI/zGaLaRP6Bp1uRffpvUpMI1WoZWa+epqI07xRGT/viH0X6ka5tkX7faX7ksy5p
         OVJH7rSGNDePeNXhuxq0s1TE3kY5Qn1HEDeJsGaY966F+o32XXDV2zk4PfV/7yl4aEDB
         hXIESw8KqJKA+tmauZ/lDl/tjSjWsN+YUzOCVLWG5Yl7NhtdXFvxt0tGVapQC3Q2IJIL
         lqTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777175697; x=1777780497; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1BdFcpz+AcaZJuHG5kH6Dp7Mwp/lMapbOHRN2wu9PUQ=;
        b=RALmFA3PbA4qFjPRQ9kUYFM4SIytStQwwgZK3bBATspwVmU8aJCwQuaWGd7qh/MttQ
         eC4as9TyWKCEbwhSwCymKciB/hHhY78G3D/5oS5FCr4UMTuTwLMe+CvjDIAYXE4gQ51i
         IKz+Uod8URJRKTm9B1qO3YCYXdiqyzSloIR1w2HGwh5g6qprd9/Oo642DY482wUuWtue
         LBFtHREraAhxoK32kEbx4nu8uPex/V27vZ9kJQte4BQVasIYFTwj2SomzgbXD70F/8yq
         orF9muovVLWQ6oGF6agkT/1LijtL+G2Bn6LjFxOgM8NBmaozaiZmnl4+dnuKlDmjMOch
         ZIyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777175697; x=1777780497;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1BdFcpz+AcaZJuHG5kH6Dp7Mwp/lMapbOHRN2wu9PUQ=;
        b=e38Y5FqktwPO+iTbv0Pp64/TkLddrjsHdyzEWidHeSBEtzJHlWHpPGqsg2LDYGof6v
         t7pIoLL2aHV77e3pzVhXw6S45rHrIFDv86FmDCAm4DyeX7r13D+Rw7l2RxUmWM78K4W7
         QInmC88UOVE7MfyRp/4P/J0nl/rIyQ6Yv5YQlv76VPvZPQHV0hGG4o596oiTdP/Lggaj
         R94oQMuQmjF8x6MRUhEvKmwKt0ktZAyEFKQfUV7mOmazOCrqu5xQStfj+UFOgcuGzPqa
         Xwfz1cvPxxatWTK/JLUu5Bq/MkUTAgJIAytEvrGZekyYThjXtQNvgF8AdXFzF0KA0R+A
         GCfg==
X-Forwarded-Encrypted: i=1; AFNElJ+JC3WVU9FCS50n/Si6zcKG4nt1HH/3SgIMSiGPHepVAvtfQPDnBlfSRD2AtVZpYyxNaBJtiKbc8/9HI5b8@lists.infradead.org
X-Gm-Message-State: AOJu0YwKdZp4ylddFwjvrCy/2thNz9JQNid21PuiNVhSd9fcDDFfkym8
	N9+daOvYAj5/8xktiPkcHQ2i/Fmz9VEkjdZ08/4ALBeVwn88+cKQ7knDzcfnnH65zL/rFRCcTvA
	zySyeoh1fDLdsidMbnjCXDK7Wu5pvK+4=
X-Gm-Gg: AeBDieu4ErbeB8El81ieHpgOBbxDn4TGV9LGyiZWFWmrtqw77xZm7ehzeJVyWKTgbNA
	qL1dtvMVT+EI6nL3/ZXNhe20QUayNY3k409HFkgseYdASE7n4hS+j/udL2xCFWd8pYmJiHKAAmP
	GPiEsjrzRnurAKdbjsSEbdrPEPAJMSP6yLKH+rpYgfKowDmmE/O79+et7gvKDqqGET4XPGHUau6
	Rt5cDlEKJ5RdX09N3Lglk8fRbXdnlAnvfmDcYF2pNhYZE82qhmrvBk6Kdonc4Eb71wv9vonKEpc
	DeCIv1tA+YSYftTTWPokumjPp7g5xlpr8MYwcmMszfeSdqwsgSYyq3cQ4Djrlc32Gmi5EijmiJs
	=
X-Received: by 2002:a17:903:1aa5:b0:2ae:57e6:616c with SMTP id
 d9443c01a7336-2b5f9e5e312mr361056635ad.3.1777175697342; Sat, 25 Apr 2026
 20:54:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260426-meson_saradc-v1-1-6e96b2982c43@gmail.com>
 <84cae83c-2d67-4927-aa40-6c416d4f862d@baylibre.com> <20260425194412.1872eff8@jic23-huawei>
 <754b6044-2285-4694-99d4-18d4fd5d8f6d@baylibre.com>
In-Reply-To: <754b6044-2285-4694-99d4-18d4fd5d8f6d@baylibre.com>
From: Felix Gu <ustc.gu@gmail.com>
Date: Sun, 26 Apr 2026 11:54:47 +0800
X-Gm-Features: AQROBzBzsaXQFVJdkYRHjTgsoiLM-gr_cIOC3RLib6DRouSrwbDmmVsVhdBXyy8
Message-ID: <CAN4SLj0hp4N_WXPxxQcLjY+espY96LfizsNEqJ3L2UF4_GoCHg@mail.gmail.com>
Subject: Re: [PATCH] iio: adc: meson-saradc: fix calibration buffer leak on error
To: David Lechner <dlechner@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rosen Penev <rosenp@gmail.com>, 
	linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_205458_690279_809F1395 
X-CRM114-Status: UNSURE (   9.68  )
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

T24gU3VuLCBBcHIgMjYsIDIwMjYgYXQgNzoxNuKAr0FNIERhdmlkIExlY2huZXIgPGRsZWNobmVy
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gSSBqdXN0IHVwZGF0ZWQgaWlvL3Rlc3RpbmcgdG9kYXkg
YW5kIEkgc2VlIHJldHVybiB3aXRob3V0IGtmcmVlKCkuCj4KPiAgICAgICAgIHByaXYtPnRzY19y
ZWdtYXAgPSBzeXNjb25fcmVnbWFwX2xvb2t1cF9ieV9waGFuZGxlKGRldi0+b2Zfbm9kZSwgImFt
bG9naWMsaGhpLXN5c2N0cmwiKTsKPiAgICAgICAgIGlmIChJU19FUlIocHJpdi0+dHNjX3JlZ21h
cCkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRSX0VSUihw
cml2LT50c2NfcmVnbWFwKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ImZhaWxlZCB0byBnZXQgYW1sb2dpYyxoaGktc3lzY3RybCByZWdtYXBcbiIpOwo+ID4+IFNob3Vs
ZCBgI2luY2x1ZGUgPGxpbnV4L2NsZWFudXAuaD5gIHRob3VnaCByYXRoZXIgdGhhdCByZWx5aW5n
IG9uIGl0IGJlaW5nCj4gPj4gaW5jbHVkZWQgdGhyb3VnaCBhbm90aGVyIGhlYWRlci4KPiA+Pgo+
ID4+IFdpdGggdGhhdCBmaXhlZC4uLgo+ID4+Cj4gPj4gUmV2aWV3ZWQtYnk6IERhdmlkIExlY2hu
ZXIgPGRsZWNobmVyQGJheWxpYnJlLmNvbT4KPiA+Pgo+ID4KPgpIaSBKb25hdGhhbiwKVGhpcyBj
b2RlIHdhcyBtZXJnZWQgaW50byBsaW51eC9tYXN0ZXIgeWVzdGVyZGF5LCBwZXJoYXBzIHlvdSBo
YXZlbid0CnVwZGF0ZWQgdGhlIGNvZGUgYmFzZS4KCkJlc3QgcmVnYXJkcywKRmVsaXgKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMg
bWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FE4CAC5BB
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Oct 2025 19:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dh1NaPRDfIcrw4uUao55v8KDwA/KsjvOq1IZ0vBkQJk=; b=tsIk6gb+up5Qds
	fPdTHvgIurtR9blssFYlWl6DRvGwTA4apSuB/DGJCjE86NkbqB1pA5g0QCLp9U2GRZY9hrr6IU/zb
	CqvYh+ScbwJ9DmPm8W0YxZBZSHMrwq/S//yIR4IWrV6SW+eztNgVC0dNJdyxMxTNYakxLKz9y8mr8
	bM3GDJv6sxO09QA5UoqOKxrkO+E1C/Ss7WCOr0dg2gkJ65XcvFX5MHj2IpCYm5tGKa8WXrCL7eemT
	0hzRna2tgocWlX+lsffiRCFWJNTF2eI7Sp0IQPwThsN+skiTWDpX4vJLG9E4GDEyVRG27yz/IOJsi
	ROda63uEpcTkNJGSNGKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58P0-0000000Dyes-2Ga1;
	Sat, 04 Oct 2025 19:58:46 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v58Oy-0000000Dye7-0HUC
	for linux-amlogic@lists.infradead.org;
	Sat, 04 Oct 2025 19:58:45 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b5516ee0b0bso2467664a12.1
        for <linux-amlogic@lists.infradead.org>; Sat, 04 Oct 2025 12:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1759607923; x=1760212723; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkUHHW/8YstHHualb/SiYorZ1DiF4W6i84iViR0FPpY=;
        b=gnR/pb/o9qml+BGSlJ3AoQW85thNze1YuuKQ2A2JKFg7RFbpeWpPLTJsIi+ByOVj/g
         88RBrZTAjNHnjZ8ZJTxgNS198DjsDEMA1vWHaOgIqHBt2M270s9nCYDjv8jlyFIvwwjT
         bIOJxJbZ5h1fLK0w+mUjNK7dff3V3qWP+Yrrv8scpYVMEHdcZtGObS9D4PxJ4Rj5rPec
         wcJmPAwGnkuUsVVPpP64qd17GMHpAVWNs8nRm47luWj122NyMrxsaPe0R1DSrhhDWr36
         NdrNlCjmEeVAS+nEIzuexwJqib+cCPOwgD2N/Uen7X0It5W8eFjLEjRrN8fqQbPrZT1k
         OisA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759607923; x=1760212723;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RkUHHW/8YstHHualb/SiYorZ1DiF4W6i84iViR0FPpY=;
        b=TSfVVWYYQpxD5lReAA/unsPPCcX8Anco2UbTEIFhxb2rkzT8QaN5/qitsi/L122Yqk
         8KRpJwBpffR8qjKPF/+ergBlb/PBkW3F5elVb75DSCpJ3D+hmZRZkw3muHTxSgT4c+4O
         qs0AZDpBiR3+C7nwhvoRQdBX897UIfc9nSQ5jkaxGxpUd2wBUVGZDHj9G6S7kvjtCSBy
         1a9sBz2ewu7h21hOcZiElc623L2lPiD0HtusuK90TcaKP+BkGkRKjmJXJpSlZAUtR272
         Ub36NL7fr2LB0MIysbT0MtL1F3y42PH2ttD7kuaDAK9SlDA5zTNH/WjJEaalg+E4Pv2w
         XcDA==
X-Forwarded-Encrypted: i=1; AJvYcCUpUA3lVzI/Qap0y+sM2HRsXQy81uhBbvuQf3XaEfF2wCOEk0D3nvy7GI1mljlMLyvm8DemRb5XSwLoxeM/@lists.infradead.org
X-Gm-Message-State: AOJu0YzIDwBEqvfvVEySgMq9D8tdZ0JqNahLjvthawH9fxI5HgfHFizI
	Z3pr4y+EqOqwVr04wjUEiEhIrIE+GgFfiTYEKx7DYJC9k0YW4uWjnr9Sr0925HxdDnkgUX89Cxc
	2JdXoYEnhpbjnYMi8bu4JILpqnyGfHMc=
X-Gm-Gg: ASbGncuzd2dTNGMAt8y1GUzc7qpDRbJjb6UBb8GpwTz71lUwwxUd2trqNlKGu8GyzVR
	QbR4GPkDnk/73//jwIwTMZpGLS46TxhfCssxLXDvS1yidPYCj1SUOzVk2ZJ9aqJP4HTMk+YMwaK
	XRdU/HxAPjPj5s3MMW7sGVk+HOw2KQ2p3TQtqriN4DkuegcdnsaDaifjjnIHOwFlKtSFohtR0/o
	aCjdp2W7nU8q1Gm8Dq8F2Z2XAAFh3tI11GnuwZXlLD/UyB8XTt021NCdc1SIlOXtoL3DqJj150=
X-Google-Smtp-Source: AGHT+IHIlqoFMv9csx8XRng4syXVJftJT6zd7u5YxyOumBwLOTKBWwzcxLH9Rhpq2ydFsn3WZaZHOCkzeoZW36Gl4Kk=
X-Received: by 2002:a17:902:d483:b0:264:567b:dd92 with SMTP id
 d9443c01a7336-28e9a664e7cmr89943225ad.52.1759607923096; Sat, 04 Oct 2025
 12:58:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250927125006.824293-1-christianshewitt@gmail.com>
 <20250927125006.824293-2-christianshewitt@gmail.com> <CAFBinCDQc=2xrKbGunSKJjLhGd0bCGN+3oYd_bg0ySs+WHxZjA@mail.gmail.com>
 <6B97C24A-A1C0-46F9-BC74-3E7D2119B6D6@gmail.com>
In-Reply-To: <6B97C24A-A1C0-46F9-BC74-3E7D2119B6D6@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 4 Oct 2025 21:58:32 +0200
X-Gm-Features: AS18NWCb80TyhWmdif5KiXRRfxefpRACPUKw21AL9syFqt4EGgXmS0JSw7hcZh4
Message-ID: <CAFBinCBrG0xZ6sWwZYtB2k_giZoOKjB_AmtbidVtyhib=UzDfg@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: meson: add initial device-tree for Tanix
 TX9 Pro
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251004_125844_108211_CD79859C 
X-CRM114-Status: GOOD (  17.52  )
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

T24gTW9uLCBTZXAgMjksIDIwMjUgYXQgMTo0M+KAr0FNIENocmlzdGlhbiBIZXdpdHQKPGNocmlz
dGlhbnNoZXdpdHRAZ21haWwuY29tPiB3cm90ZToKPgo+ID4gT24gMjkgU2VwIDIwMjUsIGF0IDE6
MTLigK9hbSwgTWFydGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVt
YWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgQ2hyaXN0aWFuLAo+ID4KPiA+IHRoYW5rIHlvdSBm
b3IgdGhlIHBhdGNoIQo+ID4KPiA+IE9uIFNhdCwgU2VwIDI3LCAyMDI1IGF0IDI6NTDigK9QTSBD
aHJpc3RpYW4gSGV3aXR0Cj4gPiA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyb3RlOgo+
ID4gWy4uLl0KPiA+PiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3ht
LXR4OS1wcm8uZHRzCj4gPj4gQEAgLTAsMCArMSw5MCBAQAo+ID4+ICsvLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogKEdQTC0yLjArIE9SIE1JVCkKPiA+PiArLyoKPiA+PiArICogQ29weXJpZ2h0
IChjKSAyMDE2IEVuZGxlc3MgQ29tcHV0ZXJzLCBJbmMuCj4gPj4gKyAqIEF1dGhvcjogQ2FybG8g
Q2Fpb25lIDxjYXJsb0BlbmRsZXNzbS5jb20+Cj4gPiBJcyBDYXJsbyByZWFsbHkgdGhlIGF1dGhv
cj8KPgo+IEhl4oCZcyB0aGUgYXV0aG9yIG9mIHRoZSBvcmlnaW5hbCBkZXZpY2UgdHJlZSB0aGF0
IDk1JQo+IG9mIHRoZSBjb250ZW50IGZvciB0aGlzIG9uZSBpcyB0YWtlbiBmcm9tOyBhcyBpcyB0
aGUKPiBjYXNlIGZvciBtb3N0IG9sZGVyIEFtbG9naWMgaGFyZHdhcmUuIFRoZSBkZWNpc2lvbgo+
IG9uIHdoaWNoIGJpdHMgdG8gY29weSBhbmQgcGFzdGUgd2FzIGFsbCBtaW5lLCBidXQgSeKAmW0K
PiBub3QgIHN1cmUgdGhhdCBza2lsbCBkZXNlcnZlcyB0b28gbXVjaCBjcmVkaXQgOikKSSBqdXN0
IHdhc24ndCBzdXJlIHdoZXRoZXIgaXQgd2FzIGEgbGVmdC1vdmVyIG9yIG9uIHB1cnBvc2UuCgo+
IEkgY2FuIHJlc2VuZCB3aXRoIG15IG93biBuYW1lIChvciBtaW5lIGFwcGVuZGVkKSBpZgo+IHRo
YXQgd291bGQgYmUgcHJlZmVycmVkPwpJJ2xsIHVsdGltYXRlbHkgbGVhdmUgaXQgdXAgdG8gTmVp
bC4gTWF5YmUgaWYgaGUgd2FudHMgeW91ciBuYW1lIGluCnRvbywgaGUgY2FuIGp1c3QgYXBwZW5k
IGl0IHdoZW4gYXBwbHlpbmc/CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==

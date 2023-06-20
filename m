Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226ADEB64D7
	for <linux-amlogic@archiver.kernel.org>; Tue, 20 Jun 2023 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8TPfYfYXMZySLOXTjbEVRY3RX+5kDJ50sfkRGTvTRiE=; b=Vo56NRImj9YCDS
	k0YGBNdKpvgVaEwvpDxjTIWchCLUSfvyePYukafjF3sCJgY3Gf4OFtUjBDJFY5J67XLahKk656Sgr
	xYCougTpYcQ3BDJVAGFa7+bukCiHmhzj4rqGkBteoEX6wlRhw6qrihxVUAw6YikeTL7I2EJ+VX8B5
	G1WuV/ygpqtWhbPHwJKupQVQSXtmCFdBZHnw6SKpF5E5e4l6+wLIrDK34SNsUnMi8HnqEI7m0WfiL
	+v91UbAtZmuP6BDWb5K8lWNc41bMUloNR1JBfSbYWDoHRkG7RGH7I4TusRYO/gtLKHmqrxS/w/EVa
	JFst+x8L8Mk2jQ9lherw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBY4H-00Amwl-2S;
	Tue, 20 Jun 2023 09:54:33 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBY4F-00Amvb-1T
	for linux-amlogic@lists.infradead.org;
	Tue, 20 Jun 2023 09:54:32 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-bd77424c886so4784966276.0
        for <linux-amlogic@lists.infradead.org>; Tue, 20 Jun 2023 02:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687254869; x=1689846869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QeKQxqV7wBO20CvYxv2br28Pl0//wusiddMDwssEpU4=;
        b=HDT+vm1yWhzlGFf3yabwM5+KGsjqQ4JCHsnZ30oorP73rvRr0HUaHjt++ZSQlI1If6
         20haBYxqpfdexux/3GPcUw8kz5Cn6MZHsVAJzm9hGWyjvFTKLZdPHne5bVcmTz8mXE8O
         DhmroUV+XEAZMzMgMeaeYtgHfwKgaxzYHhqwLVGeBYusZtZJ69rMw/wK2YwM6juPaXxv
         NQfujQ/z+aIxdIQuaI1/AH5Qu0B9lnKFAqjDGYT61CG3u9cWCoFXyqn6bxnD6OG9AsAj
         cdM214HBHXDRgYoyg62Ggqs2bYorw+qJEE/RTAskU/QDZYMDoIwEoYpnpK2BIAIUyQni
         vFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687254869; x=1689846869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeKQxqV7wBO20CvYxv2br28Pl0//wusiddMDwssEpU4=;
        b=RTKRqUZzpgv0RL81DzYdJ4ZGin1hUf99nBp0unpcr1YebuG8u/LPTiTOo6SFsjRwUF
         TpbgrBnHZ9jttchT1xVwakMDqW7n3yad+iBw0639u4ZpL2Ax5ldgHZA7VngF8UZKmbdu
         FMd36UPsOEHaJaqCOJg7QOYiwAnapPZ1OO/laNTLN99HC1zKXJP18NLO4xDq4jVmgops
         kmdz+Hrb8zMb6xLxzRdeig9L581t2fYRulgO2cSEfsa3eyQxDm7NE7DPihK/KBNZxhul
         1eKf/HneU5Ynsz47ejyRy2yeeTlADk0tMpHwvGgQFeRqn5z2lwX7T5ilnPZ5+myJSWg9
         6OQQ==
X-Gm-Message-State: AC+VfDw/W2c+N3G2Sg0HQH8dXaf+muOGCL6bJhYxtAD1pf3pBAs0/Fmw
	nLSYI7Sv2WzAigiRxW8lYNI2ZgP1LCeqHkmT67jybtQt1lHdEMBh
X-Google-Smtp-Source: ACHHUZ4H+LGKUzcGaaCj0Gc7mOWw+qA4DkD5qhFOEsz8bQbOYlz7AQcAjt4bzqj4/VID/w07RPUazZ8NiOebA60ECMk=
X-Received: by 2002:a25:b188:0:b0:be4:684e:1971 with SMTP id
 h8-20020a25b188000000b00be4684e1971mr10265097ybj.63.1687254869759; Tue, 20
 Jun 2023 02:54:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAFBinCD0RT0p-jk86W0JuMT3ufohRh1RqWCcM35DKZJpuc10HQ@mail.gmail.com>
 <CAPDyKFqgYnBfm-NespEZF8AJ5Ou4Bya8jLfVEnfyZvfAZ05Q7Q@mail.gmail.com>
 <CAFBinCDjPJHEhN-Jx3DhhhHJ3yi8oEoW7u4-Ld6Rd1+W826ttA@mail.gmail.com>
 <CAPDyKFqKSWJkJwgCO89jgKQ6AB==P9BWkuX6XtKj=ASOH15y9g@mail.gmail.com>
 <CAFBinCDwgYw3v31hP4AtV3+Z1o+esDqMKugRwMMMLqSX0Acjzw@mail.gmail.com>
 <CAPDyKFr+hQo+N31r=3f58taf9sYW0UF0ApCJhwz9vRsyNizcvg@mail.gmail.com>
 <CAFBinCDSv_vdu5887vveotvaOGFrZvaSX4jM+7Q3QvDhTdazzw@mail.gmail.com>
 <CAPDyKFpS-UwiaRPMqSpX0mNPrS5p=yJzu3g0=pGyCkWHSYyqWg@mail.gmail.com> <CAFBinCCnB=po9x6tsxCzRM99ZqgV9=5jBxS9LaoJqLPGZYSH6g@mail.gmail.com>
In-Reply-To: <CAFBinCCnB=po9x6tsxCzRM99ZqgV9=5jBxS9LaoJqLPGZYSH6g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 20 Jun 2023 11:53:54 +0200
Message-ID: <CAPDyKFpAGUudAJKAmzMbcM=LrALU6ELpwaD-ijy18o7yrPgOqA@mail.gmail.com>
Subject: Re: Odroid-C1 regression with commit 4bc31edebde5 ("mmc: core: Set HS
 clock speed before sending HS CMD13")
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	Luca Weiss <luca@z3ntu.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_025431_503789_A8170925 
X-CRM114-Status: GOOD (  24.31  )
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

T24gTW9uLCAxOSBKdW4gMjAyMyBhdCAyMTo1NCwgTWFydGluIEJsdW1lbnN0aW5nbAo8bWFydGlu
LmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBVbGYsCj4KPiBPbiBX
ZWQsIEp1biAxNCwgMjAyMyBhdCA1OjQ54oCvUE0gVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxp
bmFyby5vcmc+IHdyb3RlOgo+IFsuLi5dCj4gPiA+IEZ1bGwgcmVnaXN0ZXIgZHVtcDoKPiA+ID4g
IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvcmVnbWFwL2MxMTA4ZTAwLm1tYy9yZWdpc3RlcnMKPiA+
ID4gMDA6IDAwMDAwOTAwCj4gPiA+IDA0OiAwMDAwMDA0ZAo+ID4gPiAwODogZTdmZmUwMDIKPiA+
ID4gMGM6IDAyZjAwMDNmCj4gPiA+IDEwOiAwMDAzZjAwOQo+ID4gPiAxNDogMDNiODFjMDAKPiA+
ID4gMTg6IDJjNDNiY2YwCj4gPiA+IDFjOiBlMDAwMDE1MAo+ID4gPiAyMDogMDAwMDAwMDAKPiA+
ID4gMjQ6IDAwMDAzMDY3Cj4gPiA+IDI4OiAwMDAwMDAwMAo+ID4gPiAyYzogMDAwMDAwMDAKPiA+
ID4gMzA6IDAwMDAwMDAwCj4gPiA+IDM0OiAwMGZlMGNmZgo+ID4gPiAzODogMDAwMDEwMGIKPiA+
ID4KPiA+ID4gSW4gY2FzZSB5b3UgYXJlIGN1cmlvdXMsIHRoZSBkcml2ZXIgaXM6IGRyaXZlcnMv
bW1jL2hvc3QvbWVzb24tbXgtc2RoYy1tbWMuYwo+ID4KPiA+IFRoYW5rcyBmb3Igc2hhcmluZyB0
aGlzIGRhdGEhCj4gPgo+ID4gSSBhc3N1bWUgdGhlIGFib3ZlIHJlZ2lzdGVycyBpbmRpY2F0ZSB0
aGF0IHdlIGhhdmUgc2VudCB0aGUgY29tbWFuZAo+ID4gYW5kIGFyZSBub3cgd2FpdGluZyBmb3Ig
YW4gSVJRIGZvciBhIHJlc3BvbnNlL2Vycm9yLCBidXQgd2UgbmV2ZXIKPiA+IHJlY2VpdmUgb25l
Lgo+ID4KPiA+IFRvIHJlYWxseSBmaWd1cmUgb3V0IHdoYXQgaXMgZ29pbmcgb24sIEkgdGhpbmsg
d2UgbmVlZCB0byBkbyBzb21lCj4gPiBhZGRpdGlvbmFsIGxvdyBsZXZlbCBkZWJ1Z2dpbmcvdGVz
dGluZy4KPiA+Cj4gPiBJIHdhcyBsb29raW5nIGF0IHRoZSBjb21taXQgbWVzc2FnZSBmcm9tIGU0
YmYxYjA5NzBlZiAoIm1tYzogaG9zdDoKPiA+IG1lc29uLW14LXNkaGM6IG5ldyBkcml2ZXIgZm9y
IHRoZSBBbWxvZ2ljIE1lc29uIFNESEMgaG9zdCIpLCB3aGljaAo+ID4gaW5kaWNhdGVzIHRoYXQg
dGhlIGNsb2NrIG1hbmFnZW1lbnQgaXMgcXVpdGUgbGltaXRlZCBmb3IgdGhpcyBIVy4gRm9yCj4g
PiBleGFtcGxlLCB0aGUgNTEwMDAwMDBIeiBpc24ndCBvbmUgb2YgdGhlIHN1cHBvcnRlZCBmcmVx
dWVuY2llcy4gQ291bGQKPiA+IHRoYXQgYmUgdGhlIHJlYXNvbiBmb3IgdGhlIHByb2JsZW0/IFBl
cmhhcHMgaWYgd2UgcGxheSB3aXRoIGNoYW5naW5nCj4gPiB0aGUgZnJlcXVlbmN5IHRvIHNvbWV0
aGluZyB0aGF0IGlzIGNvbnNpZGVyZWQgc3VwcG9ydGVkIC0gdGhlbiBjYW4gd2UKPiA+IG1ha2Ug
dGhpcyB3b3JrPwo+IFlvdSBzZWVtIHRvIGJlIG1vcmUgZmFtaWxpYXIgd2l0aCB0aGlzIEFtbG9n
aWMgTU1DIGNvbnRyb2xsZXIgdGhhbiBJIGFtIDstKQoKU29tZXRpbWVzIGEgd2VsbCB3cml0dGVu
IGNvbW1pdCBtZXNzYWdlIGFjdHVhbGx5IGhlbHBzLiA6LSkKCj4gVG9kYXkgSSBmaW5hbGx5IGhh
ZCBzb21lIHRpbWUgZm9yIHRlc3RpbmcgYW5kIHdoZW4gSSBzdGFydGVkIFppeWFuZwo+IEh1YW5n
IHByb3ZpZGVkIGEgcGF0Y2ggWzBdIChhZG1pdHRlZGx5OiBJIHRoaW5rIGl0IG5lZWRzIHRvIGJl
Cj4gaW1wcm92ZWQsIGJ1dCBmaW5hbGx5IHdlIGtub3cgdGhhdCBpdCdzIGEgTU1DIGNvbnRyb2xs
ZXIgZHJpdmVyCj4gbGltaXRhdGlvbiBhbmQgbm90IGFuIE1NQyBjb3JlIGJ1ZykKCkdyZWF0IG5l
d3MhCgpJIHdpbGwgY29udGludWUgdG8gbW9uaXRvciB0aGUgdGhyZWFkIGFuZCBkZWZlciB0byBh
cHBseSBhbnl0aGluZwp1bnRpbCB5b3UgaGF2ZSBnaXZlbiBpdCB5b3VyIGJsZXNzaW5nLCBvZiBj
b3Vyc2UuCgpLaW5kIHJlZ2FyZHMKVWZmZQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=

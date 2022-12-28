Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D07AC4332F
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Dec 2022 10:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3X2XCswYqAlbqsWajMzBlGZKgHXQEZV9kPn9OsK+FYk=; b=FtLRcClM3PWBjd
	DmsFCjDRnXszUOFYFQdwBX+ZTj7yDp+4dbNIdTQNJr721jh17qt1TZNRUzjAeuoENpzgaVIJXQpc0
	j08h7PSnWqqg9X47co7S2phLIkKn3W75ljY4A8S/Q/+Tn6iiXYGi76eH7PNpMcl6rKa5CC20SY8W1
	gC1dv7po0e3z+IkuuheHoNTnDIrPWQWOOXOrg0lXqAEmV3aFWoc133/VwPTFOiOyuVnoM63Kfn6UH
	YvXuFzHXaXeDjp3npbvkfVJ4O4mNjfVBRsL8koqCbbCY60XEktteoIg9hjnstyglCjGYmk/BQC4EG
	3eq/47GeyEYCK2RTi5lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATgp-0046G0-1H; Wed, 28 Dec 2022 10:29:39 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pATgl-0046Dl-7h
	for linux-amlogic@lists.infradead.org; Wed, 28 Dec 2022 10:29:36 +0000
Received: by mail-vs1-xe32.google.com with SMTP id k4so11026358vsc.4
        for <linux-amlogic@lists.infradead.org>; Wed, 28 Dec 2022 02:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ojYNDiVvW5O96P8SY9WJxKmUEE42niI4l4BjCEll5Tc=;
        b=W8m7pH4Jzws/6d+Q2fA5u2Ife3Iz7M2qhrNmwh7UvjmwNNKq+NFtOuoNicXUK2TSxe
         o2s0uXpQFxooNZsUHZIwyAOZtx+Zogc0sfOz4q/NFPIMuceBOFXV5exCjprJTI+JUePv
         Umbk+CPxEm92GNcNJlkmgREeAfwmEmpXhi/RjwBRfbjhNpGI1t9V5JhC6ra/ug+GxoM+
         yrYsYGG6MxQhRs1l9x/x0Q2tD9SjAUWFoQPPyNOqTW9NyQ/sabyod5Tja+Uq5HprspsG
         UyrnR91tAzJyB1Smg0jbDzEDZKiWe9H66znA+nS6LYlzTUsi2XcATM5SvUWC82WxURH0
         sT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojYNDiVvW5O96P8SY9WJxKmUEE42niI4l4BjCEll5Tc=;
        b=ultiv14qC7jWnANZNycs+l/KA/2IWK6qjQdeNlVE/slBvT+ns6Sv79wu1lV6cV6cXC
         c6xBLRRxwLGium14epWWo30II3Vw2LUZqfcW/lU+2DhESJA/+XKWLHwXCnMhsF48j6tW
         9MPs7fROsh6DULOyoyEshqwPfBZ6B6Hhat1z8HmYEXoTlaBzeBU6wl47VyRjTKnh5PVU
         EQbNfunKpXFgRBlF3K73xW+F4PBg3HxGxmAt2GeVqpOWwFxZEzfgbdbtgy0Et0bQyPGG
         mnJvvAxcFw1Fr1AqY6dnrWmEfVFSYrIe2JdSMAc2V6tQOuMyGYoGmKK90gMVlq4tFn8N
         ODAw==
X-Gm-Message-State: AFqh2kpz4xj9SHG8f9wdZtl74oA0CkP05oSNP7Bi+0wntYkM6C2VSB0R
	jY2s6N3Ss7bGXRrT2laGAnLc3YRwo7erZXZApwY=
X-Google-Smtp-Source: AMrXdXsNQGqcHh16rEam6d68yAikJ0QyFEiLfbX/FBIlndF+snOBA1R/3+TrtxdXmnLlItVjMv2rduXkI0Ce+X8DA5Q=
X-Received: by 2002:a05:6102:388:b0:3c6:6870:1435 with SMTP id
 m8-20020a056102038800b003c668701435mr1617707vsq.76.1672223373665; Wed, 28 Dec
 2022 02:29:33 -0800 (PST)
MIME-Version: 1.0
References: <20221228100321.15949-1-linux.amoon@gmail.com> <20221228100321.15949-2-linux.amoon@gmail.com>
 <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
In-Reply-To: <ef20a7dfa027f1a5a24a515e347af10c06a4da85.camel@icenowy.me>
From: Anand Moon <linux.amoon@gmail.com>
Date: Wed, 28 Dec 2022 15:59:17 +0530
Message-ID: <CANAwSgSJ1SQXUovgM6FHUozr46C_CogLaAD4gf4ANNHXoav6ag@mail.gmail.com>
Subject: Re: [PATCH v1 01/11] dt-bindings: usb: Add device id for Genesys
 Logic hub controller
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-amlogic@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_022935_441604_B33C7F58 
X-CRM114-Status: GOOD (  20.07  )
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

SGkgSWNlbm93eSwKClRoYW5rcyBmb3IgdGhlIHJldmlldyBjb21tZW50cwoKT24gV2VkLCAyOCBE
ZWMgMjAyMiBhdCAxNTozOCwgSWNlbm93eSBaaGVuZyA8dXd1QGljZW5vd3kubWU+IHdyb3RlOgo+
Cj4g5ZyoIDIwMjItMTItMjjmmJ/mnJ/kuInnmoQgMTA6MDMgKzAwMDDvvIxBbmFuZCBNb29u5YaZ
6YGT77yaCj4gPiBBZGQgdXNiIGh1YiBkZXZpY2UgaWQgZm9yIEdlbmVzeXMgTG9naWMsIEluYy4g
R0w4NTJHLU9IRyBIdWIgVVNCIDIuMAo+ID4gcm9vdCBodWIgYW5kIEdlbmVzeXMgTG9naWMsIElu
Yy4gR0wzNTIzLVFGTjc2IFVTQiAzLjEgcm9vdCBodWIuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
QW5hbmQgTW9vbiA8bGludXguYW1vb25AZ21haWwuY29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGdsODUwZy55YW1sIHwgMiArKwo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0Cj4g
PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy91c2IvZ2VuZXN5cyxnbDg1MGcu
eWFtbAo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL2dlbmVzeXMs
Z2w4NTBnLnlhbWwKPiA+IGluZGV4IGE5ZjgzMTQ0OGNjYS4uZGIwMDlmM2VmNDM4IDEwMDY0NAo+
ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9nZW5lc3lzLGds
ODUwZy55YW1sCj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNi
L2dlbmVzeXMsZ2w4NTBnLnlhbWwKPiA+IEBAIC0xNiw2ICsxNiw4IEBAIHByb3BlcnRpZXM6Cj4g
PiAgICBjb21wYXRpYmxlOgo+ID4gICAgICBlbnVtOgo+ID4gICAgICAgIC0gdXNiNWUzLDYwOAo+
ID4gKyAgICAgIC0gZ2VuZXN5cyx1c2I1ZTMsNjEwCj4gPiArICAgICAgLSBnZW5lc3lzLHVzYjVl
Myw2MjAKPgo+IEkgZG9uJ3QgdGhpbmsgZ2VuZXN5cywgaXMgbmVlZGVkIGhlcmUgYmVjYXVzZSB1
c2I1ZTMgbWVhbnMgVVNCIFZJRAo+IDB4MDVlMywgd2hpY2ggaXMgYWxyZWFkeSBsaW5rZWQgdG8g
R2VuZXN5cyBMb2dpYy4KPgoKT2ssIEkgYWRkZWQgdGhpcyBhcyBnZW5lc3lzLCBpcyBpdCBwYXJ0
IG9mIHRoZSBtYW51ZmFjdHVyZXIgb3IgdmVuZG9yIG5hbWUKd2hpY2ggaXMgbW9zdCBjb21tb25s
eSB1c2VkIGZvciBhZGRpbmcgdmVuZG9yLXNwZWNpZmljIGNvbXBhdGlibGUgc3RyaW5ncy4KCj4g
SW4gYWRkaXRpb24sIHRoZSBjb250cm9sIGxvZ2ljIG9mIHRoZXNlIHR3byBodWJzIGFyZSBuZWVk
ZWQgdG8gYmUKPiB2ZXJpZmllZC4KCldlIHdlcmUgdXNpbmcgZ3Bpby1ob2cgdG8gcmVzZXQgdGhl
IFVTQiBodWIsIHNvIG5vdyBzd2l0Y2ggdG8gVVNCIG9uYm9hcmQgaHViCgo+Cj4gQW5kIHdoYXQn
cyB0aGUgc3RhdHVzIG9mIHRoZSBjb21wYW5pb24gaHViIG9mIHRoZSBVU0IzIGh1Yj8gSXMgaXQK
PiByZWFsbHkgYSBVU0IzLW9ubHkgaHViLCBvciBpcyBpdHMgVVNCMiBwYXJ0IGp1c3QgZXF1YWwg
dG8gYW5vdGhlciBVU0IzCj4gaHViPwo+CnVzYjVlMyw2MTAgaXMgVVNCIDIuMCBwb3J0IGh1YiBw
cmVzZW50IG9uIE9kcm9pZCBDMSBhbmQgT2Ryb2lkIEMyIGJvYXJkCgp1c2I1ZTMsNjIwIGlzIFVT
QiAzLjEgcG9ydCBodWIgcHJlc2VudCBvbiBPZHJvaWQgTjIuCgo+ID4KPiA+ICAgIHJlZzogdHJ1
ZQo+ID4KPgoKVGhhbmtzCi1BbmFuZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=

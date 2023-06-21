Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D305EEB64D7
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Jun 2023 07:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S7v4yAJLuDJVHG1QZ1eEJno/St95pmoMCDDzbIgjHgU=; b=uQMbqw77HUrFCm
	8vzLq00hrtu5KCIsMKYcenJfqjdfsI2Q54FRW9/z3KSCl5JpyAddcPmEgt969KaXoNM4WrhQNlhtP
	Swjdp1wmOWWOA2Io1nwUMGScRjEW38RG6TpbqF5wHe+AHkXPklm6rd4a/+tl/FEpWFYz9POU8ejly
	7EYmPT9sbw+f0foWYKb2x0KQ6kNMfkgAFEs5LsmpC2VZcEoumVYd0ERH3I1dzZ0qEvBibxNo6SbTY
	xcrLZUoWA/m8A9+TqZ/WyDZN1NryzmE92D7EKD7STFhLn/TlZsSiAf4pK7S18JaNY42UZB7U8dCQ2
	zMuvwM8aXlrp60EHnqeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsP1-00DZEA-0c;
	Wed, 21 Jun 2023 07:37:19 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBsOz-00DZDV-09;
	Wed, 21 Jun 2023 07:37:18 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-bff89873d34so204555276.2;
        Wed, 21 Jun 2023 00:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687333035; x=1689925035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RBbxlv9gnoM9pjw8kXntm7KKExMqeh457d11frY80Iw=;
        b=kXQGGZjcIupoFLjSWcG6koCUM1oNMKrA6a3JNXEAvXCJZEaqZ7F4dnU9WA3/UgUDXp
         nXrAPygM5lmdP05vDJ0QFKUAPd8OyL9VSOE8i5do597ifT6n7NPlKHj2UbTBd3QKRaA+
         R3sgcYkWtjMg0Ls0faoxUzeLiXgF7cpVANgN9xvVESg9Joim3HLl/Cqq9ieQ4whXPV//
         qUFXD1ha6kO2KmKiw/UHQWBn4/n2sfr5c07mu5rud/Pmoiya9sxS1G7TH7uuBugyl2P8
         exuQhMm07oNmokL82iPUfIASMHCU6IIsUFE8lH0qKiYMgQ87Bw+WD+VsB8SdqDKq0Sdc
         oKIA==
X-Gm-Message-State: AC+VfDzwTazuGoa8ManJS0wGaJxQrqzbmsywAhThpVP3Iz46Rhm8Mkxc
	rHQlowGG4ETLdNCq/tnNeYoXE7WLvh+7bYEd
X-Google-Smtp-Source: ACHHUZ4+S5aKSEZNONhE3a6GKs/2K37Q3L6Fk+65IksFju01p3OGwTM3+ICxZ6hfrM5+jhOVe2Izig==
X-Received: by 2002:a81:8201:0:b0:561:b5b4:ce58 with SMTP id s1-20020a818201000000b00561b5b4ce58mr13486439ywf.38.1687333035386;
        Wed, 21 Jun 2023 00:37:15 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id x8-20020a817c08000000b005623ae13106sm968570ywc.100.2023.06.21.00.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jun 2023 00:37:14 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-57015b368c3so49019607b3.3;
        Wed, 21 Jun 2023 00:37:14 -0700 (PDT)
X-Received: by 2002:a81:4992:0:b0:568:8e96:7008 with SMTP id
 w140-20020a814992000000b005688e967008mr11287000ywa.0.1687333034038; Wed, 21
 Jun 2023 00:37:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230620134857.238941-1-tanure@linux.com> <20230620134857.238941-3-tanure@linux.com>
 <ZJIjtphyKdC48JrN@ofant> <76a7f819-f3d2-d39d-1bc9-f1e7f837fd22@linaro.org>
In-Reply-To: <76a7f819-f3d2-d39d-1bc9-f1e7f837fd22@linaro.org>
From: Lucas Tanure <tanure@linux.com>
Date: Wed, 21 Jun 2023 08:37:02 +0100
X-Gmail-Original-Message-ID: <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
Message-ID: <CAJX_Q+3im20qphOXzn-=58Kx4--ajbaF4P8BVvRcDcPXn1Qheg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: meson-t7-a311d2-khadas-vim4: add
 initial device-tree
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Nick <nick@khadas.com>, Artem <art@khadas.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_003717_081630_71261F8B 
X-CRM114-Status: GOOD (  20.25  )
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
Reply-To: tanure@linux.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKdW4gMjEsIDIwMjMgYXQgNzowMuKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiAyMS8wNi8yMDIzIDAw
OjA5LCBZaXh1biBMYW4gd3JvdGU6Cj4gPj4gKyAgICAgICAgICAgIGFwYjQ6IGJ1c0BmZTAwMDAw
MCB7Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzaW1wbGUtYnVzIjsK
PiA+PiArICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHgwIDB4ZmUwMDAwMDAgMHgwIDB4NDgw
MDAwPjsKPiA+PiArICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwyPjsKPiA+
PiArICAgICAgICAgICAgICAgICAgICAjc2l6ZS1jZWxscyA9IDwyPjsKPiA+PiArICAgICAgICAg
ICAgICAgICAgICByYW5nZXMgPSA8MHgwIDB4MCAweDAgMHhmZTAwMDAwMCAweDAgMHg0ODAwMDA+
Owo+ID4+ICsKPiA+PiArICAgICAgICAgICAgICAgICAgICB1YXJ0X0E6IHNlcmlhbEA3ODAwMCB7
Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImFtbG9naWMs
bWVzb24tdDctdWFydCIsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfn5+fn5+fn5+fn5+fn5+fn4KPiA+IGlmIHlvdSBpbnRyb2R1Y2UgbmV3IGNvbXBh
dGlibGUgc3RyaW5nLCB0aGVuIGF0IGxlYXN0IHlvdSBuZWVkIHRvIGRvY3VtZW50IGl0Cj4gPiBz
byBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24t
dWFydC55YW1sIG5lZWQgdG8gYmUgdXBkYXRlZAo+ID4KPiA+IGJ1dCBteSBxZXVzdGlvbiBoZXJl
LCB3aHkgYm90aGVyIGludHJvZHVjaW5nIG5ldyBjb21wYXRpYmxlIHN0cmluZyBpZiBub3RoaW5n
Cj4gPiBjaGFuZ2VkIHdpdGggdGhlIGNvbXBhdGlibGUgZGF0YT8gZ2l2ZW4gdGhlIHVhcnQgaXMg
c2FtZSBJUCB3aXRoIGcxMmEsIGNhbid0IHdlIGp1c3QKPiA+IHVzZSAiYW1sb2dpYyxtZXNvbi1n
MTItdWFydCIgZm9yIHRoaXM/IG5vIG9ubHkgaXQgd2lsbCByZWR1Y2UgdGhlIHN0cnVjdHVyZSBs
ZW5ndGggb2YKPiA+IG1lc29uX3VhcnRfZHRfbWF0Y2hbXSwgYnV0IGFsc28gcmVsaWV2ZSBtYWlu
dGFpbmVyJ3MgcmV2aWV3IGJ1cmRlbj8KPgo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xp
bnV4L3Y2LjEtcmMxL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvd3Jp
dGluZy1iaW5kaW5ncy5yc3QjTDQyCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KSGks
IEkgZGlkIG5vdCB1bmRlcnN0YW5kIHRoZSByZWNvbW1lbmRhdGlvbiBoZXJlLgpDYW4gSSBhZGQg
ImFtbG9naWMsbWVzb24tdDctdWFydCIgd2l0aG91dCBEb2N1bWVudGF0aW9uIGNoYW5nZXM/Ckkg
dGhpbmsgWWVzLCBhcyBJIGNhbiBzZWUgYSBmZXcgY29tcGF0aWJsZSBzdHJpbmdzIGluIGR0cyB0
aGF0IGRvbid0CmV4aXN0IGFueXdoZXJlIGVsc2UuCgpNeSBpZGVhIGhlcmUgaXMgdG8gYWRkICJh
bWxvZ2ljLG1lc29uLXQ3LXVhcnQiIGZvciBmdXR1cmUgdXNlIGlmIGV2ZXIKY3JlYXRlZCwgbGlr
ZSBpZiB3ZSBmaW5kIGEgYnVnIGluIHRoZSBmdXR1cmUgdGhhdCBpcyBvbmx5IHJlbGV2YW50IHRv
ClQ3IHNvYy4KQnV0IGZvciBub3csIGZhbGxiYWNrIHRvIHM0IHVhcnQsIGFzIGl0IHNlZW1zIHRv
IGJlIHRoZSBzYW1lIGNvbnRyb2xsZXIuCgpGcm9tIEtyenlzenRvZiBzYWlkIGluIHRoZSB3cml0
aW5nLWJpbmRpbmdzLnJzdCwgSSBhbSBmb2xsb3dpbmcgdGhlIHJ1bGVzLgoKU28sIHdoYXQncyB0
aGUgcGF0aCBmb3J3YXJkIGhlcmU/CgpUaGFua3MKTHVjYXMKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0Cmxp
bnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

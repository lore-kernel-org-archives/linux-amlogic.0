Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E4C76196
	for <linux-amlogic@archiver.kernel.org>; Thu,  6 Apr 2023 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiBnkw844XlPmmd0HLSMoNO4MRjYBgkDpLNP9/wmQWc=; b=YO4bsdsBNBBc/w
	U9MJetK+4AA1k5IN5XQlpNQVP7QSD/CjYGY3qhLlvKhLkNI/Kje38YpA4DUq3VxdYQkW1iIguFAn4
	4HESmoqjQ9iZg/H3rn1O3DeTDwctLZ67tNedQ8yYNQs5W+sGiz1tQCtbKBkKDcxG1eY2n5srlrQi7
	SuDwhthAtlIHwVtRfj9Ka0jSmT0cK8U5X8xXdTMHKXL+/GDfey0XLTVCH+tx3DM5Hxi8oCPbz6OLf
	N2um3/5xwgikZWOO5COlLu4nBGhMvBdQ245PRY+4+LC3r9+OHKg4Xeg28G1cuOujFEZQBW1xn8vxW
	iNRGg9Vj6oTT0T+A/xlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRqz-007sBc-0u;
	Thu, 06 Apr 2023 15:48:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRqw-007sAh-21;
	Thu, 06 Apr 2023 15:48:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2EA560B2C;
	Thu,  6 Apr 2023 15:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CFE5C4339C;
	Thu,  6 Apr 2023 15:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680796125;
	bh=gCMj7rHc2vXcOYr+ShATDoCKp8S/RUyCf67KISWSutM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZMF5k7KKffyKyYyX7yspk2IyYCGQcqbQ7LzxlG0zX2jKbDx2pOFdE+SdtfFTELZzu
	 FwuO9NAHPoZsCLnHSQWoYxNOd4EZptbNtaEiKJnCtGDzm6HX4olb1dHGrW0yhImCOR
	 b37KPZ+7G8xuKUiVRNVrCB8boMqXobaklI/WLzcrmlJeD33tNmnMgcPDuPBLb3Ev91
	 b+nIaoXvfjTF5tUEoFUBsDbcjQckoybX5C2qhTRZ2RR8OFJ2zqjYJjwUbQsRbq9JlC
	 AYOTinadPVJ62rmoAO7oI8CG+gnG2hnBIDQ5LcvEQIEpNVnoCeYyIeJm9xS/EIn+RM
	 2S4Fih8rtiKlw==
Received: by mail-yb1-f173.google.com with SMTP id j7so46633685ybg.4;
        Thu, 06 Apr 2023 08:48:45 -0700 (PDT)
X-Gm-Message-State: AAQBX9e0yxZQAVEbgL91Q2qoMklEyYv8ky0bq9dXdWvJdLXuyPNuoPr6
	hnq1M7WzNjIwdrTE4/pqORwQ7+E0WIFQWLPKRw==
X-Google-Smtp-Source: AKy350Zzc2mowfFyIPi/dfoj4PLjaJFeaGp+GLAx0yBecFNH8tMSD++w2H0z7ixo8hKG1Kc7Dvdk1MZHPK6dVBFWaNg=
X-Received: by 2002:a25:cad1:0:b0:b75:3fd4:1b31 with SMTP id
 a200-20020a25cad1000000b00b753fd41b31mr2367088ybg.1.1680796124084; Thu, 06
 Apr 2023 08:48:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230406151429.524591-1-tanure@linux.com> <20230406151429.524591-3-tanure@linux.com>
In-Reply-To: <20230406151429.524591-3-tanure@linux.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 6 Apr 2023 10:48:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL_MLHO-zk0HAmuAmiJQ_TmD4EN5YC0JmRs7PXjStjr3A@mail.gmail.com>
Message-ID: <CAL_JsqL_MLHO-zk0HAmuAmiJQ_TmD4EN5YC0JmRs7PXjStjr3A@mail.gmail.com>
Subject: Re: [PATCH 2/2] of: fdt: Allow the kernel to mark nomap regions
 received from fdt
To: Lucas Tanure <tanure@linux.com>
Cc: Frank Rowand <frowand.list@gmail.com>, Mike Rapoport <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, jbrunet@baylibre.com, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	martin.blumenstingl@googlemail.com, narmstrong@baylibre.com, stefan@agner.ch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_084846_761760_54A8D341 
X-CRM114-Status: GOOD (  26.77  )
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

T24gVGh1LCBBcHIgNiwgMjAyMyBhdCAxMDoxNOKAr0FNIEx1Y2FzIFRhbnVyZSA8dGFudXJlQGxp
bnV4LmNvbT4gd3JvdGU6Cj4KPiBSZXNlcnZlZCByZWdpb25zIGNhbiBiZSBkZXNjcmliZWQgaW4g
RkRUIGFuZCBkZXZpY2UgdHJlZXMsIGJ1dCBGRFQgZG9lc24ndAo+IHByb3ZpZGUgdGhlIHJlbGF0
ZWQgZmxhZ3MsIGxpa2Ugbm9tYXAuCgpJdCB0b29rIG1lIGEgbWludXRlIHRvIHVuZGVyc3RhbmQg
d2hhdCB5b3UgbWVhbnQgYnkgRkRUIHZzLiBkZXZpY2UKdHJlZXMuIFVzZSB0aGUgZXhhY3QgdGhp
bmdzIHlvdSBhcmUgdGFsa2luZyBhYm91dDogL21lbXJlc2VydmUvIGFuZAovcmVzZXJ2ZWQtbWVt
b3J5IG5vZGUuCgo+IFNvIGFsbG93IHRoZSBrZXJuZWwgdG8gbWFyayByZWdpb25zIHdoZXJlIHRo
ZSBiYXNlIGFuZCBzaXplIHJlY2VpdmVkIGZyb20KPiB0aGUgZGV2aWNlIHRyZWUgYXJlIHRoZSBz
YW1lIGFzIHRoZSBiYXNlIGFuZCByZWdpb24gb24gRkRULgo+IEhlcmUgd2UgdHJ1c3QgdGhhdCB0
aGUgZGV2aWNlIHRyZWUgaGFzIGEgbW9yZSB1cGRhdGVkIGRlc2NyaXB0aW9uIG9mIHRoZQo+IHJl
Z2lvbiB0aGFuIHRoZSBvbmUgcmVjZWl2ZWQgZnJvbSBGRFQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBM
dWNhcyBUYW51cmUgPHRhbnVyZUBsaW51eC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvb2YvZmR0LmMg
fCAxMCArKysrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9vZi9mZHQuYyBiL2RyaXZlcnMvb2Yv
ZmR0LmMKPiBpbmRleCBkMWE2OGI2ZDAzYjMuLjc1NGE3ZWE0ZjQ1YyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL29mL2ZkdC5jCj4gKysrIGIvZHJpdmVycy9vZi9mZHQuYwo+IEBAIC00ODIsMTEgKzQ4
MiwxMyBAQCBzdGF0aWMgaW50IF9faW5pdCBlYXJseV9pbml0X2R0X3Jlc2VydmVfbWVtb3J5KHBo
eXNfYWRkcl90IGJhc2UsCj4gICAgICAgICBpZiAobm9tYXApIHsKPiAgICAgICAgICAgICAgICAg
LyoKPiAgICAgICAgICAgICAgICAgICogSWYgdGhlIG1lbW9yeSBpcyBhbHJlYWR5IHJlc2VydmVk
IChieSBhbm90aGVyIHJlZ2lvbiksIHdlCj4gLSAgICAgICAgICAgICAgICAqIHNob3VsZCBub3Qg
YWxsb3cgaXQgdG8gYmUgbWFya2VkIG5vbWFwLCBidXQgZG9uJ3Qgd29ycnkKPiAtICAgICAgICAg
ICAgICAgICogaWYgdGhlIHJlZ2lvbiBpc24ndCBtZW1vcnkgYXMgaXQgd29uJ3QgYmUgbWFwcGVk
Lgo+ICsgICAgICAgICAgICAgICAgKiBzaG91bGQgbm90IGFsbG93IGl0IHRvIGJlIG1hcmtlZCBu
b21hcCwgdW5sZXNzIGlzIHRoZSBleGFjdCBzYW1lIHJlZ2lvbgo+ICsgICAgICAgICAgICAgICAg
KiAoc2FtZSBiYXNlIGFuZCBzaXplKSwgd2hpY2ggdGhlIGtlcm5lbCBrbm93cyBiZXR0ZXIgYW5k
IHNob3VsZCBiZSBhbGxvd2VkIHRvIG1hcmsKPiArICAgICAgICAgICAgICAgICogIGl0IGFzIG5v
bWFwLgo+ICsgICAgICAgICAgICAgICAgKiBCdXQgZG9uJ3Qgd29ycnkgaWYgdGhlIHJlZ2lvbiBp
c24ndCBtZW1vcnkgYXMgaXQgd29uJ3QgYmUgbWFwcGVkLgo+ICAgICAgICAgICAgICAgICAgKi8K
PiAtICAgICAgICAgICAgICAgaWYgKG1lbWJsb2NrX292ZXJsYXBzX3JlZ2lvbigmbWVtYmxvY2su
bWVtb3J5LCBiYXNlLCBzaXplKSAmJgo+IC0gICAgICAgICAgICAgICAgICAgbWVtYmxvY2tfaXNf
cmVnaW9uX3Jlc2VydmVkKGJhc2UsIHNpemUpKQo+ICsgICAgICAgICAgICAgICBpZiAobWVtYmxv
Y2tfb3ZlcmxhcHNfcmVnaW9uKCZtZW1ibG9jay5tZW1vcnksIGJhc2UsIHNpemUpID09IE1FTUJM
T0NLX09WRVJMQVBTICYmCj4gKyAgICAgICAgICAgICAgICAgICBtZW1ibG9ja19pc19yZWdpb25f
cmVzZXJ2ZWQoYmFzZSwgc2l6ZSkgPT0gTUVNQkxPQ0tfT1ZFUkxBUFMpCgpXb24ndCB0aGlzIGZh
aWwgdG8gd29yayBhcyBJSVJDIG1lbWJsb2NrIHdpbGwgbWVyZ2UgcmVnaW9ucyB3aGVuIHRoZXkK
YXJlIGFkamFjZW50IGFuZCBoYXZlIHRoZSBzYW1lIGF0cnJpYnV0ZXMuCgpQZXJoYXBzIGluc3Rl
YWQsIHRoZSBEVCBjb2RlIHNob3VsZCBpZ25vcmUgYW55IC9tZW1yZXNlcnZlLyBlbnRyaWVzCnRo
YXQgYXJlIGFsc28gaW4gL3Jlc2VydmVkLW1lbW9yeS4KCkkgd291bGQgc3VnZ2VzdCBqdXN0IHJl
dmVyc2UgdGhlIG9yZGVyIHRoZXkgYXJlIHByb2Nlc3NlZCwgYnV0IEkKc3VzcGVjdCB0aGF0IG1p
Z2h0IGNhdXNlIHNvbWUgcmVncmVzc2lvbi4gVGhpcyBjb2RlIGlzIGFsbCBmcmFnaWxlCmVzcGVj
aWFsbHkgd2l0aCBwbGF0Zm9ybXMgcHV0dGluZyBpbiAxMDAgcmVnaW9ucy4KCkZpbmFsbHksIHBl
cmhhcHMgZml4IHUtYm9vdC4gVGhlIHJlYXNvbiB0aGUgcmVzZXJ2ZWQgbG9jYXRpb24gZ29lcyBp
bgpib3RoIHBsYWNlcyB3YXMgdG8gc3VwcG9ydCBhbiBPUyBub3Qgc3VwcG9ydGluZyAvcmVzZXJ2
ZWQtbWVtb3J5LiBJCnRoaW5rIHRoYXQgc3VwcG9ydCBoYXMgYmVlbiBpbiBwbGFjZSBmb3IgYSBs
b3QgbG9uZ2VyIHRoYW4gYW55b25lCndvdWxkIGNhcmUgYWJvdXQuCgpSb2IKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGlu
ZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

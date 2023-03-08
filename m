Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45FA7C64EC4
	for <linux-amlogic@archiver.kernel.org>; Wed,  8 Mar 2023 12:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xibxaYxX2IzNPs1sLB/+UBKIoIxuTUQg8aVIN17CgfQ=; b=C0z+rDrJQwTkox
	4gcGlCNYYBVTgqGTJ/2mns8GVqFwVQbtG4SPmQr2OntbMejjnYRUiiBesbwAk9BnGw/tu+gLu2WVc
	IKreVQwfIXZbBcGNa0UhJyRdeMcLl5sqkGgc6f+xP7y8RAdQGOkpgMXTn+aGGqSLoKe+4BCj27Sw6
	szmHih/iOwjrUG2SObb6nsTY0lih5Sg3JktiocB/BMGX7tJBl8OA6RuHaKDgUXpaB6yTKls3uZ+V1
	jdgBS9AMYf1h8RlD5SmzmJvzHcdTbh31m1eX/dNXQUDwKfKLLf6ZXMumjGR+wCjym3E3CCUbce/ic
	3ppjGqcdZT4n3AGWcU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtDU-004vNG-MQ; Wed, 08 Mar 2023 12:48:24 +0000
Received: from smtp4-g21.free.fr ([2a01:e0c:1:1599::13])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZtDR-004vLn-8x
	for linux-amlogic@lists.infradead.org; Wed, 08 Mar 2023 12:48:23 +0000
Received: from [IPV6:2a02:8428:2a4:1a01:45c4:a757:53fe:d68b] (unknown [IPv6:2a02:8428:2a4:1a01:45c4:a757:53fe:d68b])
	(Authenticated sender: marc.w.gonzalez@free.fr)
	by smtp4-g21.free.fr (Postfix) with ESMTPSA id 31D3B19F5AD;
	Wed,  8 Mar 2023 13:47:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1678279697;
	bh=khQxVjFHMjEKGcJe0J+IKRrBiCSANsezuEHC8IvabDI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uthwmaaBuqqeWDXGBUXa60Z5MPrU6O0uLQAShfd73hN8O8BdkFhbf2Pr2TjX6MH28
	 uQwLDjUkbp8qM/vD3BRhctd3gPzbLtzfQZ61R7TevX9i9lqMhjhrCnjTrgUgOG1ayQ
	 666x28QubRO0Y5IJjZu5ledQCao76ser7c//XJh3u+5Uf9ZvhSQqMdOE3B7HhlpYHL
	 SZM0oHlbnfTBSL6R6snF2v6tGY0V0CBwi3y+H33P4GmfLP/cQTdRRuvKZFrcfYWMhZ
	 sXIcjQFkBXxTN/PcROWwHhODvG1WIMCuBzi+utQqiHdjl3NMTwQ1/HiBAXR1wScFd0
	 HIv60mCwo+qPw==
Message-ID: <f14407f1-e16f-0074-6e29-c597754ae617@free.fr>
Date: Wed, 8 Mar 2023 13:47:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH] brcmfmac: add 43751 SDIO ids and initialization
To: Franky Lin <franky.lin@broadcom.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Arend van Spriel <aspriel@gmail.com>,
 Hante Meuleman <hante.meuleman@broadcom.com>, Kalle Valo <kvalo@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Pieter-Paul Giesberts <pieter-paul.giesberts@broadcom.com>,
 Alexander Prutskov <alep@cypress.com>, Joseph chuang <jiac@cypress.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Angus Ainslie <angus@akkea.ca>, linux-wireless@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <05977cbb-8a8f-0a67-b4bd-b265dbb83280@free.fr>
 <895a3812-e490-cc40-0f8e-a88e166e8f24@linaro.org>
 <c1a215cf-94be-871b-2a8a-3cc381588f83@free.fr>
 <6be2c348-b343-876a-a77f-a8297676de6a@free.fr>
 <a215e398-2c49-19d2-0730-5e8c51df1ed9@free.fr>
 <CA+8PC_du5dMwkmAshG2mM9TdeJft5aeAbEdDp0_q3Rxdvpq4MQ@mail.gmail.com>
Content-Language: en-US
From: Marc Gonzalez <marc.w.gonzalez@free.fr>
In-Reply-To: <CA+8PC_du5dMwkmAshG2mM9TdeJft5aeAbEdDp0_q3Rxdvpq4MQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_044821_479444_9BF7936A 
X-CRM114-Status: GOOD (  16.85  )
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

T24gMDgvMDMvMjAyMyAwMDoxNSwgRnJhbmt5IExpbiB3cm90ZToKCj4gT24gVHVlLCBNYXIgNywg
MjAyMyBhdCA2OjQw4oCvQU0gTWFyYyBHb256YWxleiB3cm90ZToKPiAKPj4gVGhyb3VnaCB0aGUg
U0RJTyBidXMsIHRoZSBXaUZpIGNoaXAgcmVwb3J0cyAweGFhZTcgKGkuZS4gNDM3NTEpCj4+IGhl
bmNlIHRoZSAvc3lzL2J1cy9zZGlvL2RldmljZXMgb3V0cHV0IGFib3ZlLgo+Pgo+PiBzZGlvX3Jl
YWRfZnVuY19jaXMoKSAtPiBzZGlvX3JlYWRfY2lzKCkgd2hpY2ggc2V0cwo+PiBmdW5jLT52ZW5k
b3IvZnVuYy0+ZGV2aWNlIHRvIDJkMC9hYWU3Cj4+Cj4+Cj4+IEJ1dCB3aGVuIGJyY21mX2NoaXBf
cmVjb2duaXRpb24oKSBjYWxscyBjaS0+b3BzLT5yZWFkMzIoKQo+PiBpLmUuIGJyY21mX3NkaW9f
YnVzY29yZV9yZWFkMzIoKQo+PiBbIHZzIGJyY21mX3NkaW9kX3JlYWRsKCkgaW4gYnJjbWZfc2Rp
b19wcm9iZV9hdHRhY2goKSBdCj4+Cj4+IFsgICAgMS4xNzcyODNdIGJyY21mbWFjOiBGMSBzaWdu
YXR1cmUgcmVhZCBAMHgxODAwMDAwMD0weDEwNDJhYWU4Cj4+IFsgICAgMS4xODI5MTJdIGZvdW5k
IEFYSSBjaGlwOiBCQ000Mzc1Mi8yCj4+IFsgICAgMS4xODYzODRdIEJDTTQzNzUyLzI6IGNoaXA9
YWFlOCByZXY9MiB0eXBlPTEKPj4KPj4gSGVyZSBpdCByZXBvcnRzIDB4YWFlOCAoaS5lLiA0Mzc1
MikKPj4KPj4gV2h5IHRoZSBkaXNjcmVwYW5jeT8KPj4gQ2FuIGl0IGNhdXNlIGlzc3Vlcz8KPj4g
KFNvbWV0aW1lcywgdGhlIHdob2xlIFNESU8gYnVzIGRvZXNuJ3QgcHJvYmUgYXQgYm9vdC4KPj4g
SSBhbSBzdGlsbCBpbnZlc3RpZ2F0aW5nIHRoZXNlIGludGVybWl0dGVudCBwcm9ibGVtcy4pCj4+
Cj4+IFNob3VsZCBJIHVzZSA0Mzc1MSBvciA0Mzc1MiBmaXJtd2FyZS4uLj8KPiAKPiBUaGlzIHF1
ZXN0aW9uIHNob3VsZCBiZSBhbnN3ZXJlZCBieSB0aGUgQ3lwcmVzcy9JbmZpbmVvbiBmb2xrcyBi
dXQKPiB1bmZvcnR1bmF0ZWx5IHRoZXkgaGF2ZSBiZWVuIHF1aWV0IGZvciBhIGxvbmcgdGltZS4g
SW4gZ2VuZXJhbCB3ZSB1c2UKPiB0aGUgaWQgcmVhZCBmcm9tIDB4MTgwMDAwMDAgdG8gZGVjaWRl
IHdoaWNoIGZpcm13YXJlIHRvIGxvYWQuIEJ1dCBiZQo+IGF3YXJlIHRoYXQgdGhlIHJldiBhbHNv
IG1hdHRlcnMuIFRoZXJlIGFyZSBzb21lIGV4YW1wbGVzIGluCj4gYnJjbWZfc2Rpb19md25hbWVz
IHRhYmxlIHRoYXQgdGhlIGRpZmZlcmVudCBmaXJtd2FyZSBuYW1lIGNhbiBiZQo+IGRlcml2ZWQg
ZnJvbSB0aGUgc2FtZSBjaGlwIGNvbW1vbiBpZCBidXQgZGlmZmVyZW50IHJldi4KPiAKPiBIb3dl
dmVyIHNkaW8gZGV2aWNlIGVudW1lcmF0aW9uIGhhcHBlbnMgYmVmb3JlIGZpcm13YXJlIGRvd25s
b2FkIHNvCj4gdGhlIGludGVybWl0dGVudCBwcm9ibGVtIHlvdSBhcmUgZmFjaW5nIHByb2JhYmx5
IGlzIG5vdCByZWxhdGVkIHRvCj4gZmlybXdhcmUgdmVyc2lvbi4KCkRpc2Nsb3N1cmU6IE15IGtu
b3dsZWRnZSBvZiBTRElPIGRldmljZSBlbnVtZXJhdGlvbiBpcyAwLgoKV2hlbiB0aGUgaG9zdCBz
ZW5kcyB0aGUgZXF1aXZhbGVudCBvZiBhbiAiaWRlbnRpZnkgeW91cnNlbGYiIG1lc3NhZ2UKb24g
dGhlIFNESU8gYnVzLCBkb2Vzbid0IHRoZSByZXBseSBjb21lIGZyb20gdGhlIFdpRmkgZGV2aWNl
PwpXaHkgd291bGQgdGhlIGRldmljZSByZXBseSAweGFhZTcgaW5zdGVhZCBvZiAweGFhZTg/CgpJ
biBvdGhlciB3b3Jkcywgd2hvIGlzIHJlcGx5aW5nIDB4YWFlNz8KClJlZ2FyZHMuCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

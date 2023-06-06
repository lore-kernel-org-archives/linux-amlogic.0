Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB8B5C77B7A
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Jun 2023 12:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaO3zkH4AQD3zLtM9mdlaOF5JU1G5Qt9mpuM0JjxbdM=; b=u4zwb3KmoVP4NO
	gzfnLJXRldkjNCfUwRjnvSIqFSaaDjW1WzPa5TR6prHt1lzVnQkBiQb9e4OLXa2hh2V1nUVm3vkm4
	B3GZU9h7RfkIKQhIJMK/3ujRZziA0Ly0fzGvTaES1Y1/+3hLZ3QJbCk6C44/5RDXKKCP9juUhzgUV
	Qjny1W1ndOiX0224e58E54ZXE48bShZmsQdvolQeSJHU8V3sfYKg9O61XbLmFp2Q62l5oTGcbsQ15
	6rnhuVnzPpkG22jHHWSBo8L4epKXUqh5kq3brAqhkZHH8Ilf+t0FMG1YEkF0uf3nFEbM7R3uhgS6s
	XUKi6zrXe9uVrdowlObQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6WGU-001kvM-0o;
	Tue, 06 Jun 2023 12:58:22 +0000
Received: from mx.sberdevices.ru ([45.89.227.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6WGQ-001ks0-1M;
	Tue, 06 Jun 2023 12:58:21 +0000
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 878A65FD3B;
	Tue,  6 Jun 2023 15:58:09 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1686056289;
	bh=MsK3KfXvwDDXjdR1K4Z8iNkLw2j81KfAr/Pv963g5nQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	b=XNGmWbqE+gcreM/m4zW6J26BakoZSNJ1Y7UnfbIw9z7G7YKoi3DATkZhYe9+KvPhu
	 2P49UFRlrhrMN3fYX07Kg/T5p0K3mKhKsP0lqRGUqyojcU5dZ09UD1PAjgVc0NXULC
	 6v3OhljNuIVARIzWLw3iEWTOV/heqky8m96JjJ7qhcIHDGNqfpOU7z+iX5dONzI1Qj
	 zmI7xXpn0q65u1eqAYev0GayO4N3HSDbh1B/yW1vuDMF0aF/RM5JKmNQ6ArbAU/Cu8
	 zejU5845t2Wd6JOK7opluSy32o+vwyy+cVeKN/XUwki515icEi47bCOAjdLHrRmGGz
	 Jy2kLeaMttHuQ==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Tue,  6 Jun 2023 15:58:07 +0300 (MSK)
Message-ID: <02c7e2b4-9087-fc73-bd57-0d4c12bbe203@sberdevices.ru>
Date: Tue, 6 Jun 2023 15:53:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v1] meson saradc: fix clock divider mask length
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: "jic23@kernel.org" <jic23@kernel.org>, Dmitry Rokosov
	<DDRokosov@sberdevices.ru>, "lars@metafoo.de" <lars@metafoo.de>,
	"neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>, "jbrunet@baylibre.com"
	<jbrunet@baylibre.com>, "andy.shevchenko@gmail.com"
	<andy.shevchenko@gmail.com>, "nuno.sa@analog.com" <nuno.sa@analog.com>,
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, kernel <kernel@sberdevices.ru>, Vyacheslav
	<adeep@lexina.in>
References: <20230515210545.2100161-1-gnstark@sberdevices.ru>
 <CAFBinCCc+t7Ks6fqz38cVrufPRFdxFgC9Qp+JhcM1KfD6pupTg@mail.gmail.com>
 <a52335ea-6545-8ca6-d318-38b7ffc64368@lexina.in>
 <CAFBinCDmkGnD5o_rV6K73De2XmHDxRYveDwNAy3iA+Kwr5sdqg@mail.gmail.com>
 <6910550a-b025-0d97-0b39-bc89b235541e@sberdevices.ru>
 <CAFBinCCk6OziOxt2AY1A25C=9_pibhHsDK0wJNZ_AyHMd=z6SQ@mail.gmail.com>
 <dcb05f27-4c6d-0544-ff0d-288a6848ccaf@sberdevices.ru>
 <CAFBinCCnAVveiYEOSq=KkBq0kRJti7eWgfRxqiTkQWe9i8mTzA@mail.gmail.com>
From: George Stark <gnstark@sberdevices.ru>
In-Reply-To: <CAFBinCCnAVveiYEOSq=KkBq0kRJti7eWgfRxqiTkQWe9i8mTzA@mail.gmail.com>
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/06/06 11:10:00 #21443593
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_055819_174230_8002488C 
X-CRM114-Status: GOOD (  20.45  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIDYvNS8yMyAyMzoxOCwgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBIaSBHZW9yZ2Us
Cj4KPiBPbiBUaHUsIEp1biAxLCAyMDIzIGF0IDEwOjU24oCvUE0gR2VvcmdlIFN0YXJrIDxnbnN0
YXJrQHNiZXJkZXZpY2VzLnJ1PiB3cm90ZToKPiBbLi4uXQo+PiBIZXJlIHRoZSB0ZXN0IEkgcHJv
bWlzZWQ6Cj4+IFF1ZXN0aW9uOiB3aGF0J3MgdGhlIHJlYWwgc2l6ZSBvZiBjbG9jayBkaXZkZXIg
ZmllbGQgaW4gU0FSX0FEQ19SRUczIHJlZ2lzdGVyIGluIHNhcmFkYyBpbiBtZXNvbjggc29jcz8K
Pj4gVGhlIGN1cnJlbnQga2VybmVsIGNvZGUgc2F5cyA1IGJpdHMKPj4gVGhlIGRhdGFzaGVldCBz
YXlzIDYgYml0Cj4+Cj4+IFRoZSBwYXJlbnQgY2xvY2sgb2YgYWRjIGNsb2NrIGlzIDI0TWh6Cj4+
IEkgY2FuIGNoZWNrIGl0IGhlcmUgYnk6Cj4+Cj4+ICMgY2F0IC9zeXMva2VybmVsL2RlYnVnL2Ns
ay9jbGtfc3VtbWFyeQo+PiAgICB4dGFsICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
NCAgICAgICAgNCAgICAgICAgMSAgICAyNDAwMDAwMCAgICAgICAgICAwICAgICAwICA1MDAwMCAg
ICAgICAgIFkKPj4gICAgICAgYzExMDg2ODAuYWRjI2FkY19kaXYgICAgICAgICAgICAgIDEgICAg
ICAgIDEgICAgICAgIDAgICAgICAxMTQyODU4ICAgICAgICAgMCAgICAgMCAgNTAwMDAgICAgICAg
ICBZCj4+ICAgICAgICAgIGMxMTA4NjgwLmFkYyNhZGNfZW4gICAgICAgICAgICAxICAgICAgICAx
ICAgICAgICAwICAgICAgMTE0Mjg1OCAgICAgICAgIDAgICAgIDAgIDUwMDAwICAgICAgICAgWQo+
Pgo+PiBmb3IgZGl2aWRlciB3aWR0aCA1Yml0IG1pbiBhZGMgY2xvY2sgaXMgMjRNaHogLyAzMiA9
ICA3NTBLSFoKPj4gZm9yIGRpdmlkZXIgd2lkdGggNmJpdCBtaW4gYWRjIGNsb2NrIGlzIDI0TWh6
IC8gNjQgPSAgMzc1S0h6Cj4+Cj4+IEkgc3VwcG9zZSB0aGF0IHRoZSBsb3dlciBhZGMgY2xvY2sg
cmF0ZSB0aGUgaGlnaGVyIG1lYXN1cmVtZW50IHRpbWUKPj4gc28gSSBuZWVkIHRvIGdldCBtZWFz
dXJlbWVudCB0aW1lIGF0IGJvdGggY2xrIGZyZXFzIGFuZCB0aGUgdGltZXMgZGlmZmVyIHNvCj4+
IDZiaXQgZGl2aWRlciBpcyByZWFsbHkgYXBwbGllZAo+Pgo+PiBJIHBlcmZvcm1lZCB0ZXN0IGF0
IE9kcm9pZC1DMSwga2VybmVsIDYuMi1yYzgKPj4gVHdvIGtlcm5lbCBwYXRjaGVzIG11c3QgYmUg
YXBwbGllZDoKPj4KPj4gdGhlIHRvcGljIHN0YXJ0ZXIgcGF0Y2ggYW5kIHRoZSBoZWxwZXIgcGF0
Y2ggYXQgdGhlIGVuZCBvZiB0aGUgbGV0dGVyCj4+IEluIHRoZSBoZWxwZXIgcGF0Y2ggSSB0dXJu
IG9uIENMT0NLX0FMTE9XX1dSSVRFX0RFQlVHRlMgdG8gY2hhbmdlIGNsb2NrIHJhdGUgZnJvbSBz
aGUgc2hlbGwKPj4gYW5kIHVzZSBrdGltZV9nZXRfcmF3X3RzNjQgdG8gbWVhc3VyZSBtZWFzdXJl
bWVudCB0aW1lCj4+Cj4+IFNvIHRoZSB0aGUgdGVzdCBpdHNlbGY6Cj4+IGNhdCAvc3lzL2Rldmlj
ZXMvcGxhdGZvcm0vc29jL2MxMTAwMDAwLmNidXMvYzExMDg2ODAuYWRjL2lpbzpkZXZpY2UwL2lu
X3ZvbHRhZ2UzX3Jhdwo+PiBbIDE3ODEuMjI2MzA5XSA9PT09IGZyZXE6IDExNDI4NTggdGltZSA0
MjQwODAwMAo+Pgo+PiAjIGVjaG8gNzUwMDAwID4gL3N5cy9rZXJuZWwvZGVidWcvY2xrL2MxMTA4
NjgwLmFkYyNhZGNfZW4vY2xrX3JhdGUKPj4gIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3Nv
Yy9jMTEwMDAwMC5jYnVzL2MxMTA4NjgwLmFkYy9paW86ZGV2aWNlMC9pbl92b2x0YWdlM19yYXcK
Pj4gWyAxNzkwLjcyODY1Nl0gPT09PSBmcmVxOiA3NTAwMDAgdGltZSA0OTE3MzAwMAo+Pgo+PiAj
IGVjaG8gMzc1MDAwID4gL3N5cy9rZXJuZWwvZGVidWcvY2xrL2MxMTA4NjgwLmFkYyNhZGNfZW4v
Y2xrX3JhdGUKPj4gIyBjYXQgL3N5cy9kZXZpY2VzL3BsYXRmb3JtL3NvYy9jMTEwMDAwMC5jYnVz
L2MxMTA4NjgwLmFkYy9paW86ZGV2aWNlMC9pbl92b2x0YWdlM19yYXcKPj4gWyAxODE2Ljk1NTQ3
N10gPT09PSBmcmVxOiAzNzUwMDAgdGltZSA2ODI0NTAwMAo+Pgo+PiAjIGNhdCAvc3lzL2tlcm5l
bC9kZWJ1Zy9jbGsvY2xrX3N1bW1hcnkKPj4gICAgeHRhbCAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDQgICAgICAgIDQgICAgICAgIDEgICAgMjQwMDAwMDAgICAgICAgICAgMCAgICAg
MCAgNTAwMDAgICAgICAgICBZCj4+ICAgICAgIGMxMTA4NjgwLmFkYyNhZGNfZGl2ICAgICAgICAg
ICAgICAxICAgICAgICAxICAgICAgICAwICAgICAgMzc1MDAwICAgICAgICAgIDAgICAgIDAgIDUw
MDAwICAgICAgICAgWQo+PiAgICAgICAgICBjMTEwODY4MC5hZGMjYWRjX2VuICAgICAgICAgICAg
MSAgICAgICAgMSAgICAgICAgMCAgICAgIDM3NTAwMCAgICAgICAgICAwICAgICAwICA1MDAwMCAg
ICAgICAgIFkKPiBUaGVzZSByZXN1bHRzIGxvb2tzIGV4Y2VsbGVudCAtIHRoYW5rcyBmb3Igc2hh
cmluZyB0aGUgdGVzdCByZXN1bHRzIQo+IENvdWxkIHlvdSBwbGVhc2UgY2hlY2sgb25lIGxhc3Qg
dGhpbmc6Cj4gJCBncmVwIC1pIGFkYyAvc3lzL2tlcm5lbC9kZWJ1Zy9tZXNvbi1jbGstbXNyL21l
YXN1cmVfc3VtbWFyeQo+IEl0IHNob3VsZCBjb25maXJtIHRoYXQgdGhlIGNsb2NrIHJhdGUgaXMg
Mzc1a0h6IChvciBjbG9zZSB0byBpdCwgU29DCj4gaW50ZXJuYWwgY2xvY2sgbWVhc3VyZW1lbnQg
aXMgbm90IDEwMCUgcHJlY2lzZSkKSGVsbG8gTWFydGluCgpMb29rcyBsaWtlIGl0IHdvcmtzIGFz
IGV4cGVjdGVkOgojIGdyZXAgLWkgYWRjIC9zeXMva2VybmVsL2RlYnVnL21lc29uLWNsay1tc3Iv
bWVhc3VyZV9zdW1tYXJ5CiDCoCBzYXJfYWRjwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgMTE0MDYyNcKgwqDCoCArLy0zMTI1SHoKIyBlY2hvIDM3NTAwMCA+IC9zeXMva2VybmVsL2Rl
YnVnL2Nsay9jMTEwODY4MC5hZGMjYWRjX2VuL2Nsa19yYXRlCiMgZ3JlcCAtaSBhZGMgL3N5cy9r
ZXJuZWwvZGVidWcvbWVzb24tY2xrLW1zci9tZWFzdXJlX3N1bW1hcnkKIMKgc2FyX2FkY8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMzcxODc1wqDCoMKgICsvLTMxMjVIegoKU28g
SSdtIHJlLXNlbmRpbmcgdGhlIHBhdGNoIHdpdGggZml4ZWQgY29tbWl0IG1lc3NhZ2UKCi0tIApC
ZXN0IHJlZ2FyZHMKR2VvcmdlCgo+Cj4gT25jZSB3ZSBoYXZlIHRoYXQgY29uZmlybWF0aW9uOiBj
YW4geW91IHBsZWFzZSByZS1zZW5kIHRoZSBwYXRjaCB3aXRoCj4gdGhlIGRlc2NyaXB0aW9uIHVw
ZGF0ZWQgc28gaXQncyBjbGVhciB3aGljaCBTb0MgZ2VuZXJhdGlvbnMgYXJlCj4gYWZmZWN0ZWQg
YW5kIGJ5IHN0YXRpbmcgdGhhdCB0aGUgZml4IHdhcyB0ZXN0ZWQgb24gYSBNZXNvbjhiIE9kcm9p
ZC1DMQo+IGJvYXJkLgo+Cj4KPiBUaGFuayB5b3UgYW5kIGJlc3QgcmVnYXJkcywKPiBNYXJ0aW4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

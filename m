Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F29C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 02:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3CFWS2fKow5iznc16Kfq63EiwnF7QmVs0LIM1uQ0vBs=; b=VX79eI1ziVlKJN
	hJHmcy1SlDznorymH36i+hxxGiqdXj9UVEVKWli2JNvN06+kLp20Va4GnAnUVVqDTHBvAfscUUNvg
	rNIpkNChn/fRjV07mcNQoHDLZn7ocYkta6ziWQcWqlBn5ZZDbC1xQD5v4HB7+tyU5suqUR4/OM6Pr
	Ki7kQWY3lTaWO4FMYxY5RepG/uNaGT9BcOlAvfVxfXgZ/K0hLh6Yibl1wvrydISc8AgWTG2BLH0Kl
	ejDfSkNPSoWy3fNobDqnDgXAjY3N39lxBTLmq3/baYeLZ6ATXLs/hyMSIfCyLNbty8icMDgIHY9ID
	bC9V4nH6qmF1xV6+VGPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA18o-003cRz-Tq; Wed, 19 Jan 2022 02:56:06 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA18T-003cJJ-Dq; Wed, 19 Jan 2022 02:55:46 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 19 Jan
 2022 10:55:38 +0800
Message-ID: <f8f1c6c6-3805-6371-87ea-06fc14862625@amlogic.com>
Date: Wed, 19 Jan 2022 10:55:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.1; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v9 4/4] clk: meson: add sub MMC clock controller driver
Content-Language: en-US
To: Stephen Boyd <sboyd@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Michael Turquette
 <mturquette@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Rob
 Herring <robh+dt@kernel.org>, <linux-clk@vger.kernel.org>
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jianxin Pan
 <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>, XianWei Zhao
 <xianwei.zhao@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, BiChao
 Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-5-liang.yang@amlogic.com>
 <20220113213513.9819AC36AEA@smtp.kernel.org>
 <09ff9044-9abc-d1ad-26c1-5e6ece56d30c@amlogic.com>
 <20220114230130.35EAAC36AE7@smtp.kernel.org>
 <fe77fd6b-788f-1694-f260-f95e54cf4ef3@amlogic.com>
 <20220119022221.3AF83C340E0@smtp.kernel.org>
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220119022221.3AF83C340E0@smtp.kernel.org>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_185545_506555_071750F0 
X-CRM114-Status: GOOD (  10.18  )
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

SGkgU3RlcGhlbiwKCk9uIDIwMjIvMS8xOSAxMDoyMiwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IFsg
RVhURVJOQUwgRU1BSUwgXQo+IAo+IFF1b3RpbmcgTGlhbmcgWWFuZyAoMjAyMi0wMS0xNiAyMjoy
NDoyOCkKPj4KPj4KPj4gT24gMjAyMi8xLzE1IDc6MDEsIFN0ZXBoZW4gQm95ZCB3cm90ZToKPj4+
IFsgRVhURVJOQUwgRU1BSUwgXQo+Pj4KPj4+IFF1b3RpbmcgTGlhbmcgWWFuZyAoMjAyMi0wMS0x
MyAyMToxNDo0NikKPj4+PiBPbiAyMDIyLzEvMTQgNTozNSwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+
Pj4+PiBRdW90aW5nIExpYW5nIFlhbmcgKDIwMjItMDEtMTMgMDM6NTc6NDUpCj4+Pj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVzb24vbW1jLWNsa2MuYyBiL2RyaXZlcnMvY2xrL21lc29u
L21tYy1jbGtjLmMKPj4+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+Pj4+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLmY1Mzk3N2Y2MTM5MAo+Pj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+Pj4gKysrIGIv
ZHJpdmVycy9jbGsvbWVzb24vbW1jLWNsa2MuYwo+Pj4+Pj4gQEAgLTAsMCArMSwzMDAgQEAKPj4+
IFsuLl0KPj4+Pj4+ICsKPj4+Pj4+ICtzdGF0aWMgaW50IG1tY19jbGtjX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4+Pj4+PiArewo+Pj4+Pj4gKyAgICAgICBzdHJ1Y3QgY2xr
X2h3X29uZWNlbGxfZGF0YSAqb25lY2VsbF9kYXRhOwo+Pj4+Pj4gKyAgICAgICBzdHJ1Y3QgZGV2
aWNlICpkZXYgPSAmcGRldi0+ZGV2Owo+Pj4+Pj4gKyAgICAgICBzdHJ1Y3QgbW1jX2Nsa2NfZGF0
YSAqZGF0YTsKPj4+Pj4+ICsgICAgICAgc3RydWN0IHJlZ21hcCAqbWFwOwo+Pj4+Pj4gKyAgICAg
ICBzdHJ1Y3QgY2xrX3JlZ21hcCAqY2xrLCAqY29yZTsKPj4+Pj4+ICsgICAgICAgc3RydWN0IG1l
c29uX3NjbGtfZGl2X2RhdGEgKmRpdl9kYXRhOwo+Pj4+Pj4gKwo+Pj4+Pj4gKyAgICAgICAvKmNh
c3QgdG8gZHJvcCB0aGUgY29uc3QgaW4gbWF0Y2gtPmRhdGEqLwo+Pj4+Pgo+Pj4+PiBTcGFjZSBh
ZnRlciAqLCBhbHNvIHdoeSBkbyB3ZSBuZWVkIHRvIGNhc3QgYXdheSBjb25zdD8gVGhlIHVzZXIg
b2YgdGhpcwo+Pj4+PiBwb2ludGVyIHBhc3NlcyBpdCBhbGwgdGhlIHdheSBkb3duIHRvIG1tY19j
bGtjX3JlZ2lzdGVyX2NsaygpIHdoaWNoCj4+Pj4+IGNvdWxkIHRha2UgdGhlIGRhdGEgYXMgY29u
c3Qgdm9pZCBwb2ludGVyIGFuZCBkZWNpZGUgdG8gY2FzdCBhd2F5IGNvbnN0Cj4+Pj4+IHRoZXJl
Lgo+Pj4+Cj4+Pj4gaWYgdXNlICdjb25zdCcgaGVyZSwgaXQgIHdpbGwgcmVwb3J0IGEgd2Fybmlu
ZzoKPj4+PiBkcml2ZXJzL2Nsay9tZXNvbi9tbWMtY2xrYy5jOjIyNDo3OiBlcnJvcjogYXNzaWdu
bWVudCBkaXNjYXJkcyDigJhjb25zdOKAmQo+Pj4+IHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFy
Z2UKPj4+PiB0IHR5cGUgWy1XZXJyb3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4+Pj4KPj4+PiAg
ICAgIGRhdGEgPSAoY29uc3Qgc3RydWN0IG1tY19jbGtjX2RhdGEgKilvZl9kZXZpY2VfZ2V0X21h
dGNoX2RhdGEoZGV2KTsKPj4+Cj4+PiBPZiBjb3Vyc2UuIFRoZSB0eXBlIGRlY2xhcmF0aW9uIHVw
IGFib3ZlIG5lZWRzIGNvbnN0IGFkZGVkIHRvIGl0LlRoZSBwYXJtIG9mIG1tY19jbGtjX3JlZ2lz
dGVyX2Nsa193aXRoX3BhcmVudCguLi4uLCB2b2lkICpkYXRhKSBkb2VzIG5vdAo+PiBoYXZlICdj
b25zdCcsIHNvIG1ha2UgdGhlIHR5cGUgZGVjbGFyYXRpb24gY2F1c2UgYSBmdXJ0aGVyICdjb25z
dCcgY2FzdAo+PiB3YXJuaW5nLiBDb3VsZCBpIGNvcHkgdGhlc2UgaW5mb3MganVzdCBsaWtlIGJl
bG93Ogo+IAo+IFdoeSBjYW4ndCB5b3UgcHVzaCBjb25zdCBkb3duIHRvIHRoZSBmdW5jdGlvbiB0
aGF0IHJlYWxseSBjYXJlcyB0bwo+IHJlbW92ZSBjb25zdD8KZW0sIGl0IGlzIHJlYWxseSBvayB0
byBtZS4gaSB3aWxsIGZpeCBpdCBuZXh0IHZlcnNpb24uCj4gCj4gLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxp
c3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

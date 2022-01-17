Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37A3C433EF
	for <linux-amlogic@archiver.kernel.org>; Mon, 17 Jan 2022 06:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=foYZAmOVhCFPjozGqmNn3s0wxGZAyGhs4joQw+PvWDw=; b=EBolWd5UXro3NB
	fz7o3CLxK2l/NAPyx9oGQV3TKNoc2YhwO/q8QDLFo+lDpTNP0L1xqXU11EKNMhRRU82u3UxSyijg1
	NavcxPIit83hHashim0purWV4BvBtCXLUpBK+uieDjKj88lh9PdQkkuDW8qGhRxzED9pQQVzyjg50
	KT1cODKk7eQ+A2P1Sb/nNIVoQvvf8gx9q7UE76u4ZhIiWeY8Xu2frFLyQpxaBpos5JjUB1bzesoch
	0q+xUVgWoOeQDC/jFB353J7YqSaYzoK3yoUTKHO553Lpg0ok1NGhUoVUuSIGAtbn7zFZia3byFSsH
	UvLpjIEUwk2iuldNET4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9LRe-00DfHw-Mz; Mon, 17 Jan 2022 06:24:46 +0000
Received: from mail-sz.amlogic.com ([211.162.65.117])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9LRS-00DfGE-V5; Mon, 17 Jan 2022 06:24:36 +0000
Received: from [10.28.39.106] (10.28.39.106) by mail-sz.amlogic.com
 (10.28.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Mon, 17 Jan
 2022 14:24:28 +0800
Message-ID: <fe77fd6b-788f-1694-f260-f95e54cf4ef3@amlogic.com>
Date: Mon, 17 Jan 2022 14:24:28 +0800
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
From: Liang Yang <liang.yang@amlogic.com>
In-Reply-To: <20220114230130.35EAAC36AE7@smtp.kernel.org>
X-Originating-IP: [10.28.39.106]
X-ClientProxiedBy: mail-sz.amlogic.com (10.28.11.5) To mail-sz.amlogic.com
 (10.28.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220116_222435_028532_8150DA01 
X-CRM114-Status: UNSURE (   7.97  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

CgpPbiAyMDIyLzEvMTUgNzowMSwgU3RlcGhlbiBCb3lkIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1B
SUwgXQo+IAo+IFF1b3RpbmcgTGlhbmcgWWFuZyAoMjAyMi0wMS0xMyAyMToxNDo0NikKPj4gT24g
MjAyMi8xLzE0IDU6MzUsIFN0ZXBoZW4gQm95ZCB3cm90ZToKPj4+IFF1b3RpbmcgTGlhbmcgWWFu
ZyAoMjAyMi0wMS0xMyAwMzo1Nzo0NSkKPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVz
b24vbW1jLWNsa2MuYyBiL2RyaXZlcnMvY2xrL21lc29uL21tYy1jbGtjLmMKPj4+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjUzOTc3ZjYxMzkwCj4+Pj4g
LS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL21tYy1jbGtjLmMKPj4+
PiBAQCAtMCwwICsxLDMwMCBAQAo+IFsuLl0KPj4+PiArCj4+Pj4gK3N0YXRpYyBpbnQgbW1jX2Ns
a2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+PiArewo+Pj4+ICsgICAg
ICAgc3RydWN0IGNsa19od19vbmVjZWxsX2RhdGEgKm9uZWNlbGxfZGF0YTsKPj4+PiArICAgICAg
IHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+Pj4gKyAgICAgICBzdHJ1Y3QgbW1j
X2Nsa2NfZGF0YSAqZGF0YTsKPj4+PiArICAgICAgIHN0cnVjdCByZWdtYXAgKm1hcDsKPj4+PiAr
ICAgICAgIHN0cnVjdCBjbGtfcmVnbWFwICpjbGssICpjb3JlOwo+Pj4+ICsgICAgICAgc3RydWN0
IG1lc29uX3NjbGtfZGl2X2RhdGEgKmRpdl9kYXRhOwo+Pj4+ICsKPj4+PiArICAgICAgIC8qY2Fz
dCB0byBkcm9wIHRoZSBjb25zdCBpbiBtYXRjaC0+ZGF0YSovCj4+Pgo+Pj4gU3BhY2UgYWZ0ZXIg
KiwgYWxzbyB3aHkgZG8gd2UgbmVlZCB0byBjYXN0IGF3YXkgY29uc3Q/IFRoZSB1c2VyIG9mIHRo
aXMKPj4+IHBvaW50ZXIgcGFzc2VzIGl0IGFsbCB0aGUgd2F5IGRvd24gdG8gbW1jX2Nsa2NfcmVn
aXN0ZXJfY2xrKCkgd2hpY2gKPj4+IGNvdWxkIHRha2UgdGhlIGRhdGEgYXMgY29uc3Qgdm9pZCBw
b2ludGVyIGFuZCBkZWNpZGUgdG8gY2FzdCBhd2F5IGNvbnN0Cj4+PiB0aGVyZS4KPj4KPj4gaWYg
dXNlICdjb25zdCcgaGVyZSwgaXQgIHdpbGwgcmVwb3J0IGEgd2FybmluZzoKPj4gZHJpdmVycy9j
bGsvbWVzb24vbW1jLWNsa2MuYzoyMjQ6NzogZXJyb3I6IGFzc2lnbm1lbnQgZGlzY2FyZHMg4oCY
Y29uc3TigJkKPj4gcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZQo+PiB0IHR5cGUgWy1XZXJy
b3I9ZGlzY2FyZGVkLXF1YWxpZmllcnNdCj4+Cj4+ICAgICBkYXRhID0gKGNvbnN0IHN0cnVjdCBt
bWNfY2xrY19kYXRhICopb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7Cj4gCj4gT2YgY291
cnNlLiBUaGUgdHlwZSBkZWNsYXJhdGlvbiB1cCBhYm92ZSBuZWVkcyBjb25zdCBhZGRlZCB0byBp
dC5UaGUgcGFybSBvZiBtbWNfY2xrY19yZWdpc3Rlcl9jbGtfd2l0aF9wYXJlbnQoLi4uLiwgdm9p
ZCAqZGF0YSkgZG9lcyBub3QgCmhhdmUgJ2NvbnN0Jywgc28gbWFrZSB0aGUgdHlwZSBkZWNsYXJh
dGlvbiBjYXVzZSBhIGZ1cnRoZXIgJ2NvbnN0JyBjYXN0IAp3YXJuaW5nLiBDb3VsZCBpIGNvcHkg
dGhlc2UgaW5mb3MganVzdCBsaWtlIGJlbG93OgoKc3RydWN0IG1tY19jbGtjX2RhdGEgKmRhdGFf
Y2xrYzsKLi4uLi4uCmRhdGEgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoZGV2KTsKZGF0YV9j
bGtjID0gZGV2bV9rbWFsbG9jKGRldiwgc2l6ZW9mKCpkYXRhX2Nsa2MpLCBHRlBfS0VSTkVMKTsK
bWVtY3B5KGRhdGFfY2xrYywgZGF0YSwgc2l6ZW9mKCpkYXRhX2Nsa2MpKTsKLi4uLi4uCmNsayA9
IG1tY19jbGtjX3JlZ2lzdGVyX2Nsa193aXRoX3BhcmVudCguLi4uLCAmZGF0YV9jbGtjLT5yeCk7
Cgo+IAo+IC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK

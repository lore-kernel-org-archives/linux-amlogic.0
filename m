Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF45C433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jan 2022 02:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69+J/GHa5mXGScDSeq3tLD7D/+S2I5mJLwPBz53BJQE=; b=U18OoZ/8S1NADw
	amBLApAV63Qu519A8Kyf/xbfMLM+nWuiA4EcgGfRiTq+YPo6QwwE7s4Kqn9A6/z88Rxl8/x8YTJ1O
	log5iAj5svsRDxVijXkIknoMaiyBR4ro6iONrreHfC1vkuEOpPq1WvLRkj6SWW8dK6/vfRe5DFr/r
	R9L72ST8sZ50aOdjIsbY61kAGaTTXzXiSB1E37tpvi33HEaNUYof/z2DI5M+a7oSlOs1ZJGHncu0p
	H1+QfBpzRdeu7IcoF/KT22Ia2Gq55xo9nyGfDSb/y6zUl2shB5uJ0iF03YOHi7Mzu9d4MXWXoqcsn
	r1O79LRrMuFTuI7KaEjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA0cF-003WqT-NY; Wed, 19 Jan 2022 02:22:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA0cC-003WoT-2x; Wed, 19 Jan 2022 02:22:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8B3A4B8189A;
 Wed, 19 Jan 2022 02:22:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF83C340E0;
 Wed, 19 Jan 2022 02:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642558941;
 bh=TUaPuu1VvMddn53j9AqDwXehQaQWuB7rudQxVqafxIs=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gQBiIfrSi8SbwNyqk7TR3sDQFgUvzBwxm3ZoeDaZR5VtOKRqN8TS/8qo+1lH1yeHX
 p+orgMaJd33+92x7qXCFDIam92CgcOvBXrmCMRVVmr9E/JcIojjNXaqLbU4djY5lxP
 0Sqj6okrbhJoDOYGgqdzKltj3n+0bl6WNCHYx5liZP0qw9BZknOw15II9dwLWHkWFV
 11BsWVmQqE2jdrGu30C+fycF2JZDlowOpe2sbKT6NMBtEzHj9THC4bSHxpJuZLz+Ma
 Yo8rEzWLIism0INmF+JM4e2OQTfvIkMkwgKGvaOCV0lKw6ZbQKHKi36hzHpEbK/xFg
 Kg3oXwQZrB4EQ==
MIME-Version: 1.0
In-Reply-To: <fe77fd6b-788f-1694-f260-f95e54cf4ef3@amlogic.com>
References: <20220113115745.45826-1-liang.yang@amlogic.com>
 <20220113115745.45826-5-liang.yang@amlogic.com>
 <20220113213513.9819AC36AEA@smtp.kernel.org>
 <09ff9044-9abc-d1ad-26c1-5e6ece56d30c@amlogic.com>
 <20220114230130.35EAAC36AE7@smtp.kernel.org>
 <fe77fd6b-788f-1694-f260-f95e54cf4ef3@amlogic.com>
Subject: Re: [PATCH v9 4/4] clk: meson: add sub MMC clock controller driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jianxin Pan <jianxin.pan@amlogic.com>, Victor Wan <victor.wan@amlogic.com>,
 XianWei Zhao <xianwei.zhao@amlogic.com>,
 Kelvin Zhang <kelvin.zhang@amlogic.com>,
 BiChao Zheng <bichao.zheng@amlogic.com>, YongHui Yu <yonghui.yu@amlogic.com>,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
To: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liang Yang <liang.yang@amlogic.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org
Date: Tue, 18 Jan 2022 18:22:19 -0800
User-Agent: alot/0.10
Message-Id: <20220119022221.3AF83C340E0@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220118_182224_427545_7A332328 
X-CRM114-Status: GOOD (  17.32  )
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

UXVvdGluZyBMaWFuZyBZYW5nICgyMDIyLTAxLTE2IDIyOjI0OjI4KQo+IAo+IAo+IE9uIDIwMjIv
MS8xNSA3OjAxLCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gPiBbIEVYVEVSTkFMIEVNQUlMIF0KPiA+
IAo+ID4gUXVvdGluZyBMaWFuZyBZYW5nICgyMDIyLTAxLTEzIDIxOjE0OjQ2KQo+ID4+IE9uIDIw
MjIvMS8xNCA1OjM1LCBTdGVwaGVuIEJveWQgd3JvdGU6Cj4gPj4+IFF1b3RpbmcgTGlhbmcgWWFu
ZyAoMjAyMi0wMS0xMyAwMzo1Nzo0NSkKPiA+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9t
ZXNvbi9tbWMtY2xrYy5jIGIvZHJpdmVycy9jbGsvbWVzb24vbW1jLWNsa2MuYwo+ID4+Pj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiA+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjUzOTc3ZjYxMzkw
Cj4gPj4+PiAtLS0gL2Rldi9udWxsCj4gPj4+PiArKysgYi9kcml2ZXJzL2Nsay9tZXNvbi9tbWMt
Y2xrYy5jCj4gPj4+PiBAQCAtMCwwICsxLDMwMCBAQAo+ID4gWy4uXQo+ID4+Pj4gKwo+ID4+Pj4g
K3N0YXRpYyBpbnQgbW1jX2Nsa2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikK
PiA+Pj4+ICt7Cj4gPj4+PiArICAgICAgIHN0cnVjdCBjbGtfaHdfb25lY2VsbF9kYXRhICpvbmVj
ZWxsX2RhdGE7Cj4gPj4+PiArICAgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7
Cj4gPj4+PiArICAgICAgIHN0cnVjdCBtbWNfY2xrY19kYXRhICpkYXRhOwo+ID4+Pj4gKyAgICAg
ICBzdHJ1Y3QgcmVnbWFwICptYXA7Cj4gPj4+PiArICAgICAgIHN0cnVjdCBjbGtfcmVnbWFwICpj
bGssICpjb3JlOwo+ID4+Pj4gKyAgICAgICBzdHJ1Y3QgbWVzb25fc2Nsa19kaXZfZGF0YSAqZGl2
X2RhdGE7Cj4gPj4+PiArCj4gPj4+PiArICAgICAgIC8qY2FzdCB0byBkcm9wIHRoZSBjb25zdCBp
biBtYXRjaC0+ZGF0YSovCj4gPj4+Cj4gPj4+IFNwYWNlIGFmdGVyICosIGFsc28gd2h5IGRvIHdl
IG5lZWQgdG8gY2FzdCBhd2F5IGNvbnN0PyBUaGUgdXNlciBvZiB0aGlzCj4gPj4+IHBvaW50ZXIg
cGFzc2VzIGl0IGFsbCB0aGUgd2F5IGRvd24gdG8gbW1jX2Nsa2NfcmVnaXN0ZXJfY2xrKCkgd2hp
Y2gKPiA+Pj4gY291bGQgdGFrZSB0aGUgZGF0YSBhcyBjb25zdCB2b2lkIHBvaW50ZXIgYW5kIGRl
Y2lkZSB0byBjYXN0IGF3YXkgY29uc3QKPiA+Pj4gdGhlcmUuCj4gPj4KPiA+PiBpZiB1c2UgJ2Nv
bnN0JyBoZXJlLCBpdCAgd2lsbCByZXBvcnQgYSB3YXJuaW5nOgo+ID4+IGRyaXZlcnMvY2xrL21l
c29uL21tYy1jbGtjLmM6MjI0Ojc6IGVycm9yOiBhc3NpZ25tZW50IGRpc2NhcmRzIOKAmGNvbnN0
4oCZCj4gPj4gcXVhbGlmaWVyIGZyb20gcG9pbnRlciB0YXJnZQo+ID4+IHQgdHlwZSBbLVdlcnJv
cj1kaXNjYXJkZWQtcXVhbGlmaWVyc10KPiA+Pgo+ID4+ICAgICBkYXRhID0gKGNvbnN0IHN0cnVj
dCBtbWNfY2xrY19kYXRhICopb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRldik7Cj4gPiAKPiA+
IE9mIGNvdXJzZS4gVGhlIHR5cGUgZGVjbGFyYXRpb24gdXAgYWJvdmUgbmVlZHMgY29uc3QgYWRk
ZWQgdG8gaXQuVGhlIHBhcm0gb2YgbW1jX2Nsa2NfcmVnaXN0ZXJfY2xrX3dpdGhfcGFyZW50KC4u
Li4sIHZvaWQgKmRhdGEpIGRvZXMgbm90IAo+IGhhdmUgJ2NvbnN0Jywgc28gbWFrZSB0aGUgdHlw
ZSBkZWNsYXJhdGlvbiBjYXVzZSBhIGZ1cnRoZXIgJ2NvbnN0JyBjYXN0IAo+IHdhcm5pbmcuIENv
dWxkIGkgY29weSB0aGVzZSBpbmZvcyBqdXN0IGxpa2UgYmVsb3c6CgpXaHkgY2FuJ3QgeW91IHB1
c2ggY29uc3QgZG93biB0byB0aGUgZnVuY3Rpb24gdGhhdCByZWFsbHkgY2FyZXMgdG8KcmVtb3Zl
IGNvbnN0PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=

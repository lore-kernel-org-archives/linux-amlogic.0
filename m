Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D38C43334
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Jun 2022 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdouqkP3AYESr9/c94f1ZnnZuZPPpK5U4CcmF21Pu+Y=; b=MyVnYYPNTUEhca
	2qmh2O9/l0SfhKjVf3rqJFUnjPue9bWKC7Llcz43YXXFjR9rv9Gmv/qSJoI62zfQIX3av3Wj6HuZx
	YJUCjt6/HGsyjOZ7j/8XiwwPTx8ad0TPJRm8svtXMwn7NYP3ntPcbfhXHYCHk0vnQGF6/RtLujzSj
	VVnUlgy4yuwcvXAiKpRRb2G9sEKA2u647MNU5c2XpFiZnkNw2Y7K11tcN7JTQhcyTf3wh75zG4SLJ
	uhbpv4IvImLheMk8APJFPo2+oN70O1M7xaPffLYG2c9Dy+7UA+7xzKSQDEpSdtWq1+7fiPgLwZqCQ
	KW8qLJafVs0Nf3XlGDhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdkn-008BOG-8J; Fri, 10 Jun 2022 12:28:41 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzdkk-008BMy-Hj; Fri, 10 Jun 2022 12:28:39 +0000
Message-Id: <1654863631956.630904509.2460384861@manjaro.org>
From: Furkan Kardame <f.kardame@manjaro.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 1/1] arm64: dts: meson: add gpio-fan control to
 GS-King-X
Date: Fri, 10 Jun 2022 12:28:30 +0000
In-Reply-To: <c6a152af-dc8a-c3ec-3abb-015328554fbd@baylibre.com>
References: <c6a152af-dc8a-c3ec-3abb-015328554fbd@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_052838_781946_52AB1E79 
X-CRM114-Status: GOOD (  17.93  )
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

SGVsbG8gTmVpbCwKClRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIGl0LiAKSSBoYXZlIHNlbnQgb3V0
IHYzIHdpdGggdGhlIGZvbGxvd2luZyBjaGFuZ2VzOgoqIEZpeGVkIHNwZWVkLW1hcCBpbmRlbnRh
dGlvbiwKKiBBbGlnbmVkIGJyYWNrZXQKKiBTb3J0ZWQgY3B1X3RoZXJtYWwgbm9kZSBpbiBhbHBo
YWJldGljYWwgb3JkZXIuICAKKiBDaGFuZ2VkIGNvb2xpbmctZGV2aWNlCiogSW5jcmVhc2VkIHRl
bXBlcmF0dXJlIHRvIDcwwrBDCgpJIGhvcGUgdGhhdCBpcyBmaW5lLgoKT24gRnJpZGF5IDEwIEp1
bmUgMjAyMiAwOTo0MjowMiAoKzAzOjAwKSwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cgo+IE9uIDE2
LzA1LzIwMjIgMTQ6MjUsIEZ1cmthbiBLYXJkYW1lIHdyb3RlOgo+ID4gR1MtS2luZy1YIGhhcyBh
IHNpbmdsZSBzcGVlZCBHUElPIGZhbiB3aGljaCBpcyBhbHdheXMtb24gYnkgZGVmYXVsdC4gSWYK
PiA+IHdlIGFkZCBjb250cm9scyBmb3IgdGhlIGZhbiBhbmQgYSB0cmlwIHBvaW50LCB0aGUgZmFu
IHN0YXlzIG9mZiBtb3N0IG9mCj4gPiB0aGUgdGltZSwgcmVkdWNpbmcgYmFja2dyb3VuZCBub2lz
ZSBmcm9tIHRoZSB1bml0Lgo+ID4gU2lnbmVkLW9mZi1ieTogRnVya2FuIEthcmRhbWUgPGYua2Fy
ZGFtZUBtYW5qYXJvLm9yZz4KPiA+IC0tLQo+ID4gLi4uL2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
ZzEyYi1nc2tpbmcteC5kdHMgfCAyNiArKysrKysrKysrKysrKysrKysrCj4gPiAxIGZpbGUgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKQo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9k
dHMvYW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1nMTJiLWdza2luZy14LmR0cwo+ID4gaW5kZXggNmM3YmZhY2JhLi4yNDM0
MTA5MTMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24t
ZzEyYi1nc2tpbmcteC5kdHMKPiA+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1nMTJiLWdza2luZy14LmR0cwo+ID4gQEAgLTE5LDYgKzE5LDE1IEBAIGFsaWFzZXMgewo+
ID4gcnRjMCA9ICZydGM7Cj4gPiBydGMxID0gJnZydGM7Cj4gPiB9Owo+ID4gKwo+ID4gKyBncGlv
X2ZhbjogZ3Bpby1mYW4gewo+ID4gKyBjb21wYXRpYmxlID0gImdwaW8tZmFuIjsKPiA+ICsgZ3Bp
b3MgPSA8JmdwaW8gR1BJT0hfNSBHUElPX0FDVElWRV9ISUdIPjsKPiA+ICsgLyogVXNpbmcgRHVt
bXkgU3BlZWQgKi8KPiA+ICsgZ3Bpby1mYW4sc3BlZWQtbWFwID0gPDAgMAo+ID4gKyAxIDE+Owo+
Cj4gVGhlIHNwZWVkLW1hcCBpcyBub3QgY29ycmVjdGx5IGluZGVudGVkLCBpdCBzaG91bGQgYmU6
Cj4KPiBncGlvLWZhbixzcGVlZC1tYXAgPSA8MCAwPiwgPDEgMT47Cj4KPiA+ICsgI2Nvb2xpbmct
Y2VsbHMgPSA8Mj47Cj4gPiArIH07Cj4KPiBUaGlzIGJyYWNrZWQgaXMgbm90IGNvcnJlY3RseSBh
bGlnbmVkCj4KPiA+IGdwaW8ta2V5cy1wb2xsZWQgewo+ID4gY29tcGF0aWJsZSA9ICJncGlvLWtl
eXMtcG9sbGVkIjsKPiA+IEBAIC0xMzEsMyArMTQwLDIwIEBAICZ0ZG1vdXRfYSB7Cj4gPiAmdG9o
ZG1pdHggewo+ID4gc3RhdHVzID0gIm9rYXkiOwo+ID4gfTsKPiA+ICsKPiA+ICsmY3B1X3RoZXJt
YWwgewo+ID4gKyB0cmlwcyB7Cj4gPiArIGNwdV9hY3RpdmU6IGNwdS1hY3RpdmUKPiA+ICsgdGVt
cGVyYXR1cmUgPSA8NjAwMDA+OyAvKiBtaWxsaWNlbHNpdXMgKi8KPiA+ICsgaHlzdGVyZXNpcyA9
IDwyMDAwPjsgLyogbWlsbGljZWxzaXVzICovCj4gPiArIHR5cGUgPSAiYWN0aXZlIjsKPiA+ICsg
fTsKPiA+ICsgfTsKPiA+ICsKPiA+ICsgY29vbGluZy1tYXBzIHsKPiA+ICsgbWFwIHsKPiA+ICsg
dHJpcCA9IDwmY3B1X2FjdGl2ZT47Cj4gPiArIGNvb2xpbmctZGV2aWNlID0gPCZncGlvX2ZhbiAx
IFRIRVJNQUxfTk9fTElNSVQ+Owo+Cj4gVGhpcyBzaG91bGQgYmU6IGNvb2xpbmctZGV2aWNlID0g
PCZncGlvX2ZhbiBUSEVSTUFMX05PX0xJTUlUIFRIRVJNQUxfTk9fTElNSVQ+Owo+Cj4gPiArIH07
Cj4gPiArIH07Cj4gPiArfTsKPgo+IFRoYW5rcywKPiBOZWlsCj4KLS0gCkZ1cmthbiBLLgpNYW5q
YXJvIExpbnV4CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1h
bWxvZ2ljCg==

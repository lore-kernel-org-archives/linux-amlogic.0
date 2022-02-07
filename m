Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED82C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Feb 2022 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IGi3sIwllxuG3JXgmAttlG9tKUnIDwp52tx+iolGmI4=; b=XIzClBvz6vkYJH
	wRldHPR08HOMmu64hGMS4AhFCdFLVYuC1spUoxPuoHlBGBTvEhv2esSOsBd9bqB0RkJp8eNARi3rj
	caXTmzEGGs17a3uJWeXs2ydqK/O8jS9322t9sFveKt5Y1A5VZgUgXpqNQFZ7fvaPDMI25ZAtCwalJ
	UIqzc2NRPvERjZVPDOrU7Dzb8kvlb+BNF3AIDfpQhLrKBqOFugeDs0XZ/j2inr4zIAFvdY/JOQFK4
	oTMsexIFYdgxQxT8ll+lj6F7pNnPggjyGGVGpeerjx3G91iDPEBaBxSZnY32A/e1rT9cqgUMl9vzk
	xOFkKsRCPYxA19kSwiYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nH4Mo-00AKye-AG; Mon, 07 Feb 2022 13:47:42 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nH4Ml-00AKxn-Px; Mon, 07 Feb 2022 13:47:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1ED8211D4;
 Mon,  7 Feb 2022 05:47:36 -0800 (PST)
Received: from [10.57.70.156] (unknown [10.57.70.156])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 88E7F3F718;
 Mon,  7 Feb 2022 05:47:34 -0800 (PST)
Message-ID: <a7adf12d-f949-9a95-9c6a-b73017107dc7@arm.com>
Date: Mon, 7 Feb 2022 13:47:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] add pmu to amlogic meson sm1
Content-Language: en-GB
To: Benjamin Mordaunt <crawford.benjamin15@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220205234554.4403-1-crawford.benjamin15@gmail.com>
 <20220206144343.2194-1-crawford.benjamin15@gmail.com>
 <42c51f9d-d122-2d09-cdcd-f733cbc60d5b@baylibre.com>
 <65cde84a-8f8b-ac57-9b66-2b8d6378dbfa@arm.com>
 <CANtEDzSVxnUsC05Vhr5gG3KRBAX_X564ZiY2nBSoBFoy54RQ5w@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CANtEDzSVxnUsC05Vhr5gG3KRBAX_X564ZiY2nBSoBFoy54RQ5w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_054739_955405_8FDDE0EC 
X-CRM114-Status: GOOD (  15.64  )
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

T24gMjAyMi0wMi0wNyAxMzozMywgQmVuamFtaW4gTW9yZGF1bnQgd3JvdGU6Cj4gVGhlIFM5MDVY
M+KAmXMgKE9kcm9pZCBDNCkgZGF0YXNoZWV0IGFwcGVhcnMgdG8gcmVwb3J0IDQgaW5kaXZpZHVh
bCBQTVVJUlFzLAo+IG11Y2ggaW4gdGhlIHNhbWUgd2F5IGFzIEdYLiBJZiB0aGF0IGlzIGluZGVl
ZCB0aGUgY2FzZSwgSSB0aGluayB0aGlzIHBhdGNoCj4gYXBwbGllcy4gT3RoZXJ3aXNlLCBpcyB0
aGUgZGF0YXNoZWV0IHdyb25nIGlmIE1hcmPigJlzIGNvbW1lbnRzIGFwcGx5PwoKQSBmYWlybHkg
c29saWQgdGVzdCB3b3VsZCBiZSB0byBydW4gYSBzYW1wbGluZyBldmVudCAoZS5nLiBgcGVyZiBz
dGF0YCkgCnRhc2tzZXQgdG8gYSBzaW5nbGUgQ1BVIGFuZCBvYnNlcnZlIHRoZSBjb3JyZXNwb25k
aW5nIElSUSBjb3VudCBpbmNyZWFzZSAKaW4gL3Byb2MvaW50ZXJydXB0cywgZm9yIGVhY2ggY29y
ZSBpbiB0dXJuLiBJZiB0aGF0IGJlaGF2ZXMgYXMgZXhwZWN0ZWQgCnRoZW4gY2hhbmNlcyBhcmUg
ZXZlcnl0aGluZyBpcyBpbmRlZWQgc2FuZS4KCkNvdXBsZSBvZiBuaXRwaWNrcyBmb3IgdGhlIHBh
dGNoIGl0c2VsZiAtIHlvdSdyZSBhbG1vc3QgdGhlcmUsIGJ1dCAKeW91J3ZlIGdvdCBzcHVyaW91
cyB0YWJzIG9uIHRoZSBibGFuayBsaW5lcywgcGx1cyB5b3UgbmVlZCBhIHByb3BlciAKY29tbWl0
IG1lc3NhZ2UgYW5kIHlvdXIgc2lnbi1vZmYgYWJvdmUgdGhlICItLS0iIGxpbmUgLSBhbnl0aGlu
ZyB5b3UgYWRkIApiZWxvdyB0aGVyZSBpcyB0cmVhdGVkIGFzIGFkZGl0aW9uYWwgY29tbWVudGFy
eSBmb3IgcmV2aWV3ZXJzJyBiZW5lZml0IAphbmQgd2lsbCBiZSBkaXNjYXJkZWQgYnkgYGdpdCBh
bWAuCgpDaGVlcnMsClJvYmluLgoKPiAKPiAvIEJlbgo+IAo+IE9uIE1vbiwgNyBGZWIgMjAyMiBh
dCAxMzoyMCwgUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4gd3JvdGU6Cj4gCj4+
IE9uIDIwMjItMDItMDcgMDg6MTQsIE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+Pj4gSGksCj4+Pgo+
Pj4gT24gMDYvMDIvMjAyMiAxNTo0MywgQmVuamFtaW4gTW9yZGF1bnQgd3JvdGU6Cj4+Pj4gLS0t
Cj4+Pj4gVGhlIGR0cyBmb3IgbWVzb24gc20xIGFwcGVhcnMgdG8gb21pdCB0aGUgU29DJ3MgUE1V
LAo+Pj4+IHdoaWNoIGlzIGVzc2VudGlhbCBmb3IgYWNjZXNzaW5nIHBlcmYgZXZlbnRzIHJlZ2Fy
ZGluZwo+Pj4+IGUuZy4gY2FjaGUgb24gZS5nLiB0aGUgT2Ryb2lkIEM0IHBsYXRmb3JtLiBBZGQg
aXQuCj4+Pj4KPj4+PiAgICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tc20xLmR0
c2kgfCAxMyArKysrKysrKysrKystCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L2Jv
b3QvZHRzL2FtbG9naWMvbWVzb24tc20xLmR0c2kKPj4+PiBiL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1zbTEuZHRzaQo+Pj4+IGluZGV4IDNkOGIxZjRmMi4uNDE0N2VlY2QyIDEw
MDY0NAo+Pj4+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRz
aQo+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9tZXNvbi1zbTEuZHRzaQo+
Pj4+IEBAIC02LDYgKzYsOCBAQAo+Pj4+ICAgICNpbmNsdWRlICJtZXNvbi1nMTItY29tbW9uLmR0
c2kiCj4+Pj4gICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2F4Zy1hdWRpby1jbGtjLmg+
Cj4+Pj4gKyNpbmNsdWRlIDxkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4K
Pj4+PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL2FybS1naWMu
aD4KPj4+PiAgICAjaW5jbHVkZSA8ZHQtYmluZGluZ3MvcG93ZXIvbWVzb24tc20xLXBvd2VyLmg+
Cj4+Pj4gICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3Jlc2V0L2FtbG9naWMsbWVzb24tYXhnLWF1
ZGlvLWFyYi5oPgo+Pj4+ICAgICNpbmNsdWRlIDxkdC1iaW5kaW5ncy9yZXNldC9hbWxvZ2ljLG1l
c29uLWcxMmEtYXVkaW8tcmVzZXQuaD4KPj4+PiBAQCAtOTAsNyArOTIsMTYgQEAgbDI6IGwyLWNh
Y2hlMCB7Cj4+Pj4gICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJjYWNoZSI7Cj4+Pj4gICAg
ICAgICAgICB9Owo+Pj4+ICAgICAgICB9Owo+Pj4+IC0KPj4+PiArCj4+Pj4gKyAgICBhcm0tcG11
IHsKPj4+PiArICAgICAgICBjb21wYXRpYmxlID0gImFybSxjb3J0ZXgtYTU1LXBtdSI7Cj4+Pj4g
KyAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDEzNyBJUlFfVFlQRV9MRVZFTF9ISUdIPiwK
Pj4+PiArICAgICAgICAgICAgICAgICA8R0lDX1NQSSAxMzggSVJRX1RZUEVfTEVWRUxfSElHSD4s
Cj4+Pj4gKyAgICAgICAgICAgICAgICAgPEdJQ19TUEkgMTUzIElSUV9UWVBFX0xFVkVMX0hJR0g+
LAo+Pj4+ICsgICAgICAgICAgICAgICAgIDxHSUNfU1BJIDE1NCBJUlFfVFlQRV9MRVZFTF9ISUdI
PjsKPj4+PiArICAgICAgICBpbnRlcnJ1cHQtYWZmaW5pdHkgPSA8JmNwdTA+LCA8JmNwdTE+LCA8
JmNwdTI+LCA8JmNwdTM+Owo+Pj4+ICsgICAgfTsKPj4+PiArCj4+Pj4gICAgICAgIGNwdV9vcHBf
dGFibGU6IG9wcC10YWJsZSB7Cj4+Pj4gICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZXJhdGlu
Zy1wb2ludHMtdjIiOwo+Pj4+ICAgICAgICAgICAgb3BwLXNoYXJlZDsKPj4+Cj4+PiBQbGVhc2Ug
c2VlIE1hcmMncyBjb21tZW50cyBhYm91dCBQTVUgc3VwcG9ydDoKPj4+IGh0dHA6Ly9sb3JlLmtl
cm5lbC5vcmcvci84NzM1cGNxNjNvLndsLW1hekBrZXJuZWwub3JnCj4+Cj4+IElmIFNNMSBhY3R1
YWxseSBoYXMgZGlzdGluY3QgcGVyLWNvcmUgaW50ZXJydXB0cyBhcyB0aGUgcGF0Y2ggaW1wbGll
cwo+PiB0aGVuIGl0J3MgZmluZSAtIGl0J3Mgb25seSBHMTJCIGFuZCBhbnl0aGluZyBlbHNlIHRo
YXQgY29tYmluZXMgbXVsdGlwbGUKPj4gUE1VIElSUXMgaW50byBhIHNpbmdsZSBTUEkgd2hpY2gg
YXJlIHVuc3VwcG9ydGFibGUuCj4+Cj4+IFJvYmluLgo+Pgo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

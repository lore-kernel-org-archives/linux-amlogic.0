Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE3CC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 27 Dec 2021 05:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:CC:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uk0lvmoCA6IUyBaNTXIDuHxvTmu+WvgWkS0j41+Mt7M=; b=o3MsP8d/ybBSKybD22DIMOOZeI
	ym4Bhpi257yzjyYbRX9q7faEScbNvV/wm+vuKBj0ypP81KVwiO8a/np5khNacd5wun71SN+qdcZkr
	zILSnFfZlLPatFaLG6k1MNh2KMlgMJLyAWNcQDICagn8P9bJmok+B5OZkBsyAwa6B3a7eTUCuSjd2
	I8Tpr1cizoluXZCe6znwo3mY5p/ZuhOhRYMcQgkZfTvfK7uQiEeoOsR975H0Vw97x5estdxXbs7vZ
	DtT0meBA3dVHdjm9WHR1gkaJUZm0xPlz16mOXLu+3cy1e7+M+YuoDioN804i2FMyuBfkFtj19x/Vv
	1FbTvtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1imD-00GCxJ-Vz; Mon, 27 Dec 2021 05:42:30 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1imB-00GCwT-1A; Mon, 27 Dec 2021 05:42:28 +0000
Received: from [10.98.21.175] (10.98.21.175) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 27 Dec
 2021 13:42:14 +0800
Subject: Re: patch "dt-bindings: serial: amlogic, meson-uart: support S4"
 added to tty-testing
To: <linux-serial@vger.kernel.org>, <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <164007477584155@kroah.com>
CC: Rob Herring <robh+dt@kernel.org>, Neil Armstrong
 <narmstrong@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
From: xianwei.zhao <xianwei.zhao@amlogic.com>
Message-ID: <31645f87-fa44-dd54-48b9-8e18b82ae41d@amlogic.com>
Date: Mon, 27 Dec 2021 13:42:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <164007477584155@kroah.com>
Content-Language: en-US
X-Originating-IP: [10.98.21.175]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_214227_119681_DDFDA8BC 
X-CRM114-Status: GOOD (  22.93  )
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

SGkgR3JlZywKCk9uIDIwMjEvMTIvMjEg5LiL5Y2INDoxOSwgZ3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmcgd3JvdGU6Cj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gCj4gCj4gVGhpcyBpcyBhIG5vdGUg
dG8gbGV0IHlvdSBrbm93IHRoYXQgSSd2ZSBqdXN0IGFkZGVkIHRoZSBwYXRjaCB0aXRsZWQKPiAK
PiAgICAgIGR0LWJpbmRpbmdzOiBzZXJpYWw6IGFtbG9naWMsIG1lc29uLXVhcnQ6IHN1cHBvcnQg
UzQKPiAKPiB0byBteSB0dHkgZ2l0IHRyZWUgd2hpY2ggY2FuIGJlIGZvdW5kIGF0Cj4gICAgICBn
aXQ6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvZ3JlZ2toL3R0eS5n
aXQKPiBpbiB0aGUgdHR5LXRlc3RpbmcgYnJhbmNoLgo+IAo+IFRoZSBwYXRjaCB3aWxsIHNob3cg
dXAgaW4gdGhlIG5leHQgcmVsZWFzZSBvZiB0aGUgbGludXgtbmV4dCB0cmVlCj4gKHVzdWFsbHkg
c29tZXRpbWUgd2l0aGluIHRoZSBuZXh0IDI0IGhvdXJzIGR1cmluZyB0aGUgd2Vlay4pCj4gCj4g
VGhlIHBhdGNoIHdpbGwgYmUgbWVyZ2VkIHRvIHRoZSB0dHktbmV4dCBicmFuY2ggc29tZXRpbWUg
c29vbiwKPiBhZnRlciBpdCBwYXNzZXMgdGVzdGluZywgYW5kIHRoZSBtZXJnZSB3aW5kb3cgaXMg
b3Blbi4KPiAKPiBJZiB5b3UgaGF2ZSBhbnkgcXVlc3Rpb25zIGFib3V0IHRoaXMgcHJvY2Vzcywg
cGxlYXNlIGxldCBtZSBrbm93Lgo+IAo+IAo+PkZyb20gMzRkZTY2NjY4NDNkNDdhNDU2NGY1NDA1
NzQ0MDJmNjIxYzY4OWVhMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBYaWFud2Vp
IFpoYW8gPHhpYW53ZWkuemhhb0BhbWxvZ2ljLmNvbT4KPiBEYXRlOiBUdWUsIDIxIERlYyAyMDIx
IDExOjAxOjQ1ICswODAwCj4gU3ViamVjdDogZHQtYmluZGluZ3M6IHNlcmlhbDogYW1sb2dpYywg
bWVzb24tdWFydDogc3VwcG9ydCBTNAo+IAo+IEFkZCBzZXJpYWwgYmluZGluZ3Mgc3VwcG9ydCBt
ZW5zb24gUzQgU29DIGZhbWlseS4KCkkgd2lsbCBmaXggdGhlIHR5cGUgbGF0dGVyOiBtZW5zb24g
LT4gbWVzb24KCj4gCj4gU2lnbmVkLW9mZi1ieTogWGlhbndlaSBaaGFvIDx4aWFud2VpLnpoYW9A
YW1sb2dpYy5jb20+Cj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIxMTIyMTAz
MDE0Ni41MjItMS14aWFud2VpLnpoYW9AYW1sb2dpYy5jb20KPiBTaWduZWQtb2ZmLWJ5OiBHcmVn
IEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IC0tLQo+ICAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sICAgICAg
ICAgIHwgMiArKwo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYg
LS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMs
bWVzb24tdWFydC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Nlcmlh
bC9hbWxvZ2ljLG1lc29uLXVhcnQueWFtbAo+IGluZGV4IDc0ODdhYTZlZjg0OS4uNzJlODg2OGRi
M2UwIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zZXJp
YWwvYW1sb2dpYyxtZXNvbi11YXJ0LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3Mvc2VyaWFsL2FtbG9naWMsbWVzb24tdWFydC55YW1sCj4gQEAgLTI5LDYgKzI5
LDcgQEAgcHJvcGVydGllczoKPiAgICAgICAgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uOC11YXJ0
Cj4gICAgICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjhiLXVhcnQKPiAgICAgICAgICAgICAg
ICAgLSBhbWxvZ2ljLG1lc29uLWd4LXVhcnQKPiArICAgICAgICAgICAgICAtIGFtbG9naWMsbWVz
b24tczQtdWFydAo+ICAgICAgICAgICAgIC0gY29uc3Q6IGFtbG9naWMsbWVzb24tYW8tdWFydAo+
ICAgICAgICAgLSBkZXNjcmlwdGlvbjogRXZlcnl0aGluZy1FbHNlIHBvd2VyIGRvbWFpbiBVQVJU
IGNvbnRyb2xsZXIKPiAgICAgICAgICAgZW51bToKPiBAQCAtMzYsNiArMzcsNyBAQCBwcm9wZXJ0
aWVzOgo+ICAgICAgICAgICAgIC0gYW1sb2dpYyxtZXNvbjgtdWFydAo+ICAgICAgICAgICAgIC0g
YW1sb2dpYyxtZXNvbjhiLXVhcnQKPiAgICAgICAgICAgICAtIGFtbG9naWMsbWVzb24tZ3gtdWFy
dAo+ICsgICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLXM0LXVhcnQKPiAgIAo+ICAgICByZWc6Cj4g
ICAgICAgbWF4SXRlbXM6IDEKPiAKClRoYW5rcyEKCgoKCkJlc3QgcmVnYXJkcywKCgoKClhpYW53
ZWkgWmhhbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1s
b2dpYwo=

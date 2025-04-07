Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0DEC36010
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Apr 2025 23:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOVnn/QrkAqe+lJ5HaAEc3Nna3v8wu+N8UpKx2rQ3Ec=; b=kFo7IqHJPSbfdK
	6GfqYMLGSK3QR9CXbxu9iSTr5O+qiMDN/BgexIJmlVSzWaTMMhFO1kdSFPezZIgs78WxCVE0upxfV
	oIo5sQInej3E7uWbvEaY74Pgfnb+aiODuTW2juNztlF6C+FCDPhuOsxbGgIDZbJ/SxDUPzImI5u1y
	Hi4NgoyoyHuHlumxZ612o+r7B4WawkXrFOZlZKC2TNT5O7iziLm2hxLaqmzDRXmP6QEtF990buhwZ
	UiBFMRF6/xwEQNB7Q15/eFa41f0uKxa5Cn0UV3UEqWAdp21TeVc9ldJJqzahy3xI2RRzZ2MQnde+F
	KBemC8u6dIpuQQ6BZQ5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vb6-00000002GHf-29TQ;
	Mon, 07 Apr 2025 23:09:44 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1vb3-00000002GGd-2odO
	for linux-amlogic@lists.infradead.org;
	Mon, 07 Apr 2025 23:09:43 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 02597240029
	for <linux-amlogic@lists.infradead.org>; Tue,  8 Apr 2025 01:09:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1744067378; bh=O74ZcjE1OQcfzpO0kSxXYabLxllHbRodD/griblwqRc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=evTTQNeq+5tyiYgfXbWGpw+B8C3f+zTyO5vx+qOOZr1x1dG7dxECxAEVlb8uclcyk
	 6QpEDOo97vPxiQeV+D+BCW4oiEnegLZWsrQLnTaDyv1TlK+noe/0Whk8UIRyjsWraU
	 exRyemlkFtaslIugBnayZvi8eeHboilpeMX+ONpVMswzKhh2soS30CelHhiXoU/u9Y
	 8HP/ytUmgHZcnaag3AkimbcA3qlcyvoPmHppI9uJUt9UsQFNjBjPJwq4aMW1psB0xn
	 UpmoeOwLo7fqJRbr9fo0nT8sHVkLpiB97r+axxO0ln4017eZR/5d828ofPhoIfqef7
	 vkQT9GsHp6yOw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ZWlKD3rbZz6v0r;
	Tue,  8 Apr 2025 01:09:36 +0200 (CEST)
Date: Mon,  7 Apr 2025 23:09:36 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
Message-ID: <Z_RbMLu27AKHaCIO@probook>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
 <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
 <CAFBinCD13CNuxRkrSoPXUMNQ9AJH7UV0gsOfdgeRKhkXsANgnw@mail.gmail.com>
 <Z-vjWFFWvo1gesCe@probook>
 <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDgn30H13hfkEsfyzSjO-HJ-XpAUwSwimBk7VPpKyNKMw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_160941_995408_E1FB9999 
X-CRM114-Status: GOOD (  28.43  )
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

T24gU3VuLCBBcHIgMDYsIDIwMjUgYXQgMTA6MzY6MThQTSArMDIwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBUdWUsIEFwciAxLCAyMDI1IGF0IDM6MDDigK9QTSBKLiBOZXVzY2jD
pGZlciA8ai5uZUBwb3N0ZW8ubmV0PiB3cm90ZToKPiA+Cj4gPiBPbiBTdW4sIE1hciAzMCwgMjAy
NSBhdCAxMToxMDoyOFBNICswMjAwLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+ID4gPiBU
aGFua3MgZm9yIHlvdXIgcGF0Y2ghCj4gPiA+Cj4gPiA+IE9uIFN1biwgTWFyIDIzLCAyMDI1IGF0
IDE6MzjigK9QTSBKLiBOZXVzY2jDpGZlciB2aWEgQjQgUmVsYXkKPiA+ID4gPGRldm51bGwrai5u
ZS5wb3N0ZW8ubmV0QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiBbLi4uXQo+ID4gPiA+ICsgICAg
ICAgICAgICAgICBldGhfcGh5MDogZXRoZXJuZXQtcGh5QDAgewo+ID4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgIC8qIElDIFBsdXMgSVAxMDFBICgweDAyNDMwYzU0KSAqLwo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwwPjsKPiA+ID4gRG9lcyByZWcgPSA8MT4gYWxz
byB3b3JrIG9uIHlvdXIgYm9hcmQ/Cj4gPiA+IDAgaXMgdGhlIGJyb2FkY2FzdCBhZGRyZXNzLiBJ
dCdzIHVuZm9ydHVuYXRlbHkgc29tZXRoaW5nIHRoYXQgd2Ugc3RpbGwKPiA+ID4gaGF2ZSBpbmNv
cnJlY3QgaW4gYSBsb3Qgb2YgLmR0cyBmaWxlcy4KPiA+Cj4gPiBVbmZvcnR1bmF0ZWx5IG5vdC4g
SSB0cmllZCBhZGRyZXNzZXMgMSB0byAzMSB3aXRob3V0IHN1Y2Nlc3MsIHdoaWNoCj4gPiBzZWVt
cyBzdHJhbmdlOyBteSBndWVzcyB3YXMgdGhhdCB0aGUgUEhZIHNob3VsZCByZXNwb25kIHRvIG9u
ZSBvZiB0aGVtLgo+ID4gSSBnZXQgdGhpcyBlcnJvcjoKPiA+Cj4gPiAjIGlwIGwgc2V0IGV0aDAg
dXAKPiA+IFsgICAgNi44MDY4NDddIG1lc29uNi1kd21hYyBjOTQxMDAwMC5ldGhlcm5ldCBldGgw
OiBSZWdpc3RlciBNRU1fVFlQRV9QQUdFX1BPT0wgUnhRLTAKPiA+IFsgICAgNi44MTA2MDldIG1l
c29uNi1kd21hYyBjOTQxMDAwMC5ldGhlcm5ldCBldGgwOiBfX3N0bW1hY19vcGVuOiBDYW5ub3Qg
YXR0YWNoIHRvIFBIWSAoZXJyb3I6IC0xOSkKPiBUaGFua3MgZm9yIHRlc3RpbmcuIExldCdzIGtl
ZXAgaXQgYXQgemVybyB0aGVuLgo+IAo+ID4gPgo+ID4gPiBbLi4uXQo+ID4gPiA+ICsmaTJjX0FP
IHsKPiA+ID4gPiArICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ID4gPiArICAgICAgIHBpbmN0
cmwtMCA9IDwmaTJjX2FvX3BpbnM+Owo+ID4gPiA+ICsgICAgICAgcGluY3RybC1uYW1lcyA9ICJk
ZWZhdWx0IjsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICBwbWljQDMyIHsKPiA+ID4gPiArICAg
ICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJyaWNvaCxybjV0NjE4IjsKPiA+ID4gPiArICAgICAg
ICAgICAgICAgcmVnID0gPDB4MzI+Owo+ID4gPiA+ICsgICAgICAgICAgICAgICBzeXN0ZW0tcG93
ZXItY29udHJvbGxlcjsKPiA+ID4gSGVyZSBJJ20gYSBiaXQgc3VycHJpc2VkOgo+ID4gPiBBcmVu
J3Qgc29tZSBvZiB0aGUgb3V0cHV0cyB1c2VkIHRvIGRyaXZlIFZDQ0sgKENQVSBwb3dlciByYWls
KSBhbmQKPiA+ID4gVkRERUUgKGV2ZXJ5dGhpbmcgZWxzZSBwb3dlciByYWlsLCB3aGljaCBhbHNv
IHBvd2VycyB0aGUgR1BVKT8KPiA+Cj4gPiBVbmZvcnR1bmF0ZWx5IEkgZG9uJ3QgaGF2ZSBzY2hl
bWF0aWNzIGFuZCBJIHdhc24ndCBhYmxlIHRvIHRyYWNlIHRoZQo+ID4gY29ubmVjdGlvbnMgb24g
dGhlIGJvYXJkIGJlY2F1c2UgdGhleSdyZSBzbyB0aW55LiBTbyBpdCdzIHF1aXRlIHBvc3NpYmxl
IHRoYXQKPiA+IHlvdSdyZSByaWdodCwgYnV0IEkgY2FuJ3QgYmUgc3VyZS4KPiA+Cj4gPiBBcmUg
dGhlcmUgdm9sdGFnZSBzZW5zb3JzIGluIHRoZSBNZXNvbjggU29DIHRoYXQgSSBjb3VsZCB1c2Ug
dG8gZXN0YWJsaXNocyB0aGUKPiA+IHJlbGF0aW9uIGJldHdlZW4gUE1JQyBvdXRwdXRzIGFuZCBT
b0Mgc3VwcGxpZXM/Cj4KPiBUaGVyZSBhcmVuJ3QgYW55IHNlbnNvcnMgKHRoYXQgSSdtIGF3YXJl
IG9mKS4gQnV0IHlvdSBjYW4gY2hlY2sKPiAvc3lzL2tlcm5lbC9kZWJ1Zy9yZWd1bGF0b3IvcmVn
dWxhdG9yX3N1bW1hcnkgYW5kIGNvbXBhcmUgdGhlIHZhbHVlcwo+IHdpdGggdGhlIG9uZXMgZnJv
bSBhcmNoL2FybS9ib290L2R0cy9hbWxvZ2ljL21lc29uOG0yLW14aWlpLXBsdXMuZHRzCj4gQWxz
byB0aGUgdmVuZG9yIHUtYm9vdCBhbmQga2VybmVsIGxvZ3MgbWF5IHByb3ZpZGUgc29tZSBpbmZv
cm1hdGlvbi4KClRoZSB2YWx1ZXMgaW4gL3N5cy9rZXJuZWwvZGVidWcvcmVndWxhdG9yL3JlZ3Vs
YXRvcl9zdW1tYXJ5IGRvIGluZGVlZAptYXRjaCB0aGUgdmFsdWVzIGluIG1lc29uOG0yLW14aWlp
LXBsdXMuZHRzOgoKIERDREMxICAgICAgICAgICAgICAgICAgICAgICAgICAgIDAgICAgMCAgICAg
IDAgdW5rbm93biAgMTEwMG1WICAgICAwbUEgICAgIDBtViAgICAgMG1WCiBEQ0RDMiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAwICAgIDAgICAgICAwIHVua25vd24gIDExNTBtViAgICAgMG1B
ICAgICAwbVYgICAgIDBtVgogRENEQzMgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCAgICAw
ICAgICAgMCB1bmtub3duICAxNTAwbVYgICAgIDBtQSAgICAgMG1WICAgICAwbVYKIExETzEgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDAgICAgMCAgICAgIDAgdW5rbm93biAgMjkwMG1WICAg
ICAwbUEgICAgIDBtViAgICAgMG1WCiBMRE8yICAgICAgICAgICAgICAgICAgICAgICAgICAgICAw
ICAgIDAgICAgICAwIHVua25vd24gIDE4MDBtViAgICAgMG1BICAgICAwbVYgICAgIDBtVgogTERP
MyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMCAgICAwICAgICAgMCB1bmtub3duICAxODAw
bVYgICAgIDBtQSAgICAgMG1WICAgICAwbVYKIExETzQgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIDAgICAgMCAgICAgIDAgdW5rbm93biAgMjg1MG1WICAgICAwbUEgICAgIDBtViAgICAgMG1W
CiBMRE81ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAwICAgIDAgICAgICAwIHVua25vd24g
IDE4MDBtViAgICAgMG1BICAgICAwbVYgICAgIDBtVgogTERPUlRDMSAgICAgICAgICAgICAgICAg
ICAgICAgICAgMCAgICAwICAgICAgMCB1bmtub3duICAyNzAwbVYgICAgIDBtQSAgICAgMG1WICAg
ICAwbVYKIExET1JUQzIgICAgICAgICAgICAgICAgICAgICAgICAgIDAgICAgMCAgICAgIDAgdW5r
bm93biAgIDkwMG1WICAgICAwbUEgICAgIDBtViAgICAgMG1WCgpBZnRlciBJIGNvcHkgdGhlIHJl
Z3VsYXRvciB0YWJsZSBmcm9tIG1lc29uOG0yLW14aWlpLXBsdXMuZHRzLCBJIGNhbiBpbmRlZWQK
b2JzZXJ2ZSB0aGUgZWZmZWN0IG9mIHJlZ3VsYXRvcnMgYmVpbmcgb24vb2ZmLiBJIHdpbGwgdXNl
IHRoYXQgdG8gZnVydGhlcgppbnZlc3RpZ2F0ZSBob3cgdGhlIHJlZ3VsYXRvcnMgYXJlIHVzZWQu
CgpUaGUgdmVuZG9yIHUtYm9vdC9rZXJuZWwgYXJlbid0IHZlcnkgdXNlZnVsLCB1bmZvcnR1bmF0
ZWx5LgpUaGUgZG93bnN0cmVhbSBkZXZpY2V0cmVlIGluY2x1ZGVzIHRoZXNlIHNldHRpbmdzOgoK
CXJuNXQ2MTggewoJCXN0YXR1cyA9ICJva2F5IjsKCQlkZHJfdm9sdGFnZSAgID0gPDE1MDAwMDA+
OyAvLyAxLjVWCgkJdmRkYW9fdm9sdGFnZSA9IDwxMjAwMDAwPjsgLy8gMS4yVgoJCVsuLi5dCgl9
OwoKVGhlIGNvcnJlc3BvbmRpbmcgZHJpdmVyIHNlZW1zIHRvIGFzc29jaWF0ZSBkZHJfdm9sdGFn
ZSB3aXRoIERDREMyIGFuZAp2ZGRpb192b2x0YWdlIHdpdGggRENEQzMsIGFsdGhvdWdoIHRoaXMg
cGFydCBvZiB0aGUgY29kZVsxXSBpcyAiI2lmIDAiJ2QuCgpbMV0gaHR0cHM6Ly9naXRodWIuY29t
L2VuZGxlc3NtL2xpbnV4LW1lc29uL2Jsb2IvbWFzdGVyL2RyaXZlcnMvYW1sb2dpYy9wb3dlci9y
aWNvaC9yaWNvaF9wbXUuYyNMMTI3CgoKQmVzdCByZWdhcmRzLApKLiBOZXVzY2jDpGZlcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dp
YyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

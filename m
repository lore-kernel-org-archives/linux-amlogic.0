Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A55C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat,  1 Jan 2022 13:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bs4i0DNdTtXugYSRWOyzpmb9iz0BYQOVGKIQtVltew4=; b=HQWAl/IuFqYmpe
	OMIIvlNm3RU9/Ag67rqMhMI+7pkWvs+/DQR21PinKra+8JlK4roEmTBBq/ip6N+pjuqvqWGnNHb4w
	0IkQpE3eA71WVdjLbqWmsactF7HpoeL52dVlsn+IEuDukC3dX6TC0gGSugKePQyrV2EA6SQArSu7k
	SOOS2xc/kmlJRNrkF+Xz0dQ1mCGwF7KTwYm034cuxgDXkAxY+Fq7vytcm13EnlqYIYgj4sLMTktC2
	7OvLgmFryF9fHgSq/X3gldxwefKQIKah7Rym7rff6UpF6ZjS6S33MMApuetL6Np3YJsciwv0x1CQ2
	HtNbUwWZKweZbyRcdRow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n3eT2-0075Ba-Vy; Sat, 01 Jan 2022 13:30:40 +0000
Received: from mail-sh.amlogic.com ([58.32.228.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n3eSr-00759V-4u; Sat, 01 Jan 2022 13:30:30 +0000
Received: from [10.18.89.180] (10.18.89.180) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Sat, 1 Jan
 2022 21:30:13 +0800
Message-ID: <7278bace-a2b9-0cfc-55b3-c19311e3352e@amlogic.com>
Date: Sat, 1 Jan 2022 21:30:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH V3 4/6] tty: serial: meson: The UART baud rate calculation
 is described using the common clock code. Also added S4 chip uart
 Compatible.
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
CC: <linux-serial@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>, Vyacheslav
 <adeep@lexina.in>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>
References: <20211230102110.3861-1-yu.tu@amlogic.com>
 <20211230102110.3861-5-yu.tu@amlogic.com>
 <CAFBinCCL-QaeSRCLzfyNXcRQZ7YC1D85rP2y4OGkAjCmQEqGgQ@mail.gmail.com>
 <3e1e40aa-7865-0f7a-5772-e2ad96c8141d@amlogic.com>
 <CAFBinCB2nF0TwRE1uJ4UTB_avcqRBfOHR1CDSe29dB1o-YjEHQ@mail.gmail.com>
From: Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <CAFBinCB2nF0TwRE1uJ4UTB_avcqRBfOHR1CDSe29dB1o-YjEHQ@mail.gmail.com>
X-Originating-IP: [10.18.89.180]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220101_053029_222270_BC4410A6 
X-CRM114-Status: GOOD (  28.29  )
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

SGkgTWFydGluLAogICAgIFRoYW5rIHlvdSB2ZXJ5IG11Y2ggZm9yIHlvdXIgcmVwbHkuCgpPbiAy
MDIxLzEyLzMxIDIzOjMyLCBNYXJ0aW4gQmx1bWVuc3RpbmdsIHdyb3RlOgo+IFsgRVhURVJOQUwg
RU1BSUwgXQo+IAo+IE9uIEZyaSwgRGVjIDMxLCAyMDIxIGF0IDEyOjI0IFBNIFl1IFR1IDx5dS50
dUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4gWy4uLl0KPj4+PiAgICBzdGF0aWMgaW50IG1lc29uX3Vh
cnRfcmVxdWVzdF9wb3J0KHN0cnVjdCB1YXJ0X3BvcnQgKnBvcnQpCj4+Pj4gICAgewo+Pj4+ICsg
ICAgICAgc3RydWN0IG1lc29uX3VhcnRfZGF0YSAqcHJpdmF0ZV9kYXRhID0gcG9ydC0+cHJpdmF0
ZV9kYXRhOwo+Pj4+ICsgICAgICAgaW50IHJldDsKPj4+PiArCj4+Pj4gKyAgICAgICByZXQgPSBj
bGtfcHJlcGFyZV9lbmFibGUocHJpdmF0ZV9kYXRhLT5wY2xrKTsKPj4+PiArICAgICAgIGlmIChy
ZXQpCj4+Pj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4+Pj4gKwo+Pj4+ICsgICAgICAg
cmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxlKHByaXZhdGVfZGF0YS0+YmF1ZF9jbGspOwo+Pj4+ICsg
ICAgICAgaWYgKHJldCkgewo+Pj4+ICsgICAgICAgICAgICAgICBjbGtfZGlzYWJsZV91bnByZXBh
cmUocHJpdmF0ZV9kYXRhLT5wY2xrKTsKPj4+PiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsK
Pj4+PiArICAgICAgIH0KPj4+IFRoaXMgY29kZSBpcyBmcm9tIG15IG9yaWdpbmFsIHN1Z2dlc3Rp
b24gLSBhbmQgSSBoYWQgYSBkb3VidCB0aGVyZQo+Pj4gd2hpY2ggSSBmb3Jnb3QgdG8gYWRkIGFz
IGEgY29tbWVudCBvcmlnaW5hbGx5Ogo+Pj4gQ2FuIHlvdSBjb25maXJtIHRoYXQgYWNjZXNzaW5n
IHRoZSBVQVJUIGNvbnRyb2xsZXIgcmVnaXN0ZXJzIHdvcmtzCj4+PiBldmVuIHdoZW4gInBjbGsi
IGlzIHR1cm5lZCBvZmY/Cj4+PiBJIGFtIGFza2luZyB0aGlzIGJlY2F1c2UgdGhlIGNvbW1vbiBj
bG9jayBmcmFtZXdvcmsgY2FuIGFjY2VzcyB0aGUKPj4+IGNsb2NrcyBhdCBhbnkgdGltZS4KPj4+
IEFuZCBJIGhhdmUgc2VlbiBTb0NzIHdoaWNoIHdvdWxkIGhhbmcgd2hlbiB0cnlpbmcgdG8gYWNj
ZXNzIGEgbW9kdWxlJ3MKPj4+IHJlZ2lzdGVycyB3aGlsZSB0aGUgbW9kdWxlJ3MgcGNsayBpcyB0
dXJuZWQgb2ZmLgo+PiBPbiBhbGwgbWVzb24gcGxhdGZvcm1zLCB0aGUgZGVmYXVsdCBwY2xrIGZv
ciBhbGwgVUFSVCBpcyB0dXJuZWQgb24KPj4gZHVyaW5nIHRoZSB1LWJvb3QgcGhhc2UuIFdoZW4g
cmVnaXN0ZXJpbmcgdWFydCBwY2xrIGluIHRoZSBrZXJuZWwgcGhhc2UsCj4+IHRoZSBDTEtfSUdO
T1JFX1VOVVNFRCBmbGFnIGlzIGFkZGVkLiBTbyB0aGUgcmVhbCBzaHV0ZG93biBpcyB3aGVuIHRo
ZQo+PiBzdGFuZGJ5IGdvZXMgZG93biwgdGhlIHBhcmVudCBjbGsgc2h1dHMgZG93bi4KPiBJbnRl
cmVzdGluZywgdGhhbmtzIGZvciBzaGFyaW5nIHRoYXQgdS1ib290IHR1cm5zIHRoZXNlIGNsb2Nr
cyBvbi4KPiBMZXQncyBzYXkgc29tZW9uZSB3YW50ZWQgdG8gbWFrZSB1LWJvb3Qgc2F2ZSBwb3dl
ciBhbmQgdHVybiBvZmYgYWxsCj4gVUFSVCBjbG9ja3MgZXhjZXB0IHRoZSBvbmUgZm9yIHVhcnRf
QU8gKHdoZXJlIHdlIHR5cGljYWxseSBjb25uZWN0IHRoZQo+IHNlcmlhbCBjb25zb2xlKS4KPiBJ
biB0aGF0IGNhc2UgdGhlIHBjbGsgb2YgdWFydF9DIChqdXN0IHRvIGNob29zZSBhbiBleGFtcGxl
IGhlcmUpIGlzCj4gdHVybmVkIG9mZi4gV291bGQgdGhlcmUgYmUgYSBwcm9ibGVtIHRoZW4gYWNj
ZXNzaW5nIHRoZSByZWdpc3RlcnMgb2YKPiB1YXJ0X0MgYmVmb3JlIGNsa19wcmVwYXJlX2VuYWJs
ZSBpcyBjYWxsZWQ/ClRoZSB3YXkgeW91IGRlc2NyaWJlIGl0LCBpdCBkb2VzIGhhbmcuIFRoaXMg
d291bGQgbm90IGJlIHJlY29tbWVuZGVkIG9uIAphY3R1YWwgcHJvamVjdHMuCgpBdCBwcmVzZW50
LCBBbUxvZ2ljIGNoaXBzIGFyZSBvbGRlciB0aGFuIFM0IFNvYywgYW5kIHdlIGhhdmUgbm8gd2F5
IHRvIApkZWFsIHdpdGggdGhpcyBwcm9ibGVtLiBXZSBoYXZlIHRvIHRlbGwgY3VzdG9tZXJzIG5v
dCB0byB1c2UgaXQgaW4gdGhpcyAKd2F544CCQ3VzdG9tZXJzIHJhcmVseSB1c2UgaXQgaW4gcmVh
bCBwcm9qZWN0cy5PbiB0aGUgUzQgU09DIHdlIHdpbGwgdXNlIAphIGNsb2NrIGxpa2UgdGhlIFVB
UlQgcGNsayB0byBjb250cm9sIHRoZSBzaHV0ZG93biB1c2luZyB0d28gcmVnaXN0ZXJzLCAKb25l
IHNhZmUgKG5lZWQgdG8gb3BlcmF0ZSBpbiBFTDMpIGFuZCBvbmUgbm9ybWFsIChFTDEpLiBJdCB3
aWxsIG9ubHkgYmUgCmNsb3NlZCBpZiBib3RoIHJlZ2lzdGVycyBhcmUgY2xvc2VkLiBUaGlzIG1h
aW5seSBwcmV2ZW50cyBtaXNvcGVyYXRpb24uCgpXaXRoIHlvdXIgZXhwZXJpZW5jZSwgSSdkIGxp
a2UgdG8ga25vdyBob3cgeW91IGRlYWwgd2l0aCB0aGlzIGtpbmQgb2YgCnByb2JsZW0uCj4gCj4g
Wy4uLl0KPj4+PiAgICAgICAgICAgcG9ydC0+Zmlmb3NpemUgPSA2NDsKPj4+IGNvbW1pdCAyN2Q0
NGUwNWQ3Yjg1ZCAoInR0eTogc2VyaWFsOiBtZXNvbjogcmV0cmlldmUgcG9ydCBGSUZPIHNpemUK
Pj4+IGZyb20gRFQiKSBbMF0gZnJvbSBNYXkgMjAyMSBoYXMgY2hhbmdlZCB0aGlzIGxpbmUgdG86
Cj4+PiAgICAgcG9ydC0+Zmlmb3NpemUgPSBmaWZvc2l6ZTsKPj4+IFNvIHlvdXIgcGF0Y2ggY3Vy
cmVudGx5IGRvZXMgbm90IGFwcGx5IHRvIGxpbnV4LW5leHQgKG9yIGV2ZW4gTGludXMnCj4+PiBt
YWlubGluZSB0cmVlKS4KPj4+Cj4+IFNvIGRvIEkgbmVlZCB0byB3YWl0IGZvciBbMF0gcGF0Y2gg
bWVyZ2VkIGJlZm9yZSBJIGNhbiBjb250aW51ZSB0byBtYWtlCj4+IGNoYW5nZXMgPwo+IFRoZXNl
IGNoYW5nZXMgYXJlIGFscmVhZHkgbWVyZ2VkLgo+IAo+PiBXaGF0IGNhbiBJIGRvIGJlZm9yZT8K
PiBZb3Ugc2hvdWxkIGJhc2UgeW91ciBjaGFuZ2VzIG9uIHRvcCBvZiB0aGUgdHR5LmdpdC90dHkt
bmV4dCBicmFuY2ggWzFdCj4gd2hlcmUgR3JlZyAodGhlIG1haW50YWluZXIgb2YgdGhpcyB0cmVl
KSB3aWxsIHBpY2sgdXAgdGhlIHBhdGNoZXMgb25jZQo+IHRoZXkgYXJlIGdvb2QgKGdvdCBlbm91
Z2ggQWNrZWQtYnkvUmV2aWV3ZWQtYnksIGV0Yy4pLgo+IEkgc3VzcGVjdCB0aGF0IHlvdSBiYXNl
ZCB5b3VyIGNoYW5nZXMgb24gYW4gb2xkZXIgb3Igc3RhYmxlIGtlcm5lbAo+IHZlcnNpb24gKGxl
dCdzIHNheSA1LjEwKS4gTmV3IGZ1bmN0aW9uYWxpdHkgc2hvdWxkIGFsd2F5cyBnZXQgaW50byB0
aGUKPiAtbmV4dCB0cmVlIHdoZXJlIHZhcmlvdXMgYXV0by1idWlsZCByb2JvdHMgd2lsbCBjb21w
aWxlLXRlc3QgdGhlCj4gY2hhbmdlcyBhbmQgd2UgZXZlbiBoYXZlIEtlcm5lbCBDSSB3aGVyZSBj
aGFuZ2VzIGFyZSB0ZXN0ZWQgb24gcmVhbAo+IGhhcmR3YXJlIChCYXlMaWJyZSBldmVuIG1haW50
YWlucyBBbWxvZ2ljIGJvYXJkcyBpbiB0aGVpciBLZXJuZWwgQ0kKPiBsYWJzKS4gTGV0J3Mgc2F5
IEFtbG9naWMgdXBkYXRlcyB0byBMaW51eCA1LjE3IG5leHQgeWVhciB0aGVuIHRoZQo+IHBhdGNo
ZXMgYXJlIGFscmVhZHkgaW5jbHVkZWQgaW4gdGhhdCBrZXJuZWwgdmVyc2lvbiAtIGluc3RlYWQg
b2YgYmVpbmcKPiBvbmx5IGF2YWlsYWJsZSBpbiBMaW51eCA1LjEwLgo+IApJJ20gc29ycnksIEkg
ZGlkIGJyYW5jaCBjb25maXJtIHRoZXJlIHdhcyBhIG1pc3Rha2UsIEkgaGF2ZSBjb3JyZWN0ZWQu
Cj4gCj4gQmVzdCByZWdhcmRzLAo+IE1hcnRpbgo+IAo+IAo+IFsxXSBodHRwczovL2dpdC5rZXJu
ZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9ncmVna2gvdHR5LmdpdC9sb2cvP2g9dHR5
LW5leHQKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFt
bG9naWMK

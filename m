Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0C08C79FA7
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Jan 2026 17:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=HNGwi7rMJUrWWv/fUoI5H5jSKNdboFl7uYiZBvpnxGE=; b=EmAD2FzuK6TzvW
	1dRemIpXlGoX4hd8LgAcJPlx87ywYiY4yhrVgTzWcm3OclwVlXfU5d+5u6apqEDTwxZlXS+fKc1Cc
	Vb673v1d8nn8+o6mAvvC+kzc+ZJ0FUOQh/M7o6DQ9DgpG5PQan2GupdN5pgEI0iHABfNciGMVVs33
	yV8baS/HFbEnGy0N+U6xbHgZgi/mt+yF+clEX8k/CQUco29cF+aGBBeObs7FR9gHGuL2Rl3sPWEpy
	SPwp00J748NCsHAGKa9s0AaGusCR9Lu/lbdUOtKisjIE/PJvo7TxzpoBVaIPqMBgkGSxA0LC/XdkI
	YZ6lhJ6OckgZQwAOltZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoKz-0000000BpIi-2LZP;
	Mon, 05 Jan 2026 17:25:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoKx-0000000BpI1-0Jjw;
	Mon, 05 Jan 2026 17:25:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C4D744110;
	Mon,  5 Jan 2026 17:25:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E26B1C116D0;
	Mon,  5 Jan 2026 17:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767633945;
	bh=yECq9Pg5qwIQCTGjYI+cgz+yczoMQEDsLhbkf0Ix9/g=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=AofVgm4INyuCrEfqjmcCQK+Rz+kAJlDEzMrErH+w9xwVYvVFiP/LJ3/EPtoo5xP2a
	 WDvS81SE99+mRj/6WHQV8U7y3tB/BQGPzMiskZXg4OpEgI/WytPH28zCjDerp85LHW
	 kXbpGYZo0lxcZDDJmZltcdjyvVxs2SFOAbeg/MZfNzFGfi9LrI4rnf5TzrsSSin8f8
	 oQK0hySnBbGyGIGoWp74sItIIsI5ckyt4IzRRGTzQDf5fTo+JsyqkLK3fHo85NQSbj
	 oqeA/GjJp4p32ReA4/rcJ7qf432O1OwnEVqfoeMfjkHFpbpgNX+v4w3PkVvKEXvgGX
	 lShUYdwzpVzRA==
Date: Mon, 5 Jan 2026 11:25:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Linnaea Lavia <linnaea-von-lavia@live.com>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	stable@vger.kernel.org, Ricardo Pardini <ricardo@pardini.net>
Subject: Re: [PATCH] PCI: meson: Remove meson_pcie_link_up() timeout,
 message, speed check
Message-ID: <20260105172543.GA320987@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCAPpiq=M00ZQXAB4Pu2Myjo8gpXC7DByKkGN6Z_Ahqafg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_092547_137927_59081AEA 
X-CRM114-Status: GOOD (  18.67  )
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

T24gTW9uLCBKYW4gMDUsIDIwMjYgYXQgMDU6NDk6MDBQTSArMDEwMCwgTWFydGluIEJsdW1lbnN0
aW5nbCB3cm90ZToKPiBPbiBUaHUsIERlYyAxOCwgMjAyNSBhdCA3OjA24oCvQU0gTWFuaXZhbm5h
biBTYWRoYXNpdmFtCj4gPG1hbml2YW5uYW4uc2FkaGFzaXZhbUBvc3MucXVhbGNvbW0uY29tPiB3
cm90ZToKPiA+Cj4gPgo+ID4gT24gTW9uLCAwMyBOb3YgMjAyNSAxNjoxOToyNiAtMDYwMCwgQmpv
cm4gSGVsZ2FhcyB3cm90ZToKPiA+ID4gUHJldmlvdXNseSBtZXNvbl9wY2llX2xpbmtfdXAoKSBv
bmx5IHJldHVybmVkIHRydWUgaWYgdGhlIGxpbmsgd2FzIGluIHRoZQo+ID4gPiBMMCBzdGF0ZS4g
IFRoaXMgd2FzIGluY29ycmVjdCBiZWNhdXNlIGhhcmR3YXJlIGF1dG9ub21vdXNseSBtYW5hZ2Vz
Cj4gPiA+IHRyYW5zaXRpb25zIGJldHdlZW4gTDAsIEwwcywgYW5kIEwxIHdoaWxlIGJvdGggY29t
cG9uZW50cyBvbiB0aGUgbGluayBzdGF5Cj4gPiA+IGluIEQwLiAgVGhvc2Ugc3RhdGVzIHNob3Vs
ZCBhbGwgYmUgdHJlYXRlZCBhcyAibGluayBpcyBhY3RpdmUiLgo+ID4gPgo+ID4gPiBSZXR1cm5p
bmcgZmFsc2Ugd2hlbiB0aGUgZGV2aWNlIHdhcyBpbiBMMHMgb3IgTDEgYnJva2UgY29uZmlnIGFj
Y2Vzc2VzCj4gPiA+IGJlY2F1c2UgZHdfcGNpZV9vdGhlcl9jb25mX21hcF9idXMoKSBmYWlscyBp
ZiB0aGUgbGluayBpcyBkb3duLCB3aGljaAo+ID4gPiBjYXVzZWQgZXJyb3JzIGxpa2UgdGhpczoK
PiA+ID4KPiA+ID4gWy4uLl0KPiA+Cj4gPiBBcHBsaWVkLCB0aGFua3MhCj4gPgo+ID4gWzEvMV0g
UENJOiBtZXNvbjogUmVtb3ZlIG1lc29uX3BjaWVfbGlua191cCgpIHRpbWVvdXQsIG1lc3NhZ2Us
IHNwZWVkIGNoZWNrCj4gPiAgICAgICBjb21taXQ6IDExNjQ3ZmM3NzJlOTc3Yzk4MTI1OWE2M2M0
YTJiN2UyYzMxMmVhMjIKPgo+IE15IHVuZGVyc3RhbmRpbmcgaXMgdGhhdCB0aGlzIGlzIHF1ZXVl
ZCBmb3IgLW5leHQuCj4KPiBSaWNhcmRvIChDYydlZCkgcmVwb3J0ZWQgdGhhdCB0aGlzIHBhdGNo
IGZpeGVzIFBDSSBsaW5rIHVwIG9uIGhpcwo+IE9kcm9pZC1IQzQuICBJcyB0aGVyZSBhIGNoYW5j
ZSB0byBnZXQgdGhpcyBwYXRjaCBpbnRvIC1maXhlcywgc28gaXQKPiBjYW4gYmUgcHVsbGVkIGJ5
IExpbnVzIGZvciBvbmUgb2YgdGhlIG5leHQgLXJjPwoKVGhlIEZpeGVzIHRhZyBpcyBmb3IgOWMw
ZWY2ZDM0ZmRiICgiUENJOiBhbWxvZ2ljOiBBZGQgdGhlIEFtbG9naWMKTWVzb24gUENJZSBjb250
cm9sbGVyIGRyaXZlciIpLCB3aGljaCBhcHBlYXJlZCBpbiB2NS4wIGluIDIwMTksIHNvIGl0Cndh
cyBhIGxhdGVudCBpc3N1ZSBzaW5jZSB0aGVuLiAgdjUuMCBrZXJuZWxzIGJ1aWx0IHdpdGgKQ09O
RklHX1BDSUVBU1BNX1BPV0VSU0FWRT15IG9yIENPTkZJR19QQ0lFQVNQTV9QT1dFUl9TVVBFUlNB
VkU9eQpzaG91bGQgc2hvdyB0aGUgc2FtZSBwcm9ibGVtLgoKQnV0IEkgdGhpbmsgdGhhdCBsYXRl
bnQgaXNzdWUgYmVjYW1lIG9idmlvdXMgd2hlbiB0aGUgZm9sbG93aW5nIHR3bwpjb21taXRzIGVz
c2VudGlhbGx5IG1hZGUgQ09ORklHX1BDSUVBU1BNX1BPV0VSU0FWRSB0aGUgZGVmYXVsdCBmb3IK
ZGV2aWNldHJlZSBwbGF0Zm9ybXM6CgogIGYzYWMyZmYxNDgzNCAoIlBDSS9BU1BNOiBFbmFibGUg
YWxsIENsb2NrUE0gYW5kIEFTUE0gc3RhdGVzIGZvciBkZXZpY2V0cmVlIHBsYXRmb3JtcyIpCiAg
ZGY1MTkyZDliYjBlICgiUENJL0FTUE06IEVuYWJsZSBvbmx5IEwwcyBhbmQgTDEgZm9yIGRldmlj
ZXRyZWUgcGxhdGZvcm1zIikKClRob3NlIHR3byBjb21taXRzIGFwcGVhcmVkIGluIHY2LjE4LCBz
byBJIHRoaW5rIHdlIGNhbiBtYWtlIGEgY2FzZQp0aGF0IGl0IGZpeGVzIGEgcmVjZW50IHByb2Js
ZW0gYW5kIGlzIHRodXMgbWF0ZXJpYWwgZm9yIHRoZSBjdXJyZW50CnJlbGVhc2UuCgpNb3ZlZCB0
byBmb3ItbGludXMgZm9yIHY2LjE5IGFuZCBzcXVhc2hlZCB5b3VyIHVudXNlZApXQUlUX0xJTktV
UF9USU1FT1VUIGZpeC4gIFRoYW5rcyEKCkJqb3JuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1h
bWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

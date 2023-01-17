Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA07C3DA78
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Jan 2023 12:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/c7fBxsNV3WZ4Ln2MIu0GaICefRZ//EcoQ9j61ayQNk=; b=UucGV21W4Qziyn
	J2C4ALR5uymRYCpMOO3igLw4QsrS99LjpuX9TQXwuN0hC10xVbm6l6PoRKw4ZkC008FPslweQ2MIo
	ScrVms9Z59Ee6rsXC39yj+F0l/SQEOZUZ6DfiTO8aIfmG6wd1SxtGEPb08472npP4KGsBFfE0vM+9
	c/tdf2tzSmaulv/tUGR6ET/XwDrMlz45LSJ340Ok9vsft3gAKIQFG8PTRXX1r8JxqyVal/VAfxBjM
	Y2PihWrihLJjqu+qDzxoUj0XgbEtBl48g3SCr6wuYgpWGalDzcgdSHf4SNnAeZwob5zwTUgR04IsR
	3Dm5ZvyMvBYEK4QMI0bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkhz-00E80K-56; Tue, 17 Jan 2023 12:04:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHkhj-00E7vC-D6
	for linux-amlogic@lists.infradead.org; Tue, 17 Jan 2023 12:04:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673957078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hIghJLY4bualUJFQqX/SZDMXujK/HbU9/7wn3xgRH5o=;
	b=KczKGC7skjMEm97BwZjVkN1SXbpvwpd7mQSApmbmqB+BQptUwMwZsmvKZrQzSobRTKMD+l
	ij0h54qZ1b/YovrniZmcMOCzW9PeUw/HOc3n7gsNtx2wNRfSHvw4fdcqRQYoWgF2uOKRe3
	p422jqYmL/0BX45dkJ4MfRcNUtk52J4=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-ZyFKJcRJMXaYW24lsjzrfw-1; Tue, 17 Jan 2023 07:04:35 -0500
X-MC-Unique: ZyFKJcRJMXaYW24lsjzrfw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-482d3bf0266so324482017b3.3
        for <linux-amlogic@lists.infradead.org>; Tue, 17 Jan 2023 04:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EGd8Gv7zO6+RZus69tR/m6BH1nFkS1nUUO+DcJcAeOU=;
        b=pXmgm2xdMEIqy4B/y3xStJpHxJeceFZCPFlAUMBjpWXECBOuGWklfDuTlG9iJ05mBw
         /XQRCz4LGxya9pKlCN92ctfgIDoZPIQ9V7APp6cziLX9xf67/C3Cc7bzrvpltn4Q2K6r
         +tvxXjvv/a3Y5RrJkfM0aWsOzdAYCcnY/i7PLxQ3LNq98YOyl3lE4LyeqVpWRY6cxLTF
         PNTfBzs5DaSo/rMg3MG7zurNKEKd0wxuT/bWp++ZYYCznbgFRqI4P8Bm9VXt90BdZeYZ
         c222kyD/30OdEk7KbAtU6illz9pl+2eDFgKza8PgAxz48HFyjVWkos5Aj3ob8Umx0wMU
         vvEQ==
X-Gm-Message-State: AFqh2kr2HYq/IMd6izOvRqq7WawZwDWEYJz2UjD6vWv8JdIoauvaDGfG
	+K1W6B1aSZO+jM6ZQGIxviHI5qtJTWVt/69N9DcTjcfzfn6pNEJvBPFIw9zq6pnT6oHnrsG8aal
	pMr4v1BWnu7uYsnvrL3BDj9KRhrt26W8=
X-Received: by 2002:a0d:ebc7:0:b0:4d2:df5d:4f8a with SMTP id u190-20020a0debc7000000b004d2df5d4f8amr2479248ywe.11.1673957074953;
        Tue, 17 Jan 2023 04:04:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtHxspuMUbwpLPxkzC/BX7aJ3whS1J+KUFaZG4ER3Z2qEHdLvNUwS4DQIn2g/GbJHhFhtDxaQ==
X-Received: by 2002:a0d:ebc7:0:b0:4d2:df5d:4f8a with SMTP id u190-20020a0debc7000000b004d2df5d4f8amr2479226ywe.11.1673957074632;
        Tue, 17 Jan 2023 04:04:34 -0800 (PST)
Received: from gerbillo.redhat.com (146-241-115-179.dyn.eolo.it. [146.241.115.179])
        by smtp.gmail.com with ESMTPSA id bi27-20020a05620a319b00b00706a1551428sm634487qkb.6.2023.01.17.04.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 04:04:34 -0800 (PST)
Message-ID: <699f6ee109b3a72b2b377f42a78705f47d4a77b9.camel@redhat.com>
Subject: Re: [PATCH net-next] net: phy: meson-gxl: support more
 G12A-internal PHY versions
From: Paolo Abeni <pabeni@redhat.com>
To: Heiner Kallweit <hkallweit1@gmail.com>, Neil Armstrong
	 <neil.armstrong@linaro.org>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>, David Miller
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet
 <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  "netdev@vger.kernel.org"
 <netdev@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Amlogic Meson..."
 <linux-amlogic@lists.infradead.org>
Date: Tue, 17 Jan 2023 13:04:30 +0100
In-Reply-To: <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
References: <d75ef7df-a645-7fdd-491a-f89f70dbea01@gmail.com>
	 <Y8Qwk5H8Yd7qiN0j@lunn.ch> <03ea260e-f03c-d9d7-6f5f-ff72836f5739@gmail.com>
	 <51abd8ca-8172-edfa-1c18-b1e48231f316@linaro.org>
	 <6de25c61-c187-fb88-5bd7-477b1db1510e@gmail.com>
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_040439_525493_E5038412 
X-CRM114-Status: GOOD (  35.32  )
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

SGVsbG8sCgpPbiBTdW4sIDIwMjMtMDEtMTUgYXQgMjE6MzggKzAxMDAsIEhlaW5lciBLYWxsd2Vp
dCB3cm90ZToKPiBPbiAxNS4wMS4yMDIzIDE5OjQzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiA+
IEhpIEhlaW5lciwKPiA+IAo+ID4gTGUgMTUvMDEvMjAyMyDDoCAxODowOSwgSGVpbmVyIEthbGx3
ZWl0IGEgw6ljcml0wqA6Cj4gPiA+IE9uIDE1LjAxLjIwMjMgMTc6NTcsIEFuZHJldyBMdW5uIHdy
b3RlOgo+ID4gPiA+IE9uIFN1biwgSmFuIDE1LCAyMDIzIGF0IDA0OjE5OjM3UE0gKzAxMDAsIEhl
aW5lciBLYWxsd2VpdCB3cm90ZToKPiA+ID4gPiA+IE9uIG15IFNDMi1iYXNlZCBzeXN0ZW0gdGhl
IGdlbnBoeSBkcml2ZXIgd2FzIHVzZWQgYmVjYXVzZSB0aGUgUEhZCj4gPiA+ID4gPiBpZGVudGlm
aWVzIGFzIDB4MDE4MDMzMDAuIEl0IHdvcmtzIG5vcm1hbCB3aXRoIHRoZSBtZXNvbiBnMTJhCj4g
PiA+ID4gPiBkcml2ZXIgYWZ0ZXIgdGhpcyBjaGFuZ2UuCj4gPiA+ID4gPiBTd2l0Y2ggdG8gUEhZ
X0lEX01BVENIX01PREVMIHRvIGNvdmVyIHRoZSBkaWZmZXJlbnQgc3ViLXZlcnNpb25zLgo+ID4g
PiA+IAo+ID4gPiA+IEhpIEhlaW5lcgo+ID4gPiA+IAo+ID4gPiA+IEFyZSB0aGVyZSBhbnkgZGF0
YXNoZWV0cyBmb3IgdGhlc2UgZGV2aWNlcz8gQW55dGhpbmcgd2hpY2ggZG9jdW1lbnRzCj4gPiA+
ID4gdGhlIGxvd2VyIG5pYmJsZSByZWFsbHkgaXMgYSByZXZpc2lvbj8KPiA+ID4gPiAKPiA+ID4g
PiBJJ20ganVzdCB0cnlpbmcgdG8gYXZvaWQgZnV0dXJlIHByb2JsZW1zIHdoZXJlIHdlIGZpbmQg
aXQgaXMgYWN0dWFsbHkKPiA+ID4gPiBhIGRpZmZlcmVudCBQSFksIG5lZWRzIGl0cyBvd24gTUFU
Q0hfRVhBQ1QgZW50cnksIGFuZCB0aGVuIHdlIGZpbmQgd2UKPiA+ID4gPiBicmVhayBkZXZpY2Vz
IHVzaW5nIDB4MDE4MDMzMDIgd2hpY2ggd2UgaGFkIG5vIGlkZWEgZXhpc3RzLCBidXQgZ290Cj4g
PiA+ID4gY292ZXJlZCBieSB0aGlzIGNoYW5nZS4KPiA+ID4gPiAKPiA+ID4gVGhlIFNDMiBwbGF0
Zm9ybSBpbmhlcml0ZWQgYSBsb3QgZnJvbSBHMTJBLCB0aGVyZWZvcmUgaXQncyBwbGF1c2libGUK
PiA+ID4gdGhhdCBpdCdzIHRoZSBzYW1lIFBIWS4gQWxzbyB0aGUgdmVuZG9yIGRyaXZlciBmb3Ig
U0MyIGdpdmVzIGEgaGludAo+ID4gPiBhcyBpdCBoYXMgdGhlIGZvbGxvd2luZyBjb21wYXRpYmxl
IGZvciB0aGUgUEhZOgo+ID4gPiAKPiA+ID4gY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWQw
MTgwLjMzMDEiLCAiZXRoZXJuZXQtcGh5LWllZWU4MDIuMy1jMjIiOwo+ID4gPiAKPiA+ID4gQnV0
IHlvdSdyZSByaWdodCwgSSBjYW4ndCBzYXkgZm9yIHN1cmUgYXMgSSBkb24ndCBoYXZlIHRoZSBk
YXRhc2hlZXRzLgo+ID4gCj4gPiBPbiBHMTJBICgmIEdYTCksIHRoZSBQSFkgSUQgaXMgc2V0IGlu
IHRoZSBNRElPIE1VWCByZWdpc3RlcnMsCj4gPiBwbGVhc2Ugc2VlOgo+ID4gaHR0cHM6Ly9lbGl4
aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL25ldC9tZGlvL21kaW8t
bXV4LW1lc29uLWcxMmEuYyNMMzYKPiA+IAo+ID4gU28geW91IHNob3VsZCBlaXRoZXIgYWRkIHN1
cHBvcnQgZm9yIHRoZSBQSFkgbXV4IGluIFNDMiBvciBjaGVjawo+ID4gd2hhdCBpcyBpbiB0aGUg
RVRIX1BIWV9DTlRMMCByZWdpc3Rlci4KPiA+IAo+IFRoYW5rcyBmb3IgdGhlIGhpbnQuIEkganVz
dCBjaGVja2VkIGFuZCByZWFkaW5nIGJhY2sgRVRIX1BIWV9DTlRMMCBhdCB0aGUKPiBlbmQgb2Yg
ZzEyYV9lbmFibGVfaW50ZXJuYWxfbWRpbygpIGdpdmVzIG1lIHRoZSBleHBlY3RlZCByZXN1bHQg
b2YgMHgzMzAxMDE4MC4KPiBCdXQgc3RpbGwgdGhlIFBIWSByZXBvcnRzIDMzMDAuCj4gRXZlbiBp
ZiBJIHdyaXRlIHNvbWUgb3RoZXIgcmFuZG9tIHZhbHVlIHRvIEVUSF9QSFlfQ05UTDAsIEkgZ2V0
IDAxODAvMzMwMAo+IGFzIFBIWSBJRC4KPiAKPiBGb3IgdS1ib290IEkgZm91bmQgdGhlIGZvbGxv
d2luZzoKPiAKPiBodHRwczovL2dpdGh1Yi5jb20va2hhZGFzL3UtYm9vdC9ibG9iL2toYWRhcy12
aW00LXItNjRiaXQvZHJpdmVycy9uZXQvcGh5L2FtbG9naWMuYwo+IAo+IHN0YXRpYyBzdHJ1Y3Qg
cGh5X2RyaXZlciBhbWxvZ2ljX2ludGVybmFsX2RyaXZlciA9IHsKPiAJLm5hbWUgPSAiTWVzb24g
R1hMIEludGVybmFsIFBIWSIsCj4gCS51aWQgPSAweDAxODAzMzAwLAo+IAkubWFzayA9IDB4ZmZm
ZmZmZjAsCj4gCS5mZWF0dXJlcyA9IFBIWV9CQVNJQ19GRUFUVVJFUywKPiAJLmNvbmZpZyA9ICZt
ZXNvbl9waHlfY29uZmlnLAo+IAkuc3RhcnR1cCA9ICZtZXNvbl9hbWxfc3RhcnR1cCwKPiAJLnNo
dXRkb3duID0gJmdlbnBoeV9zaHV0ZG93biwKPiB9Owo+IAo+IFNvIGl0J3MgdGhlIHNhbWUgUEhZ
IElEIEknbSBzZWVpbmcgaW4gTGludXguCj4gCj4gTXkgYmVzdCBndWVzcyBpcyB0aGF0IHRoZSBm
b2xsb3dpbmcgaXMgdGhlIGNhc2U6Cj4gCj4gVGhlIFBIWSBjb21wYXRpYmxlIHN0cmluZyBpbiBE
VCBpcyB0aGUgZm9sbG93aW5nIGluIGFsbCBjYXNlczoKPiBjb21wYXRpYmxlID0gImV0aGVybmV0
LXBoeS1pZDAxODAuMzMwMSIsICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiI7Cj4gCj4gVGhl
cmVmb3JlIGlkIDAxODAvMzMwMSBpcyB1c2VkIGV2ZW4gaWYgdGhlIFBIWSByZXBvcnRzIHNvbWV0
aGluZyBlbHNlLgo+IE1lYW5zIGl0IGRvZXNuJ3QgbWF0dGVyIHdoaWNoIHZhbHVlIHlvdSB3cml0
ZSB0byBFVEhfUEhZX0NOVEwwLgo+IAo+IEkgcmVkdWNlZCB0aGUgY29tcGF0aWJsZSBzdHJpbmcg
dG8gY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWVlZTgwMi4zLWMyMiIKPiBhbmQgdGhpcyBy
ZXN1bHRlZCBpbiB0aGUgYWN0dWFsIFBIWSBJRCBiZWluZyB1c2VkLgo+IFlvdSBjb3VsZCBjaGFu
Z2UgdGhlIGNvbXBhdGlibGUgaW4gZHRzIHRoZSBzYW1lIHdheSBmb3IgYW55IGcxMmEgc3lzdGVt
Cj4gYW5kIEkgYXNzdW1lIHlvdSB3b3VsZCBnZXQgMDE4MC8zMzAwIHRvby4KPiAKPiBSZW1haW5p
bmcgcXVlc3Rpb24gaXMgd2h5IHRoZSB2YWx1ZSBpbiBFVEhfUEhZX0NOVEwwIGlzIGlnbm9yZWQu
CgpJIFttaXM/XXJlYWQgdGhlIGFib3ZlIGFzIHdlIGNhbid0IGNvbXBsZXRlbHkgcnVsZSBvdXQg
QW5kcmV3J3MgZG91YnQsCmFzIHN1Y2ggbWFya2luZyB0aGlzIHBhdGNoIGFzIGNoYW5nZWQgcmVx
dWVzdGVkLgoKQ2hlZXJzLAoKUGFvbG8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2lj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1hbWxvZ2ljCg==

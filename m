Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0298AC433F5
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Mar 2022 20:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PZklrkIzTBwj6mLUVtFPwcOg6iuEWm0fBEwNHQ7C4bs=; b=IqkhKLNFEDBuAv
	TlryRytmDsNdGqZqb61IPBTd+0897opHeQ7ea0W5nydOaYCrIR98mlw+cI79Vrd+HVu+UquJQWula
	DxfNoh909aLIajZxeXwZHOcHlmivcVqjzhylkE1PMDgnf093/6UNfiOtBCuJARFZhgltAZP/1VeNV
	c+HwjdCHs0gd+lTz2CE1orncOPNWr1DpI4nuyHFYLufRUCTYi9NssetcTxr5VHSS0v8bYR8r235Tz
	gtfMBunp6U9MVLvGscwMUTszqBOGw+oudvyTA9x+a2lldYm+VHHD3uqu2hUdKVM/7zoTD3dOcY2tR
	wJjpeB92Z4uOqGcY7/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nX7fo-00Ep6j-W8; Wed, 23 Mar 2022 20:33:41 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nX7fc-00Ep4z-Js; Wed, 23 Mar 2022 20:33:30 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bg10so5220379ejb.4;
 Wed, 23 Mar 2022 13:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=8w53GL3MnLADST4E9DcwHIxh+z2VdgIPaNKFHog2SHc=;
 b=Nmp4i2IKn+57oTHm39eJaqGtLbPBR9bF0QWZqkMTvyicg/ojKJw81a5ZUfz4qe0zZM
 UClxD/I/o11G0mQN42pVYkVYiIIfHQM8DSC89JyBjzPOJ9KvQLXmc3LqMVLFrFejUb/X
 8tuc2GAHel4ujRN3JaalPC9uv97sx2Y747CxEeQgkin9AFtEwERAopiSIQG20/jpEKz2
 kWLuw7m5n2V8lk+EfO+1hwryPsSJd/ZThiFcxFVb/oI8AdNWffI6SmItzjmBWvmICxYG
 s1KMm9Luf6OdmEQO6VF8JFnhJI2//Hc9nT6litKo5atkZHGWSKD+FNsZD/eE1lyHWQCs
 ndZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8w53GL3MnLADST4E9DcwHIxh+z2VdgIPaNKFHog2SHc=;
 b=KvmefvVoGFp60Dmvt9UoxH3Yr3O6S5FInORkl/o74ckmEp5uuI9YLKY8B9b7TIGZXI
 OJuuDyFEn5ejoL9GYtd+Frba6uD9s8KWJ48BuU4xzR5C3OowAeNgNs40AEz/iZWx0ypK
 Y8IiEsBU7lECyRdcPpF/z49zU8Fjz4zf6WihQbdU3UaDNX/Q1CJthRNdPDheSaIC7sNl
 mX9IFHHVfjFsIhAZyZ8qz13gEgjgZWk6O0GwlOnbG9cCToZKTEeJ3t2hyEA5q29ajAma
 z8q7MFkVMCtLbv0Y1oGT1dBfP/AqnwhPAhvWN6/PMkMsLkdMcOt7XtjRMejw4nUaLZvk
 yl6w==
X-Gm-Message-State: AOAM531dl6cEPuYzs/Hqq8ij+7Q6drBefizyyUVq6AwNXw5KhhYFoY/b
 uksfA3Dv4zndoQa+HYJQCWw=
X-Google-Smtp-Source: ABdhPJy35M7x98Gg8G1hQ6cDhzEMbFWY8nuotieRdsHkGjwSKkzFwncXI0Jp56IPyp3CyPe6EKkFKQ==
X-Received: by 2002:a17:907:6296:b0:6da:745b:7b40 with SMTP id
 nd22-20020a170907629600b006da745b7b40mr2076068ejc.750.1648067605870; 
 Wed, 23 Mar 2022 13:33:25 -0700 (PDT)
Received: from ?IPV6:2a01:c22:73b2:3800:a873:f3b8:ab68:ccbd?
 (dynamic-2a01-0c22-73b2-3800-a873-f3b8-ab68-ccbd.c22.pool.telefonica.de.
 [2a01:c22:73b2:3800:a873:f3b8:ab68:ccbd])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a056402274600b004194fc1b7casm427134edd.48.2022.03.23.13.33.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 13:33:25 -0700 (PDT)
Message-ID: <80937566-6455-b1bf-0a5d-a7b54dd3adc5@gmail.com>
Date: Wed, 23 Mar 2022 21:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
 <3bf14cf0-f00d-f718-30ea-e63272f3ce72@arm.com>
 <9e2fc38a-a51e-7635-970c-64948fc6eae4@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <9e2fc38a-a51e-7635-970c-64948fc6eae4@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_133328_696705_A525C316 
X-CRM114-Status: GOOD (  19.94  )
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

T24gMjEuMDMuMjAyMiAwOTozNCwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToKPiBPbiAxOC8w
My8yMDIyIDIxOjUwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+IE9uIDIwMjItMDItMjUgMjE6MTMs
IEhlaW5lciBLYWxsd2VpdCB3cm90ZToKPj4+IEFkZCBhIFlBTUwgc2NoZW1hIGJpbmRpbmcgZm9y
IFRNMTYyOCBhdXhkaXNwbGF5Cj4+PiAoNy8xMS1zZWdtZW50IExFRCkgY29udHJvbGxlci4KPj4+
Cj4+PiBUaGlzIHBhdGNoIGlzIHBhcnRpYWxseSBiYXNlZCBvbiBwcmV2aW91cyB3b3JrIGZyb20K
Pj4+IEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4uCj4+Pgo+Pj4gQ28tZGV2ZWxv
cGVkLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4+PiBTaWduZWQtb2ZmLWJ5
OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+Pj4gLS0tCj4+PiB2NToK
Pj4+IC0gYWRkIHZlbmRvciBwcmVmaXggdG8gZHJpdmVyLXNwZWNpZmljIHByb3BlcnRpZXMKPj4+
IC0tLQo+Pj4gICAuLi4vYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbCAg
fCA5MiArKysrKysrKysrKysrKysrKysrCj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA5MiBpbnNlcnRp
b25zKCspCj4+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFtbAo+Pj4KPj4+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1l
Yyx0bTE2MjgueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNw
bGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4gaW5k
ZXggMDAwMDAwMDAwLi4yYTFlZjY5MmMKPj4+IC0tLSAvZGV2L251bGwKPj4+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55
YW1sCj4+PiBAQCAtMCwwICsxLDkyIEBACj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjog
KEdQTC0yLjAtb3ItbGF0ZXIgT1IgQlNELTItQ2xhdXNlKQo+Pj4gKyVZQU1MIDEuMgo+Pj4gKy0t
LQo+Pj4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvYXV4ZGlzcGxheS90aXRh
bm1lYyx0bTE2MjgueWFtbCMKPj4+ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKPj4+ICsKPj4+ICt0aXRsZTogVGl0YW4gTWljcm8gRWxlY3Ry
b25pY3MgVE0xNjI4IExFRCBjb250cm9sbGVyCj4+PiArCj4+PiArbWFpbnRhaW5lcnM6Cj4+PiAr
ICAtIEFuZHJlYXMgRsOkcmJlciA8YWZhZXJiZXJAc3VzZS5kZT4KPj4+ICsgIC0gSGVpbmVyIEth
bGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPj4+ICsKPj4+ICthbGxPZjoKPj4+ICsgIC0g
JHJlZjogL3NjaGVtYXMvc3BpL3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwjCj4+PiArCj4+PiAr
cHJvcGVydGllczoKPj4+ICsgIGNvbXBhdGlibGU6Cj4+PiArICAgIGNvbnN0OiB0aXRhbm1lYyx0
bTE2MjgKPj4+ICsKPj4+ICsgIHJlZzoKPj4+ICsgICAgbWF4SXRlbXM6IDEKPj4+ICsKPj4+ICsg
IHRpdGFubWVjLGdyaWQ6Cj4+PiArICAgIGRlc2NyaXB0aW9uOgo+Pj4gKyAgICAgIE1hcHBpbmcg
b2YgZGlzcGxheSBkaWdpdCBwb3NpdGlvbiB0byBncmlkIG51bWJlci4KPj4+ICsgICAgICBUaGlz
IGltcGxpY2l0bHkgZGVmaW5lcyB0aGUgZGlzcGxheSBzaXplLgo+Pj4gKyAgICAkcmVmOiAvc2No
ZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQo+Pj4gKyAgICBtaW5JdGVt
czogMQo+Pj4gKyAgICBtYXhJdGVtczogNwo+Pj4gKwo+Pj4gKyAgdGl0YW5tZWMsc2VnbWVudC1t
YXBwaW5nOgo+Pj4gKyAgICBkZXNjcmlwdGlvbjoKPj4+ICsgICAgICBNYXBwaW5nIG9mIDcgc2Vn
bWVudCBkaXNwbGF5IHNlZ21lbnRzIEEtRyB0byBiaXQgbnVtYmVycyAxLTEyLgo+Pj4gKyAgICAk
cmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQo+Pj4gKyAg
ICBtaW5JdGVtczogNwo+Pj4gKyAgICBtYXhJdGVtczogNwo+Pj4gKwo+Pj4gKyAgIiNhZGRyZXNz
LWNlbGxzIjoKPj4+ICsgICAgY29uc3Q6IDIKPj4+ICsKPj4+ICsgICIjc2l6ZS1jZWxscyI6Cj4+
PiArICAgIGNvbnN0OiAwCj4+PiArCj4+PiArcmVxdWlyZWQ6Cj4+PiArICAtIGNvbXBhdGlibGUK
Pj4+ICsgIC0gcmVnCj4+Cj4+IFdvdWxkIGl0IGJlIGZhaXIgdG8gc2F5IHRoYXQgInNwaS1sc2It
Zmlyc3QiIGFuZCAic3BpLTN3aXJlIiBhcmUgYWxzbyAKPj4gcmVxdWlyZWQ/IFRoZSBjaGlwcyBh
cmVuJ3QgY29uZmlndXJhYmxlIHNvIHdvbid0IGV4YWN0bHkgYmUgdXNhYmxlIGFueSAKPj4gb3Ro
ZXIgd2F5LiBGdXJ0aGVybW9yZSBJIGJlbGlldmUgdGhlIHRyYW5zbWlzc2lvbiBmb3JtYXQgYWN0
dWFsbHkgd29ya3MgCj4+IG91dCBlcXVpdmFsZW50IHRvIFNQSSBtb2RlIDMsIHNvIHNob3VsZCB3
YXJyYW50ICJzcGktY3BoYSIgYW5kIAo+PiAic3BpLWNwb2wiIGFzIHdlbGwuCj4+Cj4+PiArCj4+
PiArcGF0dGVyblByb3BlcnRpZXM6Cj4+PiArICAiXi4qQFsxLTddLChbMS05XXwxWzAtNl0pJCI6
Cj4+PiArICAgIHR5cGU6IG9iamVjdAo+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy9sZWRzL2NvbW1v
bi55YW1sIwo+Pj4gKyAgICB1bmV2YWx1YXRlZFByb3BlcnRpZXM6IGZhbHNlCj4+PiArICAgIGRl
c2NyaXB0aW9uOiB8Cj4+PiArICAgICAgUHJvcGVydGllcyBmb3IgYSBzaW5nbGUgTEVELgo+Pj4g
Kwo+Pj4gKyAgICBwcm9wZXJ0aWVzOgo+Pj4gKyAgICAgIHJlZzoKPj4+ICsgICAgICAgIGRlc2Ny
aXB0aW9uOiB8Cj4+PiArICAgICAgICAgIDEtYmFzZWQgZ3JpZCBudW1iZXIsIGZvbGxvd2VkIGJ5
IDEtYmFzZWQgc2VnbWVudCBiaXQgbnVtYmVyLgo+Pj4gKyAgICAgICAgbWF4SXRlbXM6IDEKPj4+
ICsKPj4+ICsgICAgcmVxdWlyZWQ6Cj4+PiArICAgICAgLSByZWcKPj4KPj4gSSdtIGNvbmNlcm5l
ZCB0aGF0IHRoaXMgbGVhdmVzIHVzIG5vIHJvb20gdG8gc3VwcG9ydCB0aGUgYWRkaXRpb25hbCAK
Pj4ga2V5cGFkIGZ1bmN0aW9uYWxpdHkgaW4gZnV0dXJlLiBIYXZpbmcgbm93IGRvdWJsZS1jaGVj
a2VkIGEgZGF0YXNoZWV0LCAKPj4gdGhlIGlucHV0cyBhcmUgYWxzbyBhIHR3by1kaW1lbnNpb25h
bCBtdXggKHNoYXJpbmcgdGhlIHNlZ21lbnQgbGluZXMpLCAKPj4gc28gdGhlIGRldmljZSBlZmZl
Y3RpdmVseSBoYXMgdHdvIGRpc3RpbmN0IGJ1dCBudW1lcmljYWxseS1vdmVybGFwcGluZyAKPj4g
Y2hpbGQgYWRkcmVzcyBzcGFjZXMgLSBvbmUgYWRkcmVzc2VkIGJ5IChncmlkLHNlZ21lbnQpIGFu
ZCB0aGUgb3RoZXIgYnkgCj4+IChzZWdtZW50LGtleSkuCj4+Cj4+IFJvYiwgS3J5c3p0b2YsIGFu
eSB0aG91Z2h0cyBvbiB0aGUgYmVzdCBEVCBpZGlvbSB0byBsZWF2ZSBhY2NvbW1vZGF0aW9uIAo+
PiBmb3IgdGhhdD8gSSdtIHRoaW5raW5nIGVpdGhlciByZXF1aXJlIGFuIGludGVybWVkaWF0ZSBu
b2RlIHRvIGNvbnRhaW4gCj4+IGVhY2ggbm90aW9uYWwgYWRkcmVzcyBzcGFjZSwgb3IgcGVyaGFw
cyBhZGQgYW5vdGhlciBsZWFkaW5nIGFkZHJlc3MgY2VsbCAKPj4gdG8gc2VsZWN0IGJldHdlZW4g
dGhlbT8gSSBkb24ndCBiZWxpZXZlIGFueSBvZiB0aGVzZSB0aGluZ3MgaGF2ZSBmdXJ0aGVyIAo+
PiBmdW5jdGlvbmFsaXR5IGJleW9uZCB0aGF0Lgo+IAo+IEkgdGhpbmsgaW50ZXJtZWRpYXRlIG5v
ZGVzIC0gbGVkcywga2V5cyAtIGFyZSBtb3JlIGFwcHJvcHJpYXRlLCBiZWNhdXNlCj4gaXQgaXMg
c2VsZi1kZXNjcmliaW5nLiBBZGRpdGlvbmFsIGFkZHJlc3Mgc3BhY2UgbnVtYmVyIHdvdWxkIHJl
cXVpcmUKPiBkZWNvZGluZyB0aGlzICIwIiBvciAiMSIgaW50byBMRUQva2V5LiBGb3IgY29tcGxl
eCBkZXZpY2VzIC0gbGlrZSBQTUlDcwo+IHdpdGggcmVndWxhdG9ycywgUlRDIGFuZCBjbG9ja3Mg
LSB3ZSBhbHJlYWR5IGhhdmUgc3VjaCBwYXR0ZXJucy4KPiAKVGhlbiBpdCdzIGp1c3QgdGhlIHF1
ZXN0aW9uIHdobyBjYW4gaW1wbGVtZW50IHN1Y2ggYW4gaW50ZXJtZWRpYXRlIG5vZGUKYmFzZWQg
b24gd2hhdCBoYXMgYmVlbiBkb25lIHNvIGZhci4KCj4gQmVzdCByZWdhcmRzLAo+IEJlc3QgcmVn
YXJkcywKPiBLcnp5c3p0b2YKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1hbWxvZ2ljCg==

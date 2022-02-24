Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13075C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 21:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IFJndNJtbZIP2S1O7w09nOV7OkNdOqc8JiYA8E5FfQ=; b=MsFAmRKoSFE6Tg
	Ex5YaPqmjjluEY/+CtNEe3lL+79Qi7zENAL9R2xm9I7OOATq5U5EGrxQMANme1iJeoShdqUVvxsEp
	c+k0IGytBH4Lm8HGCSzd31TGKWF5nwJ0Kj5enIHbBWo7E9s/+eq2kfrI56jwBK8wQZck1enViv7qm
	r5bBYBjNpyR91jcEtH9yvUSxVgOEgivKvXJNjJM/jnagPcd3g8ZPRmXJzuTRPkbO/phU/GgaadlIH
	30HD99J79p0NMYwleP5HusEcSUBdhzXyUgbNrJFwAmqOGpn2HwJ8+U2SB29Y3vwf7MteFyv4ZqgvJ
	/Dxaa3ONP14ugJ6udUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNLhl-002Sai-AK; Thu, 24 Feb 2022 21:31:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNLhh-002SZj-U5; Thu, 24 Feb 2022 21:31:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D1E5E6194C;
 Thu, 24 Feb 2022 21:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C71FC340E9;
 Thu, 24 Feb 2022 21:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645738272;
 bh=xAaV71khgyxJSYNTbghVh0hGPi9acURlzOoApHgt5V8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hBViD1MEgdFwxvUNZIgAlV+jLNlQODbe5yBXsIOVuvuimoXXdMarWY445b2ktBqkL
 dL57YHKBnQe6NYAYrppZ16n+4KMvWWOHLzD6QKx9QtlPINdyMmjJuVz18SN6XCri3m
 kefdK48sqpQMoCMKhCuJosOoiAQ6XvIMAfzPC1i8VPEFF0UhBkcQTQeWwg/3pIWzT9
 Iz0bS9QqE1bwo1zMgEBogxotkZ2JCgOW6khUWdKd33h0Rrd6wjwreHooZqhgZNwBDq
 WvLc4jVBVaQHr/jjgeXJU0Ua+QPO9m6n8wCppqdPYePOi9xlRrGtiqIyeD2N8NUpd9
 PB1n09f5SzcmA==
Received: by mail-ej1-f44.google.com with SMTP id p14so6985562ejf.11;
 Thu, 24 Feb 2022 13:31:12 -0800 (PST)
X-Gm-Message-State: AOAM530hpCX+x4m0e1vfqyZVa2wbfTq9urVe6dNt5OdL+TpBnuUcXpFe
 318/ku0/WUlStr7b9ct/z0NK2aRLajfkM0sMig==
X-Google-Smtp-Source: ABdhPJz9gGO5RwkLo5KhzTerkRw/zvkylyNwIdinxgbHvG3V6vn/A+xfja9Q/OgQ6dBDyAoiZqpRMB7qHSQ/5wFGBPo=
X-Received: by 2002:a17:906:f6d9:b0:6ce:e7d:5f3a with SMTP id
 jo25-20020a170906f6d900b006ce0e7d5f3amr3727571ejb.20.1645738270497; Thu, 24
 Feb 2022 13:31:10 -0800 (PST)
MIME-Version: 1.0
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
 <2b7f0011-8872-70fa-b9b7-50b7817e7084@gmail.com>
 <YhfpD9qfcuAlC+wp@robh.at.kernel.org>
 <29fcdfe3-1b8e-f466-6e20-919c6ab2a7ae@gmail.com>
In-Reply-To: <29fcdfe3-1b8e-f466-6e20-919c6ab2a7ae@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 24 Feb 2022 15:30:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqL-yFJkq9Uj9XAzfcN=yD9AGUQEGk7f-h81P7MNj7p==A@mail.gmail.com>
Message-ID: <CAL_JsqL-yFJkq9Uj9XAzfcN=yD9AGUQEGk7f-h81P7MNj7p==A@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Miguel Ojeda <ojeda@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>, 
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_133114_103903_189D2E31 
X-CRM114-Status: GOOD (  26.63  )
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

T24gVGh1LCBGZWIgMjQsIDIwMjIgYXQgMjo1NiBQTSBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2Vp
dDFAZ21haWwuY29tPiB3cm90ZToKPgo+IE9uIDI0LjAyLjIwMjIgMjE6MjIsIFJvYiBIZXJyaW5n
IHdyb3RlOgo+ID4gT24gV2VkLCBGZWIgMjMsIDIwMjIgYXQgMDY6NTk6MzFQTSArMDEwMCwgSGVp
bmVyIEthbGx3ZWl0IHdyb3RlOgo+ID4+IEFkZCBhIFlBTUwgc2NoZW1hIGJpbmRpbmcgZm9yIFRN
MTYyOCBhdXhkaXNwbGF5Cj4gPj4gKDcvMTEtc2VnbWVudCBMRUQpIGNvbnRyb2xsZXIuCj4gPj4K
PiA+PiBUaGlzIHBhdGNoIGlzIHBhcnRpYWxseSBiYXNlZCBvbiBwcmV2aW91cyB3b3JrIGZyb20K
PiA+PiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Lgo+ID4+Cj4gPj4gQ28tRGV2
ZWxvcGVkLWJ5OiBBbmRyZWFzIEbDpHJiZXIgPGFmYWVyYmVyQHN1c2UuZGU+Cj4gPj4gU2lnbmVk
LW9mZi1ieTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgo+ID4+IENvLURldmVs
b3BlZC1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNvbT4KPiA+PiBTaWdu
ZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgo+ID4+IC0t
LQo+ID4+IHYzOgo+ID4+IC0gZml4IHJlbWFpbmluZyBZQU1MIGlzc3Vlcwo+ID4+IC0gdXNlIENv
LURldmVsb3BlZC1ieQo+ID4+IC0tLQo+ID4+ICAuLi4vYmluZGluZ3MvYXV4ZGlzcGxheS90aXRh
bm1lYyx0bTE2MjgueWFtbCAgfCA5MiArKysrKysrKysrKysrKysrKysrCj4gPj4gIDEgZmlsZSBj
aGFuZ2VkLCA5MiBpbnNlcnRpb25zKCspCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXV4ZGlzcGxheS90aXRhbm1lYyx0bTE2MjgueWFt
bAo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2F1eGRpc3BsYXkvdGl0YW5tZWMsdG0xNjI4LnlhbWwKPiA+PiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+ID4+IGluZGV4IDAwMDAwMDAwMC4uMmExZWY2OTJjCj4gPj4gLS0tIC9k
ZXYvbnVsbAo+ID4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hdXhk
aXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sCj4gPj4gQEAgLTAsMCArMSw5MiBAQAo+ID4+ICsj
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vci1sYXRlciBPUiBCU0QtMi1DbGF1
c2UpCj4gPj4gKyVZQU1MIDEuMgo+ID4+ICstLS0KPiA+PiArJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9hdXhkaXNwbGF5L3RpdGFubWVjLHRtMTYyOC55YW1sIwo+ID4+ICskc2No
ZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiA+PiAr
Cj4gPj4gK3RpdGxlOiBUaXRhbiBNaWNybyBFbGVjdHJvbmljcyBUTTE2MjggTEVEIGNvbnRyb2xs
ZXIKPiA+PiArCj4gPj4gK21haW50YWluZXJzOgo+ID4+ICsgIC0gQW5kcmVhcyBGw6RyYmVyIDxh
ZmFlcmJlckBzdXNlLmRlPgo+ID4+ICsgIC0gSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdt
YWlsLmNvbT4KPiA+PiArCj4gPj4gK2FsbE9mOgo+ID4+ICsgIC0gJHJlZjogL3NjaGVtYXMvc3Bp
L3NwaS1wZXJpcGhlcmFsLXByb3BzLnlhbWwjCj4gPj4gKwo+ID4+ICtwcm9wZXJ0aWVzOgo+ID4+
ICsgIGNvbXBhdGlibGU6Cj4gPj4gKyAgICBjb25zdDogdGl0YW5tZWMsdG0xNjI4Cj4gPj4gKwo+
ID4+ICsgIHJlZzoKPiA+PiArICAgIG1heEl0ZW1zOiAxCj4gPj4gKwo+ID4KPiA+PiArICBncmlk
Ogo+ID4+ICsgICAgZGVzY3JpcHRpb246Cj4gPj4gKyAgICAgIE1hcHBpbmcgb2YgZGlzcGxheSBk
aWdpdCBwb3NpdGlvbiB0byBncmlkIG51bWJlci4KPiA+PiArICAgICAgVGhpcyBpbXBsaWNpdGx5
IGRlZmluZXMgdGhlIGRpc3BsYXkgc2l6ZS4KPiA+PiArICAgICRyZWY6IC9zY2hlbWFzL3R5cGVz
LnlhbWwjL2RlZmluaXRpb25zL3VpbnQ4LWFycmF5Cj4gPj4gKyAgICBtaW5JdGVtczogMQo+ID4+
ICsgICAgbWF4SXRlbXM6IDcKPiA+PiArCj4gPj4gKyAgc2VnbWVudC1tYXBwaW5nOgo+ID4+ICsg
ICAgZGVzY3JpcHRpb246Cj4gPj4gKyAgICAgIE1hcHBpbmcgb2YgNyBzZWdtZW50IGRpc3BsYXkg
c2VnbWVudHMgQS1HIHRvIGJpdCBudW1iZXJzIDEtMTIuCj4gPj4gKyAgICAkcmVmOiAvc2NoZW1h
cy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50OC1hcnJheQo+ID4+ICsgICAgbWluSXRlbXM6
IDcKPiA+PiArICAgIG1heEl0ZW1zOiA3Cj4gPgo+ID4gQXJlIHRoZXNlIHByb3BlcnRpZXMgdXNl
ZnVsIGZvciBhbnkgNyBzZWdtZW50IGRpc3BsYXkgb3Igc3BlY2lmaWMgdG8KPiA+IHRoaXMgY29u
dHJvbGxlcj8KPiA+Cj4gQm90aCBhcmUgY29udHJvbGxlci1zcGVjaWZpYy4gRS5nLiB0aGUgZnVu
Y3Rpb25hbGx5IHNpbWlsYXIgZHJpdmVyCj4gaHQxNmszMyB1c2VzIGRpZmZlcmVudCBwcm9wZXJ0
aWVzLgoKVGhlbiB0aGV5IGJvdGggbmVlZCBhIHZlbmRvciBwcmVmaXguCgo+ID4gVGhlIGNvbW1p
dCBtc2cgbWVudGlvbnMgMTEgc2VnbWVudCBkaXNwbGF5LiBEb2VzIHRoaXMgbmVlZCB0byBiZT86
Cj4gPgo+ID4gb25lT2Y6Cj4gPiAgIC0gbWluSXRlbXM6IDcKPiA+ICAgICBtYXhJdGVtczogNwo+
ID4gICAtIG1pbkl0ZW1zOiAxMQo+ID4gICAgIG1heEl0ZW1zOiAxMQo+ID4KPiBUaGUgY29udHJv
bGxlciB3b3VsZCBiZSBhYmxlIHRvIGRyaXZlIDExIHNlZ21lbnRzLCBidXQgdGhlIGRyaXZlcgo+
IHN1cHBvcnRzIDcgc2VnbWVudHMgb25seSAoYXQgbGVhc3QgZm9yIG5vdykuIFRoZXJlZm9yZSBh
IDExIHNlZ21lbnQKPiBkaXNwbGF5IGNhbiBiZSB1c2VkLCBidXQgb25seSB0aGUgNyBzZWdtZW50
IHBhcnQgd2lsbCBiZSBhY3RpdmUuCj4gQWxsIGRldmljZXMgd2l0aCB0aGlzIGNvbnRyb2xsZXIg
SSd2ZSBzZWVuIGFuZCBoZWFyZCBvZiBoYXZlCj4gNyBzZWdtZW50IGRpc3BsYXlzLgoKQmluZGlu
Z3Mgc2hvdWxkIGJlIGNvbXBsZXRlLCBub3QganVzdCB3aGF0IGEgcGFydGljdWxhciB2ZXJzaW9u
IG9mIGEKZHJpdmVyIHN1cHBvcnRzLiBIb3dldmVyLCBpZiBhbGwga25vd24gaC93IGlzIGp1c3Qg
NyBzZWcsIHRoZW4gaXQgaXMKZmluZS4KClJvYgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

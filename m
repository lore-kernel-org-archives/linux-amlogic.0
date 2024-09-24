Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282D3CF9C6B
	for <linux-amlogic@archiver.kernel.org>; Tue, 24 Sep 2024 13:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h7Jp5w/oc4WdKYjJTlIkGnz/zM+V5f0yNOYVb/cvIUg=; b=COEsEsInusFj/y
	nrmKF8UOLGqwLWPw82+E+f4a3YTz5Eq7ZNrqdh0Qfp+5E0HuODz6obz0A3NwgqibdgWzSZttb36kZ
	EoBLfYAxYYD35cmbdzzKlsDm7ffu1pcnwEai4RSlrTxVdozLE5Mkxct0oAAWAo3HghAictr710hJ5
	brnxChzjNjbU9/JcxqnJcl/X2Yb9mnGXcw8SrwkpITixyhauuoLCQcpC4nCLM3Mx6p4NxFCVHCXMH
	ALneJQxkIo/VeQAup/xo01jschWcT6PEoZ976gklcXudds0JQzJ3sCld1z4i3xG78YucYvSYzSx+b
	/eKaZ9VOe75hqGvk0G0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st5hy-00000002RuA-0QBd;
	Tue, 24 Sep 2024 13:36:02 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st5hu-00000002Rt7-46Yc
	for linux-amlogic@lists.infradead.org;
	Tue, 24 Sep 2024 13:36:01 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42cb1e623d1so53285605e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 24 Sep 2024 06:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727184957; x=1727789757; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3E6b+gVIkbGGzSkS722nePILW289klIZmg9uMPH6KhA=;
        b=OxRE1t/lHy/W3UGR4M/JBTKZ2I/1hUOK8AhYGqAXUtg5KaJ7oJLEQOnSzjWKwcBZje
         2XtZEJulstNDiWcwip+JXk9hnbXx3ZAqSekkuuffFzl511hZNHRfoLYjztQ7pvjwIwbk
         IBj2QjiwuiXCvyTbXK41Eni4QBwJ82Yygw6+0ApOH2qIz9vXxa+/2x1/zbmkAyesqhh4
         I4NX0P9WcY5RbrhGwEkQnjOBmht2MBnInu/YK2IHFDjD/Wz/LxNdf37KFnzN0UGNG/uL
         d9EiHrnv4xyi/vwsUcI8GCR/c2r4YPo6/bQX1sJUscakBt6LCGnxBPXa4exW9B+Jg2hM
         58dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727184957; x=1727789757;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E6b+gVIkbGGzSkS722nePILW289klIZmg9uMPH6KhA=;
        b=W7CFikGh0hWPuKbO5DHeAfD79mICETyhwiUyS+bFj7rXj9GXNuOwiJzTyuHFUILN6E
         Jb2qnKaMuQR8c4/YZ9gBaT1yGvJOZx5TgDMvg0HxsK0J0rOy6xOjgf5aODGwDV7uLI5z
         kvJ97PmMLVuSPZLn/JY0tDFjNFkXTsCgfBlEJkYLxTU7jP491dlTSZLhuBMzjKZys1R9
         ctUlgXsQJeZDv0UQqyDhF2FW3nbodW1t4W7+sz3CBjd6oVMXIz/FAXHs/FDO46iDgDIb
         rPNBedJmU7VwPjjglDEBrgPKF8L/2Q3V434Q7Qo3VZUqpzUsrMOVTm66IbBG6St5yLKy
         QFyA==
X-Forwarded-Encrypted: i=1; AJvYcCUpBJoCjS7fdbLop1SlsRZPvjye3A0VarKHyHowzeRZ564KYRgwDL9ZhkZs4aaVt++iYwpa9o3uqe0q5oxG@lists.infradead.org
X-Gm-Message-State: AOJu0YyugTS6i5TmKW5pOr3iJyXBkh3NxmI1DmonLTQlhbobTVTMnNt4
	b9NmpbpKaQMv9A3OUB1dZa6WiDuC5fup3IEnyipLUUCC1luEwUHKAqy5lbmDu6w=
X-Google-Smtp-Source: AGHT+IGBgky4n9wPxuyc6QNRHlbrRzfXmDQaavcvSD3rrUDX/VSO0yvgDNj5ySKrNuM0F3m0fGobvg==
X-Received: by 2002:a05:600c:470d:b0:42c:b63e:fea6 with SMTP id 5b1f17b1804b1-42e7ada50d8mr130393715e9.22.1727184956966;
        Tue, 24 Sep 2024 06:35:56 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:e1a:2f3f:4335:573b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e9029eec6sm22472085e9.21.2024.09.24.06.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 06:35:56 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Chuan Liu <chuan.liu@amlogic.com>
Cc: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>,  Neil
 Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-amlogic@lists.infradead.org,
  linux-clk@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: meson: pll: Update the meson_clk_pll_init
 execution judgment logic
In-Reply-To: <e458a1c6-5e85-4ecd-a21a-3407a6dd832b@amlogic.com> (Chuan Liu's
	message of "Tue, 24 Sep 2024 18:27:04 +0800")
References: <20240920-optimize_pll_flag-v1-1-c90d84a80a51@amlogic.com>
	<1jy13hxwp2.fsf@starbuckisacylon.baylibre.com>
	<e458a1c6-5e85-4ecd-a21a-3407a6dd832b@amlogic.com>
Date: Tue, 24 Sep 2024 15:35:55 +0200
Message-ID: <1jtte5xjgk.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_063559_178249_6586790B 
X-CRM114-Status: GOOD (  38.78  )
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

T24gVHVlIDI0IFNlcCAyMDI0IGF0IDE4OjI3LCBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4gd3JvdGU6Cgo+IE9uIDIwMjQvOS8yNCAxNjo1MCwgSmVyb21lIEJydW5ldCB3cm90ZToK
Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+Cj4+IE9uIEZyaSAyMCBTZXAgMjAyNCBhdCAxNjoxMywg
Q2h1YW4gTGl1IHZpYSBCNCBSZWxheSA8ZGV2bnVsbCtjaHVhbi5saXUuYW1sb2dpYy5jb21Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4+Cj4+PiBGcm9tOiBDaHVhbiBMaXUgPGNodWFuLmxpdUBhbWxvZ2lj
LmNvbT4KPj4+Cj4+PiBUaGUgaGFyZHdhcmUgcHJvcGVydHkgb2YgUExMIGRldGVybWluZXMgdGhh
dCBQTEwgY2FuIG9ubHkgYmUgZW5hYmxlZAo+Pj4gYWZ0ZXIgUExMIGhhcyBiZWVuIGluaXRpYWxp
emVkLiBJZiBQTEwgaXMgbm90IGluaXRpYWxpemVkLCB0aGUKPj4+IGNvcnJlc3BvbmRpbmcgbG9j
ayBiaXQgd2lsbCBub3QgYmUgc2V0IHRvIDEsIHJlc3VsdGluZyBpbgo+Pj4gbWVzb25fY2xrX3Bs
bF9pc19lbmFibGVkKCkgcmV0dXJuaW5nICJmYWxzZSIuCj4+Pgo+Pj4gVGhlcmVmb3JlLCBpZiBQ
TEwgaXMgYWxyZWFkeSBlbmFibGVkLCB0aGVyZSBpcyBubyBuZWVkIHRvIHJlcGVhdAo+Pj4gaW5p
dGlhbGl6YXRpb24sIGFuZCB0aGUganVkZ21lbnQgIkNMS19NRVNPTl9QTExfTk9JTklUX0VOQUJM
RUQiIGluCj4+PiBtZXNvbl9jbGtfcGxsX2luaXQoKSBhcHBlYXJzIHJlZHVuZGFudC4KPj4gQXBw
YXJlbnRseSB5b3UgbWVzc2VkIHNvbWV0aGluZyB1cCB3aXRoIGI0IC4uLgo+Cj4KPiBlbW1tbS4u
LiBJJ20gbm90IGZhbWlsaWFyIHdpdGggdGhpcyB0b29s8J+Yggo+Cj4KPj4+IC0tLQo+Pj4gVGhl
IGhhcmR3YXJlIHByb3BlcnR5IG9mIFBMTCBkZXRlcm1pbmVzIHRoYXQgUExMIGNhbiBvbmx5IGJl
IGVuYWJsZWQKPj4+IGFmdGVyIFBMTCBoYXMgYmVlbiBpbml0aWFsaXplZC4gSWYgUExMIGlzIG5v
dCBpbml0aWFsaXplZCwgdGhlCj4+PiBjb3JyZXNwb25kaW5nIGxvY2sgYml0IHdpbGwgbm90IGJl
IHNldCB0byAxLCByZXN1bHRpbmcgaW4KPj4+IG1lc29uX2Nsa19wbGxfaXNfZW5hYmxlZCgpIHJl
dHVybmluZyAiZmFsc2UiLgo+Pj4KPj4+IFRoZXJlZm9yZSwgaWYgUExMIGlzIGFscmVhZHkgZW5h
YmxlZCwgdGhlcmUgaXMgbm8gbmVlZCB0byByZXBlYXQKPj4+IGluaXRpYWxpemF0aW9uLCBhbmQg
dGhlIGp1ZGdtZW50ICJDTEtfTUVTT05fUExMX05PSU5JVF9FTkFCTEVEIiBpbgo+Pj4gbWVzb25f
Y2xrX3BsbF9pbml0KCkgYXBwZWFycyByZWR1bmRhbnQuCj4KPgo+IFlvdSBoYXZlIGEgcG9pbnQs
IGJ1dCB3ZSBkbyBnZXQgdGhpcyBraW5kIG9mIHNpdHVhdGlvbiBhbGwgdGhlIHRpbWU6Cj4KPiBG
b3IgZXhhbXBsZSwgaGlmaV9wbGwgcHJvdmlkZXMgYSBjbG9jayBmb3IgYXVkaW8sIHdoaWNoIG5l
ZWRzIHRvIGJlCj4gY29uZmlndXJlZAo+Cj4gaW4gdGhlIGJvb3Rsb2FkZXIgcGhhc2UgaW4gb3Jk
ZXIgdG8gcGxheSBhdWRpbyBhcyBzb29uIGFzIHBvc3NpYmxlIGFmdGVyCj4gYm9vdC4KPgo+IEFm
dGVyIGVudGVyaW5nIHRoZSBrZXJuZWwsIHRoZSBoaWZpX3BsbCBmcmVxdWVuY3kgbWF5IGJlIGR5
bmFtaWNhbGx5Cj4gYWRqdXN0ZWQKCldoYXRldmVyIHdhcyBmZWVkaW5nIHRoZSBhdWRpbyBmaWZv
IGlzIGdvbmUgYnkgdGhhdCBzdGFnZSBhbmQgZmlmbywgdGRtCmFuZCBldmVyeXRoaW5nIHdpbGwg
YmUgcmVzZXQgYXMgc29vbiB0aGUgYXVkaW8gZHJpdmVycyBhcmUgcHJvYmVkLgpJIGhhcmRseSBz
ZWUgaG93IGtlZXBpbmcgdGhlIFBMTCBpbml0IHRocm91Z2ggYm9vdCBjb3VsZCBhcHBseSB0byBh
dWRpbywKZXNwZWNpYWxseSB3aXRoIHRoZSB1c2Ugb2YgYXNzaWduZWQtcmF0ZSBpbiBEVC4KCj4K
PiAodG8gbWF0Y2ggdGhlIGF1ZGlvIGJpdCByYXRlL2F1ZGlvIGFuZCB2aWRlbyBzeW5jaHJvbml6
YXRpb24sIGV0Yy4pLiBUaGUKPiBncF9wbGwKPgo+IHRoYXQgcHJvdmlkZXMgdGhlIGNsb2NrIGZv
ciBlTU1DIGFuZCB0aGUgaGRtaV9wbGwgdGhhdCBwcm92aWRlcyB0aGUgY2xvY2sKPiBmb3IKPgo+
IEhETUkgYXJlIGFsbCBjb25maWd1cmVkIGR1cmluZyB0aGUgYm9vdGxvYWRlciBwaGFzZSBhbmQg
Y2Fubm90IGJlIGNvbmZpZ3VyZWQKPgo+IGFzIFJPIGluIHRoZSBrZXJuZWwuCgpIRE1JLCB5b3Ug
cHJlc3VtYWJseSB3YW50IHRvIGF2b2lkIGEgZ2xpdGNoIGluIHZpZGVvIHVudGlsIHlvdSdyZSBy
ZWFkeQp0byByZWNvbmZpZ3VyZSB0aGUgcGlwZWxpbmUuIFRoYXQgd291bGQgYmUgYSB2YWxpZCB1
c2UtY2FzZSBmb3IKQ0xLX01FU09OX1BMTF9OT0lOSVRfRU5BQkxFRC4KCj4KPgo+IE15IGlkZWEg
aXMgdG8gc3RpbGwgZGVzY3JpYmUgdGhlIGluaXRfcmVncyBpbmZvcm1hdGlvbiBpbiB0aGUga2Vy
bmVsIGluIHRoZQo+IGRyaXZlcjoKPgo+IDEpIElmIHRoZSBib290bG9hZGVyIGlzIG5vdCBlbmFi
bGVkLCB0aGUgUExMIHdpbGwgYmUganVkZ2VkIGFzIHVudXNlZAo+IGR1cmluZyB0aGUKPgo+IGJv
b3Rsb2FkZXIgcGhhc2UsIGFuZCB0aGVuIGVudGVyIHRoZSBrZXJuZWwgZm9yIGluaXRpYWxpemF0
aW9uLgo+Cj4gMikgSWYgdGhlIGJvb3Rsb2FkZXIgaGFzIGVuYWJsZWQgUExMLCBpbiBvcmRlciB0
byBlbnN1cmUgY2xvY2sgY29udGludWl0eQo+IGFmdGVyCj4KPiBlbnRlcmluZyB0aGUga2VybmVs
LCBpdCB3aWxsIG5vdCByZXBlYXQgaW5pdGlhbGl6YXRpb24gKHJlLWluaXRpYWxpemF0aW9uCj4g
bWF5IGNhdXNlIHRoZQo+Cj4gbW9kdWxlIHRoYXQgcmVmZXJlbmNlcyBQTEwgdG8gd29yayBhYm5v
cm1hbGx5KS4KCkkgdW5kZXJzdG9vZCB5b3VyIGlkZWEgdGhlIGZpcnN0IHRpbWUgYXJvdW5kLiBJ
IHN0aWxsIGRvIG5vdCBhZ3JlZS4KVXNlIENMS19NRVNPTl9QTExfTk9JTklUX0VOQUJMRUQgaWYg
eW91IG11c3Qga2VlcCBhbiBlbmFibGVkIFBMTCBhbmQKanVzdGlmeSB0aGUgdXNlIHdpdGggYSBw
cm9wZXIgY29tbWVudC4gRm9yIGVNTUMgSSdtIG5vdCBjb252aW5jZWQuCgo+Cj4gQ2FuIHRoZSBj
b3VwbGluZyBiZXR3ZWVuIGJvb3Rsb2FkZXIgYW5kIGtlcm5lbCBiZSBhdm9pZGVkIG9uIHRoZSBw
cmVtaXNlIG9mCj4KPiBlbnN1cmluZyBmdW5jdGlvbmFsIGludGVncml0eS4KPgo+Cj4+IElmIHRo
ZSBQTEwgaXMgZW5hYmxlZCwgaXQgaGFzIGJlZW4gaW5pdGlhbGxpemVkLCB0byBzb21lIGV4dGVu
dAo+PiB5ZXMuIEhvd2V2ZXIgd2UgaGF2ZSBubyBpZGVhIHdoYXQgdGhlIHNldHRpbmcgd2FzLiBJ
biBnZW5lcmFsLCBJIHJlYWxseQo+PiBkb24ndCBsaWtlIGluaGVyaXRpbmcgc2V0dGluZ3MgZnJv
bSBib290bG9hZGVyLiBJdCBicmluZ3MgYWxsIHNvcnRzIG9mCj4+IGlzc3VlcyBkZXBlbmRpbmcg
b24gdGhlIGJvb3Rsb2FkZXIgb3JpZ2luIGFuZCB2ZXJzaW9uIHVzZWQgYnkgdGhlCj4+IHNwZWNp
ZmljIHBsYXRmb3JtLgo+Pgo+PiBTbyBpbiBnZW5lcmFsIGEgUExMIHNob3VsZCBiZSByZS1pbml0
aWFsaXplZCB3aGVuIHBvc3NpYmxlLiBXaGVuIGl0IGlzCj4+IG5vdCBwb3NzaWJsZSwgaW4gbW9z
dCBjYXNlIGl0IG1lYW5zIHRoZSBQTEwgc2hvdWxkIGJlIFJPIGFuZCBsaW51eAo+PiBzaG91bGQg
anVzdCB1c2UgaXQuCj4+Cj4+IFNvbWVvbmUgYnJvdWdodCBhIHNwZWNpZmljIGNhc2UgaW4gYmV0
d2Vlbiwgd2hlcmUgdGhleSBuZWVkZWQgdG8ga2VlcAo+PiB0aGUgUExMIG9uIGJvb3QsIGJ1dCBz
dGlsbCBiZSBhYmxlIHRvIHJlbG9jayBpdCBsYXRlciBvbi4gVGhlIGZsYWcKPj4gcHJvcGVybHkg
aWRlbnRpZnkgdGhvc2UgUExMcy4gTXVjaCBsaWtlIENMS19JU19DUklUSUNBTCBvcgo+PiBDTEtf
SUdOT1JFX1VOVVNFRCwgZWFjaCB1c2FnZSBzaGFsbCBiZSBwcm9wZXJseSBkb2N1bWVudGVkLgo+
Pgo+Pj4gSW4gYWN0dWFsIGFwcGxpY2F0aW9uIHNjZW5hcmlvcywgUExMIGNvbmZpZ3VyYXRpb24g
aXMgZGV0ZXJtaW5lZCBkdXJpbmcKPj4+IHRoZSBib290bG9hZGVyIHBoYXNlLiBJZiBQTEwgaGFz
IGJlZW4gY29uZmlndXJlZCBkdXJpbmcgdGhlIGJvb3Rsb2FkZXIKPj4+IHBoYXNlLCB5b3UgbmVl
ZCB0byBhZGQgYSBmbGFnIHRvIHRoZSBrZXJuZWwgdG8gYXZvaWQgUExMCj4+PiByZS1pbml0aWFs
aXphdGlvbiwgd2hpY2ggd2lsbCBpbmNyZWFzZSB0aGUgY291cGxpbmcgYmV0d2VlbiB0aGUga2Vy
bmVsCj4+PiBhbmQgdGhlIGJvb3Rsb2FkZXIuCj4+IFRoZSB2YXN0IG1ham9yaXR5IG9mIHRob3Nl
IFBMTCBzaG91bGQgYmUgUk8gdGhlbi4KPj4gSWYgeW91IGNhbiByZWxvY2sgaXQsIHlvdSBzaG91
bGQgYmUgYWJsZSB0byByZS1pbml0IGl0IGFzIHdlbGwuCj4KPgo+IHJlLWluaXQgbWF5IGNhdXNl
IGdsaXRjaCBpbiB0aGUgUExMLCB3aGljaCBhZmZlY3RzIG1vZHVsZSB3b3JrIGF0IGxhdGVyIFBM
TAo+IGxldmVscy4KPgo+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBDaHVhbiBMaXUgPGNodWFuLmxpdUBh
bWxvZ2ljLmNvbT4KPj4+IC0tLQo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmMgfCAz
ICstLQo+Pj4gICBkcml2ZXJzL2Nsay9tZXNvbi9jbGstcGxsLmggfCAxIC0KPj4+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9jbGsvbWVzb24vY2xrLXBsbC5jIGIvZHJpdmVycy9jbGsvbWVzb24vY2xr
LXBsbC5jCj4+PiBpbmRleCA4OWYwZjA0YTE2YWIuLjhkZjJhZGQ0MGI1NyAxMDA2NDQKPj4+IC0t
LSBhL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuYwo+Pj4gKysrIGIvZHJpdmVycy9jbGsvbWVz
b24vY2xrLXBsbC5jCj4+PiBAQCAtMzE2LDggKzMxNiw3IEBAIHN0YXRpYyBpbnQgbWVzb25fY2xr
X3BsbF9pbml0KHN0cnVjdCBjbGtfaHcgKmh3KQo+Pj4gICAgICAgICAqIEtlZXAgdGhlIGNsb2Nr
IHJ1bm5pbmcsIHdoaWNoIHdhcyBhbHJlYWR5IGluaXRpYWxpemVkIGFuZCBlbmFibGVkCj4+PiAg
ICAgICAgICogZnJvbSB0aGUgYm9vdGxvYWRlciBzdGFnZSwgdG8gYXZvaWQgYW55IGdsaXRjaGVz
Lgo+Pj4gICAgICAgICAqLwo+Pj4gLSAgICAgaWYgKChwbGwtPmZsYWdzICYgQ0xLX01FU09OX1BM
TF9OT0lOSVRfRU5BQkxFRCkgJiYKPj4+IC0gICAgICAgICBtZXNvbl9jbGtfcGxsX2lzX2VuYWJs
ZWQoaHcpKQo+Pj4gKyAgICAgaWYgKG1lc29uX2Nsa19wbGxfaXNfZW5hYmxlZChodykpCj4+PiAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPj4gSSdtIG5vdCBPSyB3aXRoIHRoaXMuCj4+Cj4+PiAg
ICAgICAgaWYgKHBsbC0+aW5pdF9jb3VudCkgewo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvY2xr
L21lc29uL2Nsay1wbGwuaCBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuaAo+Pj4gaW5kZXgg
OTQ5MTU3ZmI3YmY1Li5jY2NiZjUyODA4YjEgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL2Nsay9t
ZXNvbi9jbGstcGxsLmgKPj4+ICsrKyBiL2RyaXZlcnMvY2xrL21lc29uL2Nsay1wbGwuaAo+Pj4g
QEAgLTI4LDcgKzI4LDYgQEAgc3RydWN0IHBsbF9tdWx0X3JhbmdlIHsKPj4+ICAgICAgICB9Cj4+
Pgo+Pj4gICAjZGVmaW5lIENMS19NRVNPTl9QTExfUk9VTkRfQ0xPU0VTVCAgQklUKDApCj4+PiAt
I2RlZmluZSBDTEtfTUVTT05fUExMX05PSU5JVF9FTkFCTEVEIEJJVCgxKQo+Pj4KPj4+ICAgc3Ry
dWN0IG1lc29uX2Nsa19wbGxfZGF0YSB7Cj4+PiAgICAgICAgc3RydWN0IHBhcm0gZW47Cj4+Pgo+
Pj4gLS0tCj4+PiBiYXNlLWNvbW1pdDogMGVmNTEzNTYwYjUzZDQ5OWM4MjRiNzcyMjBjNTM3ZWFm
ZTFkZjkwZAo+Pj4gY2hhbmdlLWlkOiAyMDI0MDkxOC1vcHRpbWl6ZV9wbGxfZmxhZy02NzhhODhk
MjNmODIKPj4+Cj4+PiBCZXN0IHJlZ2FyZHMsCj4+IC0tCj4+IEplcm9tZQoKLS0gCkplcm9tZQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

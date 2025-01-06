Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A44D8E77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aTlAXskPdLCLPhtOtETM1sl6vQuafCeziGjfq1XE2NQ=; b=oJKYYtCBz3xAj2
	QBHAmnd9jxtxW4RLbaUcccnILqu39XQtCk7elneoWaCWEFibVN4qilou3dVVRv1FWiGa2UiP7IyIv
	AwT+pCKdgu5Ogkkiq/ModLhnQgky9xaZaSdSSFhni2JdM5kwb87mgCqdL77130ok47D7ZJgCtsVc0
	tqXOQ1VTQkGcpgu8J/8tY3fyQF+GEWc0gT/ZtwuM09JBOXZlrp0fVgj5AHYESvrVJoVxY6FoHERB1
	Mq+JcDQTBf1roaNZyX8xojwZM1exkaiJI4HGY5vZhke55tc3POINAcb428Yq1JcUFbP5r18/ReW+p
	zWUVo04tyruZUcJlUzTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoSM-00000001eZA-3fBe;
	Mon, 06 Jan 2025 14:51:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUnJY-00000001Qah-0gRI;
	Mon, 06 Jan 2025 13:38:41 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21661be2c2dso187535235ad.1;
        Mon, 06 Jan 2025 05:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736170719; x=1736775519; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=;
        b=Di0xMQZqnfOFv8uh4+iz/29h4Dyhz+sFHKZizGzyWwIJu4CNaRfFzhTKVtfLdTsQx9
         GgXMN0mEVCJv0rVfu4o5k59uKBZ89rfgbxL8NhOyZnRD/xi/y9DATxqb/osZCXQRIOJf
         eJzncSZwE5StpmDKlzCpDRiv9LbXYjt+ZWt7pe7ZLxMHqI+kbmFTvUnE0kWnvbO5m65u
         3N/uaSZ/xh0JtH128+Xv//I+lU2/dxo8UFAZkSt08ZSNe7SJpeBfDrb2JioenRcuffcy
         LZ7Nx1y1Du8uVaIkGcicMXVu9Szq03OXOjnGF7kWj7llpeMDwZdlVJMzWI2jqXNP4A+v
         l8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170719; x=1736775519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wu/duhkbgGlNJWz7ztxoYWw979ezogxfVeEKKcsMTTk=;
        b=Fwn16TyDJy5lpn9D9i5Akju9BTe2RFW+uHsW1OHn1rfkcQAqNqfKWnDE3U/JeWfpMY
         4Bv2ByNCHFyfVLKeK4mfei9N94J398Z+R6DaMW6yvO49+CkN0WHjAlFg7FyUugjcNNwK
         5YqM8p8fVsFmRmbVyMvPFJ001TdyXBM7Km4K5ZY+LwCcW7gDpNBcstGFDLc+V8Nprr+F
         lf8GWY/Nx1lBfVqIxkaWlpW8NCbij063JkkEusKJBThAfuNU8x0EWQpFzXN/qbMv0/9/
         HrBSCY1sd9yNYqQDK3bd1shYEjWvwKGQRVWU6fb/BJE4YPjEPcndzn2hMX9ckZPNLQak
         xm7g==
X-Forwarded-Encrypted: i=1; AJvYcCWZpP+cW6gwu2RMgLAvM8GDKtEkKR6kYjQt1eQ0kFx+Boo1gnX87iiOCfbIjsVqTqmX+QAClU3VLFko9g+UVxir@lists.infradead.org
X-Gm-Message-State: AOJu0Ywms2A17JK4HwsOymkfSsR+hci91R4Mo46TXLN9xxBIH78JyYKz
	tDdkx8kfUKNS9ewMoBm4d1S+0B66yAnipe0MYqdkIhYEEWr/MDrkwllNXxqXP8OtOh/lJaDnBP5
	yJ1i1UuFsbbal4zjssZNTY3Ztlgch/bCn
X-Gm-Gg: ASbGncs7Waxslr4TgHxKycW+4EY7r9BH064g/CDDlJMwkDGplgDggFb1V4Dicvo5jgw
	v91UK+PIQ4wSC9SlkpoSITpl7eKfKWgACJPofKPeypGWLRi2ewotn
X-Google-Smtp-Source: AGHT+IHCpyL2RoYltN/Son8caT8kY8aAmajpToxCZK8DLZGGKoPJGKURhGVgsvMDpcmla3l7r6gwPZ0/44HMzZ5UWKg=
X-Received: by 2002:a17:903:98e:b0:215:9bc2:42ec with SMTP id
 d9443c01a7336-219e6f24eecmr837678925ad.47.1736170719510; Mon, 06 Jan 2025
 05:38:39 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com> <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
 <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1j4j2caxds.fsf@starbuckisacylon.baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 14:38:28 +0100
Message-ID: <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_053840_198031_35BB40E3 
X-CRM114-Status: GOOD (  27.74  )
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

SGkgSmVyb21lLAoKT24gTW9uLCBKYW4gNiwgMjAyNSBhdCAyOjI04oCvUE0gSmVyb21lIEJydW5l
dCA8amJydW5ldEBiYXlsaWJyZS5jb20+IHdyb3RlOgo+Cj4gT24gTW9uIDA2IEphbiAyMDI1IGF0
IDEzOjQ5LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1h
aWwuY29tPiB3cm90ZToKPgo+ID4gSGkgSmVyb21lLAo+ID4KPiA+IE9uIE1vbiwgSmFuIDYsIDIw
MjUgYXQgMTE6NDTigK9BTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4gd3Jv
dGU6Cj4gPiBbLi4uXQo+ID4+ID4gSSBoYXZlIGZ1cnRoZXIgdmVyaWZpZWQgdGhhdCB0aGUgZ3gt
Y2FyZCBwYXJzaW5nIGRvZXMgZmluZCB0aGUgSERNaQo+ID4+ID4gY29udHJvbGxlciBhbmQgbGlu
a3MgaXQgY29ycmVjdGx5Lgo+ID4+ID4gVG8gbWUgaXQncyBvZGQgdGhhdCBvbmx5IHRoZSAucHJl
cGFyZSgpIGNhbGxiYWNrIGlzIG5vdCBjYWxsZWQsIGFsbAo+ID4+ID4gb3RoZXJzIChhcyBtZW50
aW9uZWQgYWJvdmU6IC5od19wYXJhbXMsIC5zdGFydHVwLCAuLi4pIGFyZSB3b3JraW5nCj4gPj4g
PiBmaW5lLgo+ID4+Cj4gPj4gSSB0aGluayB0aGUgcHJvYmxlbSB5b3UgYXJlIHNlZWluZyBjb21l
cyBmcm9tIHRoZSBxdWlyayBvZgo+ID4+IGNvZGVjLXRvLWNvZGVjIGxpbmtzLiBUaGUgaGRtaSBj
b2RlYyBsaW5rIGlzIHN1Y2ggYSBsaW5rIG9uIEFtbG9naWMKPiA+PiBiZWNhdXNlIGZ1cnRoZXIg
ZGlnaXRhbCByb3V0aW5nIGlzIHJlcXVpcmVkIGFmdGVyIHRoZSBiYWNrZW5kLgo+ID4+Cj4gPj4g
VGhvc2UgdHlwZSBvZiBsaW5rcyBhcmUgbm90IHVzZWQgbXVjaCBiZXNpZGUgc29tZQo+ID4+IENQ
VSBvZmZsb2FkaW5nIG9uIFNhbXN1bmcgYW5kIEFtbG9naWMsIGFzIGZhciBhcyBJIGtub3cuCj4g
Pj4gSXQgaXMgcG9zc2libGUsIGV2ZW4gbGlrZWx5LCB0aGF0IHRoaW5ncyBhcmUgc3RpbGwgbWlz
c2luZyB0aGVyZS4KPiA+Pgo+ID4+IFNvIHRob3NlIEMyQyBsaW5rcyBhcmUgb3BlcmF0ZWQgYnkg
dGhlIERBUE0gZXZlbnRzLCBub3QgdGhlIHJlZ3VhbGFyCj4gPj4gQVNvQyBjb2RlLiBZb3UgY2Fu
IHN0YXJ0IGhlcmU6Cj4gPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvc291bmQvc29jL3NvYy1kYXBtLmMjbjM5
OTUKPiA+IFRoYW5rIHlvdSAtIHRoYXQgaXMgaW5kZWVkIHRoZSByb290IGNhdXNlIQo+ID4KPiA+
PiBZb3UnbGwgc2VlIHRoYXQgLnByZXBhcmUoKSBpcyBub3QgY2FsbGVkLCBzYW1lIGFzIC50cmln
Z2VyKCkKPiA+PiBUaGF0IHNob3VsZCBwcm9wYWJseSBiZSBmaXhlZCA6Lwo+ID4gU2luY2UgSSdt
IHN0aWxsIHZlcnkgbXVjaCBjbHVlbGVzcyBhYm91dCBhbGwgb2YgdGhpcyBJIGp1c3QgY2FtZSB1
cAo+ID4gd2l0aCBhbiBleHBlcmltZW50YWwgcGF0Y2guIEFueSBmZWVkYmFjayBvbiBpdCBpcyB3
ZWxjb21lIChJIGNhbiBzZW5kCj4gPiBpdCBhcyBSRkMgcGF0Y2ggLSBidXQgcHJlcGFyZSBmb3Ig
bWUgbmVlZGluZyBzdXBwb3J0KS4KPgo+IEl0IGlzIHByb2JhYmx5IGEgZ29vZCBpZGVhIHRvIHNl
bmQgaXQgdG8gZ2V0IG1vcmUgZmVlZGJhY2ssIHllcy4KU3VyZSwgSSdsbCBkbyB0aGF0IGxhdGVy
IGFuZCBrZWVwIHlvdSBDYydlZC4KCj4gPiBXaXRoIHRoZSBhdHRhY2hlZCBwYXRjaCBJIG5vdyBz
ZWUgaGRtaS1jb2RlYydzIC5wcmVwYXJlIGNhbGxiYWNrIGJlaW5nIGNhbGxlZDoKPgo+IExvb2tz
IGxpa2UgYSBnb29kIHN0YXJ0IDopCj4KPiBDb3VwbGVzIG9mIG5pdHBpY2tzOgo+Cj4gWW91IG1p
Z2h0IHdhbnQgdG8gY2hlY2sgdGhlIHN0cmVhbSB2YWxpZGl0eSBpbgo+IHRoZSBmdW5jdGlvbiB5
b3UndmUgaW50cm9kdWNlZCwgbGlrZSBpbiBzb2NfZGFpX3RyaWdnZXIoKQpzbmRfc29jX2RhaV9o
d19wYXJhbXMoKSBkb2Vzbid0IGNoZWNrIGl0IGVpdGhlciBidXQgc25kX3NvY19kYWlfc3RhcnR1
cCgpIGRvZXMuCgo+IEl0IG1heSBhbHNvIGJlIG5pY2UgdG8gdXBkYXRlIHNuZF9zb2NfcGNtX2Rh
aV9wcmVwYXJlKCkgd2l0aCB0aGUKPiBpbnRyb2R1Y2VkIGZ1bmN0aW9uLgpBaCwgdGhpcyBvbmUg
aXMgYWxzbyBjaGVja2luZyBmb3Igc3Vic3RyZWFtIHZhbGlkaXR5LiBUaGF0IGV4cGxhaW5zCnlv
dXIgcHJldmlvdXMgc3VnZ2VzdGlvbiA6LSkKCgpCZXN0IHJlZ2FyZHMsCk1hcnRpbgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBt
YWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=

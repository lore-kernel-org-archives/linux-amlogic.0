Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC6AE77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=frmEx0D4YoJIO2dn4cWO/qWAr2m6ll7/GiaeFKDbiw0=; b=1bkbuCzev78GaE
	OxBor7VlO5JZq0aJ7jSChjpXgpkBLaYNWMjURbzamaHidnVJMXfDQe3sQlz5m3GStaHnZ6Ln3j8/M
	iGrePjbbONscpkE6y8q0Mc3EoIRxKYPM1EKiLlpUWIox/dqHKJjgOjFh4c+0skvEe9K8e7Mvq4y0x
	9Vn03Qh00zV6FoSW3wr/X7W6fHG8Lx1yTtdB2ZpoHBEVzTIAoHcxuzSXVdzM5wlLzN0Ri26M2n/di
	amGDzOjHQO4b7q0OMs4r1X/hvz7RBtZ5306Y9TbFAU/zufGdRLt4qJc3gnrwpo15lu8UQDcFUuZ99
	ZswpsLfQCBWb0vBXcwzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUntR-00000001X7u-3mCV;
	Mon, 06 Jan 2025 14:15:45 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUntQ-00000001X7Q-1DPP;
	Mon, 06 Jan 2025 14:15:45 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-218c8aca5f1so8342655ad.0;
        Mon, 06 Jan 2025 06:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1736172943; x=1736777743; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=;
        b=CtyEl+sNuaBtixdC54jSU8ZK+Z+t5dtAVy/Lmp4uf6LWM8B77HzlKC4Zd6lbaaNYC2
         ZsHndk51fmEkjyhr33Dh3LWkMRKUnlcxRWP7VFFzPOtV08fvf1N80/IV8PqyUbjYyQq+
         IkVw94cxQ2bsk8UXhgKVu2S2WIdI4Ya+T+20kXiwdaQOnt7LH7xM+6+DJbltG+5GrXZf
         4wjtdarIl1eBMMCM1GchCHOzN/3e9secB0rXQ7ei+yxnEdjlKYSQb3T+mC2ixLn+t1T5
         YmFQ+eHNZB/6N5iwwaS0uJW1eKxbukCsCM7j7nM+ShJ7/F740Nh5ca5s0O9MqzU5JsHi
         YaYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736172943; x=1736777743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MV9fhVZhcNI++rOvHAbbF2f8B7BcQuVm911rXwPeho0=;
        b=h9Mx7o9ePOHa4BUklS+kPftUtv25EYZWDfxzNtQPyo2QJrzMUfBCo+NCN2Kgz2I4ZS
         L7s4nMebymW8D72+uUkuTvYm5yMiLRMAIsJTdcVJ/znKz3aiZXR+SP+r0hNwm0WX61gJ
         2NOaWjlP3pCQ6kicTKIHkheFyk57LwLxRcUZRaLZEMm64iTYoQkI83WaDHwq8uyzK+3X
         M4spenMjSvQKXGzLrKiyWTWqVgvWVG8Cx9cQJKjKgCQ21EnfYU16ax+sNOg07pc5TKuJ
         D3+XCThFrtBCuVkHgkYnRLGVxozlHnsG9+eXacaUwiMhXR+ZBMkwLWsgPc+sRVWawpTQ
         z3WA==
X-Forwarded-Encrypted: i=1; AJvYcCUc1ZQU9SlL49Ypu9VV9ehAnQreNBtFfs5Gqnp2EBrj9pM28CZAeaXUdc1aN2AmbrK2yCdvx8T436kjcdlxV440@lists.infradead.org
X-Gm-Message-State: AOJu0YwVMX0h2Xg9rWZCYcKz0vAbMj9VD9k2gdWingNM0AGJgaPS491S
	lOAbw8b9iVUZ2e/N0FVBmK2RWte/Yg8kmQPXz6jDtRR8eS/9x8HU5l7IXH6DxjlONGVyCACgAXM
	cvVg48dEO5V7adRzNxUR93MpYhgc=
X-Gm-Gg: ASbGncsRNZ9svWu5wP2yJ3CHJW/IrVZFAUrObjl+/CXntLEECZGceilqoaXcid7yMo5
	zgG1xllM8KgKHV/A6IavGAvl2MN81dS0EBQSQNoFQlswHKXKzzYc7
X-Google-Smtp-Source: AGHT+IFEBZJtpqODTcd07D9FVHGKDHkir6SlF3wADzh7P9HVYIG39voEOtEnlLVDhzsY1eefQ0fPozBDVZGOUWxSTaw=
X-Received: by 2002:a17:902:fc84:b0:216:356b:2685 with SMTP id
 d9443c01a7336-219e6e8bb95mr915796815ad.11.1736172943446; Mon, 06 Jan 2025
 06:15:43 -0800 (PST)
MIME-Version: 1.0
References: <CAFBinCDdiJ3UNVUcShjq=7U2=oUwT3ciYdKSuZ5TdcrikxFBpg@mail.gmail.com>
 <1ja5c4b4rt.fsf@starbuckisacylon.baylibre.com> <CAFBinCCAAZHqrKHyfwHPqk9Ki9nDeGFFQfj34ZF58wj+6AjH-g@mail.gmail.com>
 <1j4j2caxds.fsf@starbuckisacylon.baylibre.com> <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
In-Reply-To: <CAFBinCA2pz+ZeWr2hA-QRwZ5gC70qp=2iqemX5MpyM75cAbJwg@mail.gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 6 Jan 2025 15:15:32 +0100
Message-ID: <CAFBinCBLPFPotAzf_5Pdk1we9ygZdMagOEfnNBKWuCm-20iYHw@mail.gmail.com>
Subject: Re: meson-aiu: HDMI codec .prepare() callback not called
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_061544_328844_7280D7CB 
X-CRM114-Status: GOOD (  24.15  )
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

T24gTW9uLCBKYW4gNiwgMjAyNSBhdCAyOjM44oCvUE0gTWFydGluIEJsdW1lbnN0aW5nbAo8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBIaSBKZXJvbWUsCj4K
PiBPbiBNb24sIEphbiA2LCAyMDI1IGF0IDI6MjTigK9QTSBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0
QGJheWxpYnJlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uIDA2IEphbiAyMDI1IGF0IDEzOjQ5
LCBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2dsZW1haWwuY29t
PiB3cm90ZToKPiA+Cj4gPiA+IEhpIEplcm9tZSwKPiA+ID4KPiA+ID4gT24gTW9uLCBKYW4gNiwg
MjAyNSBhdCAxMTo0NOKAr0FNIEplcm9tZSBCcnVuZXQgPGpicnVuZXRAYmF5bGlicmUuY29tPiB3
cm90ZToKPiA+ID4gWy4uLl0KPiA+ID4+ID4gSSBoYXZlIGZ1cnRoZXIgdmVyaWZpZWQgdGhhdCB0
aGUgZ3gtY2FyZCBwYXJzaW5nIGRvZXMgZmluZCB0aGUgSERNaQo+ID4gPj4gPiBjb250cm9sbGVy
IGFuZCBsaW5rcyBpdCBjb3JyZWN0bHkuCj4gPiA+PiA+IFRvIG1lIGl0J3Mgb2RkIHRoYXQgb25s
eSB0aGUgLnByZXBhcmUoKSBjYWxsYmFjayBpcyBub3QgY2FsbGVkLCBhbGwKPiA+ID4+ID4gb3Ro
ZXJzIChhcyBtZW50aW9uZWQgYWJvdmU6IC5od19wYXJhbXMsIC5zdGFydHVwLCAuLi4pIGFyZSB3
b3JraW5nCj4gPiA+PiA+IGZpbmUuCj4gPiA+Pgo+ID4gPj4gSSB0aGluayB0aGUgcHJvYmxlbSB5
b3UgYXJlIHNlZWluZyBjb21lcyBmcm9tIHRoZSBxdWlyayBvZgo+ID4gPj4gY29kZWMtdG8tY29k
ZWMgbGlua3MuIFRoZSBoZG1pIGNvZGVjIGxpbmsgaXMgc3VjaCBhIGxpbmsgb24gQW1sb2dpYwo+
ID4gPj4gYmVjYXVzZSBmdXJ0aGVyIGRpZ2l0YWwgcm91dGluZyBpcyByZXF1aXJlZCBhZnRlciB0
aGUgYmFja2VuZC4KPiA+ID4+Cj4gPiA+PiBUaG9zZSB0eXBlIG9mIGxpbmtzIGFyZSBub3QgdXNl
ZCBtdWNoIGJlc2lkZSBzb21lCj4gPiA+PiBDUFUgb2ZmbG9hZGluZyBvbiBTYW1zdW5nIGFuZCBB
bWxvZ2ljLCBhcyBmYXIgYXMgSSBrbm93Lgo+ID4gPj4gSXQgaXMgcG9zc2libGUsIGV2ZW4gbGlr
ZWx5LCB0aGF0IHRoaW5ncyBhcmUgc3RpbGwgbWlzc2luZyB0aGVyZS4KPiA+ID4+Cj4gPiA+PiBT
byB0aG9zZSBDMkMgbGlua3MgYXJlIG9wZXJhdGVkIGJ5IHRoZSBEQVBNIGV2ZW50cywgbm90IHRo
ZSByZWd1YWxhcgo+ID4gPj4gQVNvQyBjb2RlLiBZb3UgY2FuIHN0YXJ0IGhlcmU6Cj4gPiA+PiBo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9s
aW51eC5naXQvdHJlZS9zb3VuZC9zb2Mvc29jLWRhcG0uYyNuMzk5NQo+ID4gPiBUaGFuayB5b3Ug
LSB0aGF0IGlzIGluZGVlZCB0aGUgcm9vdCBjYXVzZSEKPiA+ID4KPiA+ID4+IFlvdSdsbCBzZWUg
dGhhdCAucHJlcGFyZSgpIGlzIG5vdCBjYWxsZWQsIHNhbWUgYXMgLnRyaWdnZXIoKQo+ID4gPj4g
VGhhdCBzaG91bGQgcHJvcGFibHkgYmUgZml4ZWQgOi8KPiA+ID4gU2luY2UgSSdtIHN0aWxsIHZl
cnkgbXVjaCBjbHVlbGVzcyBhYm91dCBhbGwgb2YgdGhpcyBJIGp1c3QgY2FtZSB1cAo+ID4gPiB3
aXRoIGFuIGV4cGVyaW1lbnRhbCBwYXRjaC4gQW55IGZlZWRiYWNrIG9uIGl0IGlzIHdlbGNvbWUg
KEkgY2FuIHNlbmQKPiA+ID4gaXQgYXMgUkZDIHBhdGNoIC0gYnV0IHByZXBhcmUgZm9yIG1lIG5l
ZWRpbmcgc3VwcG9ydCkuCj4gPgo+ID4gSXQgaXMgcHJvYmFibHkgYSBnb29kIGlkZWEgdG8gc2Vu
ZCBpdCB0byBnZXQgbW9yZSBmZWVkYmFjaywgeWVzLgo+IFN1cmUsIEknbGwgZG8gdGhhdCBsYXRl
ciBhbmQga2VlcCB5b3UgQ2MnZWQuCnBhdGNoZXMgYXJlIHNlbnQgKHdpdGggeW91ciBmZWVkYmFj
ayBhcHBsaWVkKSwgbGV0J3MgY29udGludWUgaW4gWzBdCgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2xpbnV4LXNvdW5kLzIwMjUwMTA2MTQxMzE2LjM3NTk4NC0xLW1hcnRpbi5ibHVtZW5z
dGluZ2xAZ29vZ2xlbWFpbC5jb20vCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==

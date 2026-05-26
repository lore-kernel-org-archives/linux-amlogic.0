Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E73CD5BC8
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 May 2026 12:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v0IgFv5GyZvLSE3Aqc6j7iqOvt+MnlRkHOm7E+2ETBQ=; b=OVFTQzkd2BYCcX
	NyaYbNTyfJGFzxj1IeeoSWZyPlwPcweOqG7ryEqgef+aDZ0E1SLN7Bw8YG/osoMShvaT6VIGxyE8/
	ixGXRtctQ3PLUGqiyS43g/KG8gr3EWrw5JT6O32VXi3XQhmpv+s1nLOHiDaxnmlQ5rtB0t43WKlSe
	A2fJs9cQqfERWL8brHTirpTAmYmrEeexa70/wxZ7uuh0SvR/H3/v8OhTX/yTB3UniEkveIialyH88
	EG7h2VySU/Z0vtbAbvH4JxrsdnaaXSfo0xMYC83kORonqg5OwHZjPz4lRLkb427MhhFzgaOV6KUyD
	SMp5MNu7d6BiiArvghMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqsS-00000001uaw-1BGo;
	Tue, 26 May 2026 12:27:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRqsO-00000001uZu-1u3x
	for linux-amlogic@lists.infradead.org;
	Tue, 26 May 2026 12:27:18 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-45ed18d8a1bso840372f8f.0
        for <linux-amlogic@lists.infradead.org>; Tue, 26 May 2026 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779798434; x=1780403234; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cGdeRIyed7u9Vu7ldN0+lFeh1o2iiXjimB366st4kA=;
        b=CcmIL+rUSisdJp/fHe2a46OGusZk4YIdcvdXe1LFGHj740VZshQRCAPd+tIuXG9cjD
         w8pGaLTJH/NU4zXuuAOKTgrmRRUG9V1sPM8m5bC4a3+3EU0zV/NaOfm54mLcm2XoeGzq
         UzkjU+M57rL4pEC16w9labH4ZMXXfRMn5jccwh3bu3gZxty6dCOwW47XRpvcc4zX9OF2
         dWfXFHm584ntZDEKDLZAAohMWlLZjjSLhDyrWVZHnXomf034GWoBkm2BrI+7QCUOiDe/
         VOGbWpQ79NidRounmFFjD+2i754u3j7iPnhAQUM34hp4DiVjUGxEXnvRlj1U3zi6rLeB
         GSUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779798434; x=1780403234;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3cGdeRIyed7u9Vu7ldN0+lFeh1o2iiXjimB366st4kA=;
        b=IDoMtOSFPQdKf9pW2D3DyC9qCy8Y3/ci9cYI2+YIvrfKW+NFP0y51QIuPekKELoxgr
         P1sQsXtBW3afXuMv7rNYOwo4VG1D4ah5sR6IuXLuwCHt9b6AeiZgSwBGK0Wl6SaujVgl
         R8KUX7ABuQd8OXn3f7ECwlr2/vASr6E3NPTrf706qsbaa/h4v7r0fik6YHfvq725Fd8q
         qBQkJE4obtauC90cUa7xikGZ88JNjw9Sh69GZHrtVLBge/yb3eUQj/Bsm34VlY+e/DYI
         RtgOgXcC+ayNTGPkZt9G3HhmshyRzdnYyS54PURR+GaevHkUU2QAkgPOdjXrF3f48XDH
         ntbA==
X-Forwarded-Encrypted: i=1; AFNElJ8W0ndxogug8pNdOToyZ6tUG51ryeDkO5rHGdtc41EqE8R0lDLY8wtivwOV2hDD5cCx+8AcmUa2mEDlkZAJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyNs7Fhq9ST+d+QEPdKKGGA2iIAt5qmwbN1F2pEBW6vl/6eNLas
	4MrJr7ntWX+pfDlkzkdfCWwR8ledtOlyf4QU3VDcA+zPLuJ84I0b6MF+V2PZOgw2Hb8=
X-Gm-Gg: Acq92OG+uqOipDdqRyt5tUwMaR1YaR/2u7+Zd+m4rydPE7ZXNQVb4em0Vhbcezisnsh
	Btu7dVk4phaOq9w4/VlYvz9inV2GOCvxgESLC6NmJgr6T/hexRKproPm9bi/1A5ygDPQJYqBG4J
	DiBvnow/rs2Dqvku+cI6GkM0eRH+4+HJWEuV7gakk+toWyj7OV6QSVbDBp1+rwL/oyggIQAPs39
	XUAQKa9cQkwbsRL+BwLa92mwsJC0RZmICDrOhQwSINJSegsMhsRaOmhL5/qhSx0olkiGvbSBn+6
	VkMbeFWJesMbuTVMYlFfJrJVh2Anr7OOBagwTJS7nrFpObp/ZoT/vYaZ1sGB2Y3pKynZT1i+MGI
	D9bNHHzLC+7cXNg+q+Ad78MfCL9L9HLOn48/9/1o3OnXDCVSwLIrH9afFPNkF9wu7wh6fv1m8Ns
	nuAs/byzEq0HhyigosiZ3qL8yRTG/qijXy
X-Received: by 2002:a05:6000:2408:b0:45e:941e:77b3 with SMTP id ffacd0b85a97d-45eb38c9299mr32625100f8f.41.1779798434376;
        Tue, 26 May 2026 05:27:14 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:4a0c:b15a:3467:f4ed])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-45eb6d5cb9asm38009953f8f.27.2026.05.26.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:27:13 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>,  Michael
 Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,
  Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  linux-kernel@vger.kernel.org,
  linux-clk@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 07/10] clk: amlogic: Support POWER_OF_TWO for PLL
 pre-divider
In-Reply-To: <3fda1592-f7d0-4e86-8615-602804673414@amlogic.com> (Jian Hu's
	message of "Tue, 26 May 2026 17:58:19 +0800")
References: <20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com>
	<20260511-b4-a9_clk-v1-7-41cb4071b7c9@amlogic.com>
	<1jy0hm6n7e.fsf@starbuckisacylon.baylibre.com>
	<8d89b669-e72e-4663-9596-999a12922d32@amlogic.com>
	<1jqzn65y9l.fsf@starbuckisacylon.baylibre.com>
	<3fda1592-f7d0-4e86-8615-602804673414@amlogic.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 26 May 2026 14:27:12 +0200
Message-ID: <1ja4tm5pb3.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_052716_539556_C8ABE4CB 
X-CRM114-Status: GOOD (  27.56  )
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

T24gbWFyLiAyNiBtYWkgMjAyNiBhdCAxNzo1OCwgSmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNv
bT4gd3JvdGU6Cgo+IE9uIDUvMjAvMjAyNiAzOjM1IFBNLCBKZXJvbWUgQnJ1bmV0IHdyb3RlOgo+
PiBbIEVYVEVSTkFMIEVNQUlMIF0KPj4KPj4gT24gbWVyLiAyMCBtYWkgMjAyNiBhdCAxMzo0Nywg
SmlhbiBIdSA8amlhbi5odUBhbWxvZ2ljLmNvbT4gd3JvdGU6Cj4+Cj4+PiBPbiA1LzE0LzIwMjYg
MTE6MTEgUE0sIEplcm9tZSBCcnVuZXQgd3JvdGU6Cj4+Pj4gWyBFWFRFUk5BTCBFTUFJTCBdCj4+
Pj4KPj4+PiBPbiBsdW4uIDExIG1haSAyMDI2IGF0IDIwOjQ3LCBKaWFuIEh1IHZpYSBCNCBSZWxh
eSA8ZGV2bnVsbCtqaWFuLmh1LmFtbG9naWMuY29tQGtlcm5lbC5vcmc+IHdyb3RlOgo+Pj4+Cj4+
Pj4+IEZyb206IEppYW4gSHUgPGppYW4uaHVAYW1sb2dpYy5jb20+Cj4+Pj4+Cj4+Pj4+IFRoZSBB
OSBQTEwgcHJlLWRpdmlkZXIgdXNlcyBhIGRpdmlzaW9uIGZhY3RvciBvZiAyXm4gdG8gZW5zdXJl
IGEgY2xvY2sKPj4+Pj4gZHV0eSBjeWNsZSBvZiA1MCUgYWZ0ZXIgcHJlZGl2aXNpb24uCj4+Pj4+
Cj4+Pj4+IEFkZCBmbGFnICdDTEtfTUVTT05fUExMX05fUE9XRVJfT0ZfVFdPJyB0byBpbmRpY2F0
ZSB0aGF0IHRoZSBQTEwKPj4+Pj4gcHJlLWRpdmlkZXIgZGl2aXNpb24gZmFjdG9yIGlzIDJebi4K
Pj4+PiBJIHVuZGVyc3RhbmQgd2hhdCB5b3UgYXJlIGRvaW5nIGhlcmUgYnV0IEkgaGF2ZSB0byBh
c2sgd2h5IHRoaXMgY2FuJ3QgYmUKPj4+PiBpbXBsZW1lbnRlZCB3aXRoIGluZGVwZW5kZW50IGRp
dmlkZXJzIHRoYXQgYWxyZWFkeSBzdXBwb3J0cyBwb3dlciBvZiAyID8KPj4+Cj4+PiBJZiB3ZSB1
c2UgaW5kZXBlbmRlbnQgZGl2aWRlcnMsIHRoZSBuIG1lbWJlciB3b3VsZCBoYXZlIHRvIGJlIHJl
bW92ZWQgZnJvbQo+Pj4gbWVzb25fY2xrX3BsbF9kYXRhLgo+Pj4KPj4+IEhvd2V2ZXIsIG4gaXMg
cmVmZXJlbmNlZCAzNSB0aW1lcyBpbiBjbGstcGxsLmMsIHdoaWNoIG1lYW5zIHdlIHdvdWxkIG5l
ZWQKPj4+IHRvIG1vZGlmeSBhbGwKPj4+IHJlbGF0ZWQgbG9naWMgYWNyb3NzIHRoZSBmaWxlLiBU
aGlzIHdvdWxkIGJlIGEgcmVsYXRpdmVseSBsYXJnZQo+Pj4gY2hhbmdlLgo+PiBZZXMKPj4KPj4+
Cj4+PiBNb3Jlb3ZlciwgZm9yIGFsbCBBbWxvZ2ljIGNoaXBzLCB0aGUgbiBkaXZpZGVyIGlzIGFu
IGluZGlzcGVuc2FibGUgcGFydCBvZgo+Pj4gdGhlIERDTyBjbG9jay4KPj4gVGhlcmUgaXMgaGFy
ZGx5IGEganVzdGlmaWNhdGlvbiBoZXJlCj4+Cj4+PiBUaGUgZGlmZmVyZW5jZSBiZXR3ZWVuIFNv
QyBnZW5lcmF0aW9ucyBpcyBhcyBmb2xsb3dzOgo+Pj4gICAgICBQcmV2aW91cyBTb0NzIFBMTDog
biA9IDEsIDIsIDMsIDQuLi4gKGxpbmVhciBkaXZpZGVyKQo+Pj4gICAgICBBOSBTb0MgUExMOiAg
ICAgICAgICAgIG4gPSAyXjAsIDJeMSwgMl4yLCAyXjMsIDJeNC4uLiAocG93ZXItb2YtdHdvCj4+
PiBkaXZpZGVyKQo+PiBZZXMgdGhhdCB3YXMgZmFpcmx5IG9idmlvdXMKPj4KPj4+IFRoZXJlZm9y
ZSwgc3BsaXR0aW5nIG91dCB0aGUgbiBkaXZpZGVyIGZyb20gdGhlIERDTyBjbG9jayBtaWdodCBu
b3QgYmUgYQo+Pj4gZ29vZCBkZXNpZ24gY2hvaWNlLgo+PiBJJ20gbm90IHN1cmUgSSBhZ3JlZSBh
bmQgeW91J3ZlIG9ubHkgc3RhdGVkIHlvdXIgcG9pbnQgb2YgdmlldyB3aXRob3V0Cj4+IHByb3Zp
ZGluZyBhbnkgdGVjaG5pY2FsIGp1c3RpZmljYXRpb24gaGVyZS4KPj4KPj4gIEZyb20gdGhlIGRh
dGFzaGVldHMgb2YgdGhlIGRpZmZlcmVudCBTb0Mgd2UgaGF2ZSwgdGhlIGRvY3VtZW50ZWQKPj4g
bGltaXRhdGlvbiBpcyBhbHdheXMgdGhlIERDTyBvdXRwdXQgcmF0ZSByYW5nZS4gTm90aGluZyBy
ZWxhdGVkIHRvIG4gKG9yCj4+IG0sIG9yIHRoZSBtdWx0LXJhbmdlIGZvciB0aGF0IG1hdHRlciku
IFRoaXMgaXMgYSBsZWdhY3kgcHJvYmxlbSwgd2UKPj4gc3RhcnRlZCB3aXRoIG1vbm9saXRoaWMg
ZHJpdmVyIGFuZCBzbG93bHkgc2ltcGxpZmllZCBpdC4KPj4KPj4gQXMgZmFyIGFzIEkgY2FuIHNl
ZSBub3csIHJld29ya2luZyB0aGUgUExMIGRyaXZlciB0byBiZSBhIHNpbXBsZQo+PiBtdWx0aXBs
aWVyIGRyaXZlciB3aXRoIHJhbmdlIG91dHB1dCByYXRlIGNvbnN0cmFpbnQgY291bGQgYWN0dWFs
bHkgYmUKPj4gc2ltcGxlciB0aGFuIHRoZSBjdXJyZW50IGNvZGUuIEkgd291bGQgYWxzbyBtYWtl
IHNpbXBsZXIgdG8gYWNjb21vZGF0ZQo+PiBkaWZmZXJlbmNlcyBzdWNoIGFzIHRoZSBvbmUgcHJl
c2VudGVkIGhlcmUuCj4+Cj4+IFVubGVzcyB5b3UgY2FuIHByb3ZpZGUgdGVjaG5pY2FsIHJlYXNv
bnMgd2h5IGdvaW5nIGluIHRoaXMgZGlyZWN0aW9uCj4+IHdvdWxkIGJlIGluY29ycmVjdCwgdGhh
dCdzIHdoZXJlIEknZCBwcmVmZXIgdG8gZ28uCj4+Cj4+PiBbLi4uXQo+Pj4KPj4+IEJlc3QgcmVn
YXJkcywKPj4+Cj4+PiBKaWFuCj4+IC0tCj4+IEplcm9tZQo+Cj4KPiBJIGFncmVlIHRoYXQgaGF2
aW5nIGFuIGluZGVwZW5kZW50IE4gZGl2aWRlciB3b3VsZCBzaW1wbGlmeSB0aGUgUExMIHJhdGUK
PiBjYWxjdWxhdGlvbi4KPgo+IEEgc2VwYXJhdGUgcHJlLWRpdmlkZXIgZm9yIE4gaXMgdGVjaG5p
Y2FsbHkgcG9zc2libGUsIGJ1dCB0aGVyZSBhcmUgc29tZQo+IGhhcmR3YXJlIGNvbnN0cmFpbnRz
IHRoYXQgbmVlZCB0byBiZSBjb25zaWRlcmVkOgo+Cj4gTiA9IDEgaXMgdGhlIHByZWZlcnJlZCBv
cGVyYXRpbmcgbW9kZSBleGNlcHQgYSBmZXcgZml4ZWQtZnJlcXVlbmN5IFBMTHMuCj4gTGFyZ2Vy
IE4gdmFsdWVzIHJlZHVjZSB0aGUgUExMIHBoYXNlIGRldGVjdG9yIGZyZXF1ZW5jeSwgd2hpY2gg
bWF5Cj4gbmVnYXRpdmVseSBpbXBhY3QKPiBqaXR0ZXIgcGVyZm9ybWFuY2UgYW5kIG92ZXJhbGwg
UExMIHN0YWJpbGl0eS4KClVuZGVyc3Rvb2QuIFlvdSBjb3VsZCByZWFsbHkgbWFrZSBhIGRpZmZl
cmVuY2UgYnkgZ29pbmcgZGVlcGVyIGFuZApleHBsYWluaW5nIHdoYXQgdGhvc2UgY29uc3RyYWlu
dHMgYXJlLCBlc3BlY2lhbGx5IHNpbmNlIHlvdSBhc2sgcXVlc3Rpb24KaW50ZXJuYWxseSBhdCBB
bWxvZ2ljLgoKQXQgdGhlIG1vbWVudCB3aGF0IGlzIGRvY3VtZW50ZWQgaXMgYSByYW5nZSByZWdh
cmRpbmcgdGhlIG91dHB1dCByYXRlIG9mCnRoZSBQTExzLiBBIFBMTCBpcyBtYWRlIG9mIGEgcHJl
LWRpdmlkZXIgYW5kIGZyYWN0aW9uYWwgbXVsdGlwbGllci4KYW5kIHlvdSBhcmUgc2F5aW5nIHRo
YXQgZm9yIHRoZSBtdWx0aXBsaWVyIHRvIHdvcmsgYW5kIGxvY2ssIHRoZXJlIGlzCmFjdHVhbGx5
IGEgY29uc3RyYWludCB0aGUgaW5wdXQgcmF0ZSB0b28uCgpJZiB5b3UgY2FuIGRpc2N1c3Mgd2l0
aCB5b3VyIEhXIHRlYW0gYW5kIGNsYXJpZnkgd2hhdCB0aGUgY29uc3RyYWludHMKcmVhbGx5IGFy
ZSwgdGhhdCB3b3VsZCBoZWxwIHRvIGJldHRlciBtb2RlbCB0aGUgUExMLiBJbiB0aGVuIG1vcmUg
bGlrZWx5CmZvciB1cyB0byBmaWd1cmUgb3V0IHRoZSBiZXN0IHdheSB0byBkcml2ZSBpdC4KCgo+
Cj4gQmVjYXVzZSBvZiB0aGlzLCB3ZSBjYW5ub3QgZ3VhcmFudGVlIHN0YWJsZSBzeXN0ZW0gb3Bl
cmF0aW9uIHdoZW4gYXJiaXRyYXJ5Cj4gbGFyZ2VyCj4gTiB2YWx1ZXMgYXJlIHVzZWQuCj4KPiBT
b21lIFBMTHMgcmVxdWlyZSBub24tMSBOIHZhbHVlcyB0byBnZW5lcmF0ZSBzcGVjaWZpYyBmaXhl
ZCBvdXRwdXQKPiBmcmVxdWVuY2llcyBiZWNhdXNlCj4gdGhlIHRhcmdldCByYXRlIGNhbm5vdCBi
ZSBhY2hpZXZlZCB3aXRoIE4gPSAxIHdoaWxlIGtlZXBpbmcgdGhlIFBMTCB3aGlsZQo+IGtlZXBp
bmcgdGhlCj4gUExMIHdpdGhpbiBpdHMgdmFsaWQgb3BlcmF0aW5nIHJhbmdlLiBTbyBOIGlzIGRl
c2lnbmVkIHRvIGhhdmUgb3RoZXIgdmFsdWVzCj4g4oCL4oCLdG8KPiBzYXRpc2Z5IHRoaXMgcmVx
dWlyZW1lbnQuCgpBZ2FpbiBpdCBzZWVtcyBsaWtlIHRoZSBjb25zdHJhaW50cyB3ZSBhcmUgdXNp
bmcgYXJlIG5vdCB0aGUgcmVhbApsaW1pdGF0aW9uLCBqdXN0IGJ5LXByb2R1Y3RzLCB3aGljaCB0
aGUgc2l0dWF0aW9uIHVuY2xlYXIuCgo+Cj4gRm9yIGV4YW1wbGUsIHRoZSBBWEcgUENJZSBQTEwg
dXNlcyBOID0gMyB0byBnZW5lcmF0ZSB0aGUgcmVxdWlyZWQgMTAwIE1Iego+IG91dHB1dCBmcmVx
dWVuY3ksCj4gc2luY2UgdGhlIHRhcmdldCBmcmVxdWVuY3kgY2Fubm90IGJlIGFjaGlldmVkIHdp
dGggTiA9IDEuCj4KClBDSWUgaXMgYSB0b3BpYyBpbiBpdHNlbGYuIEl0IHVzZXMgZGlmZmVyZW50
IG9wcyBmb3IgaGlzdG9yaWMgcmVhc29ucyB0aG91Z2gKSSBzdXNwZWN0LCB3aXRoIHByb3BlciBj
b25zdHJhaW50cywgaXQgd291bGQgbm90IHJlYWxseSBuZWVkIHRvLgoKPgo+IEFkZGl0aW9uYWxs
eSwgaXMgdGhlIHJlZmFjdG9yZWQgcHJlLWRpdmlkZXIgTiBpbXBsZW1lbnRlZCBhcyBhIHNlcGFy
YXRlCj4gcGF0Y2hzZXQsCj4gaW5kZXBlbmRlbnQgZnJvbSB0aGUgQTkgUExMIGNoYW5nZXM/CgpJ
IGNvdWxkIGJlIHNlZW4gYXMgYSBwcmUtcmVxdWlzaXRlLgoKPgo+Cj4gQmVzdCByZWdhcmRzLAo+
Cj4KPiBKaWFuCgotLSAKSmVyb21lCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==

Return-Path: <SRS0=vjaz=ZE=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877DAC43331
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 01:48:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57619206C3
	for <linux-amlogic@archiver.kernel.org>; Tue, 12 Nov 2019 01:48:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="obRD7J59";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbDnTVrR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57619206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NbJngEkX9DAQrsrMBJ4/rHigEVPwLSITNPn6vaVDyN4=; b=obRD7J59xaVcCg
	rKDe6FpoC24w9+XKPUeGeWNIn/5vpujQGIdC/qjYguGg9TnsCcuCBhxQTBiz9bEAhvAZAAxC0ZC2A
	Rtt586fIse0h5mo8GZ2mrlXEwg5pLFCvuKyzaiXgtCH0obuH/ZiuDCfKE5vVV8fqMRTAub+pDRNmC
	ETeA8JtoDfcxPtFxZbwPGMIRqR0dTX/ZZQWzr2neepJkQuoRHYzRCJPn9f0PcBXw4dl++D+86klbh
	zkKnxosYLaVY1w28JheMd2+5chA/xzLtCizoeOFiPqvCeoNQeqiLUAvLLRFIqOQUGln2Ud5G15c6q
	l9N4woBEBip0f+hixdfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iULIM-0003xZ-Rz; Tue, 12 Nov 2019 01:48:38 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iULIK-0003x4-Jv; Tue, 12 Nov 2019 01:48:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id r10so16735577wrx.3;
 Mon, 11 Nov 2019 17:48:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/bjIqi6hO/adh9b46mmU09qR2JgvrPKcPXsn9PKpydQ=;
 b=HbDnTVrRBD0jVKHLLydC03N06oTzh50Z5atOgRLw2IGC+WSPbw+CBtnAhZ9mE6wenq
 YZlYtu47iMNQxdTRXULdKWL6bgV6ccf7NJPqCMhENEYrsbFeApa63dcWoooL2277eHhG
 ULwctVuQtS33qqUFutyjmnVJ64CqDpvbk4bVYxkVA0Pbaa0IhzN7mR3chlCBkhlJxNFt
 hkqoMZeAmwadBaR1u6Onx0G5lGSUj8Cu8gXOn5UXAaGUNzUVVpoxOh3D3qq32OKnZW5u
 bZ16EvG8hQ0eKh9Da6QFH21godYwbZpHmRMYJpXAfszDFFhiIGnyIT1DmujUS6AxKbix
 pRzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/bjIqi6hO/adh9b46mmU09qR2JgvrPKcPXsn9PKpydQ=;
 b=fRVuOz5GVZQH8mqvawmlWew55DzFX+89Ua2+ajqwoSUhDXk9LdFRb0qRZ87ydNlOWL
 JLGrVIBGRXXYbnKXOlh1bEyO800BG//qgEU5PRW1TJzFiai8mSMqL3NscFSlUX88y5Li
 Pf1C7srSF2q+EnZMmea3KCn3cEToysGaRBhDjwNfPzOmsmi26+doZkBn2TvgedAxW3Ow
 4GCPa5U1hG3wgsroDAQ+0gEVttq0Hu/uIbKiy7EFJ5xVTwEmliD92mo/tfaEmnfYoH9w
 My3EKnyABrhszxgO8VJ72pvpFXkjEV3zm1wbmh2wp0pfeS4yO0gpLIiI14HyqcwI3Qts
 9DAA==
X-Gm-Message-State: APjAAAUw8A7Elp3+T3Nidfi2AtvhmPZaUam1IOLLtwHHCev5brlZGpI7
 acysmP+uO4BGPNJjn7NacvHgifnjQgyieSO95go=
X-Google-Smtp-Source: APXvYqxuxcgymK9jAB/5KQHDa1nDO97DkTPn+jtJT1mWCOODP321UsjLE7Cfn2IHOUjA0/iissWb1hTqLp0z9NvLe7Q=
X-Received: by 2002:adf:8088:: with SMTP id 8mr22613309wrl.230.1573523315058; 
 Mon, 11 Nov 2019 17:48:35 -0800 (PST)
MIME-Version: 1.0
References: <20191014141718.22603-1-narmstrong@baylibre.com>
 <20191014141718.22603-2-narmstrong@baylibre.com>
 <20191023201141.GA21235@bogus>
 <CA+3zgmsJPsvXgsjDQKKrSG+UNdY3SK+hKCTD2X3hGG+OXejHig@mail.gmail.com>
 <CAKgpwJWU3jB0DWEKE09TOV+YLceBFJ75ZirAXQbuhj8v3FwjXg@mail.gmail.com>
 <CA+3zgmtJqN-3Q-kjMhh58B+T7z_1TA-C6be7+UP6nuQb7eq=8A@mail.gmail.com>
In-Reply-To: <CA+3zgmtJqN-3Q-kjMhh58B+T7z_1TA-C6be7+UP6nuQb7eq=8A@mail.gmail.com>
From: Jun Li <lijun.kernel@gmail.com>
Date: Tue, 12 Nov 2019 09:48:22 +0800
Message-ID: <CAKgpwJWj9nqF-j2e+hNZZUtqGY92-2o1cUNWWh0ugePrwjbtsA@mail.gmail.com>
Subject: Re: [PATCH 1/3] doc: dt: bindings: usb: dwc3: Update entries for
 disabling SS instances in park mode
To: Tim <elatllat@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191111_174836_656234_E9315E83 
X-CRM114-Status: GOOD (  22.80  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Felipe Balbi <balbi@kernel.org>, Jianxin Pan <jianxin.pan@amlogic.com>,
 devicetree@vger.kernel.org, khilman@baylibre.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Dongjin Kim <tobetter@gmail.com>, linux-amlogic@lists.infradead.org,
 Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

YnkgYSBxdWlyaywgdGhvc2UgcGxhdGZvcm1zIHdpdGhvdXQgdGhpcyBxdWlyayBjYW4ndCBiZW5l
Zml0IHRoaXMgZml4LgoKaWYgbGF0ZXIgdGhpcyBidWcgaXMgZml4ZWQgYnkgc29tZSByZXZlcnNp
b24gb2YgZHdjMyBJUCwgd2UgY2FuIGVhc2lseQpyZW1vdmUgdGhlIHdvcmthcm91bmQgYnkgYSBJ
UCB2ZXJzaW9uIGNoZWNrOgppZiAoZHdjLT5yZXZpc2lvbiA8IERXQzNfUkVWSVNJT05fUEFSS19N
T0RFX0ZJWEVEKQp7CiAgICAgICAgICBkaXNhYmxlIHBhcmsgbW9kZSBmb3Igc3M7Cn0KCkxpIEp1
bgoKVGltIDxlbGF0bGxhdEBnbWFpbC5jb20+IOS6jjIwMTnlubQxMeaciDEx5pel5ZGo5LiAIOS4
i+WNiDEwOjA15YaZ6YGT77yaCj4KPiBTcGVjdWxhdGlvbjsKPgo+IE1heWJlIHRoZSBrZXJuZWwg
bWFpbnRhaW5lcnMgcHJlZmVyIHRvIG9wdGltaXN0aWNhbGx5IHBlcm1pdCBmdXR1cmUKPiBwcm9k
dWN0cyB0byBlYXNpbHkgcmVtb3ZlIHdvcmthcm91bmRzIHZpYSBxdWlyayBmbGFncy4KPiBFdmVu
IGlmIGRhdGEgZnJvbSB0ZXN0aW5nIHdlcmUgc2hvd24sIGFuZCBpdCBkaWQgbm90IGltcGFjdAo+
IHBlcmZvcm1hbmNlLCBjb2RlIHJlZHVjdGlvbiBhbmQgY2xhcml0eSBhcmUgZGVzaXJhYmxlLgo+
Cj4gT24gU3VuLCBOb3YgMTAsIDIwMTkgYXQgODo1OCBQTSBKdW4gTGkgPGxpanVuLmtlcm5lbEBn
bWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIE5laWwKPiA+Cj4gPiBBcyBJIGdvdCB0aGUgaW5m
b3JtYXRpb24gZnJvbSBTeW5vcHN5cywgdGhpcyBidWcgZXhpc3RzIG9uIGN1cnJlbnQgSVAgdmVy
c2lvbnMsCj4gPiBhbmQgcGVyIG15IHRlc3RzIHdpdGggZXh0ZXJuYWwgVVNCMyBodWIgKyAyIFN1
cGVyIHNwZWVkIHVkaXNrcyBvbiBkYXRhCj4gPiByZWFkIGJ5IGRkLCBJIGNhbiByZXByb2R1Y2Ug
dGhpcyBpc3N1ZSB3aXRoIGRpZmZlcmVudCBrZXJuZWwgdmVyc2lvbnMsIGFsc28gSQo+ID4gZGlk
bid0IHNlZSBvYnZpb3VzIHBlcmZvcm1hbmNlIGRyb3AgYnkgZGQgdGVzdHMgYWZ0ZXIgZGlzYWJs
ZSBwYXJrIG1vZGUgZm9yCj4gPiBzdXBlciBzcGVlZCwgc28gc2hvdWxkIHdlIGp1c3QgZGlzYWJs
ZSBpdCBieSBkZWZhdWx0IHNvIG5vIG5lZWQgYSBxdWlyaz8KPiA+Cj4gPiBMaSBKdW4KPiA+Cj4g
PiBUaW0gPGVsYXRsbGF0QGdtYWlsLmNvbT4g5LqOMjAxOeW5tDEx5pyIMTHml6XlkajkuIAg5LiK
5Y2IODo0MuWGmemBk++8mgo+ID4gPgo+ID4gPiBUaGFua3MgZm9yIHdvcmtpbmcgb24gdGhpcyBO
ZWlsLAo+ID4gPiBJcyB0aGVyZSBzb21ldGhpbmcgdGhhdCBuZWVkcyBkb2luZyBmb3IgdGhpcyBw
YXRjaCB0byBtYWtlIGl0IGludG8gNS4zIG9yIDUuND8KPiA+ID4gQXMgcHJldmlvdXNseSBtZW50
aW9uZWQgdGhlIHBhdGNoIHNldCBmaXhlcyB0aGUgaXNzdWUgb24gYWZmZWN0ZWQgaGFyZHdhcmU7
Cj4gPiA+ICAgICBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3BhdGNoLzExMTY0NTE1Lwo+
ID4gPgo+ID4gPgo+ID4gPgo+ID4gPiBPbiBXZWQsIE9jdCAyMywgMjAxOSBhdCA0OjExIFBNIFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPiA+Cj4gPiA+ID4gT24gTW9u
LCBPY3QgMTQsIDIwMTkgYXQgMDQ6MTc6MTZQTSArMDIwMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6
Cj4gPiA+ID4gPiBUaGlzIHBhdGNoIHVwZGF0ZXMgdGhlIGRvY3VtZW50YXRpb24gd2l0aCB0aGUg
aW5mb3JtYXRpb24gcmVsYXRlZAo+ID4gPiA+ID4gdG8gdGhlIHF1aXJrcyB0aGF0IG5lZWRzIHRv
IGJlIGFkZGVkIGZvciBkaXNhYmxpbmcgYWxsIFN1cGVyU3BlZWQgWEhDaQo+ID4gPiA+ID4gaW5z
dGFuY2VzIGluIHBhcmsgbW9kZS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDQzogRG9uZ2ppbiBLaW0g
PHRvYmV0dGVyQGdtYWlsLmNvbT4KPiA+ID4gPiA+IENjOiBKaWFueGluIFBhbiA8amlhbnhpbi5w
YW5AYW1sb2dpYy5jb20+Cj4gPiA+ID4gPiBSZXBvcnRlZC1ieTogVGltIDxlbGF0bGxhdEBnbWFp
bC5jb20+Cj4gPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9u
Z0BiYXlsaWJyZS5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+ICBEb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvdXNiL2R3YzMudHh0IHwgMiArKwo+ID4gPiA+ID4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPiA+ID4gPgo+ID4gPiA+IFNpZ2gsIHdoYXQncyBvbmUg
bW9yZSB0byB0aGUgbmV2ZXIgZW5kaW5nIGxpc3Qgb2YgcXVpcmtzLi4uCj4gPiA+ID4KPiA+ID4g
PiBBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF22C3ABBC
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 May 2025 17:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J8+YK0VteZnBaAO0qZeJB5VYl5EPRhmY1kYEk6dW6SE=; b=V2SdL9vrU07FR1
	/DsJefA0m//k6WpBZSLopJOLCm18r261+MQL/ThbuHBeboBmSsam17CM1uZut20o0opWVIo8exjJb
	o5VdyjSdrHx8imxzJsO1zP3ezHrpigvwfmxR5b0tezVbV8cukjL/WpPaEdUzoroI/QFnylKuqnAIN
	aSUDnxD/KVEx7SW2aNwFdAeNZ0eSgyF7wX7fJeQN6MXSPE52EDnHgw+oWUbXYDurDlkoy83843i4B
	9FOvlTo5HIZgHSZzh39jYiAeWvjmRLcAOu8/qSK2OXnUlLbQcyxowvaRbCHDUV+TiUqvwUyuz0Pq2
	LOEkHABh4U3cC5F/UL/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCML1-0000000Csy5-1Krc;
	Tue, 06 May 2025 17:44:15 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIZ1-0000000CB57-3fsz
	for linux-amlogic@lists.infradead.org;
	Tue, 06 May 2025 13:42:30 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-308702998fbso5183040a91.1
        for <linux-amlogic@lists.infradead.org>; Tue, 06 May 2025 06:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lessconfused.com; s=lessconfused; t=1746538946; x=1747143746; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=;
        b=gT1XTUKtCD1u2fraT6Gih46YWYlwgz+RxCrEWH56OJbnbyw2snNN3tDBiEVdmIbFxA
         U8RULXTPiVAnL0ny3VTCCgfPoPlxeAS+gNIjdgfdA/qqJJhWhQFLIIyzI5JsWIt7Qn1Z
         vQ8N2trQ4MnvXsrNoZaAjIBem0rdM6RgowZpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538946; x=1747143746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JseNVTS5cyJQpI/Mfz9vsdQjjHZ+PMPgo17Lr4qAjrY=;
        b=KUI0OBa0nuX1snvQRPp6MiGeRyvKCbwqrTT9YYtZJnt+Rg2WidmS5HTV+sR+cebN4Y
         TdW5/nsU2qNT5Rza6pxWWKYnDTnxu2nZh/azdJbKdKNVza63GvkIEutHSoWNhcHh6I76
         8aopes5w6qnuEKhJRTP+GCXyMB4WvaAIDJWKcgr5KDTNge49p7KDz21SvUM9n9d0yfG7
         XofRqelZ5A+gPiqof/F9BEf1n69S2e7E+95vpWoavRyiFkyRHlJfx3DBvkVA+P78FctG
         jzShttbeVBOSYi3HZM5zervL6WZue3jkBdboO/ib3r+hT7lNYlpRdglzIS7xRgk1GwP+
         ut9g==
X-Forwarded-Encrypted: i=1; AJvYcCXLFDN+yX1p8Eka0TKjLy+mOLOAOk+Zp4R+XejDVGdlyDY7gSm50iCaiza81iztmYfgO/Q81v5FDJCUt4iH@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6pKTuhqmecdzOOFXoHf9v+dMGGfMLYnMkPwAvM08qwgzJU92l
	tyqwj6D2ECduJKH0n3ogcW+EfYSy2pYBv+vegDo7fliV9WwV5ps9X2UfMla7SoBCj82Pc3FCyI5
	309hYOA0jaHuJdCfEwzGRlc0zK6HOp4SPaPa6eA==
X-Gm-Gg: ASbGncttwiU+5BSca5oCw6YtI1J3SXoLBc5ACaRQ4d4r2WfUHn/mT2XPVf5mhr6MpgR
	4rYnUG3SPbEb962gjUAkY6egmv2NshfR2PG8er81xi+kT7ZDfMG1sXSQBOiG7MKY5Zm4XcmAIhs
	CP7AxTuCuOgc0SbSdYqDeZ79ojoeYv0jm57tghGxTJJHk1nID3DuX/AFE=
X-Google-Smtp-Source: AGHT+IFMb+lrclQ4OPHCAh1lzSkIMnskyJOofZ7Kk/Nmt7sTAKcOTEwR67sDgAeExPy9dKzAQGA9Dqsm1s06dVSJZYE=
X-Received: by 2002:a17:90b:5446:b0:301:a0e9:66f with SMTP id
 98e67ed59e1d1-30a6198e12emr19037686a91.14.1746538946445; Tue, 06 May 2025
 06:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250505143700.4029484-1-christianshewitt@gmail.com> <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
In-Reply-To: <CAFBinCBmBotJL=wC2=oV-o7piGckoBvN3S6ofYh20fEP9sn4XA@mail.gmail.com>
From: Da Xue <da@lessconfused.com>
Date: Tue, 6 May 2025 09:42:13 -0400
X-Gm-Features: ATxdqUHU86InfKfq52zvNkEmca8096lqpeIdB0VVbLy3DnspBF4H2KEICm4USso
Message-ID: <CACdvmAi3JbdLstkudF=Fb_O_P1GGADuubKVS6s22hvC93qz3tg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: sm1-bananapi: lower SD card speed
 for stability
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_064227_914083_B94ACC38 
X-CRM114-Status: GOOD (  19.16  )
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBNYXkgNiwgMjAyNSBhdCAyOjI24oCvQU0gTWFydGluIEJsdW1lbnN0aW5nbAo8bWFy
dGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSA1
LCAyMDI1IGF0IDQ6MzfigK9QTSBDaHJpc3RpYW4gSGV3aXR0Cj4gPGNocmlzdGlhbnNoZXdpdHRA
Z21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBVc2VycyByZXBvcnQgYmVpbmcgYWJsZSB0byBib290
ICh1LWJvb3QpIGZyb20gU0QgY2FyZCBidXQga2VybmVsCj4gPiBpbml0IHRoZW4gZmFpbHMgdG8g
bW91bnQgcGFydGl0aW9ucyBvbiB0aGUgY2FyZCBjb250YWluaW5nIGJvb3QKPiA+IG1lZGlhIHJl
c3VsdGluZyBpbiBmaXJzdC1ib290IGZhaWx1cmUuIFN5c3RlbSBsb2dzIHNob3cgb25seSB0aGUK
PiA+IHByb2JlIG9mIHRoZSBtbWMgZGV2aWNlczogdGhlIFNEIGNhcmQgaXMgc2VlbiwgYnV0IG5v
IHBhcnRpdGlvbnMKPiA+IGFyZSBmb3VuZCBzbyBpbml0IGZhaWxzIHRvIG1vdW50IHRoZW0gYW5k
IGJvb3Qgc3RhbGxzLgo+ID4KPiA+IFJlZHVjaW5nIHRoZSBzcGVlZCBvZiB0aGUgU0QgY2FyZCBm
cm9tIDUwTUh6IHRvIDM1TUh6IHJlc3VsdHMgaW4KPiA+IGNvbXBsZXRlIHByb2Jpbmcgb2YgdGhl
IGNhcmQgYW5kIHN1Y2Nlc3NmdWwgYm9vdC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3aXR0QGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTogTWFy
dGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KPgo+
ID4gLS0tCj4gPiBUaGUgc2FtZSB3b3JrYXJvdW5kIG9mIGRyb3BwaW5nIHRvIDM1TUh6IGlzIGFs
c28gZG9uZSB3aXRoIHRoZQo+ID4gYWMyeHggZHRzaTsgd2hpY2ggaGFzIGEgY29tbWVudCBhYm91
dCBDUkMgZXJyb3JzIGJlaW5nIHNlZW4gYXQKPiA+IDUwTUh6LiBJdCdzIHByb2JhYmxlIHRoaXMg
aXMgdGhlIHNhbWUgYWx0aG91Z2ggSSBmb3JnZXQgbm93IGhvdwo+ID4gdGhhdCBkaWFnbm9zaXMg
d2FzIGRvbmUgKG9yIHdobyBkaWQgaXQsIE1hcnRpbiBwZXJoYXBzPykuCj4gTWF5YmUgSmVyb21l
IGhlbHBlZCBpbnZlc3RpZ2F0ZS9kZWJ1Zz8gSSBjYW4ndCByZWNhbGwgYW5kIGF0IHRoZSBzYW1l
Cj4gdGltZTogaWYgaXQgZml4ZXMgdGhlIGVuZCB1c2VyIGV4cGVyaWVuY2UgaXQncyBhIHdpbi4K
CldlIGhhZCBhbiBpc3N1ZSB0b28gYW5kIGVuZGVkIHVwIGRpc2FibGluZyBNTUNfTU9ERV9IU181
Mk1IeiB8IE1NQ19NT0RFX0hTOwoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

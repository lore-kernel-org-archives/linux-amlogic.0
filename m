Return-Path: <SRS0=JUPl=DO=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90567C41604
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:04:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2435B20B1F
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Oct 2020 10:04:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCCJvEfE";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ds3SU5Sg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2435B20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rt1390HmDud4cfgXaoS/+XCKbOYLrNbfqxdB/K0GoGE=; b=fCCJvEfENUSIwEm7PLe2Sys2k
	eiEKh71Z7jeUmHC2y35yD6RGzPUhj6rTkKrwaQfuhvUyuKPsjXIgGxO3tZcnDtOcRsS6ST6YUL/tX
	af39SgUKuaasHL5xaiQuLaOcRiJPmfNthdlnG0wM+VKJC7Z7BLVhuWddcwAlKqL9kxMmT0A1oGqDf
	WD9PQifF5IMkVld2+dV3AMotV9PHNjQxG6MGIwVobynTFtlTdfo4CYDLvQuxOa+AFudGarhIFGC/s
	q8nYtZnefQnY6WzFHpmHJ9DxC60rlWX2NJVZE9uchk0aekwDANVBnjv+OlVzVHOYVE6gJ8WM97El4
	x+PdRPA0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQ6Im-0007Wj-ED; Wed, 07 Oct 2020 10:04:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQ6Ij-0007VG-IE; Wed, 07 Oct 2020 10:04:02 +0000
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17BAA2168B;
 Wed,  7 Oct 2020 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602065040;
 bh=MC7ueB1e/HcDjLEXXXivK15vF7wcTOnOf1wMHSa4/kE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Ds3SU5SgxDmoZ7N1/Kf52McZBUfzER2SrS8L2n4JjR0ACDyjy7L04Prh080wMpaKp
 bDYfiyD8ng6KPUrjG71g1NZeP24WcyQd5f/gqjL4xli+LhE2LIyyuU33w8DopQuUv9
 /ID5dVP3ThcTbG6IBGaHPXX8JNnF+Plo6qX30NCo=
Received: by mail-ej1-f50.google.com with SMTP id p15so2085190ejm.7;
 Wed, 07 Oct 2020 03:04:00 -0700 (PDT)
X-Gm-Message-State: AOAM5325CliX5dSZ91ZcTFyRzttx9zcquBi7LP2Mm79363aZPKlPcV4p
 o7FVP1pzYzu1HBaPPmKG3fa0AX9egoxbXIOucWw=
X-Google-Smtp-Source: ABdhPJwY3H9UKmpfG+K/L30qRXvWtUVJPPFubw7jMRswxHqZLul7Hj2vmJISYNWQOzKFs8ryldZeYG+0fyTXaoIP6Y0=
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr2394731ejx.215.1602065038501; 
 Wed, 07 Oct 2020 03:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <20201005203451.9985-1-post@lespocky.de>
 <20201005203451.9985-3-post@lespocky.de>
 <20201007100213.GA12224@duo.ucw.cz>
In-Reply-To: <20201007100213.GA12224@duo.ucw.cz>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 7 Oct 2020 12:03:46 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdFOgJ=9BgbR2Bq=QHf00SjdScMPOKPF0OAy6TVgJkkRA@mail.gmail.com>
Message-ID: <CAJKOXPdFOgJ=9BgbR2Bq=QHf00SjdScMPOKPF0OAy6TVgJkkRA@mail.gmail.com>
Subject: Re: [PATCH v7 02/12] dt-bindings: leds: Convert pwm to yaml
To: Pavel Machek <pavel@ucw.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201007_060401_740166_0DFD3CB1 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Rob Herring <robh@kernel.org>, Alexander Dahl <ada@thorsis.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Russell King <linux@armlinux.org.uk>,
 Alexander Dahl <post@lespocky.de>, Dan Murphy <dmurphy@ti.com>,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCA3IE9jdCAyMDIwIGF0IDEyOjAyLCBQYXZlbCBNYWNoZWsgPHBhdmVsQHVjdy5jej4g
d3JvdGU6Cj4KPiBPbiBNb24gMjAyMC0xMC0wNSAyMjozNDo0MSwgQWxleGFuZGVyIERhaGwgd3Jv
dGU6Cj4gPiBUaGUgZXhhbXBsZSB3YXMgYWRhcHRlZCBpbiB0aGUgZm9sbG93aW5nIHdheXM6Cj4g
Pgo+ID4gLSBtYWtlIHVzZSBvZiB0aGUgbm93IHN1cHBvcnRlZCAnZnVuY3Rpb24nIGFuZCAnY29s
b3InIHByb3BlcnRpZXMKPiA+IC0gcmVtb3ZlIHB3bSBub2RlcywgdGhvc2UgYXJlIGRvY3VtZW50
ZWQgZWxzZXdoZXJlCj4gPiAtIGFsaWduIG5vZGUgbmFtZXMgdG8gbmV3IGR0IHNjaGVtYSBydWxl
cyBhbmQgZHQgcmVjb21tZW5kYXRpb25zCj4gPgo+ID4gTGljZW5zZSB3YXMgbm90IGV4cGxpY2l0
bHkgc2V0IGJlZm9yZS4gIFRoZSBsaWNlbnNlIHNldCBub3cgaXMKPiA+IHJlY29tbWVuZGVkIGJ5
IERUIHByb2plY3QuCj4gPgo+ID4gU3VnZ2VzdGVkLWJ5OiBKYWNlayBBbmFzemV3c2tpIDxqYWNl
ay5hbmFzemV3c2tpQGdtYWlsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBEYWhs
IDxwb3N0QGxlc3BvY2t5LmRlPgo+ID4gUmV2aWV3ZWQtYnk6IEtyenlzenRvZiBLb3psb3dza2kg
PGtyemtAa2VybmVsLm9yZz4KPiA+IFJldmlld2VkLWJ5OiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgo+ID4gQ2M6IFBldGVyIFVqZmFsdXNpIDxwZXRlci51amZhbHVzaUB0aS5jb20+Cj4g
PiBDYzogUnVzc2VsbCBLaW5nIDxsaW51eEBhcm1saW51eC5vcmcudWs+Cj4gPiAtLS0KPiA+Cj4g
PiBOb3RlczoKPiA+ICAgICBOT1RFOiBEdWUgdG8gbGljZW5zZSBzZXQvY2hhbmdlIHRoaXMgbmVl
ZHMgQWNrZWQtYnkgb3IgU2lnbmVkLW9mZi1ieSBmcm9tOgo+ID4gICAgICAgKiBQZXRlciBVamZh
bHVzaQo+ID4gICAgICAgKiBSdXNzZWxsIEtpbmcKPgo+IFJ1c3NlbGwgS2luZyBhdXRob3JlZCB0
d28gbGluZXMgb2YgdGhlIGRvY3VtZW50YXRpb24uIEhlIGNhbiBzdGF0ZQo+IG9iamVjdGlvbnMg
bm93LCBidXQgSSdsbCBub3Qgd2FpdCBmb3IgaGlzIEFja2VkLWJ5Lgo+Cj4gPiAgICAgVGhhdCB3
YXMgZGlzY3Vzc2VkIGFscmVhZHkgd2l0aCBQZXRlciAob3JpZ2luYWwgYXV0aG9yKSwgc3RpbGwg
d2FpdGluZwo+ID4gICAgIGZvciBBY2tlZC1ieSB0aG91Z2gg4oCmCj4KPiBJZiBQZXRlciB3YXMg
b2theSB3aXRoIGxpY2Vuc2UgY2hhbmdlLCBJIGd1ZXNzIHdlIGNhbiBjb250aW51ZSBoZXJlLgoK
SGF2aW5nIGFuIEFjayBpcyBub3QgdG9vIG11Y2ggdG8gYXNrIHRvIHJlbGljZW5zZSB0aGUgY29w
eXJpZ2h0cy4KCkJlc3QgcmVnYXJkcywKS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51
eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

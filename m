Return-Path: <SRS0=Tm47=LF=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A704C4743D
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 07:31:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26E8160C3E
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jun 2021 07:31:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26E8160C3E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUuxiwL4TeYHlzWGBt0G+Fd8KSAqBxeK9mrHO4sBwKU=; b=UzjRyljXY7R128
	WF5ULENtMr52hLiy6jUwUfouk4teRTpL2hcbfcEvmHxYxOVnEmsmmgoI8rT+H1UQb3HtlNWfBMXtM
	zzYKckS0wRv1+HnsRAz0nsQstlEConsajPcF5Zj5V+4+L00J3q9bXl8wfqwvPSB/tshv7TEvokSc1
	hBaVk8dXG/psa/UH0FPRQtcag6aYIQ0o3PUMWBaLg7/D14Qj5GDp3w0uIzfW5ZihaZ6Yrk2VaXXoM
	krw4d6SDMPPzuBGNFi63VfLQn2xYxWXVwdJe3whXvS3tePXoAXQN0LdnjE5X2rPyAh0WY52aTCfCD
	anSGqIHAtvBetjnVXK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrbd7-004AGT-Fg; Fri, 11 Jun 2021 07:31:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrbct-004ADV-HB; Fri, 11 Jun 2021 07:30:48 +0000
Received: by mail-pf1-x432.google.com with SMTP id m7so3735583pfa.10;
 Fri, 11 Jun 2021 00:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fG0F4HBoROHD6DXq0+EVGrn1s2SpM2ZJvpNOm1d4zUg=;
 b=SnPIV5vze7J7JcnPD4B4Awerb0mcgkxEYKR+YeEzoxtMuRl6WUKi2YWHAs3CrsUcmb
 JWhZLp/mVOjQhPrefHUsnTMfu0c8rLZj5S001QRBnvpttQS3QGOvUZpcXPNrYQq5Apgh
 A22UhddUK7q3Bam4yebGnaolkneUyXXP0cwlS44X+fhmIVQTwT+iO409YiB/Pbr07rNu
 /gsiq9KmYp2cRVzhTLy1qyD+PFjx9mjcarcCAXucLBlig7mx1P29bOM6lQZj1spZvW2g
 677+GJSl29RoRKz/7kvf+MRvhZomZgj07MWXgLIaVA1Jj9Ttr5vcxtopLJu5udH55FKH
 iZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fG0F4HBoROHD6DXq0+EVGrn1s2SpM2ZJvpNOm1d4zUg=;
 b=mAD63gfuj4j24dL54ywa8N8RgopelRY5kUfRMkDapP6poWU8HSlMLX+uI7IVlsSjMO
 EtHttQwjSYCNOLh33HrcKGSUjX0K6CcFiscPyqc4KCod1umzDnuN1M2OgGzIy+FAFdmI
 gCFF6IcnINEXYevkrU2W1yLVjO0qu7FA2ShXOjqvi8uctVdfKkGRRuC80UTu9ClqhVo8
 BR5Vsetb03b+8tN2rHVEiOIx8nM7xU7bhxi4GT2aTp9Ji2/QIOVYyg4RPqD/OFoEzER1
 88tsQQjicK24Bfjrl/8AQTJOKUreJPyqxVOb2X72OXr7RggaLZDpEmsdKcPxzey4aLTQ
 FJLA==
X-Gm-Message-State: AOAM533GhuOvq6H7o0NbgMZREQQ06r4SHjWaalk1pszXNytNdw+ts3Aw
 vpcsyZYyYky1G3NE5ysAmg8qXkx0N3r5/dsu9hw=
X-Google-Smtp-Source: ABdhPJwgxg5M1F7Tbl6QjEiV5uVfgPWNOoW1AlwpYF/7g/rhoAsBS/3d+ETCatkdfjOsXrQ3Y5NDIpdCRtjOLqbtIkA=
X-Received: by 2002:a63:181f:: with SMTP id y31mr2280746pgl.145.1623396644577; 
 Fri, 11 Jun 2021 00:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210609012849.797576-1-xieqinick@gmail.com>
 <11da3ae4-91d4-1e51-c652-e4ad518f13bd@baylibre.com>
 <CAP4nuTVMZV7pz8NrM2MHcZzBdueRXjS+KYsU4=cQ1CB67gr_Hg@mail.gmail.com>
 <ee3341d9-350e-a84d-6836-3401be679b2a@baylibre.com>
In-Reply-To: <ee3341d9-350e-a84d-6836-3401be679b2a@baylibre.com>
From: Nick Xie <xieqinick@gmail.com>
Date: Fri, 11 Jun 2021 15:30:33 +0800
Message-ID: <CAP4nuTUt1vQjVP=3_NYaeu+m47f78ru6-MgGBiAqLeU9fJAsNg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: meson: vim3: reduce cpu thermal fan trigger
 temperature
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: robh+dt@kernel.org, khilman@baylibre.com, jbrunet@baylibre.com, 
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Nick <nick@khadas.com>, artem@khadas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_003047_595289_927FF8D1 
X-CRM114-Status: GOOD (  21.38  )
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

SGVsbG8gTmVpbCwKCgpOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+IOS6
jjIwMjHlubQ25pyIMTHml6XlkajkupQg5LiL5Y2IMzoxNeWGmemBk++8mgo+Cj4gSGksCj4KPiBP
biAxMS8wNi8yMDIxIDA4OjU0LCBOaWNrIFhpZSB3cm90ZToKPiA+IEhlbGxvIE5laWwsCj4gPgo+
ID4gVGhlIE1DVSBGQU4gd29uJ3Qgd29yayB1bnRpbCB0aGUgdGVtcGVyYXR1cmUgcmVhY2ggdG8g
ODAgZGVncmVlIGNlbnRpZ3JhZGUsCj4gPiBEbyB5b3UgdGhpbmsgdGhlIHRlbXBlcmF0dXJlIGlz
IHRvbyBoaWdoPwo+Cj4gSSB0aGluayA4MCBpcyB0b29sIGhpZ2gsIGJ1dCBJIGZlYXIgNTAgaXMg
d2F5IHRvbyBsb3csIGJ1dCBpZiB5b3UgdGhpbmsgNTAgaXMgT0sgYWZ0ZXIgeW91IHJhbiBzb21l
IHRlc3RzLCBqdXN0IGFkZCBpdCB0byB0aGUgY29tbWl0IGxvZyBhbmQgaXQncyBvayBmb3IgbWUu
CgpJIHRoaW5rIGl0IGlzIE9LLCB3ZSB1c2UgaXQgZm9yIGEgbG9uZyB0aW1lLgoKVGhhbmtzLgoK
Pgo+IE5laWwKPgo+ID4KPiA+IFRoYW5rcy4KPiA+Cj4gPiBOZWlsIEFybXN0cm9uZyA8bmFybXN0
cm9uZ0BiYXlsaWJyZS5jb20gPG1haWx0bzpuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4+IOS6jjIw
MjHlubQ25pyIMTHml6XlkajkupQg5LiL5Y2IMjo0NOWGmemBk++8mgo+ID4KPiA+ICAgICBIaSBO
aWNrLAo+ID4KPiA+ICAgICBPbiAwOS8wNi8yMDIxIDAzOjI4LCB4aWVxaW5pY2tAZ21haWwuY29t
IDxtYWlsdG86eGllcWluaWNrQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiAgICAgPiBGcm9tOiBOaWNr
IFhpZSA8bmlja0BraGFkYXMuY29tIDxtYWlsdG86bmlja0BraGFkYXMuY29tPj4KPiA+ICAgICA+
Cj4gPiAgICAgPiBSZWR1Y2UgdGhlIE1DVSBGQU4gdHJpZ2dlciB0ZW1wZXJhdHVyZSBmcm9tCj4g
PiAgICAgPiA4MCBkZWdyZWUgY2VudGlncmFkZSB0byA1MCBkZWdyZWUgY2VudGlncmFkZS4KPiA+
Cj4gPiAgICAgQ2FuIHlvdSBhZGQgc29tZSBtb3JlIHJhdGlvbmFsZSB0byB0aGlzIGNoYW5nZSA/
Cj4gPgo+ID4gICAgID4KPiA+ICAgICA+IFNpZ25lZC1vZmYtYnk6IE5pY2sgWGllIDxuaWNrQGto
YWRhcy5jb20gPG1haWx0bzpuaWNrQGtoYWRhcy5jb20+Pgo+ID4gICAgID4gLS0tCj4gPiAgICAg
PiAgYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWtoYWRhcy12aW0zLmR0c2kgfCAy
ICstCj4gPiAgICAgPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiAgICAgPgo+ID4gICAgID4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMv
YW1sb2dpYy9tZXNvbi1raGFkYXMtdmltMy5kdHNpIGIvYXJjaC9hcm02NC9ib290L2R0cy9hbWxv
Z2ljL21lc29uLWtoYWRhcy12aW0zLmR0c2kKPiA+ICAgICA+IGluZGV4IDY2ZDY3NTI0YjAzMS4u
YTljMzRmZWU5MWY0IDEwMDY0NAo+ID4gICAgID4gLS0tIGEvYXJjaC9hcm02NC9ib290L2R0cy9h
bWxvZ2ljL21lc29uLWtoYWRhcy12aW0zLmR0c2kKPiA+ICAgICA+ICsrKyBiL2FyY2gvYXJtNjQv
Ym9vdC9kdHMvYW1sb2dpYy9tZXNvbi1raGFkYXMtdmltMy5kdHNpCj4gPiAgICAgPiBAQCAtMjU2
LDcgKzI1Niw3IEBAICZjZWNiX0FPIHsKPiA+ICAgICA+ICAmY3B1X3RoZXJtYWwgewo+ID4gICAg
ID4gICAgICAgdHJpcHMgewo+ID4gICAgID4gICAgICAgICAgICAgICBjcHVfYWN0aXZlOiBjcHUt
YWN0aXZlIHsKPiA+ICAgICA+IC0gICAgICAgICAgICAgICAgICAgICB0ZW1wZXJhdHVyZSA9IDw4
MDAwMD47IC8qIG1pbGxpY2Vsc2l1cyAqLwo+ID4gICAgID4gKyAgICAgICAgICAgICAgICAgICAg
IHRlbXBlcmF0dXJlID0gPDUwMDAwPjsgLyogbWlsbGljZWxzaXVzICovCj4gPiAgICAgPiAgICAg
ICAgICAgICAgICAgICAgICAgaHlzdGVyZXNpcyA9IDwyMDAwPjsgLyogbWlsbGljZWxzaXVzICov
Cj4gPiAgICAgPiAgICAgICAgICAgICAgICAgICAgICAgdHlwZSA9ICJhY3RpdmUiOwo+ID4gICAg
ID4gICAgICAgICAgICAgICB9Owo+ID4gICAgID4KPiA+Cj4gPiAgICAgV2l0aCB0aGF0Ogo+ID4g
ICAgIFJldmlld2VkLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20g
PG1haWx0bzpuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT4+Cj4gPgo+CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

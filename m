Return-Path: <SRS0=pSyH=7P=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3F7C433DF
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2020 08:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22EF0206C3
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jun 2020 08:33:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RaDjF6aW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XQyBLPtB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22EF0206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWYKZxSDtKuXvWWl+5eaeRotPRzg0jMNpAxP4D+//Vg=; b=RaDjF6aWjuSaNV
	5DId/hlZjGorFwGZ0CzwOx4DQZdoDycn2tODc4ml/zkHJ656vwGq/Z4o2+ZXkS3VPhdU0l3dyu7NA
	7Szpq3WsZ6daGYcQuwEi1yBcEMgiT9RxMoMW2qv6Y9C5yEiOjC8qa9wXg9bDIXlGLxaJKg5jPqYeW
	si8KpVvgb1MoQ3S+5hZkYaCR9aRH8MHvRuDSIePS/lbMhTW+LUuB85rJHKKlVSp8HzUJpIRhTnQCH
	JY7xMmCqEdezTsWRN6bWHRP5Ou8wiW5iFlDcg6M7xMFcpZx0hwKu39cTpwJveICWriUoBZDibDYxM
	HgaB+5hC/QmCiw3vBw8g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jg2MH-0002qD-Hp; Tue, 02 Jun 2020 08:33:17 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jg2ME-0002oY-G5
 for linux-amlogic@lists.infradead.org; Tue, 02 Jun 2020 08:33:15 +0000
Received: by mail-wr1-x442.google.com with SMTP id t18so2450596wru.6
 for <linux-amlogic@lists.infradead.org>; Tue, 02 Jun 2020 01:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7H1jGmdpunK0UnpTr7PELYFOau+0SDjGmyZeNU7l2WE=;
 b=XQyBLPtBdqQOAVQxORH0WMvK8c7jAnhw7HnsfvKWm85fSsgd/SsCqwiw9n6xZK+tx7
 o4DSQYLwZ8YCxHV59VL9JjH6M+O3AxueEkFGjlwYAFqJBp94Ku6Xi5hzbK3h4Kvg3KPr
 MmCxgREKkngV8Cbbpe9+M72opU6j6OfcflSXcUpmqvZ8xID5/B0ZJhS6IEQ9WjCnssXp
 uu64wX9kvwJNZZZQRSfvB8CLAcHOLvZp2Wt8kl3O5jRh/XVkRlALE52jOU+9PWRmChZN
 +VO3kn5jOnZj+mPkhBYJdJS9o2NKd95hosuB3A12H2sKIwDr4qua1Hy+LFxlDu68FxU2
 Tv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7H1jGmdpunK0UnpTr7PELYFOau+0SDjGmyZeNU7l2WE=;
 b=N5QCFlA2zNaWTT70ri6r1R61jvvIwRgw/QG4RJWvDO5E1UEbmOHoydDUaHfhZTHdYW
 /CuNok9PtdjJB6Gc8PF1DnH0frpP2DXun46ggnmOKnX/65aBAUoTL7GhKyY1y6rbgnHf
 J2slNndgHWoVnllzfVqP55c2NVfQs0+uTansO+t/88HZSYlfWFFtckTSTiWGZyUoap3x
 Vwd3YsNGn2W2VJzk989gOP1/DJ8Kj5Q0N5zko7mGcuc8jmbMOJjh4cgLfgvglo4ObLUF
 HIA+0yEa8Xjc/f5rWmvfr+vXJdP9LWQlJPTuOw4h9Xpqyy+alFFscGR3v8UHy4K6SvgF
 sEIA==
X-Gm-Message-State: AOAM531D5k73jKfNI1HOMCUGpRykuVHW7P/OPwyfjdsMNK/nRg60Kmzq
 yw2g/Ju2eX4AjbbUj6MrwlU6oQ==
X-Google-Smtp-Source: ABdhPJwTWstLJV8DOsVmKsrBfUkOLHr+Ifb0u8UVqxHHLBh22pbnHCSAkqvAWuYTZbyxJQ25mTIjDQ==
X-Received: by 2002:adf:a4dd:: with SMTP id h29mr27110163wrb.372.1591086793255; 
 Tue, 02 Jun 2020 01:33:13 -0700 (PDT)
Received: from dell ([95.147.198.92])
 by smtp.gmail.com with ESMTPSA id h7sm2489681wml.24.2020.06.02.01.33.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jun 2020 01:33:12 -0700 (PDT)
Date: Tue, 2 Jun 2020 09:33:11 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 2/6] mfd: add support for the Khadas System control
 Microcontroller
Message-ID: <20200602083311.GD3714@dell>
References: <20200512132613.31507-1-narmstrong@baylibre.com>
 <20200512132613.31507-3-narmstrong@baylibre.com>
 <20200520090101.GE271301@dell>
 <8837fa43-bf46-fdd1-472e-e5f0159dab2c@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8837fa43-bf46-fdd1-472e-e5f0159dab2c@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200602_013314_543145_BCBA0108 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAwMiBKdW4gMjAyMCwgTmVpbCBBcm1zdHJvbmcgd3JvdGU6Cgo+IE9uIDIwLzA1LzIw
MjAgMTE6MDEsIExlZSBKb25lcyB3cm90ZToKPiA+IE9uIFR1ZSwgMTIgTWF5IDIwMjAsIE5laWwg
QXJtc3Ryb25nIHdyb3RlOgo+ID4gCj4gPj4gVGhpcyBNaWNyb2NvbnRyb2xsZXIgaXMgcHJlc2Vu
dCBvbiB0aGUgS2hhZGFzIFZJTTEsIFZJTTIsIFZJTTMgYW5kIEVkZ2UKPiA+PiBib2FyZHMuCj4g
Pj4KPiA+PiBJdCBoYXMgbXVsdGlwbGUgYm9vdCBjb250cm9sIGZlYXR1cmVzIGxpa2UgcGFzc3dv
cmQgY2hlY2ssIHBvd2VyLW9uCj4gPj4gb3B0aW9ucywgcG93ZXItb2ZmIGNvbnRyb2wgYW5kIHN5
c3RlbSBGQU4gY29udHJvbCBvbiByZWNlbnQgYm9hcmRzLgo+ID4+Cj4gPj4gVGhpcyBpbXBsZW1l
bnRzIGEgdmVyeSBiYXNpYyBNRkQgZHJpdmVyIHdpdGggdGhlIGZhbiBjb250cm9sIGFuZCBVc2Vy
Cj4gPj4gTlZNRU0gY2VsbHMuCj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9u
ZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+Cj4gPj4gLS0tCj4gPj4gIGRyaXZlcnMvbWZkL0tj
b25maWcgICAgICAgICAgICB8ICAxNCArKysrCj4gPj4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAg
ICAgICAgICB8ICAgMSArCj4gPj4gIGRyaXZlcnMvbWZkL2toYWRhcy1tY3UuYyAgICAgICB8IDE0
MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+PiAgaW5jbHVkZS9saW51eC9t
ZmQva2hhZGFzLW1jdS5oIHwgIDkxICsrKysrKysrKysrKysrKysrKysrKwo+ID4+ICA0IGZpbGVz
IGNoYW5nZWQsIDI0OSBpbnNlcnRpb25zKCspCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL21mZC9raGFkYXMtbWN1LmMKPiA+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvbGlu
dXgvbWZkL2toYWRhcy1tY3UuaAo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL0tj
b25maWcgYi9kcml2ZXJzL21mZC9LY29uZmlnCj4gPj4gaW5kZXggMGE1OTI0OTE5OGQzLi5iOTUw
OTEzOTcwNTIgMTAwNjQ0Cj4gPj4gLS0tIGEvZHJpdmVycy9tZmQvS2NvbmZpZwo+ID4+ICsrKyBi
L2RyaXZlcnMvbWZkL0tjb25maWcKPiA+PiBAQCAtMjAwMyw2ICsyMDAzLDIwIEBAIGNvbmZpZyBN
RkRfV0NEOTM0WAo+ID4+ICAJICBUaGlzIGRyaXZlciBwcm92aWRlcyBjb21tb24gc3VwcG9ydCBX
Q0Q5MzR4IGF1ZGlvIGNvZGVjIGFuZCBpdHMKPiA+PiAgCSAgYXNzb2NpYXRlZCBQaW4gQ29udHJv
bGxlciwgU291bmR3aXJlIENvbnRyb2xsZXIgYW5kIEF1ZGlvIGNvZGVjLgo+ID4+ICAKPiA+PiAr
Y29uZmlnIE1GRF9LSEFEQVNfTUNVCj4gPj4gKwl0cmlzdGF0ZSAiU3VwcG9ydCBmb3IgS2hhZGFz
IFN5c3RlbSBjb250cm9sIE1pY3JvY29udHJvbGxlciIKPiA+PiArCWRlcGVuZHMgb24gSTJDCj4g
Pj4gKwlkZXBlbmRzIG9uIE9GIHx8IENPTVBJTEVfVEVTVAo+ID4+ICsJc2VsZWN0IE1GRF9DT1JF
Cj4gPj4gKwlzZWxlY3QgUkVHTUFQX0kyQwo+ID4+ICsJaGVscAo+ID4+ICsJICBTdXBwb3J0IGZv
ciB0aGUgS2hhZGFzIFN5c3RlbSBjb250cm9sIE1pY3JvY29udHJvbGxlciBpbnRlcmZhY2UgcHJl
c2VudAo+ID4+ICsJICBvbiB0aGVpciBWSU0gYW5kIEVkZ2UgYm9hcmRzLgo+ID4+ICsKPiA+PiAr
CSAgVGhpcyBkcml2ZXIgcHJvdmlkZXMgY29tbW9uIHN1cHBvcnQgZm9yIGFjY2Vzc2luZyB0aGUg
ZGV2aWNlLAo+ID4+ICsJICBhZGRpdGlvbmFsIGRyaXZlcnMgbXVzdCBiZSBlbmFibGVkIGluIG9y
ZGVyIHRvIHVzZSB0aGUgZnVuY3Rpb25hbGl0eQo+ID4+ICsJICBvZiB0aGUgZGV2aWNlLgo+ID4g
Cj4gPiBJdCB3b3VsZCBiZSBnb29kIHRvIGRlc2NyaWJlIHRoZSBkZXZpY2UgaGVyZS4KPiAKPiBP
awoKSWYgeW91IGFncmVlIHdpdGggYWxsIHJldmlldyBjb21tZW50cywgdGhlcmUgcmVhbGx5IGlz
IG5vIG5lZWQgdG8KcmVwbHkuICBJdCdzIGEgd2FzdGUgb2YgeW91ciB0aW1lIGFuZCBhbnlvbmUg
ZWxzZSB3aG8gY2FyZXMgZW5vdWdoIHRvCnNlYXJjaCB0aHJvdWdoIGxvb2tpbmcgZm9yIHJlcGxp
ZXMgKGFzIEkganVzdCBkaWQpLgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpMaW5hcm8gU2Vy
dmljZXMgVGVjaG5pY2FsIExlYWQKTGluYXJvLm9yZyDilIIgT3BlbiBzb3VyY2Ugc29mdHdhcmUg
Zm9yIEFSTSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwgVHdpdHRlciB8IEJsb2cKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

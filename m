Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3410DC47DD9
	for <linux-amlogic@archiver.kernel.org>; Sun, 25 Feb 2024 12:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1nLipIcDPAUreNa91eQcv2gxBPAjxZbOgxupIDC3j04=; b=m762xBrpCe1V65
	NKKXQOsvrfzTzjE574vkXIg0KX/X/u67MgvcIayw/wB7aM0zV/mZXTaohxoet4kyCaakIYxJBb5mt
	1rv+SXjYcqKbwb4T3oxYW8OfpoARt0Amgoo/6CBQxpnu7Ahc+RvIRlEqQuJT+joeijlxTo9iy77Pm
	xv+/E8ePNZl3SI4i+85oG7TPGzs93jq0Qoh57psn6fZ3C0yaP84726uUbUSs0jefyp/F4JbDhEOAa
	UDrakioc8waKvQ7FW5AKxQM5a8YxJwy9zOMIS65IBj8+ly5qjUIhWYyiXq1kOD6+llO9rxGUIPiX2
	B2dSE3LAeI7ns41+Rb4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reDl1-0000000EvWl-3aVq;
	Sun, 25 Feb 2024 12:37:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reDkv-0000000EvVy-2wV6
	for linux-amlogic@lists.infradead.org;
	Sun, 25 Feb 2024 12:37:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33d7b8f563eso1892389f8f.0
        for <linux-amlogic@lists.infradead.org>; Sun, 25 Feb 2024 04:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708864639; x=1709469439; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMkJkQ5XQf70vJZkBI4YKSSGA1PbYpIYNkwgTn3Iuxo=;
        b=D363Tw6EVwkSVoczQ7/pcj+vPOplIzG9miWDcb70cE3sfNXo0MSBcMh5btHVDpJ/+K
         lR+IU8/jkZ2PhsPXkbL2ShuPjAb+ruB424+behJKdC5qu7KqYSRPyRrCTaL6glx7pKmK
         SFkfX8u+Qy9EEwixlUK3YcBeVkhScl9Xuq3mjbI3w5oRtLNdTFRWo+6wnFDzjYWHGmCb
         Mdbg+aJuHQcyT3HrTRN54fFiEZc0qg5ssHR9AoUgtpzW9ePeNrbnxcBN2Z9IU/9qVfFr
         njw+prD+i+7PeQ1hfHuKY42//OVCFLom36VGIAjU4o9KpdLBK+uYCp89r0emI3hNqImh
         kyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708864639; x=1709469439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMkJkQ5XQf70vJZkBI4YKSSGA1PbYpIYNkwgTn3Iuxo=;
        b=P4xv5oeOlNDwLb7kQx33cYf6FZMqAb7mW642BqyiVjxX1HdsDOQr+tRodRDqNlMLQw
         XqEi65v6PoQBmP7u5inwLMq/e6CN3bAUrrsgLKISWtGg2RmFCH5y5YTCnpJIzfdcDywE
         TWNQLBC6BxjRXJYNM3kZUEfChFzvIyoDnBa9KPg79pPZw+7YzldXi/3dlS2PzfuNTxFV
         qTksQCURI0RQIP1Ldwx0QDWAo890HdZn8ni8UtNMlAjkBmN50XSOrwbzz3P0YSE5S/3t
         RH7/uw6KEgfieyRSycIyGOUxoz9SmUG5iiSjEhGBS0DPQblZU818SqIJhkvA4snVIZbd
         OpIA==
X-Forwarded-Encrypted: i=1; AJvYcCULkM6dEgy8SN+j7X7s/07avgiqI0q28hjm5fYntyPuUtFm/Jw3+NcetCFzV0nygWIgWw+HbMgJb0Jr83jUAt2qUp4xLUFIW7fh9KLqS3gc7CM=
X-Gm-Message-State: AOJu0Yz4v28uHO+zkZx8chbzRWN2d77lWbz7/dkgcyW3AId6nkyvWEfQ
	PDZG3K2+P5WCiJpj3N1U6R7aSXlIli3ojMX4PGdv0Kz2e3vzWkpNCmvv9g+eFTs=
X-Google-Smtp-Source: AGHT+IHboAkTzMjgQLhBVPMl+xC+cHcyTjxdpJZFHan7vMWChtZG034ZBffs2Jng5zYpporvG4Uf0Q==
X-Received: by 2002:a5d:410e:0:b0:33d:bfb1:4c51 with SMTP id l14-20020a5d410e000000b0033dbfb14c51mr2167610wrp.10.1708864639416;
        Sun, 25 Feb 2024 04:37:19 -0800 (PST)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ba21-20020a0560001c1500b0033dc3fe1046sm4090407wrb.77.2024.02.25.04.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Feb 2024 04:37:19 -0800 (PST)
Message-ID: <5d3b6c7c-b526-45e0-95fd-deedad2411f6@linaro.org>
Date: Sun, 25 Feb 2024 13:37:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clocksource/drivers/arm_global_timer: Simplify
 prescaler register access
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: tglx@linutronix.de, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, patrice.chotard@foss.st.com,
 linux-amlogic@lists.infradead.org
References: <20240224213529.2601333-1-martin.blumenstingl@googlemail.com>
 <eb54b791-05d7-4eee-825d-373cc78df689@linaro.org>
 <CAFBinCB6+=PThAUz+BdfeD+DqCpscw3pSwrK2pue+J07vhPh_A@mail.gmail.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAFBinCB6+=PThAUz+BdfeD+DqCpscw3pSwrK2pue+J07vhPh_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240225_043721_828153_DFE1A5B9 
X-CRM114-Status: GOOD (  18.21  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMjQvMDIvMjAyNCAyMzoxMywgTWFydGluIEJsdW1lbnN0aW5nbCB3cm90ZToKPiBPbiBTYXQs
IEZlYiAyNCwgMjAyNCBhdCAxMDo1NeKAr1BNIERhbmllbCBMZXpjYW5vCj4gPGRhbmllbC5sZXpj
YW5vQGxpbmFyby5vcmc+IHdyb3RlOgo+IFsuLi5dCj4+PiBAQCAtMzAxLDcgKzI5OCw3IEBAIHN0
YXRpYyBpbnQgZ3RfY2xrX3JhdGVfY2hhbmdlX2NiKHN0cnVjdCBub3RpZmllcl9ibG9jayAqbmIs
Cj4+PiAgICAgICAgICAgICAgICBwc3YtLTsKPj4+Cj4+PiAgICAgICAgICAgICAgICAvKiBwcmVz
Y2FsZXIgd2l0aGluIGxlZ2FsIHJhbmdlPyAqLwo+Pj4gLSAgICAgICAgICAgICBpZiAocHN2IDwg
MCB8fCBwc3YgPiBHVF9DT05UUk9MX1BSRVNDQUxFUl9NQVgpCj4+PiArICAgICAgICAgICAgIGlm
IChwc3YgPCAwIHx8ICFGSUVMRF9GSVQoR1RfQ09OVFJPTF9QUkVTQ0FMRVJfTUFTSywgcHN2KSkK
Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIE5PVElGWV9CQUQ7Cj4+Cj4+IFdvbid0
IEZJRUxEX0ZJVCBjb3ZlciBwc3YgPCAwIGFsc28gPwo+IEhtbSwgSSB3YW50ZWQgdG8gcmVwbHkg
dGhhdCBpdCBkb2Vzbid0IGJlY2F1c2UgaW50ZXJuYWxseSBGSUVMRF9GSVQoKQo+IHVzZXMgYSBj
YXN0Ogo+ICgodHlwZW9mKF9tYXNrKSkoX3ZhbCkgPDwgX19iZl9zaGYoX21hc2spKSAmIChfbWFz
aykKPiBNeSBvcmlnaW5hbCB0aG91Z2h0IHdhcyB0aGF0IHRoZSBjYXN0IHdvdWxkIGNsZWFyIHRo
ZSBzaWduIGJpdCB3aGVuIGluCj4gZmFjdCAoSSB0aGluaykgaXQgd2lsbCBub3QgLSBpdCB3aWxs
IHJlc3VsdCBpbiB0aGUgc2lnbmVkIG51bWJlciBhbmQKPiBCSVQoMzEpIHNldC4KPiBTbyBJIHRo
aW5rIHlvdSdyZSByaWdodCwgRklFTERfRklUKCkgZG9lcyBjb3ZlciBpdC4KPiAKPiBIb3dldmVy
LCB0aGVyZSdzIHNvbWV0aGluZyBlbHNlIG9kZCB3aXRoIHRoaXMgY29kZToKPiBXZSdyZSBkaXZp
ZGluZyB0d28gZnJlcXVlbmNpZXMgKHVzaW5nIERJVl9ST1VORF9DTE9TRVNUKSB3aGljaCBhcmUg
dHdvCj4gdW5zaWduZWQgdmFsdWVzLiBTbyB0aGUgcmVzdWx0IG9mIHRoZSBkaXZpc2lvbiBjYW4g
bmV2ZXIgYmUgbmVnYXRpdmU6Cj4gICAgcHN2ID0gRElWX1JPVU5EX0NMT1NFU1QobmRhdGEtPm5l
d19yYXRlLCBndF90YXJnZXRfcmF0ZSk7Cj4gSG93ZXZlciwgd2UncmUgYWRkaXRpb25hbGx5IGRl
Y3JlbWVudGluZyBwc3YgYnkgb25lOgo+ICAgIHBzdi0tOwo+IFNvIGluIHJlYWxpdHkgaXQgY2Fu
IG9ubHkgZXZlciBiZSBuZWdhdGl2ZSBpZiB0aGUgcmVzdWx0IG9mIHRoZQo+IGRpdmlzaW9uIHdh
cyB6ZXJvIChmb3IgZXhhbXBsZSBpZiBuZXdfcmF0ZSBpcyBzbWFsbGVyIHRoYW4KPiBndF90YXJn
ZXRfcmF0ZSkuCj4gSG93ZXZlciwgaW4gdGhhdCBjYXNlIHdlIHdvdWxkIGhhdmUgY3Jhc2hlZCAt
IHdpdGggYSBkaXZpc2lvbiBieSB6ZXJvCj4gLSBpbiB0aGUgc3RhdGVtZW50IHJpZ2h0IGluIHRo
ZSBtaWRkbGUgb2YgdGhlIHR3byBtZW50aW9uZWQgYWJvdmU6Cj4gICAgaWYgKGFicyhndF90YXJn
ZXRfcmF0ZSAtIChuZGF0YS0+bmV3X3JhdGUgLyBwc3YpKSA+IE1BWF9GX0VSUikKPiAKPiBTbyBJ
IHRoaW5rIHdlIG5lZWQgYW5vdGhlciBwYXRjaCAoaXQncyBiZXN0IHRvIG9yZGVyIHRoYXQgYmVm
b3JlIHRoaXMKPiBvbmUpOiBtYWtlIHBzdiBhbiB1bnNpZ25lZCBpbnQgYW5kIGVycm9yIG91dCBi
ZWZvcmUgdHJ5aW5nIHRvIGRpdmlkZQo+IGJ5IHplcm8uCj4gSWYgeW91IGhhdmUgYW55IG9iamVj
dGlvbnM6IGxldCBtZSBrbm93LCBvdGhlcndpc2UgSSdsbCBwcmVwYXJlIGEKPiBwYXRjaCB0b21v
cnJvdy4KCkkgdGhpbmsgaXQgbWFrZXMgcGVyZmVjdGx5IHNlbnNlLCB0aGFua3MgZm9yIG1ha2lu
ZyB0aGUgY29kZSBuaWNlcgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3Jn
IOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8
aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8v
dHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9y
Zy9saW5hcm8tYmxvZy8+IEJsb2cKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==

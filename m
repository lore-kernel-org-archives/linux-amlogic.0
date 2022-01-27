Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B8CC433F5
	for <linux-amlogic@archiver.kernel.org>; Thu, 27 Jan 2022 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JR7dL+AHU5WqalZrQWeucvBhi/1y+sMFNBRPARlWgcM=; b=c5OuRVLJyfA+r2HEnbFw3y8eiG
	/QdpZgz4sY5PymbkxyahnWI91ZjTuDjEhtxR9HkN8wFqF8nFE2/CpLU7Fz+OAkqx3rm3Ml+TdzIsU
	e7mQHGTcBiGVhSRjXe9f23qhPZEpta/lAC6lXYLrLi8CR+wl8j4cneQBCDSm3gAWwHh9Sb6E93wWu
	EZN5AiCt9XB0EkfmGSpTp5AtAMXEIWk3K3daMTSL1P25ti6Wxq7ugDmd3R2dMj42JF4T3VFQK2sgd
	VAnUDznGGaVjPtBtdkINDW0O59isv7AARbkqXirUARRAJSiByBasW2wXcju4vwqMmWy60bllC0tKn
	jYlAVi+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2Gf-00FCoa-JC; Thu, 27 Jan 2022 10:44:41 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2GS-00FClq-Ug
 for linux-amlogic@lists.infradead.org; Thu, 27 Jan 2022 10:44:30 +0000
Received: by mail-wm1-x335.google.com with SMTP id r7so1563558wmq.5
 for <linux-amlogic@lists.infradead.org>; Thu, 27 Jan 2022 02:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iKifaOc9BJNsPhhZWXxvCORQUmFhdoLB1/L1im+j4Bw=;
 b=lzqbWkgNumeAcUAhOU+IXhVTzWpBSTLyGhZ2xhO+cApu3VTxgrX8WjEDopdkP5hVoD
 l/MXDqzcA0L2Ev6oc5IkZhze7ODYIA7azKkthZJtspXxgtRhHSwnDVgsy2sN40js+map
 9V8H5bl77xrAn/MJgRxVRy6TjcEnIU7F1Y7kEqJJ/yCBKPciV/UInLTHm0e4GgMRTIdO
 z8kwoWK3sdChLrLtpjcuQqh2c7tyaRkccBSF5Ax17ETBo9AMkP0c/dPTcL4Lspu3Y2j1
 DGrHO0UIOHkDk6xGs9+oAPCpKfy/biXxjqDdUVxuuGqFOyFuiHtvo8ERAswg0yMENYup
 LkeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=iKifaOc9BJNsPhhZWXxvCORQUmFhdoLB1/L1im+j4Bw=;
 b=TmofPAG06I8M83Kmd5IUe/cBonKXGBq44Lt+hm3+DXdDvUG28y5sSHLmOoc1zwH6db
 VL8v83Vr0jG9raf5hU9e/0RNr4cLwFX0IQDRLfretYW3IEUxwv2WFcdlxjLaTUfZ+xCH
 P7zyj/Y+PlU4sdvA8J6QYvJjJ1PmVIxPYlkfY75HqjKtvTebTRVyxmzZAsPpV4oKE0SV
 DlmiMms3OHUQIdGN7bf3Z3QXF7Oj5NsckLJuS3Yc8AsK+FWF5kt+pnJVY1dfLsF5qhlj
 BA2X9RlnEOP7M1GaOmhud85fhwL7DDZDTdjYoXK4Eg3UugfZwfL+Ku4bit7H5/EaVV0G
 avjQ==
X-Gm-Message-State: AOAM532vHt3go09SihyjRkURARKdFoazIKqQD8ws+fWPVePUlrT8wGhz
 e5le5fiIvWdC1topkipN2zx9XQ==
X-Google-Smtp-Source: ABdhPJy3LLNGEkfT2tqGaRBRmvMSGiTJQTiSHEfsmvm0wejzQhgHaj9YDISNOPKRKd2NwcQlTPF+8g==
X-Received: by 2002:a05:600c:4e49:: with SMTP id
 e9mr2669723wmq.92.1643280266901; 
 Thu, 27 Jan 2022 02:44:26 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff?
 ([2001:861:44c0:66c0:bd6:ac2b:1e48:f2ff])
 by smtp.gmail.com with ESMTPSA id f6sm1749482wrj.26.2022.01.27.02.44.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 02:44:26 -0800 (PST)
Subject: Re: [PATCH 1/3] arm64: dts: meson-gx: add ATF BL32 reserved-memory
 region
To: Vyacheslav <adeep@lexina.in>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220126044954.19069-1-christianshewitt@gmail.com>
 <20220126044954.19069-2-christianshewitt@gmail.com>
 <a279c365-0615-1c7f-5596-dec9ad1c8229@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <3924894b-d479-7ec2-ff68-b830137f3b79@baylibre.com>
Date: Thu, 27 Jan 2022 11:44:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a279c365-0615-1c7f-5596-dec9ad1c8229@lexina.in>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_024429_010263_00A32279 
X-CRM114-Status: GOOD (  15.96  )
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

SGksCgpPbiAyNi8wMS8yMDIyIDA2OjM1LCBWeWFjaGVzbGF2IHdyb3RlOgo+IEhpIQo+IAo+IDI2
LjAxLjIwMjIgMDc6NDksIENocmlzdGlhbiBIZXdpdHQgd3JvdGU6Cj4+IEFkZCBhbiBhZGRpdGlv
bmFsIHJlc2VydmVkIG1lbW9yeSByZWdpb24gZm9yIHRoZSBCTDMyIHRydXN0ZWQgZmlybXdhcmUK
Pj4gcHJlc2VudCBpbiBtYW55IGRldmljZXMgdGhhdCBib290IGZyb20gQW1sb2dpYyB2ZW5kb3Ig
dS1ib290Lgo+Pgo+PiBTdWdnZXN0ZWQtYnk6IE1hdGV1c3ogS3J6YWsgPGtzemFxdWl0dG9AZ21h
aWwuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gSGV3aXR0IDxjaHJpc3RpYW5zaGV3
aXR0QGdtYWlsLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvYXJtNjQvYm9vdC9kdHMvYW1sb2dpYy9t
ZXNvbi1neC5kdHNpIHwgNiArKysrKysKPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9hcm02NC9ib290L2R0cy9hbWxvZ2ljL21lc29u
LWd4LmR0c2kgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2FtbG9naWMvbWVzb24tZ3guZHRzaQo+PiBp
bmRleCA2YjQ1N2IyYzMwYTQuLmFhMTRlYTAxN2E2MSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9hcm02
NC9ib290L2R0cy9hbWxvZ2ljL21lc29uLWd4LmR0c2kKPj4gKysrIGIvYXJjaC9hcm02NC9ib290
L2R0cy9hbWxvZ2ljL21lc29uLWd4LmR0c2kKPj4gQEAgLTQ5LDYgKzQ5LDEyIEBACj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5vLW1hcDsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+
IMKgICvCoMKgwqDCoMKgwqDCoCAvKiAzMiBNaUIgcmVzZXJ2ZWQgZm9yIEFSTSBUcnVzdGVkIEZp
cm13YXJlIChCTDMyKSAqLwo+PiArwqDCoMKgwqDCoMKgwqAgc2VjbW9uX3Jlc2VydmVkX2JsMzI6
IHNlY21vbkA1MzAwMDAwIHsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmVnID0gPDB4MCAw
eDA1MzAwMDAwIDB4MCAweDIwMDAwMDA+Owo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuby1t
YXA7Cj4+ICvCoMKgwqDCoMKgwqDCoCB9Owo+PiArCj4gSG93IGRvIEkgY2hlY2sgaWYgd2UgbmVl
ZCBhIHNpbWlsYXIgcGF0Y2ggZm9yIGF4ZyBib2FyZHM/Cj4gCj4gCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBsaW51eCxjbWEgewo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxl
ID0gInNoYXJlZC1kbWEtcG9vbCI7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldXNh
YmxlOwo+Pgo+IAoKRm9yIEFYRyBib2FyZCB3aXRoIEJMMzIgYm9vdGluZyBmcm9tIHZlbmRvciB1
LWJvb3QsIHllcy4KCk5laWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK

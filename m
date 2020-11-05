Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB376C00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 13:00:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E5E6206D4
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 13:00:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NMSilXu9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a2qltg2Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E5E6206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yS25zTIom/S/NSjXwQEp0gq58TbfjW8yS8jzikjEe54=; b=NMSilXu9Y/vErdrtqE9hV+1Si
	v6J9Sebo2EIQCpSriGKUmc/y2ICtdqLt3X4AfdoAiEv3hZCg4LBMcPB3wXyu6vRxv5TveAVCiD17c
	OU22PkjbnnDvjlb6dQcfeHjr58KluNHNk7QM5FbRJnrn6Pd1EIav51E/Xe5MpgdjQCZJgVXuvQj2g
	XpkG3dtDv/N7/irIHU+xABNcit1RN8GUsWfC/VtIQs3Ifcx4sFqX0PSYntAutUfa0EnqodbsQN9dm
	FJBMt/4AQJX+OMSurmwjoILZEbh12WVDthLZ2r4PERqE7nRHO5Q9CDgSdNZ+JkxRP5Uh39nahNsAl
	EJ2wZ1Onw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaesY-00068v-6V; Thu, 05 Nov 2020 13:00:38 +0000
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaery-0005sn-Jr
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 13:00:05 +0000
Received: by mail-ua1-x943.google.com with SMTP id t15so480195ual.6
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7NcZx/oSdkYK9nn1pweWIk2stuxNmZW+6aZ8xIAheSA=;
 b=a2qltg2ZO2ve892U8tNPLNFReFupQUvEd+42PcGc3wyyE0rdCVDXLJo9Xy/NM2UgdR
 ybjgg1ik4ekokumzQ72UxxZe7zFZ4w0oT+4UE1zbNjuHtlu5VCsMqr/pHtBiKwV5RH8G
 C5cSPkBF9YdLpJEHAwja99I/V12g38cHvCqrt7KQ9js9BB++8nvgMHfbKm3I9tGEngtG
 HIKMBU2X+K+yG6NNTbA0XGSVNJT7pGwCGp+ActTQQRLCHOI9GufpGbI7Z2mNbQbDOBgU
 WWpC8cdMqHtMUDN7Z60ELLJAWumg8aMcA+Ql6y3HhlkLih3K+iGVPalHjboalGGbNRxy
 45fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7NcZx/oSdkYK9nn1pweWIk2stuxNmZW+6aZ8xIAheSA=;
 b=mR0bcEUmOtAocowQF+60BxzQKGaa0BS5uKIJTIXPwGgMExIKGP9HtwyroxJgsHBWwv
 O0rtQDF9ce57L5dihyHiTL0tFAmrLw+UZeHiS1WBcBTbQc1X8oR/3iJcCiyJPox3n8BG
 kvyJQL87S3vCJQvTcMe82NQ74ii9w7YTRMKl7QBFAiV73Rmd/UAB53VlYxrlhQ5LZ9gl
 MFhd/heXPPgB2wQaxwD9WX3eYm8VUR2t4JePjunlVDeRmX7beyY78/7zLOFmXzzOSuR5
 XoaNzupeuNQqGz7O3GnD+Ge23Oek3/fqNoebZU/ZhXUfLC+Bkpu0GoUp5sJ2TLqgVmG4
 7IqQ==
X-Gm-Message-State: AOAM533p0sZcl4UeziAbd1NTxUrI4SOaHh5hwXAbJg67dsBEGSPTLZvI
 maA6YTaSfDesAxHdxcHIxZSNq8fgknADA6DAcyhv+Q==
X-Google-Smtp-Source: ABdhPJyKvAtWA3o6fvZdEP1FXq5fTD1wQx5C/9iCOEtWf1JxjYK3WnwXGODCRXocBQ36+Iib8od5AOXX7f8O8Jguzrw=
X-Received: by 2002:ab0:140e:: with SMTP id b14mr886025uae.100.1604581199978; 
 Thu, 05 Nov 2020 04:59:59 -0800 (PST)
MIME-Version: 1.0
References: <20201103163046.14336-1-krzk@kernel.org>
In-Reply-To: <20201103163046.14336-1-krzk@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Nov 2020 13:59:21 +0100
Message-ID: <CAPDyKFoKt9pwu=GC0hE7ogVJv=h6NPUjSvk7uNVmnf=FDPWh5A@mail.gmail.com>
Subject: Re: [PATCH] mmc: meson-gx: drop of_match_ptr from of_device_id table
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_080002_819174_D9527235 
X-CRM114-Status: GOOD (  18.32  )
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
Cc: kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAzIE5vdiAyMDIwIGF0IDE3OjMwLCBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhlIGRyaXZlciBjYW4gbWF0Y2ggb25seSB2aWEgdGhlIERU
IHRhYmxlIHNvIHRoZSB0YWJsZSBzaG91bGQgYmUgYWx3YXlzCj4gdXNlZCBhbmQgdGhlIG9mX21h
dGNoX3B0ciBkb2VzIG5vdCBoYXZlIGFueSBzZW5zZSAodGhpcyBhbHNvIGFsbG93cyBBQ1BJCj4g
bWF0Y2hpbmcgdmlhIFBSUDAwMDEsIGV2ZW4gdGhvdWdoIGl0IGlzIG5vdCByZWxldmFudCBoZXJl
KS4gIFRoaXMgZml4ZXMKPiBjb21waWxlIHdhcm5pbmcgKCFDT05GSUdfT0YgJiYgIUNPTkZJR19N
T0RVTEVTKToKPgo+ICAgICBkcml2ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jOjEyNTI6MzQ6
IHdhcm5pbmc6Cj4gICAgICAgICDigJhtZXNvbl9tbWNfb2ZfbWF0Y2jigJkgZGVmaW5lZCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KPgo+IFJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2Yg
S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+CgpBcHBsaWVkIGZvciBuZXh0LCB0aGFua3MhCgpL
aW5kIHJlZ2FyZHMKVWZmZQoKCj4gLS0tCj4gIGRyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1j
LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMgYi9kcml2
ZXJzL21tYy9ob3N0L21lc29uLWd4LW1tYy5jCj4gaW5kZXggNGVjNDE1Nzk5NDBhLi4xM2Y2YTJj
MGVkMDQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tbWMvaG9zdC9tZXNvbi1neC1tbWMuYwo+ICsr
KyBiL2RyaXZlcnMvbW1jL2hvc3QvbWVzb24tZ3gtbW1jLmMKPiBAQCAtMTI2NSw3ICsxMjY1LDcg
QEAgc3RhdGljIHN0cnVjdCBwbGF0Zm9ybV9kcml2ZXIgbWVzb25fbW1jX2RyaXZlciA9IHsKPiAg
ICAgICAgIC5kcml2ZXIgICAgICAgICA9IHsKPiAgICAgICAgICAgICAgICAgLm5hbWUgPSBEUklW
RVJfTkFNRSwKPiAgICAgICAgICAgICAgICAgLnByb2JlX3R5cGUgPSBQUk9CRV9QUkVGRVJfQVNZ
TkNIUk9OT1VTLAo+IC0gICAgICAgICAgICAgICAub2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9w
dHIobWVzb25fbW1jX29mX21hdGNoKSwKPiArICAgICAgICAgICAgICAgLm9mX21hdGNoX3RhYmxl
ID0gbWVzb25fbW1jX29mX21hdGNoLAo+ICAgICAgICAgfSwKPiAgfTsKPgo+IC0tCj4gMi4yNS4x
Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

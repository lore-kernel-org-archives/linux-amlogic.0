Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25FDC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 20:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqbtBT9WwaymIPxMNNPN2ePm+s9wn4wRmgmcYTX1/gA=; b=enwUXrYP4NYqzC
	bf0BIvOyl+Np1m9vRaRYcqP3xKD35/wg/WJ5Q1nNZxbmLedembCmluw9Jk/sT2zc9aijwCrnz2uco
	EWNFmcloUEaLHxvqNVgEb5Xn2qotfP6jj2IbEZadiu/6qAaHP842QNqBMbw9nOhTmO9W1wkYHWkoH
	kQppG8Bo4L3Hk5GEGlmtjNUMmKMWiQksHdea9pGBiIfp2hA0C3LVPE5yWD9WKT1PZQ6Lemw8jmgWc
	69cFc98hq8irf67ykSn3iqYCM0e+uvfRntxeppNmri/GUrxf8dzJmjCXQbOSchL5qvnnYHGz/QyGs
	qBwYPz8tufZaagCLqGbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyf9T-001zxG-NF; Fri, 25 Nov 2022 20:18:23 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyf9Q-001zvb-N9
	for linux-amlogic@lists.infradead.org; Fri, 25 Nov 2022 20:18:22 +0000
Received: by mail-qt1-x832.google.com with SMTP id c15so3120805qtw.8
        for <linux-amlogic@lists.infradead.org>; Fri, 25 Nov 2022 12:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSTiRuRI06TOhxoFYQqmDv6+abbfogCNsszYj5jDKOA=;
        b=jz7dOfy3kSV390xTmbsxq8OVKph6kV4B1GUS62uX8AMaLz9Vmpv20Ju/pH63AEDaH1
         pXDa3sPYxxm6Fij1jRsq9Ca1NkxWIQB3RI/HA3IO+V5jCCzEw45m2rPIKWkm1Ny9+Eb4
         AyER7qyxHWaeLPjZAhNNhL9kdkjne/WvO2Yo331coGRImXVfP2QrqMaqPZqEU0rAbzkd
         c5W6gnMNcqNGwsNa6DcS1DGwmS6uwq3o59dj4e2OCJPvWYfcC21lMOyzAxdVxPMutmYh
         6TSapGXLwxtarNQvdwNt5BpgOsnZVcaPd1es7arvMPx0B5dNNpDNDOjfbIEusM1v8mjh
         jqhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZSTiRuRI06TOhxoFYQqmDv6+abbfogCNsszYj5jDKOA=;
        b=jtfaT1171CNMbj6GvK3b+Y60gY+hgczeCtO+9byqn8xdkjQPI2u+3NWtFNAFxQU/b5
         wK8/IzGIx2eEyUfjt39u+PxRxJsDstugLa91i1MdIBDQQZEc16U4CNcrfLX/HejzHf/f
         lI0/XlA3NciptAc4BvYTtQYSGZzp03x9ZbhBVtAjeZFCvnYSCyvCh0PCQF1TAo4u79w6
         wTA3HweEWjqJeo9Drk852yPxWijPEO+xRWTPaZqqkxvjZgrfN8qOgNzTBzVSYsMt5ZEP
         HrBPFzUbxbCJuO25TOwkg/yB3TrtCCGKQZ9g7ahXKVucqF2p5y/0DhOQ6trGNNTqrux1
         5tVA==
X-Gm-Message-State: ANoB5plLokyQpb1lQYFE6YFqvGoiDc+aC8NHiPVyF5cdqob8WArHiu5M
	yrkFM1tt0WpvQ6VdNDXu3Z93+w==
X-Google-Smtp-Source: AA0mqf48jVxmakZdn6axSd1lKtJcu73ds9O8bWEdIHympGZG1PjmH2cdWfrtyPb94LllVYiymUXREg==
X-Received: by 2002:ac8:5ece:0:b0:3a5:6f39:4bd8 with SMTP id s14-20020ac85ece000000b003a56f394bd8mr37639589qtx.228.1669407498320;
        Fri, 25 Nov 2022 12:18:18 -0800 (PST)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id de16-20020a05620a371000b006b615cd8c13sm3333344qkb.106.2022.11.25.12.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Nov 2022 12:18:18 -0800 (PST)
Message-ID: <7e979311cb5199c4ba9dbf1b0aad027e25563614.camel@ndufresne.ca>
Subject: Re: [PATCH v11 1/3] perf/amlogic: Add support for Amlogic meson G12
 SoC DDR PMU driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Will Deacon <will@kernel.org>, Jiucheng Xu <jiucheng.xu@amlogic.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Jianxin Pan
 <jianxin.pan@amlogic.com>, Kelvin Zhang <kelvin.zhang@amlogic.com>, Chris
 Healy <healych@amzon.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Date: Fri, 25 Nov 2022 15:18:16 -0500
In-Reply-To: <20221118164157.GA4802@willie-the-truck>
References: <20221117083419.2084264-1-jiucheng.xu@amlogic.com>
	 <20221118164157.GA4802@willie-the-truck>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_121821_170073_96CC4323 
X-CRM114-Status: GOOD (  14.16  )
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

TGUgdmVuZHJlZGkgMTggbm92ZW1icmUgMjAyMiDDoCAxNjo0MSArMDAwMCwgV2lsbCBEZWFjb24g
YSDDqWNyaXTCoDoKPiBPbiBUaHUsIE5vdiAxNywgMjAyMiBhdCAwNDozNDoxNVBNICswODAwLCBK
aXVjaGVuZyBYdSB3cm90ZToKPiA+IEFkZCBzdXBwb3J0IGZvciBBbWxvZ2ljIE1lc29uIEcxMiBT
ZXJpZXMgU09DIC0gRERSIGJhbmR3aWR0aCBQTVUgZHJpdmVyCj4gPiBmcmFtZXdvcmsgYW5kIGlu
dGVyZmFjZXMuIFRoZSBQTVUgY2FuIG5vdCBvbmx5IG1vbml0b3IgdGhlIHRvdGFsIEREUgo+ID4g
YmFuZHdpZHRoLCBidXQgYWxzbyBpbmRpdmlkdWFsIElQIG1vZHVsZSBiYW5kd2lkdGguCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IEppdWNoZW5nIFh1IDxqaXVjaGVuZy54dUBhbWxvZ2ljLmNvbT4K
PiA+IFRlc3RlZC1ieTogQ2hyaXMgSGVhbHkgPGhlYWx5Y2hAYW16b24uY29tPgo+IAo+IGFtem9u
LmNvbT8KPiAKPiA+ICtzdGF0aWMgdW1vZGVfdCBtZXNvbl9kZHJfcGVyZl9mb3JtYXRfYXR0cl92
aXNpYmxlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAo+ID4gKwkJCQkJCSAgc3RydWN0IGF0dHJpYnV0
ZSAqYXR0ciwKPiA+ICsJCQkJCQkgIGludCBuKQo+ID4gK3sKPiA+ICsJc3RydWN0IHBtdSAqcG11
ID0gZGV2X2dldF9kcnZkYXRhKGtvYmpfdG9fZGV2KGtvYmopKTsKPiA+ICsJc3RydWN0IGRkcl9w
bXUgKmRkcl9wbXUgPSB0b19kZHJfcG11KHBtdSk7Cj4gPiArCWNvbnN0IHU2NCAqY2FwYWJpbGl0
eSA9IGRkcl9wbXUtPmluZm8uaHdfaW5mby0+Y2FwYWJpbGl0eTsKPiA+ICsJc3RydWN0IGRldmlj
ZV9hdHRyaWJ1dGUgKmRldl9hdHRyOwo+ID4gKwlpbnQgaWQ7Cj4gPiArCWNoYXIgdmFsdWVbMjBd
OyAvLyBjb25maWcxOnh4eCwgMjAgaXMgZW5vdWdoCj4gPiArCj4gPiArCWRldl9hdHRyID0gY29u
dGFpbmVyX29mKGF0dHIsIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlLCBhdHRyKTsKPiA+ICsJZGV2
X2F0dHItPnNob3coTlVMTCwgTlVMTCwgdmFsdWUpOwo+ID4gKwo+ID4gKwlpZiAoc3NjYW5mKHZh
bHVlLCAiY29uZmlnMTolZCIsICZpZCkgPT0gMSkKPiA+ICsJCXJldHVybiBjYXBhYmlsaXR5WzBd
ICYgKDEgPDwgaWQpID8gYXR0ci0+bW9kZSA6IDA7Cj4gPiArCj4gPiArCWlmIChzc2NhbmYodmFs
dWUsICJjb25maWcyOiVkIiwgJmlkKSA9PSAxKQo+ID4gKwkJcmV0dXJuIGNhcGFiaWxpdHlbMV0g
JiAoMSA8PCBpZCkgPyBhdHRyLT5tb2RlIDogMDsKPiAKPiBTaG91bGQgdGhlc2UgYmUgJygxVUxM
IDw8IGlkKScgdG8gYXZvaWQgc2hpZnRpbmcgYmV5b25kIHRoZSBzaWRlIG9mIHRoZQo+IDMyLWJp
dCB0eXBlPwoKRm91bmQ6CiAgdHlwZWRlZiB1bnNpZ25lZCBzaG9ydAkJdW1vZGVfdDsKCkknZCBz
dWdnZXN0IHRoZSBCSVQoKSBtYWNybyB0aGVuLCB2ZXJ5IGVhc3kgdG8gcmVhZCBhbmQgc2hvdWxk
IHdvcmsgZm9yIHRoaXMKY2FzZS4KCj4gCj4gV2lsbAo+IAo+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QK
PiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

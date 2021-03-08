Return-Path: <SRS0=LTpV=IG=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BB8C433E0
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 08:58:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A5366512B
	for <linux-amlogic@archiver.kernel.org>; Mon,  8 Mar 2021 08:58:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A5366512B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dJP1cLRg23HCvCq3fwz9kJC/jot/2FjaXv6IkEYDLVg=; b=GgU8bfsoyCVvyMXv2o1aj7du5
	itKZemD130GIZ2XQPhGr14KXOR7YCb1mWK++OfGHj67vJtBP996n3HUdbSAdspadoRWEHtmbHCwaY
	XxJgEvMr3vk8LJT2mwyPcCjJU1PDhME8RnnrScjwD14tA58o5NAeCHrz0llILfdjf33ZLRGV6FrOj
	le2+hiBopGzGI/MrFGMbzAqLmiMqulFr+EK4JRxvKPe0XKo1g1cSAFEltz2Qm+IzSrGSmMgLO3JE9
	fMzNwi6upnnaMH9wtzV3mMa7XAVc815WyIWeMCUcECvx8mziZ2OOmdTNUVj8y8aLDFF0gt4Fjn5d1
	yqyQbEapw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJBiE-00G2uJ-Ma; Mon, 08 Mar 2021 08:58:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJBiA-00G2sa-Ql
 for linux-amlogic@lists.infradead.org; Mon, 08 Mar 2021 08:58:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 f22-20020a7bc8d60000b029010c024a1407so3298939wml.2
 for <linux-amlogic@lists.infradead.org>; Mon, 08 Mar 2021 00:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7b18Z0xDg5NJSVFZl2y3aJsTcouPtqE66ZgWzwVeUC0=;
 b=1zzqBwluC90E1032iw68u28dUMj3EbaxbNs3Acuq3BE1nb1oy3YrgcdR2izNuUAu2G
 G9OFVwyfv+5FeBgzTK+j4henuqUn4SdwU38xK5vbdhoTIcrfhAjkQn1m9ZCjViG0UeFn
 AhHzaKz8TooVZ8hD2v1gHp4R7EOrnpVSHe2rFH4rWBfHsnx9MNm5lKw8JYvcf+/4Cqh1
 NFpxqofosoedOBYosF2s4XR4Pkc5PlkwhNzu5YacO21ggpCDH8wTHrlCrU+K7j+g98Ws
 coJtIacjZmVp9V+AYrp8gQfQeqLz4F8qLTaQLhWfWb6ulOD50134l/DyWyFaicirfrdM
 NIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=7b18Z0xDg5NJSVFZl2y3aJsTcouPtqE66ZgWzwVeUC0=;
 b=CcYnNbU9c3oqgeE/Nzq4LjL40s1htXt9Q7Hmo9wcTuU5tSwYGmaamu1+4l12hTCJ79
 FFivNRrFITAl1pU/b9EP8vuAF9MMNLPQlOBDKbMzvmB4qWaS5f1OG1oZ9OrZne11AC/t
 snvDzbzD0y1g0jz++vKTvWYlyr6CzsKF/VZSJQMHKRhGBSvBcVTcVKztASQItLBemLbA
 Pxqf0J9/9aBfrl40Mm2qGlxREQNvKSRSuKsnspKRkCnS7kylDBrJPiSJVkvlPSjgHodX
 K/LfcaBpkHoKwjF+qrvmwJgnj1s12t/j+Lj8HAyTk7OuLh3Fn9u95PiHXjvyoIrsAfMo
 yM8A==
X-Gm-Message-State: AOAM531yAu3FmUdhkRPzJdLbRsOIuwbRTvw/fuO15uPlP1SECt5D8a8t
 r2QyPtxRXWcup97PpiWwnzgnXw==
X-Google-Smtp-Source: ABdhPJzak9u3HLt1ZhJWtV52V8MYhzLBkGKW43c8X2nYI0w0/pFhmxDhFC1zMa++lNwRG3SWBS5sfQ==
X-Received: by 2002:a1c:3c02:: with SMTP id j2mr21054461wma.92.1615193877604; 
 Mon, 08 Mar 2021 00:57:57 -0800 (PST)
Received: from [192.168.1.10] ([88.164.51.138])
 by smtp.gmail.com with ESMTPSA id f14sm17375517wmf.7.2021.03.08.00.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 00:57:57 -0800 (PST)
Subject: Re: [PATCH] Revert "arm64: dts: amlogic: add missing ethernet reset
 ID"
To: Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>,
 =?UTF-8?B?SsOpcsO0bWUgQnJ1bmV0?= <jbrunet@baylibre.com>
References: <20210126080951.2383740-1-narmstrong@baylibre.com>
 <7hczwh9luc.fsf@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <021e688c-4ef0-2b8c-f377-d59b768285c0@baylibre.com>
Date: Mon, 8 Mar 2021 09:57:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7hczwh9luc.fsf@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_085759_002051_FB2F484B 
X-CRM114-Status: GOOD (  16.26  )
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

T24gMDMvMDMvMjAyMSAwMDoyOCwgS2V2aW4gSGlsbWFuIHdyb3RlOgo+IEhpIE5laWwsCj4gCj4g
TmVpbCBBcm1zdHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPiB3cml0ZXM6Cj4gCj4+IEl0
IGhhcyBiZWVuIHJlcG9ydGVkIG9uIElSQyBhbmQgaW4gS2VybmVsQ0kgYm9vdCB0ZXN0cywgdGhp
cyBjaGFuZ2UgYnJlYWtzCj4+IGludGVybmFsIFBIWSBzdXBwb3J0IG9uIHRoZSBBbWxvZ2ljIEcx
MkEvU00xIEJhc2VkIGJvYXJkcy4KPj4KPj4gV2Ugc3VzcGVjdCB0aGUgYWRkZWQgc2lnbmFsIHRv
IHJlc2V0IG1vcmUgdGhhbiB0aGUgRXRoZXJuZXQgTUFDIGJ1dCBhbHNvCj4+IHRoZSBNRElPLyhS
RylNSUkgbXV4IHVzZWQgdG8gcmVkaXJlY3QgdGhlIE1BQyBzaWduYWxzIHRvIHRoZSBpbnRlcm5h
bCBQSFkuCj4+Cj4+IFRoaXMgcmV2ZXJ0cyBjb21taXQgZjMzNjJmMGMxODE3NGExZjMzNGE0MTlh
YjdkNTY3YTM2YmQxYjNmMyB3aGlsZSB3ZSBmaW5kCj4+IGFuZCBhY2NlcHRhYmxlIHNvbHV0aW9u
IHRvIGNsZWFubHkgcmVzZXQgdGhlIEV0aGVybmV0IE1BQy4KPj4KPj4gUmVwb3J0ZWQtYnk6IENv
cmVudGluIExhYmJlIDxjbGFiYmVAYmF5bGlicmUuY29tPgo+PiBBY2tlZC1ieTogSsOpcsO0bWUg
QnJ1bmV0IDxqYnJ1bmV0QGJheWxpYnJlLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogTmVpbCBBcm1z
dHJvbmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPgo+PiAtLS0KPj4gSGkgS2V2aW4sCj4+Cj4+
IFRoaXMgaGFzIGJlZW4gcmVwb3J0ZWQgdG8gYWxzbyBicmVhayBvbiA1LjEwLCB3aGVuIHRoaXMg
bGFuZHMgb24gNS4xMSwgSSdsbCBzZW5kIGFub3RoZXIKPj4gcGF0Y2ggZm9yIDUuMTAgYmVjYXVz
ZSBtZXNvbi1heGcuZHRzaSBuZWVkcyBhIGNvbmZsaWN0IHJlc29sdXRpb24gb24gNS4xMS4KPiAK
PiBMb29rcyBsaWtlIHRoaXMgbmV2ZXIgZ290IHN1Ym1pdHRlZCB0byB2NS4xMC4gIEkganVzdCBk
aXNjb3ZlcmVkIGl0IHRoYXQKPiB2NS4xMCBpbiBTRUk2MTAgKGludGVybmFsIFBIWSkgaXMgYnJv
a2VuLgo+IAo+IENvdWxkIHlvdSBzdWJtaXQgdGhpcyB0byB2NS4xMCBzdGFibGUgYWxzbyBwbGVh
c2U/CgpTdXJlLCBJJ2xsIHByZXBhcmUgdGhpcy4KCk5laWwKCj4gCj4gVGhhbmtzLAo+IAo+IEtl
dmluCj4gCj4gCj4gCj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYW1sb2dpYwo=

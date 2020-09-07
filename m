Return-Path: <SRS0=IdmP=CQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3858C43461
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 10:33:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EE62067C
	for <linux-amlogic@archiver.kernel.org>; Mon,  7 Sep 2020 10:33:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s8L04VhD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PFBDX2Qn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69EE62067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Hx3xOtj32yLgaTE3yfsF/0qnBGe1ZNGdBWXF7ayEM5g=; b=s8L04VhDVOdWnzlpOdH3d/pag
	p6s7B3ns50rvXk8Q1eQWRzXQ3e8MdjwKd8PHazrWWRm8p+ozPg0wiKHdeoD2kDStRe9baIgxNaptW
	usE2IST7k0CbdjUyJ9ADdt6NLgZV/UWRBG5uDXZI5QSDNeZcdmBePxWVWnG40vvsAxvi5xpooWKMz
	ydQ9EEehBIljgh+HicZ8eoucRzTOoDvV9Mvqd5byiSIpYXMMrekD/WxeKQX00DY9aQtI/UdreKBc+
	zp/1sNyw7jqlKFjDJH4oEnOdHJDLpL+qCDGT2K/hrUUF7esqwi1RjtX7n+30yeDKQQp1AiGGnXYBZ
	Wy1GPN0Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFET6-0006SS-Ux; Mon, 07 Sep 2020 10:33:49 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFET2-0006QY-BS
 for linux-amlogic@lists.infradead.org; Mon, 07 Sep 2020 10:33:46 +0000
Received: by mail-wm1-x343.google.com with SMTP id l9so13703079wme.3
 for <linux-amlogic@lists.infradead.org>; Mon, 07 Sep 2020 03:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dIB9drnk+63RQtsyAIplq/mv+KlE9BKKo/XmkOjk4g0=;
 b=PFBDX2Qnav8ff2C4wQssiZzMB4M9DCVZBFLrzaii6nGXOsd/DNL9243R0j08j6wzUJ
 +lMutk6809Lm5o/ydKEGBIkT7lXc4Bog6TkM609moxbvWL7IyPHtKh/fIEcL86TDjBw/
 V+71GzvUOM/iXM8AYzQlSDgGw84nG4EhMRC9EURTD9ju2XZ/O0rMHQjI8SM/lcKDWyfa
 v8SEPlnwAvRsRm2Enr/X4VCaP9R4yLIxCe9jDOA/Of2sEzlbhOQPd8Uu2T/0yH4sTl3z
 wt//Yo9C8OYuYUgxpPiIFeellnIQdD+70b3jm3Nx3vsDzMDXSyrtrnm2JucoUgc9vR8g
 fSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dIB9drnk+63RQtsyAIplq/mv+KlE9BKKo/XmkOjk4g0=;
 b=p0zeE1+dwmd4HUM0zebggayOyxMWbrGTCpjS9A9K+KMLzYyRUCK9DAoQ2Czg6PWs49
 FkmTszcODUWEOqutAdTcBc2xVCAZhMrHzY5Vh54AuzDSWAfcpNFyGIqrmAJH4s4E8bEp
 8+Lxbk9rOhG9uFCymEIEMFpg/FE7xKZW+M3w0yJSZebhN0rPR8+fEYYvlyQVMRctEXhr
 A7lxInXyp8U2PNj1KWER/XRjOBwxx9wK++bVijGn5WYUwDsrsePI852k1CqtMIpmd9cn
 yAVbVdkwSyvQLxAPxmt0qdQLxcHhVpYXoKu4Oph4fcE1hMrkIU99/f0WSeZa4RDFyrWm
 vXeA==
X-Gm-Message-State: AOAM533WecPgSrkmgbD4GdFQUIB5CPWA9dQsxEVEY1PBlDKt8iQyO2Rv
 dJypiL8NRyP7xqjbd4c69yoRCQ==
X-Google-Smtp-Source: ABdhPJxR1rKDcT/H7YbACgBs00drzH6YN0Hl6+FZAoKoAwPQcNN6ejFcCzcgfWgjowqvMkJF9BSU1w==
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr20086427wmo.186.1599474823185; 
 Mon, 07 Sep 2020 03:33:43 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac?
 ([2a01:e35:2ec0:82b0:5405:9623:e2f1:b2ac])
 by smtp.gmail.com with ESMTPSA id 59sm7465602wro.82.2020.09.07.03.33.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 03:33:42 -0700 (PDT)
Subject: Re: [PATCH 0/2] drm: panel: add support for TDO tl070wsh30 panel
To: thierry.reding@gmail.com, sam@ravnborg.org
References: <20200904161504.23915-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <7e63abb2-89d1-3047-29c2-d312ba5ce16d@baylibre.com>
Date: Mon, 7 Sep 2020 12:33:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200904161504.23915-1-narmstrong@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200907_063344_445721_77AED17F 
X-CRM114-Status: GOOD (  15.31  )
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
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpQbGVhc2UgaWdub3JlIHRoaXMgc2VyaWUsIHRoZSB2ZW5kb3JzIHBhdGNoIGlzIG1pc3Np
bmcgYW5kIHRoZSBwYW5lbCBkcml2ZXIKc3RpbGwgaGFzIHRoZSB2cmVmcmVzaC4uLgoKV2lsbCBy
ZXBvc3QuCgpOZWlsCgpPbiAwNC8wOS8yMDIwIDE4OjE1LCBOZWlsIEFybXN0cm9uZyB3cm90ZToK
PiBUaGlzIGFkZHMgc3VwcG9ydCBiaW5kaW5ncyBhbmQgc3VwcG9ydCBmb3IgdGhlIFRETyBUTDA3
MFdTSDMwIFRGVC1MQ0QgcGFuZWwKPiBtb2R1bGUgc2hpcHBlZCB3aXRoIHRoZSBBbWxvZ2ljIFM0
MDAgRGV2ZWxvcG1lbnQgS2l0Lgo+IFRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlv
biBhbmQgdXNlcyAyNCBiaXQgUkdCIHBlciBwaXhlbC4KPiBJdCBwcm92aWRlcyBhIE1JUEkgRFNJ
IGludGVyZmFjZSB0byB0aGUgaG9zdCwgYSBidWlsdC1pbiBMRUQgYmFja2xpZ2h0Cj4gYW5kIHRv
dWNoIGNvbnRyb2xsZXIuCj4gCj4gTmVpbCBBcm1zdHJvbmcgKDIpOgo+ICAgZHQtYmluZGluZ3M6
IGRpc3BsYXk6IHBhbmVsOiBhZGQgVERPIHRsMDcwd3NoMzAgRFNJIHBhbmVsIGJpbmRpbmdzCj4g
ICBkcm06IHBhbmVsOiBhZGQgVERPIHRsMDcwd3NoMzAgcGFuZWwgZHJpdmVyCj4gCj4gIC4uLi9k
aXNwbGF5L3BhbmVsL3Rkbyx0bDA3MHdzaDMwLnlhbWwgICAgICAgICB8ICA1OCArKysrCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9LY29uZmlnICAgICAgICAgICAgICAgICB8ICAxMSArCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9NYWtlZmlsZSAgICAgICAgICAgICAgICB8ICAgMSArCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10ZG8tdGwwNzB3c2gzMC5jICB8IDI2MyArKysrKysr
KysrKysrKysrKysKPiAgNCBmaWxlcyBjaGFuZ2VkLCAzMzMgaW5zZXJ0aW9ucygrKQo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
cGFuZWwvdGRvLHRsMDcwd3NoMzAueWFtbAo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL3BhbmVsL3BhbmVsLXRkby10bDA3MHdzaDMwLmMKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlz
dApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

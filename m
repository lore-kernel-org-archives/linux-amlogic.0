Return-Path: <SRS0=FAU3=J6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F507C43460
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 16:38:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB30A613EC
	for <linux-amlogic@archiver.kernel.org>; Mon,  3 May 2021 16:38:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB30A613EC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JRZurLJy+w/bJdpqD5YIU+gbggH+DeeiJlbxV6LrSZQ=; b=WyQlAHvoo86E4xpfiLpky57av
	AXiFMJvzf5wHaRX8+bkjml2OLYseSmYryEY9ZtrGoa6Dp9EliQfh4ALbyN6taxRgMJLU0k80i0d5s
	J9ggo45EnkcGmPJnc2mivtXy4+JyrzsEZs8DgyPn1QOXhaWzZp5tMlH12kTh/DMrsa81ZtGovnzgR
	ZFaoT+nJn5vVZBtns8nby4YUPgWDOeiRfZGS/JiDj1K8+PE4J3/zlpaeiBYP28+u7uK1zKst4L0cF
	ARuFtDB6sP1fZtGuA6NiV36UXO7qBAoKOhVXHiQaJEQ7A13EE70AdvdjFByHZBwQxXUjBUwXZYqnY
	sy5dU8hXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldbaR-00EOe1-4u; Mon, 03 May 2021 16:38:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldba0-00EOWv-6g; Mon, 03 May 2021 16:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-ID:Content-Description;
 bh=IL37xkHGbQoMcjdiJ4z5sJEMMG7cxWpY9a1c3V2dhxE=; b=s2pS4TLbbSTymowJeb1q1BJbwx
 d1K7QnnAl1C42IGZE2+faK4Gw9rnVUuBCtCo5iJTicdstd79cCCyrwqqWOMjBglTaOLpWKBOizTgQ
 pNituwnG6qgYIAfo3AWlNTYCxzda1SBHbobbTzjxXrHieD7UnDV7zqUiHxAVLCJZMlNniMqtglIzp
 n/X7YukFRulAc4lF9EuwE33We1/Ao1vIEyy6WG28pRHOWGV2usFOMb7zD5CSzqNBXgRYWTT9peqzd
 NH75kCMgaVws7nKci7sUsf59qZZcp2wp8nK4lx0fBDhAgehSIfkY6WQ5VS7PYSm1/ugpHawDLZA4a
 kf26fYjQ==;
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldbZx-003GGb-JB; Mon, 03 May 2021 16:37:55 +0000
Received: by mail-ed1-x52a.google.com with SMTP id n25so7024725edr.5;
 Mon, 03 May 2021 09:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IL37xkHGbQoMcjdiJ4z5sJEMMG7cxWpY9a1c3V2dhxE=;
 b=FqlmSywn+OJAdFN6KiAIpND+PnOSnF5VOvVtz+lMdLLFeNoo4VOTgrtHkc75y86ARJ
 oslREnCvNNuPUc+7UR1EaIcYniEgYX3tMOoH80ahTa/YWyLkGJGvSv490Hg+X4mCGPwf
 gMDfqdLwRbRA+y55EuVD36ceuWU4ZH8QzxtM4lpswVgL6j1pt/HC98adtmhU5dhZpipE
 GRyPowOXVHeeEFIkuvPtYQ7obN4TZX+Y/cr3zy2Cn9SKsv3vUpmyjRtmbNjSSbfijvCl
 IGRMKJswo7Cn+seNsBRk/aQLG7567zzEubqzWTaRkzCqkdz9Bijj9QcjBIOf+4guxXYK
 RTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IL37xkHGbQoMcjdiJ4z5sJEMMG7cxWpY9a1c3V2dhxE=;
 b=JULD85eQwu8o0VdeiLzjAGOpGtpnDTw5PP/sit8hvJO/AbEgJm6LAVzh15EfMvaBo9
 /Zpe0ydl3YGdOjexAmHfr2BiQDwtfOf7ebvpu42xeZoxjiL2zxSekB8A7mnnwU/2o6Vx
 IEIxJrjDNwtOEvshRw8fuLitpDN0IPo2U9LmomKnakyX3eN3R8hTeIH47crtL93yIhpr
 0tBgGqlpivaV0IT1+CJSI6dktoMVLkCDMrMBVCJtAHk8Ztp6V3JNIZfUn6WjFIJ0TMQl
 uUsof4V8kLFoCE7SLS5n1QwfMTqNc1aiyD9lqyGSc6DCe6uPIhtjD39gpzbm6UDphvq6
 ROOw==
X-Gm-Message-State: AOAM531PPqI/zhiV+rqbyrPPuTpBPeoxJSyyQcKRJb8skMEHln2MvIDA
 kTyR+nyuidg4HDfqMyZlEadRFjuRynIgMVALThY=
X-Google-Smtp-Source: ABdhPJz/AJv7RCcIWBDMKm3Gdsyf6wf0BUHiYion0nCe5BuMFjFUqoEZ3N8K441OnP/cmQR9EgeCXvCJgLSxYp9g4SU=
X-Received: by 2002:a05:6402:11ca:: with SMTP id
 j10mr16719655edw.184.1620059872356; 
 Mon, 03 May 2021 09:37:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210503145503.1477-1-linux.amoon@gmail.com>
 <20210503145503.1477-4-linux.amoon@gmail.com>
 <CAFBinCCxMvomKt9E0jT_XXpyL1_-qXH4=zVDMNdbDCnZCsnT=A@mail.gmail.com>
 <CANAwSgTdFHwtKd-sgQq0Jp8WP55fZG3wsn7feCGo257yqiFkpw@mail.gmail.com>
 <CAFBinCDUc7VG7T9c8snP4ujMMViS0GRdztP6QGJvF9LNESHHCw@mail.gmail.com>
In-Reply-To: <CAFBinCDUc7VG7T9c8snP4ujMMViS0GRdztP6QGJvF9LNESHHCw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 3 May 2021 22:07:41 +0530
Message-ID: <CANAwSgSrQnBs06+DG6x+GMvyjvu-hPFX0J5MQ0yKPBvNaNu98w@mail.gmail.com>
Subject: Re: [PATCHv1 3/9] soc: amlogic: meson-ee-pwrc: Add hdmi power domain
 Meson g12a SoCs
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-amlogic@lists.infradead.org, 
 Linux Kernel <linux-kernel@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Rob Herring <robh+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210503_093753_668854_C19EE223 
X-CRM114-Status: GOOD (  21.21  )
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

aGkgTWFydGluCgpPbiBNb24sIDMgTWF5IDIwMjEgYXQgMjE6MDUsIE1hcnRpbiBCbHVtZW5zdGlu
Z2wKPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOgo+Cj4gSGkgQW5h
bmQsCj4KPiBPbiBNb24sIE1heSAzLCAyMDIxIGF0IDU6MjkgUE0gQW5hbmQgTW9vbiA8bGludXgu
YW1vb25AZ21haWwuY29tPiB3cm90ZToKPiBbLi4uXQo+ID4gPiA+ICtzdGF0aWMgc3RydWN0IG1l
c29uX2VlX3B3cmNfbWVtX2RvbWFpbiBtZXNvbl9wd3JjX21lbV9oZG1pW10gPSB7Cj4gPiA+ID4g
KyAgICAgICB7IEhISV9NRU1fUERfUkVHMCwgR0VOTUFTSygxNSwgOCkgfSwKPiA+ID4gPiArfTsK
PiA+ID4gPiArCj4gPiA+IHRoZSBWUFUgcG93ZXIgZG9tYWluIGFscmVhZHkgaW5jbHVkZXM6Cj4g
PiA+ICAgVlBVX0hISV9NRU1QRChISElfTUVNX1BEX1JFRzApLAo+ID4gPiB3aGVyZWFzIFZQVV9I
SElfTUVNUEQgaXMgYml0c1sxNTo4XQo+ID4gPgo+ID4gPiBIYXZpbmcgdHdvIHBvd2VyIGRvbWFp
bnMgd2hpY2ggYXJlIG1hbmFnaW5nIHRoZSBzYW1lIHJlZ2lzdGVycyBzb3VuZHMKPiA+ID4gbGlr
ZSBpdCdsbCBiZSBjYXVzaW5nIHNvbWUgdHJvdWJsZQo+ID4gPiBTbyBmb3Igbm93IHRoaXMgaXMg
KGFzIEkgYW0gbm90IGV2ZW4gc3VyZSB3aGF0IHRoZSBnb2FsIGhlcmUgaXMpOgo+ID4gPiBOQUNL
ZWQtYnk6IE1hcnRpbiBCbHVtZW5zdGluZ2wgPG1hcnRpbi5ibHVtZW5zdGluZ2xAZ29vZ2xlbWFp
bC5jb20+Cj4gPiA+Cj4gPgo+ID4gT2ssIHRoYW5rcy4gT24gdGhlIGxpbmUgb2YgRXRoZXJuZXQg
UEQsIEkgdHJpZWQgdG8gYWRkIHRoaXMgYWNjb3JkaW5nbHkuCj4gRnJvbSB3aGF0IEkgdW5kZXJz
dGFuZCB0aGUgVlBVIHBvd2VyIGRvbWFpbiBpcyBzcGVjaWFsIGJlY2F1c2UgdGhlCj4gZGlzcGxh
eSBwaXBlbGluZSBjb25zaXN0cyBvZiBtdWx0aXBsZSBjb21wb25lbnRzIChIRE1JLCBWUFUsIC4u
LikKPiB0aGF0J3Mgd2h5IHRoZSBoYW5kbGluZyBjdXJyZW50bHkgaXMgc3BlY2lhbAo+Cj4gPiB3
aGVuZXZlciBJIHRyeSBzb21ldGhpbmcgbmV3IGl0IGZhaWxzLiBQbGVhc2UgaWdub3JlIHRoaXMg
c2VyaWVzLgo+IGlmIHRoZSBWUFUgYW5kIEhETUkgcG93ZXIgZG9tYWlucyB3ZXJlIHNlcGFyYXRl
IChmcm9tIGhhcmR3YXJlCj4gcGVyc3BlY3RpdmUsIG5vdCBmcm9tIGRyaXZlciBwZXJzcGVjdGl2
ZSkgdGhlbiB5b3VyIGNoYW5nZSBpcyBhIGdvb2QKPiBzdGVwIGZvcndhcmQuCj4gaW4gdGhhdCBj
YXNlIFZQVV9ISElfTUVNUEQgd291bGQgbmVlZCB0byBiZSByZW1vdmVkIGZyb20gd2hlcmV2ZXIg
aXQncwo+IGN1cnJlbnRseSB1c2VkIC0+IHRoYXQgbWVhbnMgd2UgbmVlZCB0byBhbHNvIGRlY2lk
ZSBpZiB3ZSB3YW50IHRvCj4gYnJlYWsgY29tcGF0aWJpbGl0eSB3aXRoIG9sZGVyIChiZWZvcmUg
dGhpcyBzZXJpZXMpIC5kdGJzCj4KPgoKQXMgcGVyIHRoZSBkYXRhc2hlZXQgUzkyMlggRGF0YXNo
ZWV0LCBIRE1JIGFuZCBWUFUgYXJlIGRpZmZlcmVudApyZWcgY29udHJvbGxlciBhbmQgdGhleSBh
cmUgaW5kZXBlbmRlbnQgb2YgZWFjaCBvdGhlci4KCipISElfTUVNX1BEX1JFRzAgMHg0MCoKCjE3
fjE2ICBSL1cgMHgzIEREUiBtZW1vcnkgUEQKKjE1fjggUi9XIDB4RkYgSERNSSBtZW1vcnkgUEQq
Cjd+NiBSL1cgMHgzIFJlc2VydmVkCjV+NCBSL1cgMHgzIEF1ZGlvIG1lbSBQRAozfjIgUi9XIDB4
MyBFdGhlcm5ldCBtZW1vcnkgUEQKMX4wIFIvVyAweDMgcmVzdmVkCgpOb3RlOiBIRE1JIGFuZCBB
VURJTyBhbmQgRXRoZXJuZXQgYXJlIGFsc28gaW5kZXBlbmRlbnQgb2YgZWFjaCBvdGhlci4KCipI
SElfVlBVX01FTV9QRF9SRUcwIDB4NDEgKgoKMzF+MzAgUi9XIDB4MyBzaGFycAoyOX4yOCBSL1cg
MHgzIERlaW50ZXJsYWNlciDigJMgZGlfcG9zdDogMTEgPSBwb3dlciBkb3duLiAwMCA9IG5vcm1h
bCBvcGVyYXRpb24KMjd+MjYgUi9XIDB4MyBEZWludGVybGFjZXIg4oCTIGRpX3ByZSAyNX4yNCBS
L1cgMHgzIFZpX2RpX3NjYWxlcgoyM34yMiBSL1cgMHgzIGFmYmNfZGVjMQoyMX4yMCBSL1cgMHgz
IFNyc2NsIHN1cGVyIHNjYWxlcgoxOX4xOCBSL1cgMHgzIFZkaW4xIG1lbW9yeQoxN34xNiBSL1cg
MHgzIFZkaW4wIG1lbW9yeQoxNX4xNCBSL1cgMHgzIE9zZF9zY2FsZXIgbWVtb3J5CjEzfjEyIFIv
VyAweDMgU2NhbGVyIG1lbW9yeQoxMX4xMCBSL1cgMHgzIFZwcCBvdXRwdXQgZmlmbwo5fjggUi9X
IDB4MyBDb2xvciBtYW5hZ2VtZW50IG1vZHVsZQo3fjYgUi9XIDB4MyBWZDIgbWVtb3J5CjV+NCBS
L1cgMHgzIFZkMSBtZW1vcnkKM34yIFIvVyAweDMgT3NkMiBtZW1vcnkKMX4wIFIvVyAweDMgT3Nk
MSBtZW1vcnkKCkJlbG93IGlzIHRoZSBvdXRwdXQgb24gT2Ryb2lkIE4yLgoKW2FsYXJtQGFyY2hs
LW9uMiB+XSQgc3VkbyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvcG1fZ2VucGQvcG1fZ2VucGRfc3Vt
bWFyeQpkb21haW4gICAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyAgICAgICAgICBjaGls
ZHJlbgogICAgICAgICAgICBwZXJmb3JtYW5jZQogICAgL2RldmljZSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJ1bnRpbWUgc3RhdHVzCi0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KSERNSSAgICAgICAgICAgICAgICAgICAgICAgICAgICBv
bgogICAgICAgICAgICAwCiAgICAvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZmY2MDAwMDAuYnVzL2Zm
NjAwMDAwLmhkbWktdHggIHVuc3VwcG9ydGVkCiAgICAgICAgICAgICAwCkFVRElPICAgICAgICAg
ICAgICAgICAgICAgICAgICAgb24KICAgICAgICAgICAgMAogICAgL2RldmljZXMvcGxhdGZvcm0v
c291bmQgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc3VwcG9ydGVkCiAgICAgICAgICAg
IDAKRVRIICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbgogICAgICAgICAgICAwCiAgICAv
ZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZmYzZjAwMDAuZXRoZXJuZXQgICAgICAgICAgICAgYWN0aXZl
CiAgICAgICAgICAgIDAKVlBVICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbgogICAgICAg
ICAgICAwCiAgICAvZGV2aWNlcy9wbGF0Zm9ybS9zb2MvZmY5MDAwMDAudnB1ICAgICAgICAgICAg
ICAgICAgdW5zdXBwb3J0ZWQKICAgICAgICAgICAgMAoKSERNSSBwb3dlciBkb21haW4gaXMgT04u
CkF1ZGlvIGlzIHdyb25nbHkgbWFwcGVkLgoKPiBCZXN0IHJlZ2FyZHMsCj4gTWFydGluCgotQW5h
bmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

Return-Path: <SRS0=wFsb=UL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	T_DKIMWL_WL_HIGH autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FED8C31E44
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 00:59:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 366EE205ED
	for <linux-amlogic@archiver.kernel.org>; Wed, 12 Jun 2019 00:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s1z7Ti74";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ndufresne-ca.20150623.gappssmtp.com header.i=@ndufresne-ca.20150623.gappssmtp.com header.b="KVoUy7zQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 366EE205ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p9OYur8ZdahuI+O8t7vZqINdjdH/dafgytOwj8eIkFM=; b=s1z7Ti74mOacAg
	BLMZ58JFzxz2W+g9/BV3Yaa8VUWJGf+c0DlkbzVLTRvXozyXvLbsSfuiRSMESqYNH3s1IubnOlWYP
	9TN8lg39AbR7VOLqDLA8xtc6JhUy5MSnbol3ajqwZm8aku+oRyi4NFmADiv/gD0SEIrUTHuQlVy47
	hb34DmBoBw1+HWYHEdEcI/Bsv1oUc3U2ElVa/5qMFYujK4f3aXxvWtIfXAzXXcR4LEQhi3ZGSKqvF
	eXae/3+1TwO0+2eOwutgu24maeexKZrkhIajhvjyjs17+ySzd4HTvrIWQx8kHTrKfmA0pxeijAwf5
	CP+vAPsO3+8uX7712u6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1harbH-0004DZ-78; Wed, 12 Jun 2019 00:58:51 +0000
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1harb4-00042h-Ib
 for linux-amlogic@lists.infradead.org; Wed, 12 Jun 2019 00:58:39 +0000
Received: by mail-qk1-x741.google.com with SMTP id w187so8895563qkb.11
 for <linux-amlogic@lists.infradead.org>; Tue, 11 Jun 2019 17:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ndufresne-ca.20150623.gappssmtp.com; s=20150623;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=lCyIvXUF/KVDLpAYcUT+Ck5ZH0kz/HDS3rHiDVetioQ=;
 b=KVoUy7zQH//7/UopVPM441Ud29XCSoOL3F993oSS4Aju2MULAyOcmNN1ggtBuDt5wd
 dOKY1LEltzP9rNvjuAUtL4rTWo1rVE/dMmU6311VzxTBvXevWRHkTZIOlFOIG00r7BCU
 ZVhfMWYEx22jcetcnXnMGuttdFW4pWXCRrrJTCxYlOFKqW1ZQ6YgppnX3KVqxGsbCdf1
 QhvP5VIxeUshfA9QA+bUbSq3m6jD8uBDucMEXNGEdl6JrBrKJzJZWVHsskqpyS/eWyzP
 O9nHDuHfAcr2Ysfr4F/kgtxJysGn67Dfh5QuXab+86bcIaafX5I2OG20jz7FlX8fAaHU
 OP2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=lCyIvXUF/KVDLpAYcUT+Ck5ZH0kz/HDS3rHiDVetioQ=;
 b=izcE9PjPw1KHG4uFZK7wwSVBDd4q/euXXbx73Oj6ZG+lIeFvChlY5oqGm0/MZg1uiE
 d315xL/XCOSVPHQ5tUXswp6ZNq6ukreUMY/oorj7HR0UhpKMH2EYttaKeKJtewz9qhF2
 Ph6TdMjXN/HubN9/SfV5OPT/Rzfzv9OcaXeBahvXF7mO9hViih34kQVUKk8990sIJK/N
 5AMwJoSlgzt7B3/eYhQIhswylewjO/il/9r1PnPgBGc2byWW19jeuqNsY2IFIOPizF46
 /GRH+1+LUflysiDtNE5T+cfGirSZXvFHccVERLzWXniJtYJaAw3QgmbpMDjEaRuW7c3F
 tf1Q==
X-Gm-Message-State: APjAAAVcDC9/INv9St3MXw2Ya1VLoIkoraaohh8i2+8mNOETou6VIcYt
 MAzwGHt5JGeoNdev8TMuh6VG2g==
X-Google-Smtp-Source: APXvYqxZR85xJdgsXY+YNlNTC3iOdxqJUmzjZIfm3dI75Ue5eLolzP3t9Y33Jnlpbd7riDNlFijOCg==
X-Received: by 2002:a37:660b:: with SMTP id a11mr62787324qkc.342.1560301116293; 
 Tue, 11 Jun 2019 17:58:36 -0700 (PDT)
Received: from skullcanyon ([192.222.193.21])
 by smtp.gmail.com with ESMTPSA id u125sm7255907qkd.5.2019.06.11.17.58.33
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 17:58:34 -0700 (PDT)
Message-ID: <1d2adae2b6d0f370f17b9bac94ae4e9207dccbad.camel@ndufresne.ca>
Subject: Re: [PATCH v7 2/4] media: videodev2: add
 V4L2_FMT_FLAG_FIXED_RESOLUTION
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Philipp Zabel <p.zabel@pengutronix.de>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Maxime Jourdan <mjourdan@baylibre.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hans.verkuil@cisco.com>
Date: Tue, 11 Jun 2019 20:58:32 -0400
In-Reply-To: <1560243127.13886.3.camel@pengutronix.de>
References: <20190531093126.26956-1-mjourdan@baylibre.com>
 <20190531093126.26956-3-mjourdan@baylibre.com>
 <9731b2db-efd4-87d0-c48d-87adec433747@xs4all.nl>
 <1560243127.13886.3.camel@pengutronix.de>
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190611_175838_619760_40048434 
X-CRM114-Status: GOOD (  16.94  )
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

TGUgbWFyZGkgMTEganVpbiAyMDE5IMOgIDEwOjUyICswMjAwLCBQaGlsaXBwIFphYmVsIGEgw6lj
cml0IDoKPiBPbiBXZWQsIDIwMTktMDYtMDUgYXQgMTU6MzkgKzAyMDAsIEhhbnMgVmVya3VpbCB3
cm90ZToKPiA+IEhpIE1heGltZSwKPiA+IAo+ID4gSSBhbSB3b25kZXJpbmcgaWYgdGhpcyBmbGFn
IHNob3VsZG4ndCBiZSBpbnZlcnRlZDogeW91IHNldAo+ID4gVjRMMl9GTVRfRkxBR19EWU5fUkVT
T0xVVElPTiBpZiBkeW5hbWljIHJlc29sdXRpb24gaXMgc3VwcG9ydGVkLAo+ID4gb3RoZXJ3aXNl
IGl0IGlzbid0Lgo+ID4gCj4gPiBDYW4gYWxsIHRoZSBleGlzdGluZyBtYWlubGluZWQgY29kZWMg
ZHJpdmVycyBoYW5kbGUgbWlkc3RyZWFtCj4gPiByZXNvbHV0aW9uIGNoYW5nZXM/Cj4gPiAKPiA+
IHM1cC1tZmMsIHZlbnVzIGFuZCBtZWRpYXRlayBjYW4sIGJ1dCBJIHNlZSBubyBTT1VSQ0VfQ0hB
TkdFIGV2ZW50IGluCj4gPiB0aGUgY29kYSBkcml2ZXJzLCBzbyBJIHN1c3BlY3QgdGhhdCB0aGF0
IGNhbid0IGhhbmRsZSB0aGlzLgo+ID4gCj4gPiBQaGlsaXBwLCB3aGF0IGlzIHRoZSBzdGF0dXMg
b2YgdGhlIGNvZGEgZHJpdmVyIGZvciBkeW5hbWljIHJlc29sdXRpb24KPiA+IGNoYW5nZXM/Cj4g
Cj4gRlRSLCB0byBteSBrbm93bGVkZ2UgdGhlcmUgaXMgbm8gZHluYW1pYyByZXNvbHV0aW9uIGNo
YW5nZSBzdXBwb3J0IGluCj4gdGhlIGZpcm13YXJlLCBhcyB0aGVyZSBpcyBubyBzaWduYWwgKGlu
dGVycnVwdCBub3IgcGljdHVyZSBydW4gcmV0dXJuCj4gdmFsdWUpIHRvIGluZGljYXRlIHRoYXQg
ZGlmZmVyZW50IGhlYWRlcnMgd2VyZSBwYXJzZWQuCj4gCj4gSSBhbSBwbGFubmluZyB0byBhZGQg
dGhlIGluaXRpYWwgc291cmNlIGNoYW5nZSBldmVudCByZXF1aXJlZCBieSB0aGUKPiBjdXJyZW50
IGRlY29kZXIgQVBJIGRvY3VtZW50YXRpb24sIGJ1dCBJIGFtIGFmcmFpZCB0aGVyZSB3aWxsIGJl
IG5vCj4gc3VwcG9ydCBmb3Igc291cmNlIGNoYW5nZXMgZHVlIHRvIG1pZC1zdHJlYW0gcmVzb2x1
dGlvbiBjaGFuZ2VzIGR1ZSB0bwo+IGZpcm13YXJlIGxpbWl0YXRpb25zLgoKSSdtIGZhciBmcm9t
IGZhbWlsaWFyIHdpdGggdGhpcyBJUCwgYnV0IGF0IGxlYXN0IG9uIENPREE5ODgsIEkgY2FuIHJl
YWQKZnJvbSB0aGUgbWFudWFsIHRoYXQgdGhlIHdvcmtmbG93IGlzIHRvIGZpcnN0IGd1ZXNzIHRo
ZSBhbGxvY2F0aW9uLCBhbmQKaWYgeW91IGd1ZXNzIGl0IHdyb25nLCBhbiBlcnJvciBpcyByZXR1
cm5lZC4gV2hhdCBzZWVtcyB0byBtYXRjaCB0aGUKU09VUkNFX0NIQU5HRSBldmVudCBpbiB0aGF0
IHZlcnNpb24gd291bGQgYmUgaW4gdGhlIHBpY3R1cmUgc3RhdHVzCnJlZ2lzdGVyLCB0aGUgYml0
IDIwLCB3aGljaCBpcyBkb2N1bWVudGVkIGFzIHRyaWdnZXJlZCBpZiB0aGUgc3RyZWFtCnJlcXVp
cmVzIGJpZ2dlciBidWZmZXJzIHNpemVzLCBvciBtb3JlIGJ1ZmZlcnMuIEFmdGVyIGZpeGluZyB0
aGF0LCB5b3UKc2hvdWxkLCBpZiBJIHJlYWQgY29ycmVjdGx5LCByZXRyeS4KCkl0IGRvZXMgbm90
IG5vdGlmeSBpZiB0aGUgYnVmZmVycyBhcmUgdG9vIGxhcmdlLCBidXQgeW91IGNhbiBkZXRlY3Qs
CnNpbmNlIHRoZXJlIGlzIHJlZ2lzdGVyIHdpdGggdGhlIG91dHB1dCBzdHJlYW0gaW5mb3JtYXRp
b24uIFRoaXMKYmFzaWNhbGx5IG1lYW5zIHRoYXQgZm9yIFY0TDIgcmVzdHJpY3Rpb24sIHlvdSdk
IGhhdmUgdG8gYm91bmNlIHRoZQpidWZmZXJzIG9uIGZyYW1lIHNpemUgYm91bmRhcnkgb3Igc29t
ZXRoaW5nIGxpa2UgdGhpc8OpCgpUaGlzIHdvcmtmbG93IGlzIHZlcnkgc2ltaWxhciB0byBob3cg
T01YIHdvcmtzLCBidXQgVjRMMiBpcyBldmVuIGxlc3MKZmxleGlibGUgb24gYWxsb2NhdGlvbiB2
cyBmb3JtYXQsIGZvcmNpbmcgbW9yZSByZS1hbGxvY2F0aW9uLgoKPiAKPiByZWdhcmRzCj4gUGhp
bGlwcAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9n
aWMK

Return-Path: <SRS0=SdFN=6N=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6756C83000
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:55:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 971FA208E0
	for <linux-amlogic@archiver.kernel.org>; Wed, 29 Apr 2020 18:55:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1huTzHM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tF3Vfaj1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 971FA208E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6QB+4VtiZ67pd1RhLF0ZqWY402e7dDrF5ph5ezbXVZc=; b=Y1huTzHMBh+z3G
	pamq6+3dFf1Rd796ttOtCe9nkJE3p2HnnWHif+Wxh24nl7NX/uPugjRCtNTaNhQcnh2qimMntkDO0
	qd3mFowZA86Q8QboTF/6GF0oUbWYJiWwz81DCzhaLB+UYAibdAqcygaVuHOc9iVQaGKLYKtyp/J+9
	UofSSxY1OTfe2ObeFwLKuQWWQcDiVZJycp3FZ1OAqUv9hfuL83432sB6Q/+2dm7jr6WhP6aAMykZT
	TTPMQBnAp02i+hc8n2DiCV26BYQTZMhXq3Bu6+gzeGk/b7LsuaQ3Nk8oDCrv7m0cWlYLZnclYt583
	in3YoEayTzcF9qlxbu5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTrrs-00036F-9y; Wed, 29 Apr 2020 18:55:36 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTrrJ-0000SN-Ry
 for linux-amlogic@lists.infradead.org; Wed, 29 Apr 2020 18:55:03 +0000
Received: by mail-wm1-x341.google.com with SMTP id z6so3209360wml.2
 for <linux-amlogic@lists.infradead.org>; Wed, 29 Apr 2020 11:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=6YnbwWiKQ4Iao946t7dKTYYwMaT6iBCQ8RAc8IdgDxQ=;
 b=tF3Vfaj1HFl7qz5JJnZNlQQE0SjQ2PHHoZ2ssai5WnKiSXAWErxybdq60FuDs58EAe
 G5U5L5dIia+6TiCvPFmZp8dbxJBomRK78ZClIuWHuftf52F/SRz2mYQN6nGwJM/q3xtJ
 lHd5F2VXnl4eRtUdbpfsYjwGDJrblP+iLmkvb8QuYubddfNy970WhYgERnuwy/dfQS52
 TfbSLUsf8NDXrn5xjgvfrn9rNKDEysBo1fQrXCR/RdhzLcozDHeR9efgpoQKZO4MQJce
 LWQAEvmNO1tVxCqzY3DHaPV4ABgeoJWfXJePfWvJeNOYTx158NISh+hdLKN34kT9cakV
 +pVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=6YnbwWiKQ4Iao946t7dKTYYwMaT6iBCQ8RAc8IdgDxQ=;
 b=Spu7rXR0keAq4B5q3cTPrQpEEdfSYJ+YLCAJ9NMJA8TxMMptgcWhdo3bfcjC+mOg9/
 FTyi/b8BKjCSR/fUFzqKPL1rOmL/UCnLDGQgKd1cpPoIegtx+XfZ/5Vl9aiko+OUI5cE
 QtYjgPkVlG2PKhKwvWq+MtgrvRpfuu3/B6qw4L23JNTLO2rfHldfuIJfLeREd2SVyM+r
 f+AuAr7Czui63adsguqW9QENXzJz6rlWP/7YCEZEkzAfoHqSCRV8PeOOHTrBCcKcf+AY
 RDm4+QY1LWut+lvoHGopY5f40g2TDiFY6rZzriRaxI6iyw5HcwN76S2cNspw5DSpPbhn
 50lw==
X-Gm-Message-State: AGi0PuZ7GkZx3rAHUKZGAVLTZ5iduH3Bk8gcNJmX55Tnz2aEWgcCychG
 NA2q8Ezl3DUVrgrX14PfiL80Tw==
X-Google-Smtp-Source: APiQypLtXfk/wATMJxqBb2Qp5z3oODZe/lOdUgqR3v5FpRdEcmAOBgKUT58slykEAG9h6bg83V3fZw==
X-Received: by 2002:a05:600c:2f88:: with SMTP id
 t8mr4665841wmn.46.1588186496920; 
 Wed, 29 Apr 2020 11:54:56 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id f18sm276841wrq.29.2020.04.29.11.54.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 11:54:56 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Christian Hewitt <christianshewitt@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v4] arm64: dts: meson: S922X: extend cpu opp-points
In-Reply-To: <2A9D3FBA-917A-42C7-9757-4316D6B3D284@gmail.com>
References: <20200426162119.GA23268@imac>
 <1ja72x2t7w.fsf@starbuckisacylon.baylibre.com>
 <2A9D3FBA-917A-42C7-9757-4316D6B3D284@gmail.com>
Date: Wed, 29 Apr 2020 11:54:53 -0700
Message-ID: <7hd07qktqa.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_115501_931791_3E3BF90A 
X-CRM114-Status: UNSURE (   7.84  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, joy.cho@hardkernel.com,
 narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 Tim Lewis <elatllat@gmail.com>, robh+dt@kernel.org, tobetter@gmail.com,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Q2hyaXN0aWFuIEhld2l0dCA8Y2hyaXN0aWFuc2hld2l0dEBnbWFpbC5jb20+IHdyaXRlczoKCj4+
IE9uIDI3IEFwciAyMDIwLCBhdCAxOjA2IHBtLCBKZXJvbWUgQnJ1bmV0IDxqYnJ1bmV0QGJheWxp
YnJlLmNvbT4gd3JvdGU6Cj4+IAo+PiBPbiBTdW4gMjYgQXByIDIwMjAgYXQgMTg6MjEsIFRpbSBM
ZXdpcyA8ZWxhdGxsYXRAZ21haWwuY29tPiB3cm90ZToKPj4gCj4+PiBBZGQgZXh0cmEgY3B1IHBv
cCBwb2ludHMgdG8gYWxsb3cgbWlsZCBvdmVyY2xvY2sgb24gUzkyMlguIFRoZSBvcHAKPj4+IHBv
aW50cyBhcmUgZm91bmQgaW4gSGFyZGtlcm5lbCBOMiBzb3VyY2VzIFsxXSBhbmQgdGVzdGluZyBz
aG93cyBubwo+Pj4gb2J2aW91cyBpc3N1ZXMgb24gb3RoZXIgUzkyMlggZGV2aWNlcy4gVGhlcm1h
bCB0aHJvdHRsaW5nIHNob3VsZAo+Pj4ga2VlcCB0aGluZ3MgaW4tY2hlY2sgaWYgbmVlZGVkLgo+
PiAKPj4gVGhlIE9kcm9pZC1OMiBoYXMgYSBtYXNzaXZlIGhlYXRzaW5rIG1vdW50ZWQuCj4+IERv
IHdlIGhhdmUgYW55IGlkZWEgaWYgdGhpcyBhcHBsaWVzIChpcyBzYWZlKSBvbiBhbnkgb3RoZXIg
UzkyMngKPj4gZGV2aWNlID8KPgo+IEnigJl2ZSB0ZXN0ZWQgaXQgb24gc2V2ZXJhbCBTOTIyWCBi
b3ggZGV2aWNlcyB0aGF0IEkgaGF2ZSwgYW5kIGFsc28gdGhlCj4gb3JpZ2luYWwgUzkyMlggdmVy
c2lvbiBvZiB0aGUgVklNMyAtIGFsbCBoYXZlIHNpbWlsYXIgc2l6ZWQgcGFzc2l2ZQo+IGhlYXRz
aW5rcyBhYm91dCAyMCUgdGhlIHNpemUgb2YgdGhlIE4yIG9uZS4gTm8gb2J2aW91cyBpc3N1ZXMg
d2l0aAo+IEtvZGkgc29mdHdhcmUgZGVjb2RpbmcgdG8gaW5jcmVhc2UgQ1BVIHVzYWdlLiBOQjog
VGhlIG9yaWdpbmFsIHBhdGNoCj4gc3VibWlzc2lvbiB3YXMgTjIgc3BlY2lmaWMgYW5kIHRoZW4g
cmV3b3JrZWQgdG8gYXBwbHkgdG8gYWxsIFM5MjJYCj4gZGV2aWNlcyBhdCBOZWls4oCZcyBzdWdn
ZXN0aW9uIChhZnRlciBteSBUQiBhbmQgZWFybGllciBjb21tZW50cykuCgpZZXMsIHdlIGFsc28g
aGF2ZSBPUFAgbG93ZXJpbmcgZW5hYmxlZCBieSBkZWZhdWx0ICh3aGljaCBJIHRoaW5rIE5laWwK
bWVudGlvbmVkIGVhcmxpZXIpIHNvIHRoaXMgc2hvdWxkIGJlIHNhZmUgKGVub3VnaCkgdG8gYXBw
bHkuCgpRdWV1aW5nIGZvciB2NS44LAoKS2V2aW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

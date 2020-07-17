Return-Path: <SRS0=P5SD=A4=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF3EC433E2
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 10:12:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24F3F20768
	for <linux-amlogic@archiver.kernel.org>; Fri, 17 Jul 2020 10:12:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BSGHGUj2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ht2AWyqM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24F3F20768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:In-reply-to:Subject:To:
	From:References:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6/E9cMrOlZrwoSHQXxPtWeOuujNu55gIR7YETTgHMFk=; b=BSGHGUj2D7LbT3VfATJrZGHwR
	ZVoLcq61yb+0MNJa7b7qwD6+M2Sslq7UUTEBzDhxnEV0Skm6azUhjeubVpuQDlyFMvPLtDa+xZhp9
	YKMoA5LMWibvblzhqIex0ebcEakZCd28Y95l8A5LG+fPFkkY6tH6qIrWZqPo3+MOKgqxFUuox9A+S
	H/BDCcCDVzdBfJmfJsvlmDOXHsNN4xtGVjLS18MtFk8t5c8g7wVP3xHzS81ntWSxura3OdMOCV5Av
	8ZN8FAuTeUpKMQqVCUZex+fA+yw6Y6z3+jPFLSHpY91HlQ8wGkgqdoI0RvwwpaMW3ULh7+CMNI01x
	6crR+x9rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwNM0-0000XI-7T; Fri, 17 Jul 2020 10:12:32 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwNLv-0000Wk-OC
 for linux-amlogic@lists.infradead.org; Fri, 17 Jul 2020 10:12:28 +0000
Received: by mail-wm1-x344.google.com with SMTP id f139so16269989wmf.5
 for <linux-amlogic@lists.infradead.org>; Fri, 17 Jul 2020 03:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=5f/79zlSsBtoIVG6jKxUyT1jMHSPnLVG/13OvyBIGxE=;
 b=ht2AWyqMDrf5xIEs2tT3e5scMGvYvSriW0h0cFBSnSIlyvr7/cuV84mXGax+ARRKCP
 w3d8JXGGZVp1g0mApRPNHuaMazqkpE5v6zpussBulX551PvLR/R89mTvuYUSHSKirR9v
 gZrfI8pzUdxJLxDOc1Qim8dGYchDGhTJZM82qCS0bka4QjYd0OUV+5Cjzgc+iZ5CTD0K
 XtYXfuSuVnmKsyB9al8QA9QfjCk7M5kXtdOgZPmIe2DHgd5AeBJb7UpyTGVNSbiYtJ9a
 LUKD5n1Uye5gVf7gXZCUaUQnT5bJ3FLN/UouqHy3zWuS2EZ0m7K8MhAIZGqXeIy33RNH
 FAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=5f/79zlSsBtoIVG6jKxUyT1jMHSPnLVG/13OvyBIGxE=;
 b=IyxbYidpZVpXfOEIOsb0QshMkRz8yZrSRJTLWuQ2J0mDtzeiZSJGjmPJOPRrGVI8ls
 bsNShKso2S4hRiBFoq7LzwQ/PBGKUqKmUKXbrVDGnlnnB5njGbFpVRFpXPYIv09mPwkP
 iV+nnT/INtNHruVnW43otvk1Cp+W1LBq0XVhDAx8XEmdgSzce1KWNQAr95h8ahVCDnoL
 QDD0YdvWkiS/WCpCWY0dBaQR/AH0cV2rI6aZzX14B+DESpmiipjRDBmJqmhsJLicU+8b
 EPgCKpbPflOuuLsdIeCZJxBOF2bsqfun4rqbLR9aui0p4L0O8DQI6KxC48hr6+V3tENi
 lmqQ==
X-Gm-Message-State: AOAM530B7HOOYn1WS4+R/YYYIMOS3PkOjkmmMP3QpBQnZ5QYMxhWOr1e
 wUu/NPGHTyTVJNhamPb+Yi5QLg==
X-Google-Smtp-Source: ABdhPJyI1Y6/AAEAzTxddMkmB3l91YliJOZJpDg4TOFgr4KkH74gRph/+YwKXZQqPZ8Smpazgt1osQ==
X-Received: by 2002:a1c:18b:: with SMTP id 133mr8537370wmb.178.1594980746648; 
 Fri, 17 Jul 2020 03:12:26 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id k14sm13231494wrn.76.2020.07.17.03.12.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2020 03:12:24 -0700 (PDT)
References: <MWHPR1601MB13434435DE38471CEB6675CECD7E0@MWHPR1601MB1343.namprd16.prod.outlook.com>
 <5ebc4187-54c0-ce72-c7b0-2c88b0e24059@linux.intel.com>
User-agent: mu4e 1.3.3; emacs 26.3
From: Jerome Brunet <jbrunet@baylibre.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 =?utf-8?B?5bygIOWugQ==?= <zhangn1985@outlook.com>
Subject: Re: S905x: No sound with error log.
In-reply-to: <5ebc4187-54c0-ce72-c7b0-2c88b0e24059@linux.intel.com>
Date: Fri, 17 Jul 2020 12:12:23 +0200
Message-ID: <1jpn8upi0o.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200717_061227_832615_D05F74E4 
X-CRM114-Status: GOOD (  15.73  )
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
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Ck9uIFRodSAxNiBKdWwgMjAyMCBhdCAwNDozNywgUGllcnJlLUxvdWlzIEJvc3NhcnQgPHBpZXJy
ZS1sb3Vpcy5ib3NzYXJ0QGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cgo+IE9uIDcvMTUvMjAgNTow
NCBQTSwg5bygIOWugSB3cm90ZToKPj4gSGksCj4+IAo+PiBSZWNlbnQgYXNvYyBjaGFuZ2UgbWFr
ZXMgUzkwNXggYXVkaW8gY2FyZCBwcm9iIGZhaWxlZC4KPj4gCj4+IFsgICAgNi4zMzg0MjhdIGd4
LXNvdW5kLWNhcmQgc291bmQ6IENQVSBEQUkgSTJTIEVuY29kZXIgZm9yIHJ0ZCBiZS5kYWktbGlu
ay0xIGRvZXMgbm90IHN1cHBvcnQgY2FwdHVyZQo+PiBbICAgIDYuMzQyMTc2XSBneC1zb3VuZC1j
YXJkIHNvdW5kOiBBU29DOiBjYW4ndCBjcmVhdGUgcGNtIGJlLmRhaS1saW5rLTEgOi0yMgo+PiAK
Pj4gR29vZDogNS43LjMKPj4gQmFkOiA1LjcuNgo+PiAKPj4gQWZ0ZXIgcmVhZCBwYXRjaGVzLCBJ
IGZpbmQgc3VzcGVjdDoKPj4gCj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51
eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0L3NvdW5kL3NvYz9oPXY1LjcuOCZp
ZD0xYmI3MDdmYmZkNWMyNDYwMjhkNzZiOGYxMWExOWRmZDExOGQ2MzA2Cj4+IAo+PiB0aGlzIHBh
dGNoIGRvZXNu4oCZdCBhbGxvdyBwbGF5YmFjayBvbmx5IG9yIGNhcHR1cmUgb25seSBkYWktbGlu
ay4gV2h5Pwo+Cj4gaXQgZG9lcywgYnV0IHlvdSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGUgY2FwYWJp
bGl0aWVzIG9mIGEgZGFpIG1hdGNoIHRoZSAKPiBjYXBhYmlsaXR5IG9mIGEgZGFpbGluayB0aGV5
IGFyZSBwYXJ0IG9mLiBUaGUgYmUtZGFpLWxpbmsxIGNhbiBzdXBwb3J0IAo+IGNhcHR1cmUgYnV0
IHRoZSBJMlMgZW5jb2RlciBzbyBkb2Vzbid0IHlvdSBoYXZlIGFuIGludmFsaWQgY29uZmlndXJh
dGlvbi4KPgo+IENvdWxkIHRoaXMgYmUgdGhlIHByb2JsZW0gYmUgd2l0aCB0aGlzIGNvZGU6Cj4K
PiBpbnQgbWVzb25fY2FyZF9zZXRfYmVfbGluayhzdHJ1Y3Qgc25kX3NvY19jYXJkICpjYXJkLAo+
IAkJCSAgIHN0cnVjdCBzbmRfc29jX2RhaV9saW5rICpsaW5rLAo+IAkJCSAgIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqbm9kZSkKPiB7Cj4gCXN0cnVjdCBzbmRfc29jX2RhaV9saW5rX2NvbXBvbmVudCAq
Y29kZWM7Cj4gCXN0cnVjdCBkZXZpY2Vfbm9kZSAqbnA7Cj4gCWludCByZXQsIG51bV9jb2RlY3M7
Cj4KPiAJbGluay0+bm9fcGNtID0gMTsKPiAJbGluay0+ZHBjbV9wbGF5YmFjayA9IDE7Cj4gCWxp
bmstPmRwY21fY2FwdHVyZSA9IDE7Cj4KCkhpIFBpZXJyZS1Mb3VpcywKCmFjdHVhbGx5IHRoaXMg
cGF0Y2ggY2hhbmdlZCB0aGUgbWVhbmluZyBvZiB0aGUgZHBjbV9wbGF5YmFjayBhbmQKZHBjbV9j
YXB0dXJlIGZyb20gImlzX2FsbG93ZWQiIHRvICJpc19yZXF1aXJlZCIgYW5kIGl0IGJyb2tlIHRo
aXMgY2FyZAphbmQgYW5vdGhlciBvbmUgZm9yIG1lLgoKWWVzIHRoZSBmbGFnIGFyZSAiYmxpbmRs
eSIgc2V0IGJlY2F1c2Ugd2l0aCB0aGUgb2xkIG1lYW5uaW5nLCB0aGVyZSB3YXMKbm8gcmVhc29u
IHRvIGRpc2FsbG93IGFueSBkaXJlY3Rpb24uIEFsc28gdGhlIGNhcmQgZHJpdmVyIG9ubHkgaGFu
ZGxlcwpEVCBwaGFuZGxlIGFuZCBkb2VzIG5vdCBrbm93IG11Y2ggYWJvdXQgdGhlIERBSSAoQkUp
IGNhcHMuCgpZb3VyIGNoYW5nZSBpbiBBU29DIGNvcmUgd2FzIG1lYW50IHRvIGFkZCBzdXBwb3J0
IGZvciBtdWx0aSBjcHUgQkUgbGluawpidXQ6CiAtIGl0IGNoYW5nZWQgdGhlIG1lYW5pbmcgb2Yg
dGhlIGZsYWdzCiAtIGl0IGZvcmNlcyBhbGwgQ1BVIG9uIHRoZSBCRSBsaW5rIHRvIHNoYXJlIHRo
ZSBzYW1lIGRpcmVjdGlvbgogY2FwYWJpbGl0eS4gCgo+IFNldHRpbmcgdGhlIGZsYWdzIGJsaW5k
bHkgaXMgbm90IHNvIGdvb2QuIEEgaGVscGVyIHdhcyBhZGRlZCByZWNlbnRseSwgCj4gc2VlIDI1
NjEyNDc3ZDIwYiAoJ0FTb0M6IHNvYy1kYWk6IHNldCBkYWlfbGluayBkcGNtXyBmbGFncyB3aXRo
IGEKPiBoZWxwZXInKQoKU2FtZSB3aXRoIHRoaXMgY2hhbmdlLCBpZiBhbnkgY29kZWMgZG9lcyBu
b3Qgc3VwcG9ydCBhIHN0cmVhbSBkaXJlY3Rpb24sCml0IGdldHMgZGlzYWJsZWQuIEJ1dCBpdCBp
cyB1bmNvbW1vbiB0byBoYXZlIGxpbmsgd2l0aCBtdWx0aXBsZSBjb2RlYywKb25lIGZvciBlYWNo
IHN0cmVhbSBkaXJlY3Rpb24uIFRoZSBjb21taXQgYWJvdmUgd291bGQgYnJlYWsgdGhvc2UgY2Fy
ZHMKCkNvdWxkIHlvdSB0ZWxsIHdoeSBpdCB3YXMgbm90IHBvc3NpYmxlIHRvIHJldGFpbiB0aGUg
cHJldmlvdXMgbG9naWMKd2hpY2ggd2FzIDogZGlzYWJsZSB0aGUgc3RyZWFtIGRpcmVjdGlvbiBp
ZgogLSBkcGNtX3tjYXB0dXJlLHBsYXliYWNrKSBpcyBmYWxzZSBPUgogLSBubyBjb2RlYyBzdXBw
b3J0IHRoZSBkaXJlY3Rpb24gKHNhbWUgd291bGQgYXBwbHkgdG8gY3B1KQoKPz8KCj4KPgo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gbGludXgtYW1s
b2dpYyBtYWlsaW5nIGxpc3QKPiBsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1h
bWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

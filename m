Return-Path: <SRS0=5M87=US=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36BA8C43613
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2019 22:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 064642147A
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Jun 2019 22:14:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eqtLTvDp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/fnEbMs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 064642147A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7LJQxsORaih08M+59CW1ODSzEkpdHeQssdgU0xlknQw=; b=eqtLTvDpjCotlk
	BwVhgSnLnwAgckcQA9sk086/CCOgVqTmxxd4OrhOQF6js4rS9U5zBY1bR5YIyVY3HePatG0Luq+DE
	3S5ma52WcPc0btEN3RM0XIiX871Ne2aovt5xOD7mdyixDYW/FyN/ZD4swkd+jwatvVoU8d/8WQ0fl
	g6m4ebYWp6iZC+epkNBMTGOqfrZ7zLy0oxvD+rY1BiIBOb4qhUAp9G4v2gN5+zs3gOeGQmtRhu+xR
	swNqP0yKXqmfRv1pKW5EX0nE8A1VT5woMjCQLp6Xq/7uHOgL/fqEhiSV5XZAe3lStcGSw+I9dfUzq
	MiFrM+xCWNzpL7M+/7EA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hdiqn-0000EG-42; Wed, 19 Jun 2019 22:14:41 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hdiqj-0000Dg-GM
 for linux-amlogic@lists.infradead.org; Wed, 19 Jun 2019 22:14:39 +0000
Received: by mail-wm1-x341.google.com with SMTP id f17so1077971wme.2
 for <linux-amlogic@lists.infradead.org>; Wed, 19 Jun 2019 15:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C7dXNMpZ/PnE4ssC+RMhi/ByfdDT7v9LJrTngPMmeJ8=;
 b=B/fnEbMsE3Ds9+Q2fV5/qbvCjNQJVsOftx6bYIyzB+lzw1gW8sxEWJCXU2fesaJ1Gk
 75J4MPFU3KItER5B1ElPtPwSKSVFiiirJrvldRPEOk5cVUj4gN1KTsMDj4jIDJJCOs5k
 KrgX4vIxUBv2s7dEhCHGK7Cy5hjtDcHMLmX5FLgeAALGUlCppGvrQA5dyVgXZtc1DBnK
 FoTFqeFoJpH/UGbhMB+Lk6ntOEyPmbgsfT+M5UOObDx9CbEdk+uQprqagAYJJ1BOLdTi
 3wsIutn8INIe9RtrM/TA+JmcfLH7hlRFjoxVWcFNlXE1du5GYq6G1ZoEnUN+w6IxAxYN
 9WIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C7dXNMpZ/PnE4ssC+RMhi/ByfdDT7v9LJrTngPMmeJ8=;
 b=is2X+u7YP3/pazPKvw57Z6ojx8UGAs34QMK2trHVR0mSKGSbhIrqwwB1bSC7kW4WOt
 70Z1sO8dEQ7jyEGQpharI5Sqp7Ktzf/7WHrqUxhj1A26scURPA6UmpIXLYy7sBlPY55a
 Jl+TixtTX6WkMAJO25Fwjl9EwYx3QLyZfrUYVarTT4HZsrN0AOleUdzysvtcOniK/kSQ
 R1pUjSgiogfUuMG6EB/r1sl3tIppaKSECIk3t1Su5463oNePKmQsWA6/cbjRYbQwVH7Y
 Zbxm42qOPdOGr4TUFS1LDqcn2MyeAOllRHxdZ0A7ei72HOoqGVwEGPwkoWE73sMpJPz+
 dxoA==
X-Gm-Message-State: APjAAAVL3v2hCmx+MIeabWmf+dWFZD1DAiSH2lhNhe4kXnInDdMQCein
 cIdk3wngKEiNqtb1w6v6pVM=
X-Google-Smtp-Source: APXvYqwXS8p7Zh2/WDeBjYAlQ1bqhluCfp/i82D0ywQjNRtG7ZSkUAXYX/qMFIkTCIK+h5MUG7q6Hg==
X-Received: by 2002:a7b:c775:: with SMTP id x21mr9865822wmk.9.1560982473963;
 Wed, 19 Jun 2019 15:14:33 -0700 (PDT)
Received: from ?IPv6:2003:ea:8bf3:bd00:e495:2e7:a162:327f?
 (p200300EA8BF3BD00E49502E7A162327F.dip0.t-ipconnect.de.
 [2003:ea:8bf3:bd00:e495:2e7:a162:327f])
 by smtp.googlemail.com with ESMTPSA id v67sm3546464wme.24.2019.06.19.15.14.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 15:14:33 -0700 (PDT)
Subject: Re: network unstable on odroid-c1/meson8b.
To: Aymeric <mulx@aplu.fr>, netdev@vger.kernel.org
References: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <0df100ad-b331-43db-10a5-3257bd09938d@gmail.com>
Date: Thu, 20 Jun 2019 00:14:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <ff9a72bf-7eeb-542b-6292-dd70abdc4e79@aplu.fr>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190619_151437_549002_1D8EB72B 
X-CRM114-Status: GOOD (  24.31  )
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
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTkuMDYuMjAxOSAyMjoxOCwgQXltZXJpYyB3cm90ZToKPiBIZWxsbyBhbGwsCj4gCj4gSSd2
ZSBhbiBPRFJPSUQtQzEgYm9hcmQgKGEgbWVzb244Yi9TODA1KSBhbmQgSSd2ZSBzb21lIG5ldHdv
cmsKPiB1bnN0YWJsaXR5IHdpdGggY3VycmVudCBtYWlubGluZSBrZXJuZWw7IGFzIHRpbWUgb2Yg
d3JpdHRpbmcsIHRlc3RlZAo+IDUuMC55LCA1LjEueSwgNS4yLXJjNCBhbmQgZGlkbid0IHRyeSB3
aXRoIGFueSBvdGhlcnMgdmVyc2lvbnMuCj4gCj4gQWZ0ZXIgYSBmZXcgdGFsa3Mgb24gbGludXgt
YW1sb2dpYyBtYWlsaW5nIGxpc3QsIEkndmUgYmVlbiBwb2ludGVkIGhlcmUKPiB0byBmaW5kIGFu
ZCwgaG9wcGVmdWxseSwgZml4IHRoZSBpc3N1ZS4KPiBUaGUgd2hvbGUgdGhyZWFkIG9uIGxpbnV4
LWFtbG9naWMgaXMgYXZhaWxhYmxlIGhlcmU6IFvCuV0KPiAKPiBBIHNob3J0IHN1bW1hcnk6Cj4g
MS4gV2l0aCBLZXJuZWwgMy4xMC5zb21ldGhpbmcgbWFkZSBieSBIYXJka2VybmVsICh0aGUgb25l
IGZyb20gdGhlIGJvYXJkCj4gdmVuZG9yKSwgdGhlIG5ldHdvcmsgbGluayBpcyB3b3JraW5nIGF0
IDEgZ2lnYWJpdCBhbmQgc3RheSBhdCAxIGdpZ2FiaXQuCj4gMi4gV2l0aCBLZXJuZWwgNS4wLnks
IDUuMS55LCBtYWlubGluZSwgdGhlIG5ldHdvcmsgbGluayBnb2VzIGZyb20gdXAgdG8KPiBkb3du
IGV2ZXJ5IGZldyBzZWNvbmRzIGF0IDEgZ2lnYWJpdCAobWFraW5nIHRoZSBib2FyZCB1bnVzYWJs
ZSkgYnV0IGlzCj4gd29ya2luZyBmaW5lIHdoZW4gZm9yY2VkIGF0IDEwME1iICh1c2luZyBldGh0
b29sIGNvbW1hbmQpLgo+IDMuIFRoZSBldGhlcm5ldCBjYWJsZSBpcyBub3QgdGhlIGNhdXNlIG9m
IHRoZSBpc3N1ZSAoc2VlICM0KS4KPiA0LiBBZnRlciBhIGZldyBtb3JlIGNoZWNrLCBJIHdhcyBh
YmxlIHRvIG5hcnJvdyB0aGUgcHJvYmxlbS4gSXQncyBvbmx5Cj4gcHJlc2VudCB3aGVuIHRoZSBi
b2FyZCBpcyBjb25uZWN0ZWQgdG8gbXkgImludGVybmV0IGJveCIgKGEgTGl2ZWJveAo+IDMvU2Fn
ZW1jb20pIGJ1dCBub3Qgd2l0aCBhICJzdHVwaWQiIGQtbGluayBzd2l0Y2ggKGJvdGggaGF2ZSBn
aWdhYml0Cj4gY2FwYWJpbGl0eSkuCj4gNS4gV2l0aCB0aGUgaGVscCBmcm9tIE1hcnRpbiBvbiBs
aW51eC1hbWxvZ2ljIEkndmUgdHJpZWQgdG8gZGlzYWJsZSBFRUUKPiBpbiB0aGUgZHRiIGJ1dCBp
dCBkaWRuJ3QgY2hhbmdlIGFueXRoaW5nLgo+IDYuIEFuIGV4dHJhY3Qgb2YgdGhlIGRtZXNnIG91
dHB1dCBncmVwcGluZyBldGhlcm5ldCBhbmQgbWVzb24gaXMgaGVyZQo+IHdoZW4gdGhlIGlzc3Vl
IGlzIG9jY3VyaW5nOiBbwrJdLgo+IApLZXJuZWwgMy4xMCBkaWRuJ3QgaGF2ZSBhIGRlZGljYXRl
ZCBSVEw4MjExRiBQSFkgZHJpdmVyIHlldCwgdGhlcmVmb3JlCkkgYXNzdW1lIHRoZSBnZW5waHkg
ZHJpdmVyIHdhcyB1c2VkLiBEbyB5b3UgaGF2ZSBhIGxpbmUgd2l0aAoiYXR0YWNoZWQgUEhZIGRy
aXZlciIgaW4gZG1lc2cgb3V0cHV0IG9mIHRoZSB2ZW5kb3Iga2VybmVsPwoKVGhlIGRlZGljYXRl
ZCBQSFkgZHJpdmVyIHRha2VzIGNhcmUgb2YgdGhlIHR4IGRlbGF5LCBpZiB0aGUgZ2VucGh5CmRy
aXZlciBpcyB1c2VkIHdlIGhhdmUgdG8gcmVseSBvbiB3aGF0IHVib290IGNvbmZpZ3VyZWQuCkJ1
dCBpZiB3ZSBpbmRlZWQgaGFkIGFuIGlzc3VlIHdpdGggYSBtaXNjb25maWd1cmVkIGRlbGF5LCBJ
IHRoaW5rCnRoZSBjb25uZWN0aW9uIHNob3VsZG4ndCBiZSBmaW5lIHdpdGgganVzdCBhbm90aGVy
IGxpbmsgcGFydG5lci4KSnVzdCB0byBoYXZlIGl0IHRlc3RlZCB5b3UgY291bGQgbWFrZSBydGw4
MjExZl9jb25maWdfaW5pdCgpIGluCmRyaXZlcnMvbmV0L3BoeS9yZWFsdGVrLmMgYSBuby1vcCAo
aW4gY3VycmVudCBrZXJuZWxzKS4KCkFuZCB5b3UgY291bGQgY29tcGFyZSBhdCBsZWFzdCB0aGUg
YmFzaWMgUEhZIHJlZ2lzdGVycyAweDAwIC0gMHgzMAp3aXRoIGJvdGgga2VybmVsIHZlcnNpb25z
LCBlLmcuIHdpdGggcGh5dG9vbC4KCj4gCj4gQW5kIHRoZSBsYXN0IGNvbW1lbnQgZnJvbSBNYXJ0
aW4gYW5kIHdoeSBJJ20gc2VuZGluZyBhIG1haWwgaGVyZToKPiAtIHRoZSBBbWxvZ2ljIFNvQ3Mg
dXNlIGEgRGVzaWduV2FyZSBNQUMgKEV0aGVybmV0IGNvbnRyb2xsZXIsIHRoZSBkcml2ZXIKPiBp
cyBjYWxsZWQgc3RtbWFjKSB3aXRoIGEgUmVsYXRlayBSVEw4MjExRiBFdGhlcm5ldCBQSFkuCj4g
LSB0aGVyZSdzIGxpdHRsZSBBbWxvZ2ljIHNwZWNpZmljIHJlZ2lzdGVycyBpbnZvbHZlZDogdGhl
eSBtb3N0bHkKPiBjb250cm9sIHRoZSBQSFkgaW50ZXJmYWNlIChlbmFibGluZyBSTUlJIG9yIFJH
TUlJKSBhbmQgdGhlIGNsb2NrcyBzbwo+IGl0J3MgdmVyeSBsaWtlbHkgdGhhdCBzb21lb25lIG9u
IHRoZSBuZXRkZXYgbGlzdCBoYXMgYW4gaWRlYSBob3cgdG8KPiBkZWJ1ZyB0aGlzIGJlY2F1c2Ug
YSBsYXJnZSBwYXJ0IG9mIHRoZSBFdGhlcm5ldCBzZXR1cCBpcyBub3QgQW1sb2dpYyBTb0MKPiBz
cGVjaWZpYwo+IAo+IFNvIGlmIHlvdSd2ZSBnb3QgYW55IGlkZWEgdG8gZml4IHRoaXMgaXNzdWUu
LiA6KQo+IAo+IFRoYW5rcyBpbiBhZHZhbmNlLAo+IAo+IEF5bWVyaWMuCj4gCkhlaW5lcgo+IAo+
IFvCuV06Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LWFtbG9n
aWMvMjAxOS1KdW5lLzAxMjM0MS5odG1sCj4gW8KyXToKPiBodHRwczovL3Bhc3RlLmFwbHUuZnIv
P2I1ZWI2ZGY0OGE5Yzk1YjYjc3FIazh4aFdHd1JmYWdXTnBMK3U3bUlzUEdXVldGbjJkN3hCcWlr
YThLYz0KPiAKPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1hbWxvZ2ljCg==

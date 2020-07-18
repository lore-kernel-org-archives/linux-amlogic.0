Return-Path: <SRS0=xEby=A5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A0EEC433E3
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 08:48:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E960B2064C
	for <linux-amlogic@archiver.kernel.org>; Sat, 18 Jul 2020 08:48:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qTk4f5sF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tvocZCrL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E960B2064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Mho0MLfQ2CAuVtz828GhtdqET0h9ggfSHzrUrKXIT2U=; b=qTk4f5sFyNuWN7t3a59bLza72
	ncXxKiB4j3iMxWN+N8TNwywkCC6PsiqSMfZbU+9OkMBdKBXXBFxJsq5+rd4xI8yQI6PMRikVheUcS
	5fXWOSnBsini6LkktNc2CfUElMrVxTSB5tQC9poSgaIHBuFML74d8X9VOibHwJCTRAVcu+bLjwkyb
	8WQe9ib2n+QaAOFTI/HXWk+luGYgxLPhbglEJ+kC21P5oCybg+VpQmiK+B2BIt/PkwOes6WwW4J4h
	K3Zoh79DqCG768dCy2XlrWpsBXMspBt0ZeaQP3HMYxYcEIsYcnEVMUeNAJ11uDurCRhkTGYXjII6c
	Sb7NNTw4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwiVk-00053e-23; Sat, 18 Jul 2020 08:48:00 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwiVh-00052A-Es
 for linux-amlogic@lists.infradead.org; Sat, 18 Jul 2020 08:47:58 +0000
Received: by mail-wm1-x344.google.com with SMTP id o2so20685321wmh.2
 for <linux-amlogic@lists.infradead.org>; Sat, 18 Jul 2020 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=/BnbLofxmYkS2s72/Cz2jlRqnsmW/+MfglcmklLNuWs=;
 b=tvocZCrLluWjeyiIUmxqQn6+132t6YQ8t5d6caP1zTGxMf9FO/6TULpIAJJektRvnk
 cuHZ0Y3jPti+TBrLRICtop4GzeEV9yjUCPQD4tthdn2tVn6ilD1oeoHNPsdqRUCYR02S
 1QKyIJWGMZOEoUC+eqzjGjolkQTbQrh6aIMu+7mJ4mNXAhpLTyN2kJNWmwjv+UmkjCDG
 Xktz7g/wmmti2BtrlgEHXSt+ybTBz53mqy3kRnhzvtv2EWuDSbxtOeSjhPc1jJUL9McC
 jBB6Lx79iU8FOeCNBDptTHsI1UMe/0BDWk6NZDUGxVg7S04ida+hTxLK/oOixlb9MBtQ
 /WOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:cc:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding;
 bh=/BnbLofxmYkS2s72/Cz2jlRqnsmW/+MfglcmklLNuWs=;
 b=p0cl1BI4sQH9oRRuvzwlJy4scyJvSoSVU37d05wjy/JuG5tr+/RZGGCJiCk7Lt+QjC
 hv/XZZtQmRS5yJmUzsiA2e6lrMF+HCUY2vrOrCYzp0Ifgx2pMFKX3Zf8E4KQ5ZWs2AyM
 /TIa/QBOSLcj+0bg8wx32y6gh7kDnb1+kwfAHJElIXku5Nrz0cm366L/XLoDQiMVfGAF
 KafTlF98PJUAzOYKpvwbjvIPmoMZD94tPEgo4cUx8EEZU0675qhtK9YzaVLBIu6/1TXE
 CrMbeQ/lo7ehC6alIjpRzy5bHMinK9jZGLEKI97vm2GsmMzAwn4qErN5+abZSC56fD1V
 WthA==
X-Gm-Message-State: AOAM5307Zt+eO8jGxCwv7/mCXfol5st9Y0xnjKOKA9b+haGuTbtdV60o
 B4VZ1X62Li+geg26JTXGlhzw/A==
X-Google-Smtp-Source: ABdhPJyAsg4NxrlLyDTwnHWx/NChOXQU5czRAJbgjnftVNHkZw/92YTtToJGLENcYVJJ5BKm7Vd+sQ==
X-Received: by 2002:a7b:c246:: with SMTP id b6mr13648684wmj.161.1595062075973; 
 Sat, 18 Jul 2020 01:47:55 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e35:2ec0:82b0:9d0:bf63:799d:4aa1])
 by smtp.gmail.com with ESMTPSA id b10sm17451188wmj.30.2020.07.18.01.47.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 18 Jul 2020 01:47:55 -0700 (PDT)
Subject: Re: [PATCH 1/1] usb: dwc3: meson-g12a: fix shared reset control use
To: Dan Robertson <dan@dlrobertson.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>
References: <20200713160522.19345-1-dan@dlrobertson.com>
 <20200713160522.19345-2-dan@dlrobertson.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <d9c2c755-452d-62bd-f792-1d84b76ceea4@baylibre.com>
Date: Sat, 18 Jul 2020 10:47:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:45.0)
 Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20200713160522.19345-2-dan@dlrobertson.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_044757_531175_F3BF3D7F 
X-CRM114-Status: GOOD (  19.73  )
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
Cc: linux-amlogic@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGksCgpMZSAxMy8wNy8yMDIwIMOgIDE4OjA1LCBEYW4gUm9iZXJ0c29uIGEgw6ljcml0IDoKPiBU
aGUgcmVzZXQgaXMgYSBzaGFyZWQgcmVzZXQgbGluZSwgYnV0IHJlc2V0X2NvbnRyb2xfcmVzZXQg
aXMgc3RpbGwgdXNlZAo+IGFuZCByZXNldF9jb250cm9sX2RlYXNzZXJ0IGlzIG5vdCBndWFyYW50
ZWVkIHRvIGhhdmUgYmVlbiBjYWxsZWQgYmVmb3JlCj4gdGhlIGZpcnN0IHJlc2V0X2NvbnRyb2xf
YXNzZXJ0IGNhbGwuIFdoZW4gc3VzcGVuZGluZyB0aGUgZm9sbG93aW5nCj4gd2FybmluZyBtYXkg
YmUgc2VlbjoKPiAKPiBXQVJOSU5HOiBDUFU6IDEgUElEOiA1NTMwIGF0IGRyaXZlcnMvcmVzZXQv
Y29yZS5jOjM1NSByZXNldF9jb250cm9sX2Fzc2VydCsweDE4NC8weDE5Ywo+IEhhcmR3YXJlIG5h
bWU6IEhhcmRrZXJuZWwgT0RST0lELU4yIChEVCkKPiBbLi5dCj4gcGMgOiByZXNldF9jb250cm9s
X2Fzc2VydCsweDE4NC8weDE5Ywo+IGxyIDogZHdjM19tZXNvbl9nMTJhX3N1c3BlbmQrMHg2OC8w
eDdjCj4gWy4uXQo+IENhbGwgdHJhY2U6Cj4gIHJlc2V0X2NvbnRyb2xfYXNzZXJ0KzB4MTg0LzB4
MTljCj4gIGR3YzNfbWVzb25fZzEyYV9zdXNwZW5kKzB4NjgvMHg3Ywo+ICBwbGF0Zm9ybV9wbV9z
dXNwZW5kKzB4MjgvMHg1NAo+ICBfX2RldmljZV9zdXNwZW5kKzB4NTkwLzB4YWJjCj4gIGRwbV9z
dXNwZW5kKzB4MTA0LzB4NDA0Cj4gIGRwbV9zdXNwZW5kX3N0YXJ0KzB4ODQvMHgxYmMKPiAgc3Vz
cGVuZF9kZXZpY2VzX2FuZF9lbnRlcisweGM0LzB4NGZjCj4gIHBtX3N1c3BlbmQrMHgxOTgvMHgy
ZDQKPiAKPiBGaXhlczogNmQ5ZmEzNWEzNDdhODcgKCJ1c2I6IGR3YzM6IG1lc29uLWcxMmE6IGdl
dCB0aGUgcmVzZXQgYXMgc2hhcmVkIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gUm9iZXJ0c29uIDxk
YW5AZGxyb2JlcnRzb24uY29tPgo+IC0tLQo+ICBkcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24t
ZzEyYS5jIHwgMTUgKysrKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDYgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMv
ZHdjMy1tZXNvbi1nMTJhLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2R3YzMtbWVzb24tZzEyYS5jCj4g
aW5kZXggMWY3ZjRkODhlZDlkLi44OGI3NWI1YTAzOWMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy91
c2IvZHdjMy9kd2MzLW1lc29uLWcxMmEuYwo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZHdjMy1t
ZXNvbi1nMTJhLmMKPiBAQCAtNzM3LDEzICs3MzcsMTMgQEAgc3RhdGljIGludCBkd2MzX21lc29u
X2cxMmFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiAgCQlnb3RvIGVycl9k
aXNhYmxlX2Nsa3M7Cj4gIAl9Cj4gIAo+IC0JcmV0ID0gcmVzZXRfY29udHJvbF9yZXNldChwcml2
LT5yZXNldCk7Cj4gKwlyZXQgPSByZXNldF9jb250cm9sX2RlYXNzZXJ0KHByaXYtPnJlc2V0KTsK
PiAgCWlmIChyZXQpCj4gLQkJZ290byBlcnJfZGlzYWJsZV9jbGtzOwo+ICsJCWdvdG8gZXJyX2Fz
c2VydF9yZXNldDsKPiAgCj4gIAlyZXQgPSBkd2MzX21lc29uX2cxMmFfZ2V0X3BoeXMocHJpdik7
Cj4gIAlpZiAocmV0KQo+IC0JCWdvdG8gZXJyX2Rpc2FibGVfY2xrczsKPiArCQlnb3RvIGVycl9h
c3NlcnRfcmVzZXQ7Cj4gIAo+ICAJcmV0ID0gcHJpdi0+ZHJ2ZGF0YS0+c2V0dXBfcmVnbWFwcyhw
cml2LCBiYXNlKTsKPiAgCWlmIChyZXQpCj4gQEAgLTc1Miw3ICs3NTIsNyBAQCBzdGF0aWMgaW50
IGR3YzNfbWVzb25fZzEyYV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJ
aWYgKHByaXYtPnZidXMpIHsKPiAgCQlyZXQgPSByZWd1bGF0b3JfZW5hYmxlKHByaXYtPnZidXMp
Owo+ICAJCWlmIChyZXQpCj4gLQkJCWdvdG8gZXJyX2Rpc2FibGVfY2xrczsKPiArCQkJZ290byBl
cnJfYXNzZXJ0X3Jlc2V0Owo+ICAJfQo+ICAKPiAgCS8qIEdldCBkcl9tb2RlICovCj4gQEAgLTc2
NSwxMyArNzY1LDEzIEBAIHN0YXRpYyBpbnQgZHdjM19tZXNvbl9nMTJhX3Byb2JlKHN0cnVjdCBw
bGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAo+ICAJcmV0ID0gcHJpdi0+ZHJ2ZGF0YS0+dXNiX2lu
aXQocHJpdik7Cj4gIAlpZiAocmV0KQo+IC0JCWdvdG8gZXJyX2Rpc2FibGVfY2xrczsKPiArCQln
b3RvIGVycl9hc3NlcnRfcmVzZXQ7Cj4gIAo+ICAJLyogSW5pdCBQSFlzICovCj4gIAlmb3IgKGkg
PSAwIDsgaSA8IFBIWV9DT1VOVCA7ICsraSkgewo+ICAJCXJldCA9IHBoeV9pbml0KHByaXYtPnBo
eXNbaV0pOwo+ICAJCWlmIChyZXQpCj4gLQkJCWdvdG8gZXJyX2Rpc2FibGVfY2xrczsKPiArCQkJ
Z290byBlcnJfYXNzZXJ0X3Jlc2V0Owo+ICAJfQo+ICAKPiAgCS8qIFNldCBQSFkgUG93ZXIgKi8K
PiBAQCAtODA5LDYgKzgwOSw5IEBAIHN0YXRpYyBpbnQgZHdjM19tZXNvbl9nMTJhX3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAlmb3IgKGkgPSAwIDsgaSA8IFBIWV9DT1VO
VCA7ICsraSkKPiAgCQlwaHlfZXhpdChwcml2LT5waHlzW2ldKTsKPiAgCj4gK2Vycl9hc3NlcnRf
cmVzZXQ6Cj4gKwlyZXNldF9jb250cm9sX2Fzc2VydChwcml2LT5yZXNldCk7Cj4gKwo+ICBlcnJf
ZGlzYWJsZV9jbGtzOgo+ICAJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUocHJpdi0+ZHJ2ZGF0
YS0+bnVtX2Nsa3MsCj4gIAkJCQkgICBwcml2LT5kcnZkYXRhLT5jbGtzKTsKPiAKCgpUaGlzIHNo
b3VsZCBkbyB0aGUgdHJpY2ssIEknbGwgbmVlZCB0byBjaGVjayBmaXJzdCBpZiBpdCBkb2Vzbid0
IGJyZWFrIHRoZSBHWEwvR1hNCnN1cHBvcnQgZmlyc3QuCgp0aGFua3MgZm9yIHRoZSBmaXgKCk5l
aWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

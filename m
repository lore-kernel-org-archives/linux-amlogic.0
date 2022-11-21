Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A90BC433FE
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Nov 2022 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRTtzxB3S/0DLcqz/6rBm9QAvGrUgdeelD7mXZGoz44=; b=0VV4jhsBj+QRl0na9bLxPogcR+
	SO8MCPbcnALNTUh8dXSpNMNf5d/wD7pDMNizeYskJ88PxmyjGr+1T3GJ1JtZXyqB8ul/uOiGTEgtv
	bqm1/TqTJvebyOC0ZFHRUKEcXfM944ypjdknym2YZpePHUiJTkPpX0iGQVsPRzRMimNMIK+iQd5Ll
	swUhnBprbiNYIJOlBmEMAZRQuDF9IyLX1f1xm0X3s2BuP1frOjpKPa1GTSA2oocq4O/GT1hJFjPun
	1s3cMnc84fhgy/6jBMM8auPzPpHVhqnmRMsPwlBr9WJY0jO4b6Whoo12TVjEjpTWHsB+zrWTvDDk3
	HBQXRkjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3Xs-00C2Rk-M0; Mon, 21 Nov 2022 09:56:56 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox3Xq-00C2OA-A4
	for linux-amlogic@lists.infradead.org; Mon, 21 Nov 2022 09:56:55 +0000
Received: by mail-wm1-x331.google.com with SMTP id i64-20020a1c3b43000000b003d016c21100so2735791wma.3
        for <linux-amlogic@lists.infradead.org>; Mon, 21 Nov 2022 01:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KV4ztLMcqo35iUBenDly0e7oE30KFyPrfUjUB/4nml8=;
        b=qGAIRSJg/brYeUvsyEhgzjSgthv9J4NlAZTdDGZE3ltPHyHTUBKuufvD9IOgqR7gED
         XZDbxN9gEVYJ5ESX05/5hpWG3VP1EWjablmqViOnF5Figgexbs5ZmhupJgMaRN593K+K
         FTsMWZVUirtfeHBKEwMOV3ruMEPxahUfSWu9eQyunwiv6Y2AyU9Tbrxrg5RmQS+zpFJ2
         ALMz8auoeKfkKAM9nxWsrc4Iaq16l+SaVqJubpahEhNmfg39rRiSbo64PR7jKecJrUhW
         P53+xfQ7CA7bSbFPkxvMGBUU/ZRM2SczqIhhN+L/dtyISAc3lI+WaWXBYiKLRAucFnbh
         Gcjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KV4ztLMcqo35iUBenDly0e7oE30KFyPrfUjUB/4nml8=;
        b=H3fhCdeDp6ZE72iJL7Btn2JmYR/5riIoJiiea8Scic8pnnvL9foPUcWsVrggBv3VKv
         qIS/r3cFr8xPbspTHSROJpOZP1sgpa13UlZgu3eaHpr1898l8zGgWCo95ogl0wLa8RjC
         OoXngUgVY2RjWhD4BCkjLza4d2hxJH9+tC2dukdvq8C671SCF17t1d8MCI+ELdy/UuHR
         axFwenvFvpY3xWOsy3gVvI2QeM3EXnniW3aAngpI9VMUJwYPN547xiHLSBjXPT3EI0bC
         KUObRyYIP9idWfdg5mjy1lPaSqyrxr5041LANbUXbitZX3BDn7kPR7Q5JlIfSzQw0wY5
         iokA==
X-Gm-Message-State: ANoB5pmzuexQGTAHsQ7xSW0FOi1moVVWyqEJxnGcpn12RwGlz9BGWio6
	1f4QtF/YwXERqVal0vF2oK3eAQ==
X-Google-Smtp-Source: AA0mqf78HuAM8JefAVkxBLHkJ/3gFtd683lcl+iP0S0BL7YXdl+m7GNJV+8qdD2ftDKZbVbK7HdSPA==
X-Received: by 2002:a05:600c:1e11:b0:3cf:8d52:a216 with SMTP id ay17-20020a05600c1e1100b003cf8d52a216mr3223702wmb.77.1669024611860;
        Mon, 21 Nov 2022 01:56:51 -0800 (PST)
Received: from [192.168.7.93] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id l8-20020a5d4bc8000000b002238ea5750csm10734448wrt.72.2022.11.21.01.56.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 01:56:51 -0800 (PST)
Message-ID: <929e06bf-84b5-047f-91e9-29876b721cee@linaro.org>
Date: Mon, 21 Nov 2022 10:56:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 431/606] mfd: khadas-mcu: Convert to i2c's .probe_new()
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 Lee Jones <lee@kernel.org>
Cc: linux-i2c@vger.kernel.org, kernel@pengutronix.de,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-432-uwe@kleine-koenig.org>
Organization: Linaro Developer Services
In-Reply-To: <20221118224540.619276-432-uwe@kleine-koenig.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_015654_387780_CC0F4F77 
X-CRM114-Status: GOOD (  16.15  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gMTgvMTEvMjAyMiAyMzo0MiwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gRnJvbTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4KPiAKPiBUaGUg
cHJvYmUgZnVuY3Rpb24gZG9lc24ndCBtYWtlIHVzZSBvZiB0aGUgaTJjX2RldmljZV9pZCAqIHBh
cmFtZXRlciBzbyBpdAo+IGNhbiBiZSB0cml2aWFsbHkgY29udmVydGVkLgo+IAo+IFNpZ25lZC1v
ZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+
Cj4gLS0tCj4gICBkcml2ZXJzL21mZC9raGFkYXMtbWN1LmMgfCA1ICsrLS0tCj4gICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL21mZC9raGFkYXMtbWN1LmMgYi9kcml2ZXJzL21mZC9raGFkYXMtbWN1LmMKPiBp
bmRleCBmM2Q0MTg4MTA2OTMuLjczMzhjYzE2ZjMyNyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21m
ZC9raGFkYXMtbWN1LmMKPiArKysgYi9kcml2ZXJzL21mZC9raGFkYXMtbWN1LmMKPiBAQCAtODQs
OCArODQsNyBAQCBzdGF0aWMgc3RydWN0IG1mZF9jZWxsIGtoYWRhc19tY3VfY2VsbHNbXSA9IHsK
PiAgIAl7IC5uYW1lID0gImtoYWRhcy1tY3UtdXNlci1tZW0iLCB9LAo+ICAgfTsKPiAgIAo+IC1z
dGF0aWMgaW50IGtoYWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKPiAt
CQkgICAgICAgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgKmlkKQo+ICtzdGF0aWMgaW50IGto
YWRhc19tY3VfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCkKPiAgIHsKPiAgIAlzdHJ1
Y3QgZGV2aWNlICpkZXYgPSAmY2xpZW50LT5kZXY7Cj4gICAJc3RydWN0IGtoYWRhc19tY3UgKmRk
YXRhOwo+IEBAIC0xMzUsNyArMTM0LDcgQEAgc3RhdGljIHN0cnVjdCBpMmNfZHJpdmVyIGtoYWRh
c19tY3VfZHJpdmVyID0gewo+ICAgCQkubmFtZSA9ICJraGFkYXMtbWN1LWNvcmUiLAo+ICAgCQku
b2ZfbWF0Y2hfdGFibGUgPSBvZl9tYXRjaF9wdHIoa2hhZGFzX21jdV9vZl9tYXRjaCksCj4gICAJ
fSwKPiAtCS5wcm9iZSA9IGtoYWRhc19tY3VfcHJvYmUsCj4gKwkucHJvYmVfbmV3ID0ga2hhZGFz
X21jdV9wcm9iZSwKPiAgIH07Cj4gICBtb2R1bGVfaTJjX2RyaXZlcihraGFkYXNfbWN1X2RyaXZl
cik7Cj4gICAKCgpBY2tlZC1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFy
by5vcmc+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1hbWxv
Z2ljCg==

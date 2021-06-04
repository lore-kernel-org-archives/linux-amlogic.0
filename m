Return-Path: <SRS0=z4cL=K6=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F62C4708F
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 06:26:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 18C3F6121D
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Jun 2021 06:26:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 18C3F6121D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=weGO7sgY2AAiqLDWUTZZ0V/qITdY75ZEVDY4vWTVjZc=; b=cJGgnipkigeDvo5GTV/46nni/X
	UMcZthfEEvGlAeIBcQE/ick3j7YUaoUPTHqpIOSru7vsjjQeNv5w8ClXo/9fcmpay0J6HqvaKiP67
	pssheI3cQ1i/ncm3ic/vCREQXcxVHF1y2u+r5IDTumMHyV3ZSVafu+O4uVZot99IVAL3RsTKVLLZJ
	KtsVdydokIn5pOrDmACkkSy5pRXiYldmolkEuvUIcynf6dX02CZaYg5TKGXUNXJmgGvUyIc/aFjwl
	ZYFpHn/8UeTpg8mIrMxBRUT5Fal1evK/dp7a+TQttL4tu3Xux268/75efvTUka9m4VI8xHZDf41Ss
	Jzyy68zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp3HW-00Bl7m-VL; Fri, 04 Jun 2021 06:26:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp3HQ-00Bl4T-8A
 for linux-amlogic@lists.infradead.org; Fri, 04 Jun 2021 06:26:09 +0000
Received: by mail-wm1-x334.google.com with SMTP id
 t16-20020a05600c1990b02901a0d45ff03aso3637752wmq.2
 for <linux-amlogic@lists.infradead.org>; Thu, 03 Jun 2021 23:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XWiGoQ9cXot7jOVjL8R3Jy7JG2GE+CLSEjZfNbVzYKM=;
 b=rFhr0ddRev6e86NKbMfJoCaI4Iidw4ZhSOXXMJVaC1ktXUrOxb4xBTrFcDAfICXHAT
 xZ7NieCTxYzbhGbTJNuo19T6HiQYYwaKL17f1XDGlMlGRlSsBp2O2QIC6WvUWBCTSo7C
 06UalwS5DmH8sftLZan8pB27R26abP+dCznvG5MkaCoq3drpdGbCrMpcgi8yOGqFVSCZ
 E5Xbx7WYDKcmOoqEq8FzEJ4OqIosuQffXLLUf4ymbW8pJWx404vTtDajxVRKrTRhd7Ka
 4U5w2R1uordGu9KS51hgOUwLQ72Vc8tdSIv/N5LhqC2/ADvyTZiU+m0ULX+ZCS13wVpW
 9f9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XWiGoQ9cXot7jOVjL8R3Jy7JG2GE+CLSEjZfNbVzYKM=;
 b=K1ooZQQOSj7oaF8JfkBc+OmaUfNoX1/cIyGhnNgbnmXGwyvLqHVrtc1dcxRU7aYo37
 cGJmiVDL2q3wicNemTBLGbQ/aBrc+HX95KpWqkgvhW1hCxPQwztjVYU10Q7VkbsCMuiF
 k6LufomsUFoA/wkdjaPWxJ4YgYJn9EKXp/WxntaUe6lzULGlTqVwe2ZCT0Pr17dsXA2z
 Cm8DF3nj6qtS0wobt5Kr+Uo0UZYyWU7gK9UzjUaLU+z3It99Xv3IJ+rLq49SQ9z0yoBr
 7ujYjP/OI0p+h3PrhajfGpjaCzRxlYzaPpfuCevDSZZCx4hmM+t3cLduh5+5uDEe04CR
 9JWw==
X-Gm-Message-State: AOAM532RTqpEXDN4wnCnmZU6k999kDp2q3aMoNddp3NTeXbkPxnP+sRq
 kr57Bby67qJVMVdw16yoIRirGw==
X-Google-Smtp-Source: ABdhPJyZKXbYg8qPw1WN9jMPm9RRfxl+hLlPTeAoN6oByt7B6P//XuntI5CD0bI4w1rC1rVaOnZHPg==
X-Received: by 2002:a7b:c44f:: with SMTP id l15mr1933863wmi.151.1622787962608; 
 Thu, 03 Jun 2021 23:26:02 -0700 (PDT)
Received: from Armstrongs-MacBook-Pro.local
 ([2a01:e0a:90c:e290:71d6:f7f5:b70f:ffea])
 by smtp.gmail.com with ESMTPSA id u18sm4692482wmj.15.2021.06.03.23.25.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 23:26:02 -0700 (PDT)
Subject: Re: [PATCH] clk: meson: g12a: Add missing NNA source clocks for g12b
To: xieqinick@gmail.com, jbrunet@baylibre.com, mturquette@baylibre.com,
 sboyd@kernel.org, khilman@baylibre.com, martin.blumenstingl@googlemail.com,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: nick@khadas.com, artem@khadas.com
References: <20210604032957.224496-1-xieqinick@gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <2288650e-316a-3534-21a7-9962796b7d1a@baylibre.com>
Date: Fri, 4 Jun 2021 08:26:00 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210604032957.224496-1-xieqinick@gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_232607_594742_C8E422AD 
X-CRM114-Status: GOOD (  15.67  )
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

SGksCgpMZSAwNC8wNi8yMDIxIMOgIDA1OjI5LCB4aWVxaW5pY2tAZ21haWwuY29tIGEgw6ljcml0
wqA6Cj4gRnJvbTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KPiAKPiBUaGlzIGFkZHMgdGhl
IE5ldXJhbCBOZXR3b3JrIEFjY2VsZXJhdG9yIHNvdXJjZSBjbG9ja3MgZm9yIGcxMmIuCj4gCj4g
SW5pdGlhbCBzdXBwb3J0IGZvciBzbTEgYWxyZWFkeSBleGlzdCBpbgo+IGNvbW1pdCAyZjFlZmE1
MzQwZWYKPiAoImNsazogbWVzb246IGcxMmE6IEFkZCBzdXBwb3J0IGZvciBOTkEgQ0xLIHNvdXJj
ZSBjbG9ja3MiKQo+IAo+IFRoZSBzbTEgYW5kIGcxMmIgc2hhcmUgdGhlIHNhbWUgTk5BIHNvdXJj
ZSBjbG9ja3MuCj4gVGhpcyBwYXRjaCBhZGQgbWlzc2luZyBOTkEgY2xvY2tzIGZvciBBMzExRCAo
ZzEyYikuCj4gCj4gU2lnbmVkLW9mZi1ieTogTmljayBYaWUgPG5pY2tAa2hhZGFzLmNvbT4KPiAt
LS0KPiAgZHJpdmVycy9jbGsvbWVzb24vZzEyYS5jIHwgNiArKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay9tZXNvbi9n
MTJhLmMgYi9kcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMKPiBpbmRleCBiMDgwMzU5YjQ2NDUuLjZh
MWRiMTZiMTI2ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMKPiArKysg
Yi9kcml2ZXJzL2Nsay9tZXNvbi9nMTJhLmMKPiBAQCAtNDcyMyw2ICs0NzIzLDEyIEBAIHN0YXRp
YyBzdHJ1Y3QgY2xrX2h3X29uZWNlbGxfZGF0YSBnMTJiX2h3X29uZWNlbGxfZGF0YSA9IHsKPiAg
CQlbQ0xLSURfU1BJQ0MxX1NDTEtfU0VMXQkJPSAmZzEyYV9zcGljYzFfc2Nsa19zZWwuaHcsCj4g
IAkJW0NMS0lEX1NQSUNDMV9TQ0xLX0RJVl0JCT0gJmcxMmFfc3BpY2MxX3NjbGtfZGl2Lmh3LAo+
ICAJCVtDTEtJRF9TUElDQzFfU0NMS10JCT0gJmcxMmFfc3BpY2MxX3NjbGsuaHcsCj4gKwkJW0NM
S0lEX05OQV9BWElfQ0xLX1NFTF0JCT0gJnNtMV9ubmFfYXhpX2Nsa19zZWwuaHcsCj4gKwkJW0NM
S0lEX05OQV9BWElfQ0xLX0RJVl0JCT0gJnNtMV9ubmFfYXhpX2Nsa19kaXYuaHcsCj4gKwkJW0NM
S0lEX05OQV9BWElfQ0xLXQkJPSAmc20xX25uYV9heGlfY2xrLmh3LAo+ICsJCVtDTEtJRF9OTkFf
Q09SRV9DTEtfU0VMXQk9ICZzbTFfbm5hX2NvcmVfY2xrX3NlbC5odywKPiArCQlbQ0xLSURfTk5B
X0NPUkVfQ0xLX0RJVl0JPSAmc20xX25uYV9jb3JlX2Nsa19kaXYuaHcsCj4gKwkJW0NMS0lEX05O
QV9DT1JFX0NMS10JCT0gJnNtMV9ubmFfY29yZV9jbGsuaHcsCj4gIAkJW0NMS0lEX01JUElfRFNJ
X1BYQ0xLX1NFTF0JPSAmZzEyYV9taXBpX2RzaV9weGNsa19zZWwuaHcsCj4gIAkJW0NMS0lEX01J
UElfRFNJX1BYQ0xLX0RJVl0JPSAmZzEyYV9taXBpX2RzaV9weGNsa19kaXYuaHcsCj4gIAkJW0NM
S0lEX01JUElfRFNJX1BYQ0xLXQkJPSAmZzEyYV9taXBpX2RzaV9weGNsay5odywKPiAKCkFja2Vk
LWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CgpUaGFua3MsCk5l
aWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

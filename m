Return-Path: <SRS0=c+5b=EJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943D5C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 17:03:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C2D8A2080D
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Nov 2020 17:03:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d/YtVisf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="tzUziYaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C2D8A2080D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T8bNyy0R9PQyrRiqoO+buI3YgAqt+iILbwPM/xDeFMM=; b=d/YtVisf7OzqjrPE03BiHjdEl
	6mCLuQvUeNPIAh+E4jC0eDPTFEEwKKEqvysHK5XAHGFLzH36rKsrWdLbngLN9TpOfOIljSf+89veg
	XRwwCSBeBGRDfCaiULE6CIOgDqqfzSOZzE9iwwYidZGSsskwByZO/kVIKNVM5j6r8O/7E9e8Akqp0
	vQ9s6Mfdx+vSASzul0fOkityZWajYU4f2MuIC54UMOxgtSjNadaKnYNAbZbzJKUKxCEw7/sfWkSpH
	/s0JwRu3Mmva2KWrzy9ywxEIB1zRr9A6EVO/8P+BJ3krVn5uH27zhiMsd4LPAJecnXdzkGmqJBNa4
	h8a4DhLFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZziH-0000mK-4w; Tue, 03 Nov 2020 17:03:17 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZziE-0000lB-Nh
 for linux-amlogic@lists.infradead.org; Tue, 03 Nov 2020 17:03:15 +0000
Received: by mail-pg1-x544.google.com with SMTP id x13so14133204pgp.7
 for <linux-amlogic@lists.infradead.org>; Tue, 03 Nov 2020 09:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=D1Yz0PdKp2fAxKQgHZ9fvVHAcVDky1zVOyGTbKX5Auc=;
 b=tzUziYaBmFecN8fN34P0eMETy51o+ZYvS6swXkYhfneR6oUDxnW7nrxBJKId4/0Dfe
 Lq500xXGfs9u5rgvrOgwrOVcHv8+OFmkRS4A/m02FaPKNYwiMvBfPtlvns1eBoEvw7Q3
 KMfVBGb9vcX0PrbpLbJwwq+rY1bYTt+9Nrq8xNCgQ6qwqESbTLpgoQQjJA1pksrhQA6f
 UkM9LZi73No/JNnvbfv4gj61eh7LtQo/C7ZoYu2zWbuKSkw3BudsFNYaISwk8qV3W/Ti
 VAcxBGoUd9a11h5de0Z+RCn0wdPF3sRZTXLVWcNhJUcHCZj9a9t3pUsEhgShC8/YHXXR
 xuvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=D1Yz0PdKp2fAxKQgHZ9fvVHAcVDky1zVOyGTbKX5Auc=;
 b=a6R7FfFwsBVmRDANXT4brcStCvcazVmHJJZdsu9je63FxlkMQ7GlgkIbo3xWFN+ThS
 vclxEbHbLDZ36pYPUVGD6MzoQxgcoFViM3+C9LG1vidORIDseB5++LPJ+goJJldmuT8K
 /FZyAoOrdbr3x4ssN/Iv925an+IYvXM0BHQ2QlBn7eftHwFpm6lazWsSVygweLSBf7//
 rHnZCy7TKz3e7eAeb/odgo4zZni2/gpNid0NChGTfOM2ykCitEKqYxvNEbm2TMC4Zf38
 MvJHoYu2cGwFaXqr/G/rC15/rtXBv4uuOeBSd5nej4/+wIFTiEsIN9KjiQZSgk+Jsva5
 UF5w==
X-Gm-Message-State: AOAM533jz1MZpWDJXmL5/AwV961vqLA/a+KhJGmi0Lk/hoUh8ehesa0E
 7FeKGbaS3qNnoCAH9MeM8j2Fuw==
X-Google-Smtp-Source: ABdhPJxQDRCrDmfUzdH7nNuHf3LOYUtDlNVoRljtLRDfYLGKoA3QTBfon/AVTo6kqD0R/tmx5wk7Iw==
X-Received: by 2002:a17:90a:5892:: with SMTP id
 j18mr88245pji.101.1604422990409; 
 Tue, 03 Nov 2020 09:03:10 -0800 (PST)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152])
 by smtp.gmail.com with ESMTPSA id b17sm15775682pgb.94.2020.11.03.09.03.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 09:03:08 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: meson-gx: drop of_match_ptr from of_device_id table
In-Reply-To: <20201103163046.14336-1-krzk@kernel.org>
References: <20201103163046.14336-1-krzk@kernel.org>
Date: Tue, 03 Nov 2020 09:03:08 -0800
Message-ID: <7h4km6xtir.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_120314_803067_7AE5925A 
X-CRM114-Status: UNSURE (   9.98  )
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
Cc: kernel test robot <lkp@intel.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

S3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPiB3cml0ZXM6Cgo+IFRoZSBkcml2
ZXIgY2FuIG1hdGNoIG9ubHkgdmlhIHRoZSBEVCB0YWJsZSBzbyB0aGUgdGFibGUgc2hvdWxkIGJl
IGFsd2F5cwo+IHVzZWQgYW5kIHRoZSBvZl9tYXRjaF9wdHIgZG9lcyBub3QgaGF2ZSBhbnkgc2Vu
c2UgKHRoaXMgYWxzbyBhbGxvd3MgQUNQSQo+IG1hdGNoaW5nIHZpYSBQUlAwMDAxLCBldmVuIHRo
b3VnaCBpdCBpcyBub3QgcmVsZXZhbnQgaGVyZSkuICBUaGlzIGZpeGVzCj4gY29tcGlsZSB3YXJu
aW5nICghQ09ORklHX09GICYmICFDT05GSUdfTU9EVUxFUyk6Cj4KPiAgICAgZHJpdmVycy9tbWMv
aG9zdC9tZXNvbi1neC1tbWMuYzoxMjUyOjM0OiB3YXJuaW5nOgo+ICAgICAgICAg4oCYbWVzb25f
bW1jX29mX21hdGNo4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJp
YWJsZT1dCj4KPiBSZXBvcnRlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+
Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwub3JnPgoK
VGhhbmtzIGZvciB0aGUgZml4LgoKQWNrZWQtYnk6IEtldmluIEhpbG1hbiA8a2hpbG1hbkBiYXls
aWJyZS5jb20+CgpLZXZpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtYW1sb2dpYwo=

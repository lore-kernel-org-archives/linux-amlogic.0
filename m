Return-Path: <SRS0=TE1J=CL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4146CC43461
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 12:56:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0723620709
	for <linux-amlogic@archiver.kernel.org>; Wed,  2 Sep 2020 12:56:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U7t/805v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MVYKoUM3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0723620709
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eNv1hGiiok+zmoA75O0lDI0rEZchhYyGch65p/RTjM4=; b=U7t/805vBu9yPIJheGjDCw52V
	hT7LVRW3NVk/OM2dpALanKJLCbfqpV+BS4R3S1Xy98as3DZsWN3PAbhrPWzlKDCuvXcqw3AmDHBTw
	XBUZ6frCXQSHPhYxZf1bsOkmy72TMX/kK2NNZnfMZw5N4TcJeZTtZGyUYzH80zrlEuTdpNqgriBCd
	VCTZRL6HLmZN0St046rPEi+UCpqTYuYaagc/TI52zxGxqUvWaKWlEBxDvX4MCoWSXy93maNoUtYuc
	tk2IVw2FXD36jKlQHF0UFrCwRNhVNGyxbuQYDNoN1eYvrKiyBrTPyq8XLuyVRB5Sw9S6kl2m+VZSV
	tHiVNpf/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDSJd-0005sM-Ah; Wed, 02 Sep 2020 12:56:41 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDSJb-0005oh-1T
 for linux-amlogic@lists.infradead.org; Wed, 02 Sep 2020 12:56:40 +0000
Received: by mail-lf1-x142.google.com with SMTP id d2so2772433lfj.1
 for <linux-amlogic@lists.infradead.org>; Wed, 02 Sep 2020 05:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZT5x+31ffQ1fSGTC6fc7HGVTmxRKwze1JkUzuev76fo=;
 b=MVYKoUM3Qi3G4CUp4xP5XqgQvWvDo6PsrlPp55IW6273Lw81QISusbtPEsERRcR/3B
 6Q9V3XlFUJX+GYIBnGeYqwwR874ISHS4jNWHMhiw3Xd9Cbj+/LCRCeKnA3PoLxkiV7/7
 5Mv8uiLha6QtMHB1bcvZCBV/dmLOudMDK5KPo4gr3+uw85cQhRqjrrrRXXs3v5vfarZi
 M3XO57ETyI3ba5lFOH2B1nqQ8sa5cAotWHZ3E4SjTQugzfR2BZbwQJXdi7G32HSxhpWZ
 mxSgzvdo1Bwy2Jq/MPnxHYcDW70oYBulKZ2KTwNLhjhGYttHxAJ7+h9Y2O0+j8aOxN0r
 EipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZT5x+31ffQ1fSGTC6fc7HGVTmxRKwze1JkUzuev76fo=;
 b=MsHNDm/Y8n2X6nwx+drmn6ebijtJBDDbSAKUjvpGFwcbeg/JabfDwYLklZmGeBvZu1
 Z1al7S2FJA/M4jLW6St39/2qnjOkcTVO2oOVB7KNOtSYD4P2rbwGXa3b4bOMo6KAe79w
 wqew34cKupUpbfV6o191P2Vd7u1m9DBqM7PkYmCpF55QCCO+Lega30pXJrqOlG4VOZiO
 Km9h2/0G/Kiq8xLVYjZOtLFD5/OWR0SBNwVs9/pC+0EvCnP9qFhA4drWkzNE8TV9gvBI
 Gbtw77jQVW8Jcc5gJ9dHYFr2qDwy+iMiWAB4h2s0MQ2KqCCax9O3aNOjlOhcqk/xQdn/
 prEg==
X-Gm-Message-State: AOAM530hIjhdcempN8gPZmJZ5s9BbxJeuNaP32u+Q08wgY7/2FMq45or
 KOdvKbALsycGt2nO6hSlSpo=
X-Google-Smtp-Source: ABdhPJxTy7FYR0Pg0Sm71v/FU6NwzEy2QsoacvE/ywzrQ6k+5uGvuu7pKbD5nySOHsJOa5oGFo3R7A==
X-Received: by 2002:ac2:44b7:: with SMTP id c23mr3315115lfm.128.1599051388556; 
 Wed, 02 Sep 2020 05:56:28 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id b13sm1064037lfa.92.2020.09.02.05.56.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Sep 2020 05:56:27 -0700 (PDT)
Subject: Re: [PATCH v2 2/6] regmap: Use flexible sleep
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Pavel Machek <pavel@ucw.cz>,
 Dan Murphy <dmurphy@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Lubomir Rintel <lkundrak@v3.sk>, Mark Brown <broonie@kernel.org>
References: <20200830185356.5365-1-digetx@gmail.com>
 <20200830185356.5365-3-digetx@gmail.com>
 <CGME20200902124731eucas1p13716070977dbef39d09147bb71e050f6@eucas1p1.samsung.com>
 <d936a2fc-8890-eec1-015c-d919e10d1dc5@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b580524a-d476-adbe-59b9-4ae7d62626b1@gmail.com>
Date: Wed, 2 Sep 2020 15:56:26 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d936a2fc-8890-eec1-015c-d919e10d1dc5@samsung.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_085639_101995_F9D21039 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

MDIuMDkuMjAyMCAxNTo0NywgTWFyZWsgU3p5cHJvd3NraSDQv9C40YjQtdGCOgo+IEhpIERtaXRy
eSwKPiAKPiBPbiAzMC4wOC4yMDIwIDIwOjUzLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IFRo
ZSBtdWx0aS1yZWcgd3JpdGUgZnVuY3Rpb24gdXNlcyB1ZGVsYXkoKSwgd2hpY2ggaXMgYSBidXN5
LWxvb3AgYmFzZWQKPj4gZGVsYXlpbmcgZnVuY3Rpb24gdGhhdCBpcyBub3Qgc3VpdGFibGUgZm9y
IGEgbG9uZyBkZWxheXMuIEhlbmNlIGxldCdzCj4+IHJlcGxhY2UgdGhlIHVkZWxheSgpIHdpdGgg
ZnNsZWVwKCksIHdoaWNoIGlzIGZsZXhpYmxlIHNsZWVwIGZ1bmN0aW9uIHRoYXQKPj4gc2VsZWN0
cyBiZXN0IGRlbGF5IGZ1bmN0aW9uIGJhc2VkIG9uIHRoZSBkZWxheS10aW1lLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4gCj4gVGhpcyBw
YXRjaCBsYW5kZWQgaW4gdG9kYXkncyBsaW51eC1uZXh0ICgyMDIwMDkwMikgYXMgY29tbWl0IAo+
IDJiMzJkMmY3Y2UwYS4gU2FkbHkgaXQgYnJlYWtzIGJvb3Rpbmcgb2YgQVJNIDY0Yml0IEFtbG9n
aWMgUzkyMlggYmFzZWQgCj4gT2Ryb2lkIE4yIGJvYXJkLiBIZXJlIGlzIHRoZSBsb2c6CgpIZWxs
bywgTWFyZWshIFRoYW5rIHlvdSBmb3IgdGhlIGZlZWRiYWNrISBJIG1pc3NlZCB0aGF0IHJlbWFw
IHN1cHBvcnRzCmRpZmZlcmVudCB0eXBlcyBvZiBsb2NraW5nLCBJJ2xsIG1ha2UgYSBhbm90aGVy
IHBhdGNoIHRvIGZpeCB0aGlzIHByb2JsZW0uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

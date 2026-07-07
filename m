Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F590C43602
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 Jul 2026 19:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiZI8MVWermf54hSwvMv8dIsjMJW15c5Wc4howAP8W4=; b=JHtuXTLIi3Py/M
	h9Dkq0iqHJmzBZqL9NJhAyX2wApCrfQXqLcOdLVDq401YFYNpDynQeWmBM1DsWc9B5J89ND2q6hWD
	V6FtqQzl1EESi2YAajimg2MZPg9T9i/yOGuIBxaevUBgyLnhWoVyOtnZDPju7kjoSyfOL5+m/S66v
	dO2rniIFpz9uFtDx6uaVRAaEHVRQA3Wcnkkn8DU4xCqIX6HQ/Az5e2oYopjdqSt2PjYgwo+0NUbZ9
	+LTMUYc0CcZ/hTl2tKu0DmgBzV8cu8kfHfm49ENK5PBBthz261YfRVLv03DoQ1qJVI7zGDAVvFc49
	pSeHeEAMp/SqNJ4WaZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRK-0000000FkxA-09gr;
	Tue, 07 Jul 2026 19:26:42 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whBRF-0000000Fkvm-1MWd
	for linux-amlogic@lists.infradead.org;
	Tue, 07 Jul 2026 19:26:38 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c7c61b5292so66027095ad.0
        for <linux-amlogic@lists.infradead.org>; Tue, 07 Jul 2026 12:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783452396; cv=none;
        d=google.com; s=arc-20260327;
        b=pR4xrmokYBOVJCsI3vFvIsgZR8OA0cRA02FFsNf7MfmuC11YZrymFEUD18VomacAXY
         UR/RTaWc0JuUGCpRazW3l1qtdjL9x8PrF3apGiNp61NgRHYh/HEMunL7YwNRhTUjCqNn
         ZYZ4b8XBPcCGeATwfuTsKX9jpo2G7KdQJK5480//Pxj7lMqd0IIqb4Yg6U37Cu6yvRsG
         cyDYfiq1X/iEUNZ6h5lwvya1pgZ+N9HVvEgpBS2bTgGZZxlYS2I3R5nlR1pGsDEzNOCr
         Sj/PU8ZnrQMx1kvpjZMgV2gVxLd+S4Pjwl8DC3/rL3lBU648wkVt25vWlK9ZArWQcNDc
         lYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        fh=1qwU4SiOmX00rsOz6fNDVC8A/8PbDueI2P6tGUIDUj0=;
        b=PU2b8DA0ROgyB9oCIk88nO4YEspRZoQKXZXPoMD4GPtr4nrAFtDSfCwjG9sIBSrgyT
         XGEpEL9PNtX8AKM4NJQBb8QnK4vaXj/TBIRAAtq9G+5dAFg+EczH8S+Rg1aUeSJXCvks
         BdWkHgXCsvwgi2UkFjYRKS2Ppn6iAndCb0rZ/gzNIgg94PyweLAMWOtI2HRDxGaC9qgQ
         51qnSBVE9CTdLRqGUI9H+S3acNtCkyZioSSuT0rcAj5P/BtgEUdAY+crr+tysHDH8ciN
         vSY6kUJQ57N6XljEeRAcE7fbScOwLUHjVEecDYda1R57t73bKipZ/PS1rnir2lVQIN1+
         Xdaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1783452396; x=1784057196; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        b=Lrc/LSGFsWiVAiKMZiCEpcw7xQh58ZcBeKXZbbOa3kll0fUfSFmJBe+ZgX4XM7jTHX
         fTAt8US6KRh99ukH9dCAFugQS4KrWQAJNPbMJl8d+X0snRIReW6mxFrgQjYTlEpDzztq
         xA9s+B70D28DFa4L7J66H/3irILW3UfiWQeA4/SxMcv3R/Yh0hCaqH1d3UnFhDK2fl59
         TUKnKSgFiuGIOvGu31+bVnoklCy+f7N1fllXyCBxECbjg7UZB8dHOPXCxYrUmQzf1HRP
         zw69RC7JhSzoXYEBzlzAWlKHBpDAiHP/lB2kn5orfJu9JjLtc+P/qQnYjPNK8w6855+C
         47lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783452396; x=1784057196;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1u0DNx/dvFBXj7ONBaHCpq/y26kmxzUXBBihnDFYivE=;
        b=Pnzw8nklUj31wwMt6OVQDhTjWnDmenaFnvaYel8W8UItEh5yCnUYtKUuIXCi9rHSMb
         WmpYAOa3vuX5K146oqLSwB1AFqi/LFgAItq67CNyws/5GuurciBYhHBaB46qTpy77YPG
         BRGS1LdaJAfNZfB40Ah4H45AkRvdc1mE9x25lpv0mEHljomN46mdMoK7KRen/bta+cMQ
         yS2l48kKhjUke8GDoo83DcYTfPh9bgtEyZ8X5t8PF3GV5qgzrlC7oVLjWcCjrdWtLJgL
         NqjXdacWKZccyAA1XuxUg86IPrxScacmOhJGltg6JiVM5ti/vPIbe2Xop+AGVxIXKMZV
         hD+A==
X-Forwarded-Encrypted: i=1; AHgh+RoS5kGQTP4cDCdSISIGfpxvkhoKDu8ORC4wnmaG6S0hcw4Qlgo9o7eC8caN5vM8HFQSK+x8NvcSr9lzUtoh@lists.infradead.org
X-Gm-Message-State: AOJu0YxBRQ05sZrcpGJc/rrnybfWeEhLhKMx5CjDdLO6qnu0yAe79z+v
	o2tUgwPeW0FnWKl0lCOQJAn1IPdijx8wtQKX7wCluXUZusS3NDXc1C4s8b01YTcqt57qjPx/8p/
	oDvCcK+ujlVZF9TWTiOYgdBzsrW7mnIc=
X-Gm-Gg: AfdE7cklEQWrzP/vDdKBtjJMak7qSnNEFUWr3eusDM5OMN3I0vQ908g/g5EqEHKbATg
	yLiuq97OioYZQonOghTx8MrYKbjdQRXbXAFZ6MEAXfNlgk6BYMO95adLI5MAtxru4Hwj7Ml+Z4b
	INXp9ew78jmmPL+RWmyMVAq6fK8a1WqKFv0lEN/rFl0PaplkZWwcuNxYn24OXh12CfEbt77iArr
	IxhyRAc4mR44gCJXHqhI4sVJrIRJXdo7VPy0E5QSulEZlUyCIvJY0Tf0i4hOjGnRoREYlu3QlR5
	rXFzcg9UqRYtBJTl8fTVI0M4Sg==
X-Received: by 2002:a17:903:248c:b0:2ca:11af:5ee9 with SMTP id
 d9443c01a7336-2ccbf0515c7mr44657295ad.25.1783452395771; Tue, 07 Jul 2026
 12:26:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260706093508.273968-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 7 Jul 2026 21:26:24 +0200
X-Gm-Features: AVVi8Cew5STZTOkHk0OKqMhqBm-tS-RzEUyhCNysxzBbiVbMzJ57Y2V-AnBf18k
Message-ID: <CAFBinCABGgQtsn1MsbQn_wjuCAUTaTaEhbGbwNjKeJRx-NDcZw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: amlogic: Correct indentation and whitespace
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_122637_355226_9E8824F2 
X-CRM114-Status: UNSURE (   7.58  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBKdWwgNiwgMjAyNiBhdCAxMTozNeKAr0FNIEtyenlzenRvZiBLb3psb3dza2kKPGty
enlzenRvZi5rb3psb3dza2lAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBDb3JyZWN0IHNw
YWNlcyBvciBtaXggb2YgdGFicytzcGFjZXMgaW50byBwcm9wZXIgdGFiLWluZGVudGVkIGxpbmVz
IGFuZAo+IHJlbW92ZSBvdGhlciB3aGl0ZXNwYWNlIHZpb2xhdGlvbnMuICBObyBmdW5jdGlvbmFs
IGltcGFjdCAoc2FtZSBEVEIpLgo+Cj4gU2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIEtvemxvd3Nr
aSA8a3J6eXN6dG9mLmtvemxvd3NraUBvc3MucXVhbGNvbW0uY29tPgpSZXZpZXdlZC1ieTogTWFy
dGluIEJsdW1lbnN0aW5nbCA8bWFydGluLmJsdW1lbnN0aW5nbEBnb29nbGVtYWlsLmNvbT4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9n
aWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

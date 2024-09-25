Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CBC8CCF9E8
	for <linux-amlogic@archiver.kernel.org>; Wed, 25 Sep 2024 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wpSrjWDwnz4ih1s1pW0u9isISpab9oPu0tMovmlq88c=; b=wGVJTTLlV4cx/Z
	gpy4gjPDZKRMCrOddZEw5ZosDbfaScintpZPDIzVQ76fPV8cmtHQ3+bM1GErfF1RHGYp2LeoyUeNj
	Jq+aAXK82WPVkiLByzfd7fB0buPEXi+rar/rbhTAWmJu80PoGSlbvFHsk2s6st9ceiUNIX6GEW3nR
	WHk0zozXbZVHCjcMaySOdid6PTm8GXB9TNVl0a0cdMdfwt1x2N6Jj/knFS0a5SEtrAb6pk+bVJbyT
	m+aAxq49/x4r9otXQKf3XEziocNvvKegLIrbMNyYnKbd1usuxZ/e90D5jg0oSQ4cxtZ9E5NcIeChF
	uTNF+lKuJWiMtwXqNSgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stW1U-00000006Djt-2Qk3;
	Wed, 25 Sep 2024 17:41:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stVzG-00000006D9p-3k8k;
	Wed, 25 Sep 2024 17:39:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-208ccde82e6so562275ad.0;
        Wed, 25 Sep 2024 10:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727285978; x=1727890778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zk90OIfhTnQ67I6KDPiF6eWhTkqB4aikJ1+T8tujX9k=;
        b=JMR/M3rOQUrQjGUQR/s9hJev5p9pghS90PYNDgIX7nMAm7Zk7qmHfVLFgZ9j8vTiUc
         2AOp/2fqFG9A1nTV5gtuASEbCjetpOzeK1ioL+gGiLOF65fZTiA8auyidtd5vWzo4OOe
         UCzBbF+vJOIPPgKBkDlu+06EX6/CcI5pBGWcrMhIolrql7M8Nj8gSdkOVPPUy+DSuGEj
         hQspfeczGjIoPcZsVBLRY851jN1Lb89QFifG9zaooLgQPilIalPqrxncgTNAfqgsHIyS
         pDjQURS1eqf96IozhGXnVN4JI1+fmg5V/1+dKiLaMP60JRRK7bFc5maL2fZAAsdf+ZFs
         1M+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727285978; x=1727890778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zk90OIfhTnQ67I6KDPiF6eWhTkqB4aikJ1+T8tujX9k=;
        b=XwCqKDC+5kyOS7QdrRDqCQo3TFTJwfPALkc0Ic6v/E6L9CiSsGwB5xGN66YphLzjwO
         EGrrNS4PuZIg2Uthz8KcSxuk6MXe/cm0mmTbRJGab8uUyvQ+ez6UZ4qAUrWFuo5aBRoj
         0Tz3gHdjFOKszy82vRUXYnJeFudlhnllO1ERhLOSn7TQi0qWZtP+pPLHfXXcSroVjD8m
         2rdF5SXb8r4UvFFEs3dqM5fdQDpaVtPAzZg4fPQppJTnMZSk7wGHDxaYia1OH8bgkhBE
         pb9Vrx7EiB8pwGgmMQIt28vwgJithN3WEfBsPNsr/mIUUbt41/QNp0vgKKiYbV01kwei
         7FyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3Ve1NpPdXRKmRYtJyga24heOUpnJVAkLFQy2k3JxTtjay0CPCW5SI5s4PUL034b1LC4pfmlC8cjmfVx8H7YzIOA==@lists.infradead.org, AJvYcCWMUVkRVaxt7NihXU9s5UpI8HcyNSRtTTRUFforShr56I5+OxD3nyJ8ygVMJkxf/9zTXrSNMuJlNxSXlMEm@lists.infradead.org
X-Gm-Message-State: AOJu0YzukqfLtGuV/pGb2Q/db+ofl7/R5Ev+Dx4smG93+ynO2UjSdIff
	2YduDx158Mll7hU4v6oH2voX+lh4KtolHbxlQTD1oQ6l4gdFy6BWMkY9njy8h2oiq5k+ScWsW2M
	1U33tJ3sFpdKivivO1dzXhHXxss0=
X-Google-Smtp-Source: AGHT+IGlo7PesYg/KmXOi3FOf4+bYxd/B53oypv1/h4B/VNyZnzpGsokuxWkiGSd8uA4GxMVmbbAbsgjOt75o/HZAEQ=
X-Received: by 2002:a17:903:234a:b0:205:6f2d:adf7 with SMTP id
 d9443c01a7336-20afc488b1emr40050045ad.21.1727285977974; Wed, 25 Sep 2024
 10:39:37 -0700 (PDT)
MIME-Version: 1.0
References: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-0-0b20ed4f0571@linaro.org>
 <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-10-0b20ed4f0571@linaro.org>
In-Reply-To: <20240916-topic-amlogic-arm32-upstream-bindings-fixes-v2-10-0b20ed4f0571@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 25 Sep 2024 19:39:27 +0200
Message-ID: <CAFBinCDjf7TxwMMxv9+w+Ob6RZZ8hjU0iQvUGHXLtAhvBDm8vA@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] ARM: dts: amlogic: meson8b-ec100: add missing
 clocks property in sound card
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_103938_964057_8EFD3DF1 
X-CRM114-Status: UNSURE (   9.44  )
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

T24gTW9uLCBTZXAgMTYsIDIwMjQgYXQgMTA6MDjigK9BTSBOZWlsIEFybXN0cm9uZwo8bmVpbC5h
cm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBTaW5jZSBbMV0sIHNvdW5kIGNhcmQgbXVz
dCBoYXZlIHRoZSBjb3JyZXNwb25kaW5nIGNsb2NrcyBwcm9wZXJ0eSwKPiBhZGQgaXQgdG8gdGhl
IEVDMTAwIERULCBhbmQgZml4Ogo+IG1lc29uOGItZWMxMDAuZHRiOiBzb3VuZDogJ2FueU9mJyBj
b25kaXRpb25hbCBmYWlsZWQsIG9uZSBtdXN0IGJlIGZpeGVkOgo+ICAgICAgICAgJ2Nsb2Nrcycg
aXMgYSByZXF1aXJlZCBwcm9wZXJ0eQo+ICAgICAgICAgJyNjbG9jay1jZWxscycgaXMgYSByZXF1
aXJlZCBwcm9wZXJ0eQo+ICAgICAgICAgZnJvbSBzY2hlbWEgJGlkOiBodHRwOi8vZGV2aWNldHJl
ZS5vcmcvc2NoZW1hcy9jbG9jay9jbG9jay55YW1sIwo+Cj4gWzFdIEFTb0M6IGR0LWJpbmRpbmdz
OiBhbWxvZ2ljLGd4LXNvdW5kLWNhcmQ6IGRvY3VtZW50IGNsb2NrcyBwcm9wZXJ0eQo+ICAgICAg
IGNvbW1pdDogZjE4OWM5NzJmODZiMDAzMThjZjI1NDdiNjJlNDYxY2I5ODM3NGUzNAo+Cj4gU2ln
bmVkLW9mZi1ieTogTmVpbCBBcm1zdHJvbmcgPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+ClJl
dmlld2VkLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
YW1sb2dpYwo=

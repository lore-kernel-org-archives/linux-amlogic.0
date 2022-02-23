Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62316C433EF
	for <linux-amlogic@archiver.kernel.org>; Wed, 23 Feb 2022 18:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gZ009GSIR0qLi8HLKPl4V8qDOjdPwC+c1rwOcm1Pj88=; b=Q9gxWVgt6YlbVZ
	I1V585GmIzYBLvNS4VyhBvH0EksWsraifwM7S2Bm2WmrJEKV6Okzbv1xiUhoBQ4w9rzCKY2TxLYU2
	P/a/ITED0crACHlm7JxN1u7wiGWG5kFgZl+ObX41K40WJLJBHtEN494uji3F7fLJTYoI4ksuEKfv8
	ul58pZ6T/oux1FvulBrm2wWvAsWOOzf19oehNobwNUsk0MVLOT8HpVNLRB94YMkGxtmsubxDow03M
	0cJF3owPkG+vPcCJDwM/fDq2LqLxXPhyY7LeqDQjO5E3jG7oAkzXbKRyIyVfIwwpSmZyLnOjrdZqq
	wvyCkN5UY9jNBlnFSpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMvyz-00FdrR-Jl; Wed, 23 Feb 2022 18:03:21 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMvyK-00Fdaz-Un; Wed, 23 Feb 2022 18:02:42 +0000
Received: by mail-ed1-x530.google.com with SMTP id z22so45460401edd.1;
 Wed, 23 Feb 2022 10:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=RvLWLImKF4e7kO+CK5fBPeKwpYaywnsLJXvg5598LAA=;
 b=Xof3f+C2MWxq9dDxNkehSWNiydzzI2D/wlgkOJ7dJOPAKdlh9n/8kH6j44886v6bvf
 iStAlMDwbouUuvI14282aVTnwEcgG9smQp2T1bjLzZcVzb0ymtE8Oqr6FAamP0Fer5Za
 yzrqPFBdfXlmyHAG2TQWbk+98cfvsj5G8nTJwHUao3LxadfH+viz0yPY+JCB3q+a+HCF
 pMbofE4rQIaA1LqAQ5uNmNfZBbUyaDzI/LGWDePrUNLXbddCkh16znD/wdgcVf0TDtQb
 KwxHPsV/nLKs/eEBTS6KCoEbokciWU4dejg+iRa/FNKVStPkfnlkIBybD0MJKRGOdsHb
 FRTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=RvLWLImKF4e7kO+CK5fBPeKwpYaywnsLJXvg5598LAA=;
 b=vyfYkWLv5P04Crovx3E9CnSGga8e4NUuSuzCSnD2u2yNOke2P8L+Kg8yWLmsbShEUj
 ys4X07Pg/05rZkh8LfG8yRQoqsH7eCGE7VZHKck+F6/kSeLHX8rtGOGduKEyEyzIclch
 q2kZ04nQLHLMNk25Rpk5v1JS24ho1gj345w/ULO7YDOBSUhELw0+U3fVuCbceAZ7KgHu
 UNiHURFA6o+ihLEFMzz+zAhyk5uRNgx8usfAwffn25YoBiUflaZ1fam8408Mtv6E0RZZ
 c81Y1UC8/8C5kIokYoAvB/ovZYJ2arSitr0rtwePGSwzKqUAVDRbCfbft9g7F5s4enl/
 19gQ==
X-Gm-Message-State: AOAM533RI9AJxYZppA+eRhq7rL0nJL+9av9rf1mO6o4MtjuyBMo8aeDD
 R+Ci25MzUPIYJTRN6RNumPs=
X-Google-Smtp-Source: ABdhPJx8Mkk+LyafzM/hSAfFdCJCs9Z1ihr6F9bBe+uLkcZDIU3BYCB0OA40n/8jrAW6eP/L2evAKA==
X-Received: by 2002:a05:6402:3487:b0:40f:fa53:956c with SMTP id
 v7-20020a056402348700b0040ffa53956cmr629775edc.22.1645639354295; 
 Wed, 23 Feb 2022 10:02:34 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:d12c:c0a:f603:b44d?
 (p200300ea8f4d2b00d12c0c0af603b44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:d12c:c0a:f603:b44d])
 by smtp.googlemail.com with ESMTPSA id d12sm203890edy.17.2022.02.23.10.02.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:02:33 -0800 (PST)
Message-ID: <dc89a2c4-3652-bf04-c69d-355a5bbd548d@gmail.com>
Date: Wed, 23 Feb 2022 18:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add Titan Micro
 Electronics
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Geert Uytterhoeven <geert+renesas@glider.be>
References: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
In-Reply-To: <4eb7b036-a9b9-3bd2-4e84-f56ba4b1a740@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_100241_033807_5CD6A4D0 
X-CRM114-Status: UNSURE (   6.54  )
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

QXNzaWduIHZlbmRvciBwcmVmaXggInRpdGFubWVjIiwgbWF0Y2hpbmcgdGhlaXIgZG9tYWluIG5h
bWUuCgpBY2tlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1i
eTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBIZWlu
ZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggZTA2MmE4MTg3Li42ZmZkZWM5
MWYgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3It
cHJlZml4ZXMueWFtbAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwKQEAgLTEyMzgsNiArMTIzOCw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVz
OgogICAgIGRlc2NyaXB0aW9uOiBUZXhhcyBJbnN0cnVtZW50cwogICAiXnRpYW5tYSwuKiI6CiAg
ICAgZGVzY3JpcHRpb246IFRpYW5tYSBNaWNyby1lbGVjdHJvbmljcyBDby4sIEx0ZC4KKyAgIl50
aXRhbm1lYywuKiI6CisgICAgZGVzY3JpcHRpb246IFNoZW56aGVuIFRpdGFuIE1pY3JvIEVsZWN0
cm9uaWNzIENvLiwgTHRkLgogICAiXnRsbSwuKiI6CiAgICAgZGVzY3JpcHRpb246IFRydXN0ZWQg
TG9naWMgTW9iaWxpdHkKICAgIl50bXQsLioiOgotLSAKMi4zNS4xCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBs
aXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

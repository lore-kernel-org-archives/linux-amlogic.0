Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022F2C433F5
	for <linux-amlogic@archiver.kernel.org>; Mon, 21 Feb 2022 20:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9P2YmFi7VkBGIiWNxblCdMzUtNeiWv75DZ/R9LfUKpk=; b=e0MfsrGhiLqXGr
	4gZPboSy5XO016lm7FMGU59/tlQym9sS5ZEp3u0NQUu3kU0a2jV5gHI9KVvvhaGG+7yRH3W39Sj8q
	PJ+U+uL3fNEi0xu9MMACEclY/JgZ4CewFGXRS26MOB2DhrIMZ2T1k1LZ4LsAN8tZqrbGVfaYeOFmx
	CYsn8wZNsbeca+wJmdFh7ihR5r9zDzHmrB/XK91pvlc8J7GaeyHvXXi9O/lRiLFxzJsuehbm0GNt5
	I+igWzpncxI/cmLUuntoJtiecJQGMl5HUTNPa+alK9V1ivtg9AWdpvQLhDQrG8LnW5NRlFBZujg6B
	3O510mEaJ6dhhEAxOGUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMFHE-007BB0-GB; Mon, 21 Feb 2022 20:27:20 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMFGo-007B2A-Hz; Mon, 21 Feb 2022 20:26:55 +0000
Received: by mail-ej1-x629.google.com with SMTP id bg10so36132892ejb.4;
 Mon, 21 Feb 2022 12:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=fvuoOelNYUnuMw3RclEAhuWky9HY1ItIURN9LiLCtBE=;
 b=Ekao84nEYzAyOpyQKupv6ZcKea+mL7DmE2rbOlazS4zXeoeZendkPVkipjpYNRVRjm
 5KDH5Fj1HBOoYLZqjRfoKxAvcbHWoxHKXoTAp389AkhrdjxXNRxgZuVOH1qoONBlO4xa
 p4MwPxryFN6gG1a9lyFLwCIg6xvBYHuCZs4+HAW9UGvkJ0vrDcsg2DV/UZriyfyHOMGX
 xXRBNQ+0itlmeUzExBxT+oZ2KRLG9VfUsMMCDhsLdQLVRasjfZn+3snZDrLDx9YIoqmL
 HWcGrwbdpLZMFJ+nxJqheV1SrNU/FyI15eJWgvf2Zmz3XyruSu/qQt07dusVeYQZKzj8
 UZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=fvuoOelNYUnuMw3RclEAhuWky9HY1ItIURN9LiLCtBE=;
 b=pqm7ckwIlxOw7zBViqFplNpBtB8Mb0wCETA9nuND/h6s/cpAVHl9L2nlEo9HFsR2/3
 GScDNMACKM/tzuwfeJXYpGn+9M1/VO9q4vmjZAmQ2D2t8ga8G+xEQVuAr8izzY7CKlqn
 NKnvb9HI7kVUxajklSx4vNtxXSJpEkFpz+ZczaeMBJRjr8BJAQIiwhb0fGJRq1ztAm6D
 bmkV20RojVfdsg4ee6jsNT7+44+eTdcwFsWc+7u4XVUNWCMMKTCNyo53nZqRfwZKTQC8
 Tah16nvwOJTXXkPgzxUQgKwTalkieyDmgiD02AZgnDAhp6FpdSzOuEIhKN+GXGEkNqIO
 KWCg==
X-Gm-Message-State: AOAM530ZCcHaM7+xM4624rk15i/gHTrPIc18+VeyaRIqMf2Zn702DMKk
 D0/LQHP0V6M8lrXSwwG7oLw=
X-Google-Smtp-Source: ABdhPJxbYvk+lqvBbfPU8LgrZy56/J92yjPQy18vAN4mgZsbd+WMc6R85IT5h5yTz2e6tBqJCcb7Ew==
X-Received: by 2002:a17:906:3bc7:b0:6cc:493e:31e4 with SMTP id
 v7-20020a1709063bc700b006cc493e31e4mr16745224ejf.549.1645475212691; 
 Mon, 21 Feb 2022 12:26:52 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:b141:a0d:4aad:2a06?
 (p200300ea8f4d2b00b1410a0d4aad2a06.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:b141:a0d:4aad:2a06])
 by smtp.googlemail.com with ESMTPSA id o17sm2820552edc.16.2022.02.21.12.26.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 12:26:52 -0800 (PST)
Message-ID: <358ccbef-4151-a0e6-fc4d-9859e4fdf2df@gmail.com>
Date: Mon, 21 Feb 2022 21:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v2 2/6] dt-bindings: vendor-prefixes: Add Titan Micro
 Electronics
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Miguel Ojeda
 <ojeda@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
In-Reply-To: <1f39432b-84e2-e6dc-a6b8-c48ad5cf2210@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_122654_618694_C38E0EC8 
X-CRM114-Status: UNSURE (   6.97  )
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

RnJvbTogQW5kcmVhcyBGw6RyYmVyIDxhZmFlcmJlckBzdXNlLmRlPgoKQXNzaWduIHZlbmRvciBw
cmVmaXggInRpdGFubWVjIiwgbWF0Y2hpbmcgdGhlaXIgZG9tYWluIG5hbWUuCgpBY2tlZC1ieTog
Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBGw6Ry
YmVyIDxhZmFlcmJlckBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBIZWluZXIgS2FsbHdlaXQgPGhr
YWxsd2VpdDFAZ21haWwuY29tPgotLS0KIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy92ZW5kb3ItcHJlZml4ZXMueWFtbCB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggZWJlMjk0NTE2Li4zOGJmYjQ2MmMgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwKQEAgLTEyMjksNiArMTIyOSw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0
aW9uOiBUZXhhcyBJbnN0cnVtZW50cwogICAiXnRpYW5tYSwuKiI6CiAgICAgZGVzY3JpcHRpb246
IFRpYW5tYSBNaWNyby1lbGVjdHJvbmljcyBDby4sIEx0ZC4KKyAgIl50aXRhbm1lYywuKiI6Cisg
ICAgZGVzY3JpcHRpb246IFNoZW56aGVuIFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzIENvLiwgTHRk
LgogICAiXnRsbSwuKiI6CiAgICAgZGVzY3JpcHRpb246IFRydXN0ZWQgTG9naWMgTW9iaWxpdHkK
ICAgIl50bXQsLioiOgotLSAKMi4zNS4xCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

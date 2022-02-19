Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4797C433EF
	for <linux-amlogic@archiver.kernel.org>; Sat, 19 Feb 2022 13:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6fbPYpi3ixU5EOaeB6F4W/eaXSYxd5DdQbkDNHz91k0=; b=4eZz3eXOHMUifY
	k/M5YqRPgc+GpJNJViNvp6dCPp4P/qomKKuZYH64zz/k/oEer6vyHRufas9pi8EJ23OmnvOV1rdih
	zB2/q+vONxCVCFqtS6a882X1Eg/ae5xyHMttM4LBcfDHa7+OxpLHDMoN0ZUqyGIi9EcHCK3A8UZfI
	1SNRbfuqOJk/F8U/9dSLMgeRCFDawneYStgUaVsFokli7uBWHZvI0MJ2T6toq4F17vHq2eKyqTuS6
	BYnbn/8aY0t4F4krS2LnkpJvkIB2QBR+8M1dhlZep/hrl4vH7SPbC9On1JCN0tNix1rd+35/WuXNp
	IEodPz3562hIdgfnMmJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLPgU-00GwgT-Bx; Sat, 19 Feb 2022 13:21:58 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLPg6-00GwYf-4y; Sat, 19 Feb 2022 13:21:35 +0000
Received: by mail-ej1-x630.google.com with SMTP id d10so21430558eje.10;
 Sat, 19 Feb 2022 05:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=fvuoOelNYUnuMw3RclEAhuWky9HY1ItIURN9LiLCtBE=;
 b=A9baqpgIaLoiyIClgnlI8nQkXVzJwoe0eugY7NROFOJ6j8QraPv2HwSPS/Z323hdck
 KavmMKJuF6uLw59HQ9kMEyaEGryARBpJXKIW3mu6/G75KoOVw6U2NG1dH5toDfhnxFLA
 pF4h1GyD+88QxRW2+8oyG3rShvVYC3jdoSB73HcZ6iHRjFm54hRrQtAxveTXRkqWKmFc
 NUgFVy2HEZV8iRguDefeh0sj97PKbvK2KnxCjyAM2qE9qW1zUayw9Vyl31M/01U/iWPh
 TrkVZvfxCoygGUKgzysP3PA+x97+LTYB492XeYz5DTFWjw5F2w66DpFVa93gOtHxeDAw
 kK6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=fvuoOelNYUnuMw3RclEAhuWky9HY1ItIURN9LiLCtBE=;
 b=3zIKElxEvF9HlunHY5wqizJG8xQj+6ZgNT7vcW7kkrRMdtNZczeL4NV/sqZdOQQegf
 280psqP974Y4XszpXgQuiou4R7a/FyIREM1QgMiWgK8uMn6MnQi0EfulciS+ISqzwLIa
 3VK3F4Rrkp8a4iW0ryY7jVAZSarOCAL0JLuPrENMAIDjagtMoGAnr+7v6sJgY6bwp2Iu
 Jq/iY4zU/QfiEbofIPGIC0wrhEwIfxOHdgXxK3DYEic6lOdHv/RApVieJXdqRLvzsZsN
 mdFM9FbyOHdBvlNIbmFOCqrbxsQ1EMfydQhCgCz4QUTB4JP9SYvB3nNnvOFz39DIlKHr
 hWJw==
X-Gm-Message-State: AOAM533Yq4Q+8ilhJYBAPbkmsn2uvRQZ9FpB6auHoorqIZd7UQD8Plps
 zGNHPSc5T1M0zu1xjnuLz1E=
X-Google-Smtp-Source: ABdhPJzqpPkqjcbqzzs0Iy+XWNBKleezaBJfKQY7AcpRwS61+T49RYqYpFuYKzO7oARcEK8qWX0Sjg==
X-Received: by 2002:a17:906:ad90:b0:6cf:74f1:a34 with SMTP id
 la16-20020a170906ad9000b006cf74f10a34mr9780970ejb.175.1645276892319; 
 Sat, 19 Feb 2022 05:21:32 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d?
 (p200300ea8f4d2b005cf9df09c1b3d44d.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:5cf9:df09:c1b3:d44d])
 by smtp.googlemail.com with ESMTPSA id o21sm1302818ejh.114.2022.02.19.05.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Feb 2022 05:21:31 -0800 (PST)
Message-ID: <e527eabe-3fe2-ceb6-7981-a4c3b6661fb5@gmail.com>
Date: Sat, 19 Feb 2022 14:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH 2/6] dt-bindings: vendor-prefixes: Add Titan Micro Electronics
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
References: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
In-Reply-To: <4172e59f-b9d5-d87d-9dbd-a6f683a2173c@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_052134_216019_DB0AF2CE 
X-CRM114-Status: UNSURE (   7.38  )
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
ICAgIl50bXQsLioiOgotLSAKMi4zNS4xCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK

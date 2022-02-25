Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70596C433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 21:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AnQfJn4uo9s1XrRfWrKD52I/29o/CMzXGt8XjxpmToI=; b=Sr/+ce+9W561JU
	JSR33y8ZaNuCpd606/YCW46sQf+1N9DNTN2cbqe3xqMQyb6kSZBSK11RzJlyaXEFi3sZLVPZjiLMA
	11C5vf2bnmxxK+DzGKDpAdvIYhtew1OyurM4VWemTcZA5Ya8jon5CevOf0PMDNkkoDZJxv2SaQomZ
	AjLQlDiegJG/yTxpuADqAl/NuKCYdHNQ5ciQSCLBcO/b/TxS/1G+HrvgX8aiIw5Qh1HUgEWEui/NJ
	c6agM5iv7P5N9Fncr3jKBQbGVIhuylS7mepkTMmaWiUStOrga4JqmJibaqN4CffHCXuRhPht/1UM8
	+842oKXf5iReyohBU3Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNi4U-0070Yv-LR; Fri, 25 Feb 2022 21:24:14 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNi46-0070Qw-MC; Fri, 25 Feb 2022 21:23:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id bg10so13268379ejb.4;
 Fri, 25 Feb 2022 13:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=XMOMyaP+5tw/NTE2jwKE8j7Rm2F5qsTyT92ajHBSVzE=;
 b=IjNy65ihmU+6AEvk3BdFsxIrkof69TC3Pxon5+csXTU78W9JB1ejc+cmw81jqxkZbP
 ViMqvn7ttZp9FOPHUXH0y592rsX8cVkQyzrN2uLRYYInqTE4k0A2PvRx6c7kXj4UqrjK
 MEcLwHeO2eaMhj4ClKTqofOqdKWHBRR7w7XGD+LtCubXBUFXcHQtYSSKAU65uI2X7uWD
 EBlfSmCZ6G9OQMImiK0lVp/P4kkenpQAUrSEqyRNX0sFMly9sK2d9NqT6a8M8BH9HajS
 S3rC1U09VDscCN81zwZ607P5R8p57OjobrRXy9fS8HpMc0B8a4GWZdMS/KUL1N7QJiP4
 ai2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=XMOMyaP+5tw/NTE2jwKE8j7Rm2F5qsTyT92ajHBSVzE=;
 b=e+Jc33ncYcudfoaRSEmyDdts/izXwZuZkwLtjVqj6BoXxEnMBlknzNtxHZclBsswg7
 ydOfepcc9S7cOg/bA7GhAakEkMQmCnR7lMhIPb4Y1aZObd/zODFYkmkIRjdn4RGF4LjI
 da+2dSkARiSRcl3ccFH6F28svPnYUKiOi9GQY5uYb1lddMpJuGs5w7kc+cOfgqgqUA4e
 LbFqVhX1SCZ53XXGwXPFJ2+oKhwUGxYRNMAZ/Tmrrqjz6xsVaWZJD0GM2zMOBoC9T2Rh
 EBwUzFNAF9d0aouh7cxAiI/f8uql9o8HlkUeBSoyBkJaPCW8RJM2uOF6TQJVokImzsai
 l/Qw==
X-Gm-Message-State: AOAM532LBh0UomlLdT2pzk8RJ8cdq3A9uZr9SnYuOgaV3bureZzLm95v
 u+uFLZDDJmYA15QpsnXrrQA=
X-Google-Smtp-Source: ABdhPJz7EKJhsLg03UN9iq/z6v8bEQ6eCSnzB0QD7Ao+asSXXmsuw5PyGkcL9GCrBqQ6giKMfyQzIQ==
X-Received: by 2002:a17:906:9b88:b0:6d0:f843:4068 with SMTP id
 dd8-20020a1709069b8800b006d0f8434068mr7369328ejc.678.1645824227108; 
 Fri, 25 Feb 2022 13:23:47 -0800 (PST)
Received: from ?IPV6:2a01:c22:7326:e100:c9d3:3c62:2c99:d44b?
 (dynamic-2a01-0c22-7326-e100-c9d3-3c62-2c99-d44b.c22.pool.telefonica.de.
 [2a01:c22:7326:e100:c9d3:3c62:2c99:d44b])
 by smtp.googlemail.com with ESMTPSA id
 bd3-20020a056402206300b00410a4ac2802sm1878229edb.66.2022.02.25.13.23.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:23:46 -0800 (PST)
Message-ID: <ed500ab9-baa4-8f9b-fdb8-45f0ca4569cd@gmail.com>
Date: Fri, 25 Feb 2022 22:10:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v5 1/6] dt-bindings: vendor-prefixes: Add Titan Micro
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
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
In-Reply-To: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_132350_748775_8A262653 
X-CRM114-Status: UNSURE (   6.38  )
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
ZG9yLXByZWZpeGVzLnlhbWwKaW5kZXggZTA2MmE4MTg3Li42ZmZkZWM5MWYgMTAwNjQ0Ci0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92ZW5kb3ItcHJlZml4ZXMueWFtbAor
KysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdmVuZG9yLXByZWZpeGVzLnlh
bWwKQEAgLTEyMzgsNiArMTIzOCw4IEBAIHBhdHRlcm5Qcm9wZXJ0aWVzOgogICAgIGRlc2NyaXB0
aW9uOiBUZXhhcyBJbnN0cnVtZW50cwogICAiXnRpYW5tYSwuKiI6CiAgICAgZGVzY3JpcHRpb246
IFRpYW5tYSBNaWNyby1lbGVjdHJvbmljcyBDby4sIEx0ZC4KKyAgIl50aXRhbm1lYywuKiI6Cisg
ICAgZGVzY3JpcHRpb246IFNoZW56aGVuIFRpdGFuIE1pY3JvIEVsZWN0cm9uaWNzIENvLiwgTHRk
LgogICAiXnRsbSwuKiI6CiAgICAgZGVzY3JpcHRpb246IFRydXN0ZWQgTG9naWMgTW9iaWxpdHkK
ICAgIl50bXQsLioiOgotLSAKMi4zNS4xCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxv
Z2ljQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1hbWxvZ2ljCg==

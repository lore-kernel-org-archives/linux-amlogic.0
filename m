Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B223C433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 24 Feb 2022 20:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrbKSvIbzCvWx087feUH4nod33gfC4qSpQ+gf0UY7nE=; b=WCZ8MYPAxqDHiK
	nZwKWXGCQmfKCysCmuotrctikfs0HntskA0BrPZSOnMjFobFJQCFWuJWyeI6rGx9vU013MaovaVJv
	qtqImNQXqSbkav7/TDtmlVA59sn5BdeN2MbFv6dWZ8SdQ/6zvcE+tahYh0K7V8HDdsiKNMXPqcsDs
	jfbS8mBS3INBrJIQZFkcwUZnPPi2JWH3UnXnSdMwb/+7K8mWaPTPpHAYTYzdmv8z3AAtIHQSOBDtJ
	tco3E+HvQQ8dFNLGF4NtxQhZEasRsROqPU4z4Cpd2Hi+JZhn4jcnh9s7htlNEYQmF5NIQEACvtgg+
	lFRJHAYqfWJtUnTa5m8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNKU1-002IOE-FI; Thu, 24 Feb 2022 20:13:01 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNKSe-002Hjn-VZ; Thu, 24 Feb 2022 20:11:38 +0000
Received: by mail-ed1-x52b.google.com with SMTP id s1so4424396edd.13;
 Thu, 24 Feb 2022 12:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=e5NyuFcM6LQ6ck24zC5Lh3fqt3x4cs5RkTNn8b8l2Vk=;
 b=WW8m6ltpaXjzsUeL8mbZAG+qShtaE0rRC0oJsgH8l16Cgy1HBjPK4SjOi6cc9YXKLY
 FUJfNFr4zzbeWHGgcbrVYOkyb359yLsSYLIrICroCc8Dfz4N/OTVGEFeAQkxOPu1f4fW
 PdpD74HRc1Mh9mlT8MkTomiwLIow77sUEE7l5bCUAs1MTdH8+GjcMaAHlm/i3oW9N6lW
 Si0W3p3tf3bl4ssdMwkdDn6imwemZIgV1yNF8z8s2AjajQPK0btKxnLUyZkCK8p8XCxF
 Pw8OXgy/8d/mAVufBvqg3c7mwsawDB35XWDB57W2ZxP9rBvOon7fcgYsVtfbpk58Rlmf
 OfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=e5NyuFcM6LQ6ck24zC5Lh3fqt3x4cs5RkTNn8b8l2Vk=;
 b=zp44qXw91Yy8eaqLjhU5fGUxnMmMonT2fHLNDt18Dm/sGDL3cqRIvmT/ELWshQnNga
 FxTrbzbdtgtAfvmQQUgy1TGqTBn1PkaZUg7rWPi79BLcWiUDSX4FIu8PArVMF+SERoZP
 LSJlSgHUGYrQO1iTzDWb1RTvi9LSTelB4M1ouT07Ayj2y8l+OSID1WWpsLYxV9gvBbJ9
 8mVL3JbnPAtFDiLFFZyiL637GUG/zsBNm2gBef8IKSPf1GGqIfkvUEm+rkxy1tNoZwU5
 VGZ96adXSBeTTdtTnmrCTZ9p9GnZ44hBzrsZnPayUp3PwxrVDzZ5s9Fadk1iOUievIf8
 qV4g==
X-Gm-Message-State: AOAM531au1ENac+r7vTPkB6AE1E57X9JFX8hVnltFOr/B9LHLtjghin2
 q+6MTk9OhpsmX/4XQD3nHoc=
X-Google-Smtp-Source: ABdhPJzgq2waSqW60Mpej34aIb3d1OVbopNz58VxC3hrhDTV4U4+trNRV9CIxszo/Xe4sDO01llm9A==
X-Received: by 2002:a05:6402:c90:b0:410:a0a7:ca5b with SMTP id
 cm16-20020a0564020c9000b00410a0a7ca5bmr3812607edb.417.1645733495020; 
 Thu, 24 Feb 2022 12:11:35 -0800 (PST)
Received: from ?IPV6:2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd?
 (p200300ea8f4d2b0070ade6bd1cea7edd.dip0.t-ipconnect.de.
 [2003:ea:8f4d:2b00:70ad:e6bd:1cea:7edd])
 by smtp.googlemail.com with ESMTPSA id
 b7-20020a50e787000000b00412d6970125sm229061edn.104.2022.02.24.12.11.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 12:11:34 -0800 (PST)
Message-ID: <0cd06b4a-026b-5705-b36b-1914e63bbf0b@gmail.com>
Date: Thu, 24 Feb 2022 21:11:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v4 6/6] MAINTAINERS: Add entry for tm1628 auxdisplay driver
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
References: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
In-Reply-To: <f911c7d3-a9c4-32ee-68a1-e30b478732c9@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_121137_121421_82276712 
X-CRM114-Status: UNSURE (   6.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add maintainer entry for tm1628 7-segment LED display driver.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index eb321d82f..d66da447d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19672,6 +19672,13 @@ W:	http://sourceforge.net/projects/tlan/
 F:	Documentation/networking/device_drivers/ethernet/ti/tlan.rst
 F:	drivers/net/ethernet/ti/tlan.*
 
+TM1628 LED CONTROLLER DRIVER
+M:	Heiner Kallweit <hkallweit1@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/auxdisplay/titanmec,tm1628.yaml
+F:	Documentation/ABI/testing/sysfs-devices-auxdisplay-tm1628
+F:	drivers/auxdisplay/tm1628.c
+
 TM6000 VIDEO4LINUX DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-- 
2.35.1



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

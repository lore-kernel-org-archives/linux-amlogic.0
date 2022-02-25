Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 169EAC433F5
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Feb 2022 21:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqM5KK+cjZKfwKE57864hSDr1KSDBdac+FJecXXQYmE=; b=4gFg8hmyatSZhw
	j49vo/JQnfznGqnlvJ8vF0KKJbhV2ji3fTNtF0ES9qgtnj8Xmp+NffHlOetnC8cIZza81jKJxQbw0
	uKVtkKSmu/WlcZtKFh3rs62JVzwBwm24qyUHqY8uFtdmZUTpNalokrVagbkJbRNRy6PGm141qROkE
	Wzghkj0EwSHPJWyr79VkmP1JAPerV7UAlltlBpgeSbKnAP8x39T032Q3uMtM+8uDmtH7IVcnWbfQg
	mctThUT/LyIBsRtYFLAp0/adrKJBeRebj4Trs1bFcBWKdhm++K3G+P8V7rLhm2wWPN0cbamW3LpNd
	ckHCRNeRH/V5pln/mJqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNi5s-0071KT-5i; Fri, 25 Feb 2022 21:25:40 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNi4B-0070T0-AG; Fri, 25 Feb 2022 21:23:57 +0000
Received: by mail-ed1-x533.google.com with SMTP id c6so9106243edk.12;
 Fri, 25 Feb 2022 13:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=nfqVpMsDeMm4Dl6KEyxiRu7U3Ug1Y0nrCDl3R9Adamk=;
 b=mn/5WQpvX8UpDXsx+/RJi1a8Tq3ZBpyGuoVhfX1+uduashZxSvh0nFqa/wMhTAVV3F
 1ZNVsQmqkwlppgH4A3GWHsWS/ZXCuP23r0F/B3CDsO+eevrdIkwp/gXhFCwrZj9QI96t
 8PnD/Vk1/Y9fui67586scyCpkFBBmkU/puggcxVpcDLLHCDLtnq0yx3xCUvhE0eb1fNJ
 3MX92ovkDtLjTtEyHMaMoeYmynZ6wClfOoydJ01+jLRa2u1IINXAlYDaheefX27dG/2X
 FcAQaM+1d+B5iuxuIXGHZkESgKKkVD//CTDR/7fxNqwYiAVNV2jEbIWvmHb1igWgwtUh
 oWdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=nfqVpMsDeMm4Dl6KEyxiRu7U3Ug1Y0nrCDl3R9Adamk=;
 b=gBqEzjjcME4pGcBU3eRBTesLCzSv6eHFRwamhVWPTfpH4yt4szoLc8TVxjU1S5AxM7
 rq5JWicphlWV/mSnB5AFNcyUM8PJvHcx+EOKLOu0oEL5dNKO6QV47HLHHpffNybldUbF
 pN2ajmXiyGtsJP8NQ7QT132aa5dKuwPORiihefsM3XjQnnBXo+ECQDdMh82C4uE7vGrb
 82Yo6VMRFtQqYhC2XrbEEVv2Qn28xLYKT18T17kS7V2g/QMs/xXwbAmQr2w/oBtEnaKm
 dM770TqjcDl88yi4FEsdagMGdme4/uiRPoP9bxCGIRHRGu56K0OT7aEaQ2QmLX9+QrcZ
 +AmA==
X-Gm-Message-State: AOAM533uO/hvS1pX88DQAkXpTsenGQLw+TsO6agljFhH7Ej8b0eGzEHj
 Tq2YqbmYUvrrn6u11KDrAQE=
X-Google-Smtp-Source: ABdhPJxeuoGcGF6Eo+InxvhSFmSvajf4aKhd1YO+sL7RSrUZuHGA4+z5ze+zFBMxCjC0GO00VQk0RQ==
X-Received: by 2002:aa7:df86:0:b0:413:2d4a:5358 with SMTP id
 b6-20020aa7df86000000b004132d4a5358mr8888580edy.21.1645824233893; 
 Fri, 25 Feb 2022 13:23:53 -0800 (PST)
Received: from ?IPV6:2a01:c22:7326:e100:c9d3:3c62:2c99:d44b?
 (dynamic-2a01-0c22-7326-e100-c9d3-3c62-2c99-d44b.c22.pool.telefonica.de.
 [2a01:c22:7326:e100:c9d3:3c62:2c99:d44b])
 by smtp.googlemail.com with ESMTPSA id
 u10-20020a50d94a000000b004131aa2525esm1948050edj.49.2022.02.25.13.23.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Feb 2022 13:23:53 -0800 (PST)
Message-ID: <1c1fe4e6-3c73-1445-e766-0dba264d4581@gmail.com>
Date: Fri, 25 Feb 2022 22:22:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: [PATCH v5 6/6] MAINTAINERS: Add entry for tm1628 auxdisplay driver
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
X-CRM114-CacheID: sfid-20220225_132355_443564_71C1594D 
X-CRM114-Status: UNSURE (   6.77  )
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

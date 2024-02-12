Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61375C48BC4
	for <linux-amlogic@archiver.kernel.org>; Mon, 12 Feb 2024 17:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzEVRIQFLMKcuL4atH7nEaI4ecSisr1ktMcgk4AP2Ho=; b=K0T5i1WBQSqNZN
	q6jNoNInyuNnKEgr1WrpxSXGP50Hes+frv4lDvVeY3KJKzXl4CQspxrnTRmdRbwDpW1zfgYd1ldwH
	DWi8adiWwTcMifxeYTymZQzgy6vn3rYZhn5P4CoTuANkjOp/o3Jq2gBJR4XfWqsEXOyANhe7Gu42b
	GkX1UR82JAfzVLNkv2+oYi36NWvqU7uNiPKeUq6QlnMBp1H/jVi8gZofCRoRT0a8DOnO1QKhAZNKV
	OqpmkjjBlKXLlaQd0tn4uSXKsUr1jiZK9o9SKw/ONYcvlUf1wd8fo00hVs8SeCFQAVgC274Q7GwqV
	OYZIllbi1m699Z5drc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWJ-00000006XRf-0lDp;
	Mon, 12 Feb 2024 17:55:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZaWF-00000006XPl-31cy
	for linux-amlogic@lists.infradead.org;
	Mon, 12 Feb 2024 17:55:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-41102f140b4so95455e9.2
        for <linux-amlogic@lists.infradead.org>; Mon, 12 Feb 2024 09:55:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1707760502; x=1708365302; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7ebjFfPQsMxBK4OMU/9r1jjxNqRYFypGqz5PkxsLNdE=;
        b=DJtfKfFqBWpK88Y4WMIFlp/ziwXX/uwQA14Ntv7uf/ResrhxQiK+TU8wOA8Hv9oM3A
         KhgJV4ivj1eg9FaQW5v7J1yhCP0PTzp9Qopnk9EneaIIUwAf2K1si2wWvxN8VcqY9eLZ
         5idvnRTCTXNVRZ+Bp4URJCU/s25ewikbjJWGTSsEexNeSkT7Oqp8MQkhraCCmoWAey5v
         MUsQ0DcFjtcVyp8x/iVI9uLBTAOyIjnbT4Us9auM3s7I56CMfnnswU1qMPkSrmQm4yC6
         X6aScv8EpO/DcRj09NAj45OW+bI4Q8g3Y/xA9EY5n+Dwd/tfmjQocms6iR7xIf8JmihE
         bDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707760502; x=1708365302;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7ebjFfPQsMxBK4OMU/9r1jjxNqRYFypGqz5PkxsLNdE=;
        b=o1KuO2y9oOLlk+c0IkkjCaqIWOyNYmrx4e4udxZl5Wy++ynLdoddI7/cojpUdkl0m6
         bsuQmb13os0d+vXmBlauiiuxVnw5IcoVLymhjhOHEeq/innWjUs1gz7T+4E0e2BaGUNh
         UiT4XrL2uBUTbAdOhkgi15QzsBMvzRB+aG3z8Je9RW5C4Bf/KQhEY0NRwDdVxusbk+1j
         NAf/9dB6loUmxBUmNC2EHCoGv0bVUYwmGRnQz4/9vAlZVtsSWxrRC2hapWxM5yCo3kSJ
         2Alb2XvJtNGchEq34vuLY0SXRa0VPDEm7RK1whr4TwZus8nkwb8FbZsaWurpf0t/LkC+
         4CZw==
X-Gm-Message-State: AOJu0YymnpHLRvqvf7w3TA/appOdE4yrO5TMj3wYLFu+S1eRNFa9G15V
	dZxD2D8b+IDI/iHbHluhPr5uQbFnBt0umedjM+EoZdY1H5Cp7BMu6NWGta2EZF3fnzDfdh7ZHKM
	octI=
X-Google-Smtp-Source: AGHT+IEhd7KNesDgKUWdCkIORym/IY1OJUpy3huFuFeZRZdij3h9/hNIdnuFwB+DK2vwH3NSNrmh1A==
X-Received: by 2002:a5d:4808:0:b0:337:c4be:7b9a with SMTP id l8-20020a5d4808000000b00337c4be7b9amr5001000wrq.63.1707760501760;
        Mon, 12 Feb 2024 09:55:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZCg9hnC5ntvPHzdHafHGTF9d2EVs4jTaWWlA3rBmly6vtvsdM2YVS7ir1M5l6zulv/XRAmui4aAmyn3sqbtyNxRw6iNIgcqeP1K9QWP/tM39HdJUyFD9eQ93gKHXZhGIMyDp0j0mF0+rvPU4rLF3B5NHOp8qXgFsrQ56s/i/FdBauzOGrUicZ0Jg5+5HUE9kNlMlA8tGVsR1HDwObmCHkxgc0PI0mt5+XPz97lIY1vQG2ug/MVwlL1/sXozSU7EvlWweyvBLD9jHDp1TvX6S3Cu6DW8suVOEc5z2kw3Jt0ya/4s+1PLLSUPENyiE18yXuAjg01do0+ksyJ5Z8ZMMR/6CHytyvjQBSx9D9t9+kc6k=
Received: from ?IPV6:2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9? ([2a02:8428:2a4:1a01:8c00:686f:ba67:b4c9])
        by smtp.gmail.com with ESMTPSA id z7-20020adfe547000000b0033b55186901sm7380912wrm.94.2024.02.12.09.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 09:55:01 -0800 (PST)
Message-ID: <47a5baee-866d-437d-8950-4e730f210bdf@freebox.fr>
Date: Mon, 12 Feb 2024 18:49:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: add freebox
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: AML <linux-amlogic@lists.infradead.org>, DT <devicetree@vger.kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>
References: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
In-Reply-To: <77edaf7e-aeb5-4fc0-8b69-85dcddfd5a58@freebox.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_095504_021406_EC571BFD 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Freebox is a French ISP who makes gateways and STBs.

Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
---
  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 1a0dc04f1db47..4f5a1f4e6689a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -500,6 +500,8 @@ patternProperties:
      description: FocalTech Systems Co.,Ltd
    "^forlinx,.*":
      description: Baoding Forlinx Embedded Technology Co., Ltd.
+  "^freebox,.*":
+    description: Freebox SAS
    "^freecom,.*":
      description: Freecom Gmbh
    "^frida,.*":
-- 
2.34.1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF74D29DEF
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 Jan 2026 09:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7YcGzU1KQEsV9K6SF4sbMGJIDhEo6scFC8hmF/nToTo=; b=Rt+8wdLzJ9fT3jOiaHuhPTDPa/
	//oLcInkD6KC5KYa9XmGdv/4M2o6VvluRzB6STqfiKeOmG5tdFlwYSeDFgVunT6biK4cCz0f/8azx
	mZTL3+3HqEY+DGrHzoMmt5d1ZYyxKeH9N4LmB5izh/Vvfr7poXbiHwjkZheazft1+kUdmJ0MJYuWi
	GOv4GHdcTaZqTJdOKbpQkpOdgJAIogAjfwkrgC7iXpHZghsUfiANvWhJOdadTFlmYXguxgJzWfBwS
	j7Q0B0OQxpYocA6xUyXpJZm/e0S+XJDhmJz3C4HjOm9fts6VvndCB3/GRarD5QPit1Ubt2ImMxUxN
	1bRKOupA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaU8-00000006p2G-4286;
	Tue, 13 Jan 2026 09:14:44 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfaU4-00000006p0x-05AV
	for linux-amlogic@lists.infradead.org;
	Tue, 13 Jan 2026 09:14:41 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-81f3fcdb556so1355275b3a.2
        for <linux-amlogic@lists.infradead.org>; Tue, 13 Jan 2026 01:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768295679; x=1768900479; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=hnEf8ot+lGqWBntdLq8V3taVs7sOJ7tnaso/9s2NkQnmcNoPcu1ka4uPzjKNSS/OQg
         76P/bD6lze4kuyKhkRDgBFStpZtI1pPqmqXN2EBSe2vcAImzZsth2t7xpiDlfA47/c+G
         iKdNQBIxG58qTmVXGMBoMeMauEpWSuutv02/sxl67jRip5tle/v4Gs8twBVEljmbO4OJ
         TMgnxIByfWQs3SfX596rSwjaSN9nxnTAArv7xfIkIiGGcDhBMGRcKJbmeyksOEZf/SkH
         K8z9AqoFF2NW4OfkOgKlyAaUSnFTBkRwoaQCxBvbjEnhTDNZvMvSKA48CYPxwgLfR4AC
         sROQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768295679; x=1768900479;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bot5yzHGRpdORn4dGLGp5ZsMsBNZegUjwbOB3QegdQ8=;
        b=oEqpdaPThJqLhSBHouE7PZaz3pZwjPIcA2BG9BS0yFSdyY6SnIayDQ/OD2pWAhe2tK
         x8IHzhP3F53Pg3byc8RKa27UDQXVNdoRrNNaEPXQDpClUM0N9N2DANJwqaHyKpZzB6FN
         3jywONqucksdf7OgCs5+GYtnHzZw39E07qHeoWMzb/YLzddbU2Ve4bF9jU+IjSG+vLkd
         iw1eQ6OPaUeL6ZkqgAesaBCzYCUgqPbt4r2w8lPrESlSMP70HXXRaigzqZByPutzp1pu
         A9qfIgCPxB8CTybwNexere8nntMNtW3unqFCoaKVj8cmA8gb9Xr5qz+/utSo/X30xr4R
         lOhA==
X-Forwarded-Encrypted: i=1; AJvYcCWhfuFuB767h6s3NSVFyhJVQJs+Z80JOJF15/ejJ6BxD9xEUTCULWOeU5pHvj5esSmbiUd4VRy/omZW+qvF@lists.infradead.org
X-Gm-Message-State: AOJu0YwQzzU2PBAKod2Aq6sFc7FvETCBN38YbS2SERBjL14eMthnpy66
	B6d+0l3AznSsm75nX7GMND3V6dqGTd0KALhueGfXd+pEfM3ofySwSAY6
X-Gm-Gg: AY/fxX6OXVDXxxDG75FXNebyCnZ/0w8hBZLO7u1bzIjgflyQ5Mlh1b+zjAD0TXJ66xK
	QfsETJukCXXvVWsjJYVkFA9AClOYY57Lus1imDg1jbbrfPb0di7YzkRC4sCh+/bHlU2L0jUfcXH
	LOTr9f+Sv9TKz3TWXTKU+K/RAISzsP9isGnAzWYHZOZXIwLk5J9mXwGqVGRmhz4tN8GxfrL1YGU
	bEhnRDNZuSvbTpWGZ+JSL02Gyvvmod4RncUPkVbEd0OQNBoGneu/AyBE7feNMZim+p/I/feDYI6
	L7Zwhn6JL6aqvB27v8W41aeErGNQ2SyzwLMNig0x2hK0jA7FDBmPYn4hmj/AUtc/Ws5pezLrQpf
	EzNWyHxcmbhpCN8fkRp7ETiychgdrtqpeu7lUT3R/FZhKoRabh9ujDXAwwn4D15Ji+W1Wl5Hro6
	XZqmgLsI4=
X-Google-Smtp-Source: AGHT+IGsHeyylseX5uTR0Zuev3x2aRQU9RlBAKG0seW0iIbuL5lWyCYCsms8xRBNCrhbFAf8lGITDA==
X-Received: by 2002:a05:6a20:2583:b0:366:14ac:e204 with SMTP id adf61e73a8af0-3898fa57649mr15886967637.66.1768295678911;
        Tue, 13 Jan 2026 01:14:38 -0800 (PST)
Received: from localhost.localdomain ([47.82.78.41])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c48c0bsm15293915ad.31.2026.01.13.01.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 01:14:38 -0800 (PST)
From: Nick Xie <xieqinick@gmail.com>
X-Google-Original-From: Nick Xie <nick@khadas.com>
To: neil.armstrong@linaro.org,
	khilman@baylibre.com,
	jbrunet@baylibre.com,
	martin.blumenstingl@googlemail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: [PATCH v1 1/2] dt-bindings: arm: amlogic: add Khadas VIM1S binding
Date: Tue, 13 Jan 2026 17:09:50 +0800
Message-Id: <20260113090951.35928-2-nick@khadas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260113090951.35928-1-nick@khadas.com>
References: <20260113090951.35928-1-nick@khadas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_011440_061608_A618D5D4 
X-CRM114-Status: UNSURE (   7.76  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, xianwei.zhao@amlogic.com, nick@khadas.com, krzk+dt@kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Add devicetree binding for Khadas VIM1S board based on
Amlogic S4 S905Y4 SoC.

Signed-off-by: Nick Xie <nick@khadas.com>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 08d9963fe9259..55663e0f7f915 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -247,6 +247,12 @@ properties:
               - amlogic,aq222
           - const: amlogic,s4
 
+      - description: Boards with the Amlogic Meson S4 S905Y4 SoC
+        items:
+          - enum:
+              - khadas,vim1s
+          - const: amlogic,s4
+
       - description: Boards with the Amlogic S6 S905X5 SoC
         items:
           - enum:
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

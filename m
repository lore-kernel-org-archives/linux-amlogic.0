Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B54F1C678DB
	for <linux-amlogic@archiver.kernel.org>; Sun,  5 Mar 2023 13:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vim6+c5pDLuuRiKBpD5b4YDRrX7+fyWv98pEp9+DIW8=; b=dfyLZmhXVMmENH
	yBpfyqhbYH7zycMlLB+l7M4144JAdU/cip3EaeppVEvgNgW+goJf77R1V707b7LidzEOotxfrEZdW
	6Sd6B3gp9gLhV5M1kyWHbz9M+xsMJ8RV44s0/d1XotPVPA0S9IbI5Z7e2Zxyu9YHe2hSZEpvL/Yce
	9IjPMW5uJaZELPecfUfRm+ziHP2COX22l78a0VUhTDUKUfWzktzO4OBWwY0e3zS30o+VWKUidI9jO
	Uy+r3mAG/2zaKb8yoOzzSd6kcltqQHCHyC9Jr3ifcIqFR+tIN+/MHQKoq6pzatpCbHwZRyxSRjtco
	f9SB3RHLCpOrGG9L5Pkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYogG-00AHWC-DS; Sun, 05 Mar 2023 13:45:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYofy-00AHSV-Jr; Sun, 05 Mar 2023 13:45:23 +0000
Received: by mail-wr1-x436.google.com with SMTP id h11so6354470wrm.5;
        Sun, 05 Mar 2023 05:45:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Etz7w1zB4xD9fNNk3nsimSfalHBMwFfyAwByQKbyDeo=;
        b=DjOn5MokKm3n5yfsnns/kyuu0WwFtskQlH/NG0mmQaqbcfw9ZSi7XeNvaLVRSll0kl
         MmJK3SzkHh1eutpo9I4d7eaULrdnGJT4OvzmQVV25QlsdVy+yw59cVxDROnsG4moEKWH
         Q9Lw3cVK89AJh7Xp7Qv7HZyxEcqWmcENRXzUk/B2eiFZ4NEZktwmyfUjlen8QVK1LlYK
         aWS0nMTM9p3dkUTs1VllYaS9gpIrSz7zd5adiKNsNTUty6iWBTPQ5OqKE6gqm9MfhogL
         sn2G3b5N7goDU3QC4KdV+XqDd/iSbfBfL8j/IXnNoGYA9/yq0/sxujAkkEY4R8QnOk48
         dMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Etz7w1zB4xD9fNNk3nsimSfalHBMwFfyAwByQKbyDeo=;
        b=DYbTSLSvAbaBIbYYBAlRzwfQHKAK0uIf0NUWDsIpOH2eNVWbd0+eC6yVIspm+ClXV9
         ur6HO+GUcAOm+FpLnGi7vpT9pl4h2Q7rCz6KJdZu5s9AOdNYMQmnoomcMifEWCALcYg9
         QezkYlv/azZ00efNyRozBRMVtCj9cfCxzO0ZWAGYPxINtEtrcHN00KS9RVa562mZ2cqP
         +41xnB4G1pQafiUx9YG+ptHqdXf/MKNv89BKf8GqpGeqnmVU5cjeqxMc5+Nns7nAUUrq
         gwzKTYGz55cUULOdwCr+vVB+WVUqZcVZyCPzht4VOLTbXr875uI1kEvYt3IUgVWXAlD5
         OH/Q==
X-Gm-Message-State: AO0yUKVjTxu0IcgUCxG2EREqSzrJ5ezOC06eVW2iJM2jEny+j4LUqOYb
	Gp0oYwGTKCLhXvbz2/ozvmc=
X-Google-Smtp-Source: AK7set+CiBAhHRWUIYNuzEQaEzY4YgkO2tfoyi3Y2gc3m1hr7KunYUyDzJlLraLRxENgsWnP696oMw==
X-Received: by 2002:a5d:5548:0:b0:2c7:2cf4:baff with SMTP id g8-20020a5d5548000000b002c72cf4baffmr5430761wrw.70.1678023919114;
        Sun, 05 Mar 2023 05:45:19 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id d1-20020a5d4f81000000b002c54e26bca5sm7421507wru.49.2023.03.05.05.45.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 05:45:18 -0800 (PST)
From: Christian Hewitt <christianshewitt@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: add support for BananaPi M2S variants
Date: Sun,  5 Mar 2023 13:45:11 +0000
Message-Id: <20230305134512.1596572-2-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230305134512.1596572-1-christianshewitt@gmail.com>
References: <20230305134512.1596572-1-christianshewitt@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230305_054522_670674_106F8B4B 
X-CRM114-Status: UNSURE (   7.92  )
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

BananaPi M2S ships in two variants with Amlogic S922X or A311D chips.

Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index b634d5b04e15..799a4bfff854 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -153,6 +153,7 @@ properties:
       - description: Boards with the Amlogic Meson G12B A311D SoC
         items:
           - enum:
+              - bananapi,bpi-m2s
               - khadas,vim3
               - radxa,zero2
           - const: amlogic,a311d
@@ -164,6 +165,7 @@ properties:
               - azw,gsking-x
               - azw,gtking
               - azw,gtking-pro
+              - bananapi,bpi-m2s
               - hardkernel,odroid-go-ultra
               - hardkernel,odroid-n2
               - hardkernel,odroid-n2l
-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

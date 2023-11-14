Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A47FBC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 10:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BrOhTTMiPDRdgCp+uukGwukf9JFr3VkiYnO9IuZmwA=; b=aSJcn/gu21lua4
	0JQMejByeyMCSljkRnOkegyT3XMd1ZlxEgjNvE2LGvUtm9UFlO+j5ydHZcNJSD9ZZ4hcxQCnk8z4K
	slhvhcdj/1nd5/3zRa8Ws5Lyv/19ALObIs4pFcT0Zr3iN7+qZRaF2GGny9rAT4xaYPZBGPXtQ1mIh
	/cN7m+C77Q01MgAwtzP+rM5SaT3kG3vQIVBjTPPTCV+dgTghq+HTfBlutdZodVtWmuGvFNPQZKqzo
	eV12UQir7o8kas7sEtqI918YCL4s3tKSywUTLmUKx3eNum8NWigmfkMq3Ib/IOzerbqANI0QkfCU0
	VPvpa6oOS+7ZacTim8Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qWb-00FZOU-2l;
	Tue, 14 Nov 2023 10:20:05 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qWU-00FZKs-1g
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 10:20:00 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-32daeed7771so3088509f8f.3
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 02:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699957195; x=1700561995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1QWKo5v1x3RldbHoETv2ObEXLCGaOLMr/Qq6NkPTAw=;
        b=pXMldODOmuiwfrJKzUdpJ+InM9L2a/vJaWsG5ClFpcSr8Enq25h5zfF/q62K/e7lQV
         1pYyLfBmzjjmLwaWNdfT92yeb/EbcYLoVLdM+eyimxKk0+gnaoOA4pNXWKuSRJpdCW/7
         ZoRUhhrOeMX7JCOCyhYqSy1AmgYOITbDAA6hbe5pXFH2ARPy4Im/K1ngDPTOpXy3DH5O
         yhyhcBZIrwQcovI4cU6ghqAWYUDqrCXEiRRGvhuhGGPVp2uEb52aK3VyrF/i3GfKktiG
         URwDz3blVNdPCKI4YZO+ptVI/KMliSX4ktyFuoihyd+jNRlztLDcyksZMgeql122YYMs
         d9dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699957195; x=1700561995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D1QWKo5v1x3RldbHoETv2ObEXLCGaOLMr/Qq6NkPTAw=;
        b=oLqRePwF7RX1QLehzun576PUwD1mZc8jxyIFhe2XMW9thWnh/QsfLjKrMZ01pL12v8
         4lLJ6GJvql2NdEaQ4ZUPPx5ooeA0xTXy0Bp8O2kMdIoUP6VlvcuubtBb69sKlSF+Fj4u
         A7OnEQxiB3D4kDqtHTfs9x4A5sbM3MDtzuWx34aGaglqy0dWk7tcV9lqCjVeAQjg4/K8
         xNvqa4TMxqRq0UxevnsGJoxR4iRCmL7rxLq7bfly89BGdqgV6YK2Zl4IRCgIEKIIX+en
         qT9MQXKUL9EhLNDA/9E2PWWOKGNeFlaOQeEUgrk5jU25OGj12PGnYH/HPLO3R31lWebZ
         zR+w==
X-Gm-Message-State: AOJu0YwP57sF3TBYkwLAiUBZWYm+KRlkMMjWJmB57XHlyoMt41RXkQ+J
	MMUeqKVWANx8Ctf0im/79iEZhw==
X-Google-Smtp-Source: AGHT+IEtRy6/1TJjxurvCCcvkAtUDZaID1wnEiQdKSWVWSMY+EUI5ohY3QFVq9O366Nao94h1NMqJw==
X-Received: by 2002:a05:6000:bce:b0:324:8239:2873 with SMTP id dm14-20020a0560000bce00b0032482392873mr5689990wrb.37.1699957195651;
        Tue, 14 Nov 2023 02:19:55 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d43c9000000b0032da022855fsm7419675wrr.111.2023.11.14.02.19.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:19:55 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 14 Nov 2023 11:19:50 +0100
Subject: [PATCH 1/2] dt-bindings: power: meson-g12a-power: document ISP
 power domain
MIME-Version: 1.0
Message-Id: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-1-f01e6fca67a0@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
In-Reply-To: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=643;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=TxQCQp8KexETWz0DJ5Ct9muX5KYY3F1pMZr7p8jc1eY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0nJN8WGk5SnAfQY6NQMuQ9Y2QaJiEjnrNK28CTN
 3KX/EhuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNJyQAKCRB33NvayMhJ0c3aEA
 Cojhb5oA95QAfgsCKWFyi0lXKqq0xsdU+OqBoQahY5LJYvKMov4oy1eWZO8JgU4DbIzXZMXKKv8Fvt
 occrcqxosWG/hDs5U5qEdWM5N6PoLVgYtofaqm/7GD9Zsm4GRpqIbFgkFZhXAt+VifzXwgYf4STkMM
 JPYa9O+itDHAOkLyN+kT4Gf9qQunbGaqNQTMs6RMM3Mb6ka6YYRuOm2qopuEv31DE86+U5Cin5TpbM
 xCUob2ZbP5bL9ue2UcHBsFQ7wJ1FKSByJcEiN0pd8TFWZH2zRLkBWORx1knQ2tObqCzNiNdGJucSS5
 i397W51sjErzBVTnBoHLq8Qs6PA8Rimrqdw0LwP6ED+b79yCiyhsjjpRhmiPMO5Wr+iXc7rjWf0i5e
 00UhsuZG8ruOVONe8zi0kr9EdG3pvwdiJ1Mzfg2U/YRgfXkBGotX0w5ww2xnaeUHiw5NGRnd0BXUyB
 2azZ3kOSKNtAxfd90b5GOoDFmUWCRB2g/LStbmpM2Qj4c7MHaA3ItuWkxR2Og6cnAb2ljJk9h0+bpU
 ocgbE9Kb5Xf6R2wytOISOQ7JuzLBW69l91xmGTkCdPVjTQfm4vze8RE/sxl9NI85H4dHaG0kYW+EE7
 V9e26rxwkJdHD74bj0B0B0rXhA79oQ1GRpXDyQPn0YWJJKEbSeYmD+Tu+tvQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_021958_600333_A41142AB 
X-CRM114-Status: UNSURE (   7.99  )
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

Add MIPI ISP power domain ID to the G12A Power domains bindings header

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 include/dt-bindings/power/meson-g12a-power.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/meson-g12a-power.h b/include/dt-bindings/power/meson-g12a-power.h
index 44ec0c50e340..01fd0ac4dd08 100644
--- a/include/dt-bindings/power/meson-g12a-power.h
+++ b/include/dt-bindings/power/meson-g12a-power.h
@@ -10,5 +10,6 @@
 #define PWRC_G12A_VPU_ID		0
 #define PWRC_G12A_ETH_ID		1
 #define PWRC_G12A_NNA_ID		2
+#define PWRC_G12A_ISP_ID		3
 
 #endif

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

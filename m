Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F309AC4332F
	for <linux-amlogic@archiver.kernel.org>; Tue, 14 Nov 2023 10:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kXBN+5B772ItcMKpjMO2dM+qllWllKiaYzh0zJW72rY=; b=GSjzcFMA5LVOSk
	7CxYgTQwBxPpc0qmaocFjPS+frTzDvb5jd3VDHde2YKAEE5cxOThpY0rPKp1vGMvAwe3R8yzH8slm
	yd2S8+oB4dtqhEXD8Tw9N4+DQFQ/jEAp1Sj900ZvbNcF5+0FdRpICsGNZYk4A794YFOjDJXhHkkBk
	3/n8BdCTqf0JaNcwm3sw/SqzNo1xnX3iQcEhCL7RRo7i4DmFobRyK0qPO6UY8qa76vFKx0DZKfHyk
	b84aY5W36hj5NWosW1xA6tpwSEG3Qq1ifdL36QrKchH6hjapI7pRfAAzIvVB642m06lYguSV7EIjS
	cNM4NVHR+cr1kQ5JIBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qWX-00FZMo-0b;
	Tue, 14 Nov 2023 10:20:01 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2qWT-00FZKm-3B
	for linux-amlogic@lists.infradead.org;
	Tue, 14 Nov 2023 10:19:59 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-32da7ac5c4fso3427216f8f.1
        for <linux-amlogic@lists.infradead.org>; Tue, 14 Nov 2023 02:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699957195; x=1700561995; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Y3H40OKPDCFfv2becLxXj86Eb8PKEENf7u8qtMu42o=;
        b=nuzCh+q4eG4oYnXoFbkgvm9Y8j4wcyqj+Bu055fzLsuMrpw01xvXrdDTqDRyRbnJ/X
         loWwDjvGsNWmILFoLhukFdbOzduVyfFBax32QPn979uBKaXT+KyWxUVVCRkAIh7y23Db
         9zLGwLuu23yE7elTC0WgoWs+deo62t6ApsQ9VYlSvb2v/nbRuPtJG3KWWcv5ItQ/R8V/
         2MSlN4Fei6kp0uM7wErx/FfsigbjWmVVjGkj+rpvgcaA45/8hgWa9qgpeduvloryVL1X
         jlACjxHu/pZB8EmMqRiVjfyanfix8FwiEvLodYMCXLE3NqcalqWJ/6dKyBOVQEKNr67T
         6w1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699957195; x=1700561995;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Y3H40OKPDCFfv2becLxXj86Eb8PKEENf7u8qtMu42o=;
        b=QUfyZFPDfGuEvmMaBIBDu+2BOSJm2Q5xt0nYaUTGKaWcfn81E8Tn3mqLs8YpZnyQXF
         eij7nbllGcwvscKMY39QnZf0HOxQlt0w5Bzhuw4R/dPncbj+cCjR8x4GHCwPDIME3xxO
         JPFSLxhofe5dNjIBRddiNDWFwR9oZKRTKB1ymCGtZJAbwpum/5120tIkAv8pwxM+MPYg
         7I7D3TuKcBNKVxhlc2qDoUIDykEBgSfE/eaM9zozYWnBy9Iks5jGgbm/qOaPKje50Y+T
         Oe745AQjW11yMJ5orthOkX/HuLKvTXKe4JWWbCXEPkO7FMQinbb7T08bp37jfzLbm2kD
         it+g==
X-Gm-Message-State: AOJu0Yyy2yakwMG4t/+ddp4IWyfNDX52XdMEIbfqvSh+Ffc5gfUIpKUA
	jZbxTv+H3pUSRCZrL9fsexh8FA==
X-Google-Smtp-Source: AGHT+IGNE+czp6sJVuSZ6rbZ4X7ydJSAOjDZv3m+fSTHzBughjwpl/XOaFN/IVKp/JQD37HA6m0OKg==
X-Received: by 2002:a05:6000:1547:b0:32d:939d:c7cf with SMTP id 7-20020a056000154700b0032d939dc7cfmr5789194wry.52.1699957194709;
        Tue, 14 Nov 2023 02:19:54 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id v9-20020a5d43c9000000b0032da022855fsm7419675wrr.111.2023.11.14.02.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 02:19:54 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/2] pmdomain: amlogic: meson-ee-pwrc: add ISP power domain
Date: Tue, 14 Nov 2023 11:19:49 +0100
Message-Id: <20231114-topic-amlogic-upstream-isp-pmdomain-v1-0-f01e6fca67a0@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMVJU2UC/x2NQQqDMBAAvyJ77oIbtdJ+pfQQdGMXTLJkbSmIf
 zd4GuYys4NxETZ4NjsU/olJTlXo1sD08WlhlLk6uNZ1RNTjllUm9HHNS+VXbSvsI4opapxz9JI
 wjEPrhjuFBxHUkhYO8r8ur/dxnLdsQI51AAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=699;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=hayA/yrjAypiR/MWtBGlEGZQq6NxUCOHYn4lewItjbw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlU0nIseqnNcBacgt3SvDuVxdTf2VWS+Xbpk768f36
 QchoRuyJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZVNJyAAKCRB33NvayMhJ0VjZEA
 DLwjW/XFbr9zzHFU7tpFiJ9W6tKchyMNqr9Gpcwv/ZfJnCMjpu+2svRAx/mOQYfkIa7giyxJimcykR
 BiV+dWCXLeN6JnddPMQ+xUjvJeFUZy6NjaoQuLHzOrUxoziM/BUF51RRdhsLbCldYQRLi+UX7uxEnQ
 bXsrX7jbRN6rvlkIAQSishqzUlqqEiHC1HLgzlmxKR9ko1NR2DY7v+07mPn9TH1DyEqoHfQqka5ocJ
 tvNNg71f9BigMkVqDh1A27Kv6c4v3E6f0hTTYWSyD4G4fW+rFOboI5z3ZG8kNNl9rDq/PhXx1/3BJC
 PGwZyqZ6i6q5tv+EE35OCGPyViry+Al01U5y4GICcm5LK0UaWoj7v3W7zBZFIGf3Rz34Zhyz2VxQFF
 k/feHqyaKtyvmpYMQXn8tUOPZbx02b3cv4STR9KYGgROS8RrZdCMahOab8K+1p/BjDlfkiNJkS+rNe
 AhwfbyNoSn4F/Ng/PdFWpRkqmhHmnod3fjJccyVD8zQj7K00VB7AtYP8Qsz7yhQMI8eUvv9n1tTeku
 uc5eviHa1Pi61IQBUp/uOAZ7ep5d4NVPgtZWt5XqrZHsZe86wta4jHkfx7AD3lER9hE7Dn8uax3CkG
 avTZ2G+9km6odo/amaOXE0EZ+fsTi0qw5/5mQqVIAFrhonVf8lpTMwS22xFQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_021958_031185_2F12CC28 
X-CRM114-Status: UNSURE (   6.50  )
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

Add MIPI ISP power domain bindings and entries for the ISP power domain
found in the Amlogic G12B SoC.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (2):
      dt-bindings: power: meson-g12a-power: document ISP power domain
      pmdomain: amlogic: meson-ee-pwrc: add support for G12A ISP power domain

 drivers/pmdomain/amlogic/meson-ee-pwrc.c     | 16 ++++++++++++++++
 include/dt-bindings/power/meson-g12a-power.h |  1 +
 2 files changed, 17 insertions(+)
---
base-commit: 5cd631a52568a18b12fd2563418985c8cb63e4b0
change-id: 20231114-topic-amlogic-upstream-isp-pmdomain-f7502561f911

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

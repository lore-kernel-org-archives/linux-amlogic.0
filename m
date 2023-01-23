Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8216CC38142
	for <linux-amlogic@archiver.kernel.org>; Mon, 23 Jan 2023 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hgA/l/FoT8GLlKbprtBpXXJYZ2805Yjpzi8Pq7SsN8Q=; b=UNG7x3xal9R87q
	c7EgAHQ75TndAW++vVn7sDz07GPKFLtJ2en1KkDtbHwXNDKSZwNjEGeBQlJbIJZCbPpoLSo4WU+jH
	HVp27Eyt0S0vXHyRlAT1/p+prm5wfiuQvk8IZ75Bk/4kaT09pWCiYazH1QCOX1BbETlugrq96Nq6R
	7bXsCOg/upfITJ1FfyMgkM0fmEGKYqfr8Tt+BpesL/7+yTgP2s4sfyG/K6j7P1tGXSQUUua2XjSVg
	bUkdbiBoOEbwhpRTUFWYM7kW+Ng1emOwegMYxJ8Q+3ProuW1Ojt/9B3Tj/RzM7AVry8pbPc1KAHTq
	VS+6ZH6vh1/G/YUjEPwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxTt-00HVs8-Ve; Mon, 23 Jan 2023 14:07:30 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJxTq-00HVor-Br
	for linux-amlogic@lists.infradead.org; Mon, 23 Jan 2023 14:07:27 +0000
Received: by mail-wm1-x332.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso8632416wmq.5
        for <linux-amlogic@lists.infradead.org>; Mon, 23 Jan 2023 06:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMK/+RMwR61EzRWy37zhx+HZF9yxvaCOnadqFz7PJVw=;
        b=CM0oF444X+aiG/eAAfU0knzXf6q2ftR8sHRJ8V0RejWsFpHX3FCCyzj01HX+1++CZV
         uNmAr8rUeVhaMPUXrwAOg9d+0sKIiMh16Fc3wSZrUEeORQztIpm89kg+mKWmqrAKSkE7
         0CRqR/f2W6z2MY4kxFhF1RWweemt9/0Zx7TU3ru5FL7ycTSe5WLYgpH9A2vs0+YKMiLJ
         Mb3ZRCHEf9XFbu+aQzUhrn8lUwEZFXylevywtMKfzXm7cZT6lpE0v2IqXufMVyBNa0UG
         6P3mzHiGL6qgA63HBybmQQFA1TOZlZGa6RnKf3wFscxfL1rBl1baf9Kdl5DAqyczAsKH
         /IAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMK/+RMwR61EzRWy37zhx+HZF9yxvaCOnadqFz7PJVw=;
        b=dYeLskwIVOhSsOv0NXjbybMj/PaeaSH4Z+/I1YvwyLQ5IIt3vU/Ajo9FdPmXjT4VCu
         Qe1/Ys+GbjBPg1xv85PSN0sOoR6XhLDTPx4jMmGWNgX/gRpixdQ68JLihtl/B41TvcQz
         QA7QWMDyuB0zuvUKHcPT/oPwCumyvZ2QwDh57wXiRaHHbMPN2cnOUTp7nc0ScmVp/RIO
         vzZRVtoDa9v2I8Ci8bMP/9bREER4iBTf8XK9oUd45IlOj/qYAxbpfZHi0ws5llM5l7Ai
         w2wN1pfSGZ6MZApK00T6m5nN9Ur9LRMB/ISuclReJqoejEyR6D0B+HlrbzMyfhb7jhnS
         xIOg==
X-Gm-Message-State: AFqh2kpLI0J6r0d4156xhJJtyYNk8QszB0A/UjCkbPoyGrEhrEM9SH8r
	kX8GpyjYCYgg44q7RxuJSpFwTw==
X-Google-Smtp-Source: AMrXdXtJfkW4hbK0327mqFk53zxLlnRblI0rDrk+cXT98CF5YwUFKDniiT98vVncOHdBgU0uXWowvg==
X-Received: by 2002:a05:600c:4f45:b0:3cf:68d3:3047 with SMTP id m5-20020a05600c4f4500b003cf68d33047mr24275228wmq.41.1674482842339;
        Mon, 23 Jan 2023 06:07:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id q7-20020a05600c46c700b003c6bbe910fdsm13841655wmo.9.2023.01.23.06.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 06:07:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/3] arm64: meson-g12b: add initial support for Odroid-N2L
Date: Mon, 23 Jan 2023 15:07:15 +0100
Message-Id: <20230122-topic-odroid-n2l-upstream-initial-v1-0-1ce5e08039d0@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJOUzmMC/x2NQQqDMBAAvyJ77oLZCrb9SukhJmtdSDeyiVIQ/
 97Q48xh5oDCJlzg0R1gvEuRrA3cpYOweH0zSmwM1NO1d0RY8yoBc7QsEZUSbmupxv6DolLFJ7z
 xMI+DG+8UHLTO5AvjZF7D0kq6pdTkajzL9z9+vs7zB8agXNiIAAAA
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Dongjin Kim <tobetter@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_060726_484099_32B513D2 
X-CRM114-Status: GOOD (  10.82  )
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

ODROID-N2L is a variant SBC in small form factor and some peripherals
are removed from ODROID-N2PLUS based on S922X SoC.

- On-board ethernet is removed      
- On-board RTC is removed        
- USB 3.0 hub is removed, so one USB 2.0 and one USB 3.0 host ports
are available                                                                               
- Huge heatsink is replaced with 40x40mm heatsink, 5V active heatsink
is recommended or a tall passive sink is optional                  
- 3.5mm earjack is removed                                                                  
- IR remote receiver is removed                                                             
- MIPI DSI port is added

So achieve this the current odroid-n2 dtsi is moved as odroid.dtsi
and only the N2/N2+ changes are kept in the odroid-n2.
With this only a minimal changes are needed to support the Odroid-N2L.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      dt-bindings: arm: amlogic: document Odroid-N2L
      arm64: dts: meson-g12b: move common node into new odroid.dtsi
      arm64: dts: meson-g12b-odroid: Add initial support for Hardkernel ODROID-N2L

 Documentation/devicetree/bindings/arm/amlogic.yaml |   1 +
 arch/arm64/boot/dts/amlogic/Makefile               |   1 +
 .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     | 448 +--------------------
 .../boot/dts/amlogic/meson-g12b-odroid-n2l.dts     | 125 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid.dtsi | 445 ++++++++++++++++++++
 5 files changed, 581 insertions(+), 439 deletions(-)
---
base-commit: 1b929c02afd37871d5afb9d498426f83432e71c2
change-id: 20230122-topic-odroid-n2l-upstream-initial-8e4f741792c1

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

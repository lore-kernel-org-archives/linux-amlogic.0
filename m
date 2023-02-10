Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5873C636CD
	for <linux-amlogic@archiver.kernel.org>; Fri, 10 Feb 2023 12:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FCmusLgSbBhvTtKMmo/IHqAOy9wBedPC6F/ZeWpyY00=; b=a0qo3+mWaWVf03
	VM+uSkvG8e/KBD5jcSBXAeh/qkITi7eDcE3aMBAwsDTwLbvrr2x+oj+08Nws9ZnyEKZ3Bem5Rp1AG
	0vPPyKMDk4XfsOLD6f4Fm50dEPmlIiIYPIuQi+62/RM2O+eeVDxZ1D8iTGpr1n2Aw4bAFYb2LbF3/
	qMaoSpO9tFyHe+3xxTDCyttYExwnKVVNqRzCtV9RZI18kHKrVF2Qbh/Rp+2fN0IrcMCxYZnb6nPlz
	2drvtO8QPq6oEBajzc10Di1PF3PJIyOJpUWGwQz9xOwbiYTgpX3L1WDg8hqodHkM+vMSdlL1KCZ8B
	C5x64EvKnwO2Vx8cZavg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSW4-005gMQ-Ne; Fri, 10 Feb 2023 12:28:36 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQSVu-005gH5-21; Fri, 10 Feb 2023 12:28:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id bu23so4898328wrb.8;
        Fri, 10 Feb 2023 04:28:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tsGNvhireWD4mNV5rJb2McKZOxhDc9wHPt6shXZhutQ=;
        b=jyP4fa8a6rGSNGgFV+LtOyKyJmPJUG2VVJwgFUcKZM33bq15Uvmdq6NcX/JT8AFNWM
         TvIupQ2MybJrObyL3RBPxufnvMyPZJaAUMIm+wcx14zKW2yvyH1y7hMKjo0sp93nTwbI
         yPY7ylfPvwdUjOTHNNrVh29F1p8cZuHIpbtRwfqcaQhbR96WTwySf9d9jQi04Z4CWw5U
         ViFmGX6N0axQHBij9WQ+CZtQHmPc7H2u0n4RWORte1auSkzfnZZOoI5vkJzT1lRkKX16
         PTCNps92zNQpcLQZNh+Z2uMTNV7RYt0PY5BXIG8URajdBM3sZdpLU5N+zaPzHuR0N9bF
         hMWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsGNvhireWD4mNV5rJb2McKZOxhDc9wHPt6shXZhutQ=;
        b=EvWQNStDj9QDfXcRmEDjGd+cekX+QCsQj21sLKKaM2HQq5ba1MMYLvd0wNHAb11VN6
         bVflZvc2KG0e8xbBKfkIZWWaF/7S8NAn/zoqjiTS9iJcOdRdnGz+252LEpz8qrLnUnZK
         7Ogx1MR1eiarEa2GLtTg0VS1RVJ4KiWPiZ77MszAbBOtLOOvPcPDJTMisWBmx6eq8J68
         auv7bNCHzwThp2lxV3oS0wlbtDOrAs+Ssx35jYTD0sd1EOJgsCD62f7Tfc3j32kZLt2K
         wMSQASwWell5NW39MNap2Xg/iQ6M0w2z9HS2puSI007VVSAW+UTw+R7QiNi0Uy+UYik7
         me+Q==
X-Gm-Message-State: AO0yUKWzFOKC2qJiBZy8nK3HY8WrUmsXQZL/KArQ/wak/juL7XWB6CSF
	/13MOIwTbvxQuRItlFLXt+0=
X-Google-Smtp-Source: AK7set9O+rFcCoO6ppeRXI0IbW8z6ql/sCNVW+HCaPoQq4/g82X9kh32Cs6HGJf8H2VVTg9hL9gPog==
X-Received: by 2002:a5d:690b:0:b0:2bf:b839:c48b with SMTP id t11-20020a5d690b000000b002bfb839c48bmr15161203wru.51.1676032102792;
        Fri, 10 Feb 2023 04:28:22 -0800 (PST)
Received: from toolbox.. ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id i8-20020a5d4388000000b002c5493a17efsm1540989wrq.25.2023.02.10.04.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 04:28:21 -0800 (PST)
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
Subject: [PATCH 0/3] arm64: dts: meson: gxbb-kii-pro: device-tree updates
Date: Fri, 10 Feb 2023 12:28:14 +0000
Message-Id: <20230210122817.1027765-1-christianshewitt@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_042826_130944_D00740C4 
X-CRM114-Status: UNSURE (   7.67  )
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

First we sort nodes in the current dts and remove some blank lines. Then we
add the remaining bits needed for Bluetooth to work. And finally we add the
AIU audio card to have HDMI and S/PDIF audio output.

Christian Hewitt (3):
  arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
  arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
  arm64: dts: meson: gxbb-kii-pro: add initial audio support

 .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 84 ++++++++++++++++---
 1 file changed, 73 insertions(+), 11 deletions(-)

-- 
2.34.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

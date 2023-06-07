Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF2CAC77B7A
	for <linux-amlogic@archiver.kernel.org>; Wed,  7 Jun 2023 12:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/JasMhSiyydCHMbpxclaR7lt69H4u9CJ3JBFmq1Bfug=; b=xgvK8kkP6yYCWO
	HRCq4fx/+wxyLXxr5jFy15DwXwxpoSFT2jWPTjluh2BYZ1BCI+NLhyJEv+RFKetyHZ4ozp/uxhL8t
	poTzDEQC1K3TI44igPaSl4/G9xBgzHIEqByw9oOVtNOtHBOOK+CKgvNiOtGAueI1xFOhDYGEWPPrQ
	L/FIefFPv+QQdEVkVrFVDS+r+qdLCxTLG/JJkkHUJktOogfQO8HbiTdkHidsD86r4yE0F9KiBDU3Q
	fWBXJBrWYpqmi/p8FJDuzUdcRup89YHejmBKytdAoskIvmh+2dsALGLzCtKYKH9DAvpYOycyyj261
	B78z65CUMvdjp3Rk8r/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6rqC-005jE0-0S;
	Wed, 07 Jun 2023 12:00:40 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6qq2-005ZI6-2a
	for linux-amlogic@lists.infradead.org;
	Wed, 07 Jun 2023 10:56:28 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6e68cc738so59993695e9.1
        for <linux-amlogic@lists.infradead.org>; Wed, 07 Jun 2023 03:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686135383; x=1688727383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2iKHUzCB8EHUg15xjq4OMMdldskToFfPs25o8tYY9w=;
        b=ymQSvjPpvyT7jG/isiZDKYSjksflsakM1YaZEIQlVBp8tEte6OHoV5wzQSyR40giFJ
         6owvCmjaV8p4WDxDsicuGv8nEhAhYjhBfz1olOTwHNvr6MxKDCqVpoPbQgduASPfCVx6
         weZ/oSsGvokYUSqusI/bYDdifZqmtrkNNt5JUvDmSXqWdZsagBRnxoqa8+VphqUB4FIO
         m5k+tRTCPkKLltUc+swA3zhH8So+5wsxhMfCNYRtX6e6U3TJEqAsRBZS8xmJvW1iSboq
         BZIg73q8N6lal8smXZyxMs4XJvDRqeIhspY5+zETXpeSZbLBmEXumbde9vkOmUbp8KIZ
         HTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686135383; x=1688727383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2iKHUzCB8EHUg15xjq4OMMdldskToFfPs25o8tYY9w=;
        b=CzHQ1h0mU3dg/6sgGy5AkLM6amdPEs2RfdGNJ5sZKFtBMfL7WOUyH/QtDQ4Fs9eM0b
         niS5uxZlGSn7R0zBwkK/LVfgpl5drcrhTUzaUJhHMrcnLS+tNN46JZwBMreZRjIvJWhg
         igQi1RE0VuE/weQscm0xUPZa1k2xTJUsovWWBfsr7f//jLduYKd+a1vLbOM04ddm7ClB
         E8BEz4Ub/TjS39XzffbyEJIUpBNOGUbyefGwCExRg45XqlIo2sX4FZBEB69IgkPFELBs
         IsLfye9c24EFT4JVwa5EXNhiv9rzdfJzfw7XlOnLKls73j0YYDYxqZKMneDL8JNpTqDW
         08Gg==
X-Gm-Message-State: AC+VfDxaWtoDMD93pH+rsI5ESMwlfCJeJx8WO/OLMU2kJmjBG9rIZAcQ
	iZWNkSSiY1PbHOePRk5YJdz/Dg==
X-Google-Smtp-Source: ACHHUZ6/rVBwSBm+ljhsr4Hys2ZgNVqWoCxvgWyYTTUx6yhM6vnzeAM7hJ7kNTg2bIdzCNA5WPDVyg==
X-Received: by 2002:a1c:730c:0:b0:3f7:5e3:c1f2 with SMTP id d12-20020a1c730c000000b003f705e3c1f2mr4665801wmb.8.1686135382955;
        Wed, 07 Jun 2023 03:56:22 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id i10-20020a05600c290a00b003f60faa4612sm1761879wmd.22.2023.06.07.03.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 03:56:22 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 00/18] clk: meson: move all private clk IDs to public
 dt-bindings headers
Date: Wed, 07 Jun 2023 12:56:11 +0200
Message-Id: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEtigGQC/x2OywqDMBBFf0Wy7oBaq9JfKS6ScYxD8yIxpSD+e
 4euLucsDvdUhTJTUc/mVJk+XDgGge7WKNx1sAS8Cqu+7e/t2E5wxMQI2rtoZWsqRybtAd2bV0j
 VOLGebdaHlGDDDscJh2F+zEqaRhcCk3XAXaqhOicyZdr4+z/xWq7rBykCF5CUAAAA
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4001;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=uJNGNauTjMkkifelIBeMDs+ah1nOQgnUxgk/5DE80k8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBkgGJNOIxWQSHL0QurCTHu93otFh40QfOFcpZcxiQ2
 nXKYJUmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZIBiTQAKCRB33NvayMhJ0ZG2EA
 CzoAL+jZ+bj25TogujANFIzdIsx4Colo13UTfPLmbq2qTRMMwRvF3v5svBmFoAkG99HVwprsLoOZUi
 zbKzst9h2eR9kYgAHcxTxCE98trRbn6rpmpEHd19ZDls0KNmHcz/fqMI0ZFz6mbAhgi3sBYRJ+73Wj
 NbTT/4U7et0se7GwoF3lu/q+HJNeDcc+bJ5ZBIQZjHE5U1Y/917Lj4PYPJSqGGIwVRdAY7qBC1tK+p
 JH0cQOg6cGUSDC5naqm8NHXmf61TbJJxE7iB8jGCPvcBC3xIhpQyxmC7NYYjH8YIdttHQ/61xsgH8u
 6EtafiiYX+cJkY8mbE46QAjRsbs7/gse009YuvHB6msIRZntcNsRW+16FmGII4hy7fcInlKrHhJYcK
 4xeyTKtBu57lCEL2Qx3mdH0Vg/kw4zmgbVGBLx0RqY+LaLkPH/zInXprp7SpHP6gzznrFC/SdLW1Rj
 QkUygqf6gVNOb7pYjCYSKvoGwgDWq6DgJgcnwKCPEiiDZ/49NvSbyzNV3ShqsAn1ZPBPLeh1/hJXUG
 ipp4wrlJVBOZELbH8pN3Po7quSh5N0odzGDbzmFOf0y6WxC9WDtIP7MVpThFNmBDl17Uqpgak+yGaz
 gdaSZMtKIDYWDlqCB1BK0skHlvQTLG6mVSkaydxzyWpVbR9QudnXZoMP2zdg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_035626_853013_BB49C943 
X-CRM114-Status: UNSURE (   8.89  )
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

After some complaints in the upstreaming of the A1 clock drivers,
S4 clock driver and a tentative to use some of the private DSI
clocks in [1], it has been decided to move out all the "private"
clk IDs to public dt-bindings headers.

For that we must get rid of the "NR_CLKS" define and use
ARRAY_SIZE() to get the count of hw_clks, then we can move
the IDs and do some cleanup.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (18):
      clk: meson: migrate meson-eeclk out of hw_onecell_data to drop NR_CLKS
      clk: meson: migrate meson-aoclk out of hw_onecell_data to drop NR_CLKS
      clk: meson: migrate a1 clock drivers out of hw_onecell_data to drop NR_CLKS
      clk: meson: migrate meson8b out of hw_onecell_data to drop NR_CLKS
      clk: meson: migrate axg-audio out of hw_onecell_data to drop NR_CLKS
      dt-bindings: clk: gxbb-clkc: expose all clock ids
      dt-bindings: clk: axg-clkc: expose all clock ids
      dt-bindings: clk: g12a-clks: expose all clock ids
      dt-bindings: clk: g12a-aoclkc: expose all clock ids
      dt-bindings: clk: meson8b-clkc: expose all clock ids
      dt-bindings: clk: amlogic,a1-peripherals-clkc: expose all clock ids
      dt-bindings: clk: amlogic,a1-pll-clkc: expose all clock ids
      dt-bindings: clk: axg-audio-clkc: expose all clock ids
      clk: meson: aoclk: move bindings include to main driver
      clk: meson: eeclk: move bindings include to main driver
      clk: meson: a1: move bindings include to main driver
      clk: meson: meson8b: move bindings include to main driver
      clk: meson: axg-audio: move bindings include to main driver

 drivers/clk/meson/a1-peripherals.c                 |  345 ++---
 drivers/clk/meson/a1-peripherals.h                 |   67 -
 drivers/clk/meson/a1-pll.c                         |   59 +-
 drivers/clk/meson/a1-pll.h                         |   19 -
 drivers/clk/meson/axg-aoclk.c                      |   46 +-
 drivers/clk/meson/axg-aoclk.h                      |   18 -
 drivers/clk/meson/axg-audio.c                      |  858 +++++------
 drivers/clk/meson/axg-audio.h                      |   75 -
 drivers/clk/meson/axg.c                            |  283 ++--
 drivers/clk/meson/axg.h                            |   63 -
 drivers/clk/meson/g12a-aoclk.c                     |   70 +-
 drivers/clk/meson/g12a-aoclk.h                     |   32 -
 drivers/clk/meson/g12a.c                           | 1483 ++++++++++----------
 drivers/clk/meson/g12a.h                           |  145 --
 drivers/clk/meson/gxbb-aoclk.c                     |   12 +-
 drivers/clk/meson/gxbb-aoclk.h                     |   15 -
 drivers/clk/meson/gxbb.c                           |  844 ++++++-----
 drivers/clk/meson/gxbb.h                           |   81 --
 drivers/clk/meson/meson-aoclk.c                    |   22 +-
 drivers/clk/meson/meson-aoclk.h                    |    3 +-
 drivers/clk/meson/meson-eeclk.c                    |   22 +-
 drivers/clk/meson/meson-eeclk.h                    |    3 +-
 drivers/clk/meson/meson8b.c                        | 1335 +++++++++---------
 drivers/clk/meson/meson8b.h                        |  117 --
 .../clock/amlogic,a1-peripherals-clkc.h            |   53 +
 include/dt-bindings/clock/amlogic,a1-pll-clkc.h    |    5 +
 include/dt-bindings/clock/axg-audio-clkc.h         |   65 +
 include/dt-bindings/clock/axg-clkc.h               |   48 +
 include/dt-bindings/clock/g12a-aoclkc.h            |    7 +
 include/dt-bindings/clock/g12a-clkc.h              |  130 ++
 include/dt-bindings/clock/gxbb-clkc.h              |   65 +
 include/dt-bindings/clock/meson8b-clkc.h           |   97 ++
 32 files changed, 3205 insertions(+), 3282 deletions(-)
---
base-commit: 84af914404dbc01f388c440cac72428784b8a161
change-id: 20230607-topic-amlogic-upstream-clkid-public-migration-fc1c67c44858

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

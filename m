Return-Path: <SRS0=wynk=ZJ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682C2C432C0
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:08:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B05D2084C
	for <linux-amlogic@archiver.kernel.org>; Sun, 17 Nov 2019 14:08:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFIAOPZx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="mBKRzVbA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B05D2084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=asiWX1l2R2/NIET4nQkfVA0KOrVc0E7k6AGqCiNpilY=; b=IFIAOPZxqK5mT+
	PhWMJ+Zn84w0wT7Gk0NLkkHf3B23a85CfLWmS4XCkr+UUqyoNlS5q4jve7thvffN1Q+p3tyeJwOyS
	RyrPpkxl3BXK42i1ErB9pE+Lw+AXhCOSmHayhAgvsBsFUv4Nii3Ul5lhYM0vQNo4KuUuoz44P7oNZ
	HMTx2OnT2qv8uoazDo6L9SaHqq7OuHts8m+Oh74pP0Qt0OFD+PDQwezftZH80xz4HSOeSK75UHxE/
	iuX5nD2fnLbLd54JypgYsWW0P+Vpd0UBy1r5EMYahgnSxjTc2oyQ0Rzr6TGM2xy+OJ6bzYeTB3k1h
	Lt2KJ0GCd3MwuzNFiKCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWLDW-0005TK-CB; Sun, 17 Nov 2019 14:07:54 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWLDJ-0005Dk-Sf; Sun, 17 Nov 2019 14:07:43 +0000
Received: by mail-wm1-x342.google.com with SMTP id 8so15882910wmo.0;
 Sun, 17 Nov 2019 06:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sfzf92CL96vr/sJWUdQn1rqPMmFFI9Y4IH1A/bb5Cto=;
 b=mBKRzVbA3Tv3a6pbW64Ow5gGE3LSx9JeXieKON1RqjRi5XeYL3JzMm84p89fUR+Se8
 m7C2+rmyLe6BY1KQvdWo+3EQWTgK5mQxO/bKZw7UeQA4u8xpXfDJBL6s48aaprOjTeFF
 Jhym38GFkOeNU3AiqC3aC6jDA2EQ2t73XTnzfphrM8hSUD5rJfVKKXAwIlhmZUWd78iO
 IdTieocxOxxi6dz6Vp5wJGZmrZOtBVjFyvdDfAn/c1vsGleLwHYFayRUDpnufEX1lQaL
 SamknSR/Nw7KdgUSV0EZZYrAldz2L1Em/Uh+HMKaffnR0RwWTppmT+ly+pnKy5IOKsUR
 5ojA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sfzf92CL96vr/sJWUdQn1rqPMmFFI9Y4IH1A/bb5Cto=;
 b=l8pQCGBeEF5J5R3WPJEaEny1qGSuhpVP/GC6tph+9DftpO4u8TXgN96JzDASxU6ZLL
 bpUUSY2ydmEiDvQPBLBr3UBN8BHCfhNV8G9+fbwCLOjzHXHULgH83DzNyVmjkuiPZrDH
 pMR1PnU/EXYsgYhHTqxZNJcPelP1f/fglJDGFeqRxPnyJSVzdeoQG4EAn/2oEiz4zB/R
 F6XnCedwzEG9HFvTcghspHcjGdt7682faW47N6BWM6RokA2NdfeLSgiExIOLRSfmlFFz
 NbqL9p+if8T4H2+vc6FRSZgCYWaO/xWgBMfyXBUo0VuzGVZmJ0ahJqgqjwbXXaXHXRtN
 21VA==
X-Gm-Message-State: APjAAAXbyX/hdnPwP0yQIX0g5gpaJzS+YFkViyfBCJKQm7gN4jZN11ID
 amv9xePAhGptGVQwPscdfmE=
X-Google-Smtp-Source: APXvYqwAK3MUz6opV/wXXyZ7DKoixlQvwdlMtfwitUFt5Oh7JGsEVPfq9X/zMatAONAuA3HEjgmlUA==
X-Received: by 2002:a1c:7708:: with SMTP id t8mr24189852wmi.29.1573999660252; 
 Sun, 17 Nov 2019 06:07:40 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371CB100428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371c:b100:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id n23sm16632977wmc.18.2019.11.17.06.07.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Nov 2019 06:07:39 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: narmstrong@baylibre.com, jbrunet@baylibre.com,
 linux-amlogic@lists.infradead.org
Subject: [PATCH v3 0/2] add the DDR clock controller on Meson8 and Meson8b
Date: Sun, 17 Nov 2019 15:07:29 +0100
Message-Id: <20191117140731.137378-1-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191117_060741_955245_68239402 
X-CRM114-Status: GOOD (  13.05  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Meson8 and Meson8b SoCs embed a DDR clock controller in their MMCBUS
registers. This series:
- adds support for this DDR clock controller (patches 0 and 1)
- wires up the DDR PLL as input for two audio clocks (patches 2 and 3)
- adds the DDR clock controller to meson8.dtsi and meson8b.dtsi

Special thanks go out to Alexandre Mergnat for switching the Amlogic
clock drivers over to parent_hws and parent_data. That made this series
a lot easier for me!

This series depends on v3 my other series from [0]:
"provide the XTAL clock via OF on Meson8/8b/8m2"


Changes since v2 at [2]:
- add #include <linux/clk-provider.h> as suggested by Stephen Boyd
- drop unused includes
- use devm_platform_ioremap_resource instead of open-coding it as
  suggested by Stephen Boyd
- drop trailing comma after sentinel element as suggested by Stephen
  Boyd
- dropped patch #3 "clk: meson: meson8b: use of_clk_hw_register to
  register the clocks" because it's now moved to my other series at
  [0]
- dropped dts changes so this series exclusively targets clk-meson

Changes since v1 at [1]:
- fixed the license of the .yaml binding and added Rob's Reviewed-by
- drop unused syscon.h include (spotted by Jerome - thanks)
- drop fast_io from regmap_config and add max_register as suggested
  by Jerome
- dropped original patch #4 "clk: meson: meson8b: add the ddr_pll
  input for the audio clocks" because I could not test that yet (that
  patch was a forward-port from Amlogic's 3.10 BSP kernel)


[0] https://patchwork.kernel.org/cover/11248377/
[1] https://patchwork.kernel.org/cover/11155553/
[2] https://patchwork.kernel.org/cover/11214227/


Martin Blumenstingl (2):
  dt-bindings: clock: add the Amlogic Meson8 DDR clock controller
    binding
  clk: meson: add a driver for the Meson8/8b/8m2 DDR clock controller

 .../clock/amlogic,meson8-ddr-clkc.yaml        |  50 ++++++
 drivers/clk/meson/Makefile                    |   2 +-
 drivers/clk/meson/meson8-ddr.c                | 149 ++++++++++++++++++
 include/dt-bindings/clock/meson8-ddr-clkc.h   |   4 +
 4 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/amlogic,meson8-ddr-clkc.yaml
 create mode 100644 drivers/clk/meson/meson8-ddr.c
 create mode 100644 include/dt-bindings/clock/meson8-ddr-clkc.h

-- 
2.24.0


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2607C61D97
	for <linux-amlogic@archiver.kernel.org>; Fri, 24 Nov 2023 17:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYRuthIqjmdpr8+hQ2X5S9gr1rzwyFMw+oAC0HZT4a0=; b=TQKLdOfUEX/cbo
	VZQS7T0P2Zh7+rPIEHd/zDlHTGisSbtgGvLK6Vgp4UffICnFZOLEJfoBLcpLm3AbKGt1So7qcsRCD
	vAQ3qa0zAyyKqgt54pgOdGLJmgqRwpoPM9i5o/ialVoDg2fqvlSRryeXxfjRy42sllp9E4fqWrNUZ
	hXYLjQxUPiU88frxwDAEvBY6e/OtPrSbHnGVmIbGIQtpVMNC3FX3NmcRBqB7B85EOVkMhep/4c8PE
	D2fJTdtJCfNfGVlWqDx7aNMWydUlhTjxUFWCGEI3SG2nGTaNZXrQk9Fp42twNvT7M2HMgZ1S370AC
	glt7HqBLZlAvBV21H2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6Zqa-007mwK-0v;
	Fri, 24 Nov 2023 17:20:08 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ZqW-007muw-0g
	for linux-amlogic@lists.infradead.org;
	Fri, 24 Nov 2023 17:20:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4079ed65471so15834895e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 24 Nov 2023 09:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1700846399; x=1701451199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2d1leqtXuRjh3vDQD1vENVeJ67TD/CQIGzFzr3jZ/Rw=;
        b=q454pKY9g8baYIy/83YGJC6j8OhZLfeiDqfzno2c5KyRofJbE/7QmefLgGuhpoE51r
         gCF/fNbfYsRdij5wVLsRZULpTUJk4mInW/S/bA/JsNsN6xSUbULJU9/eHsmWDpjcMhFe
         fbc4aCYVMhcgLO70LRuaJYEeal4VOqww/hvcSs6nn8YzRRxlhs2twwNns8WznEcc101v
         NmTrCPm/dfywmFGQLG1VNlUqSf2YFNH+BuUvk1BO1Tc0K/+ew/4R4iR5Xo/EdQLSeT7C
         v8lM9VeP3/Vd4u6VanyNlsnUwmDcRElox3JLGP8bRJueD6UrZQBs+ntMrydFXUQy/M2L
         +TKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700846399; x=1701451199;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2d1leqtXuRjh3vDQD1vENVeJ67TD/CQIGzFzr3jZ/Rw=;
        b=ANTqpCP24hUbGK3Xa8/VcEYLajkH1O4/brmf/J5TGRrxxW7vQxhwo7FqceCHzloipf
         fXggGJbJeXejJbAVkAlABt4fdBo+ypuxVZmFtqpcx3UGe08+hTs1Sch/wNe6vYGS3D9R
         TrcTXF1nSR/lGrGsfmnnXQScdyAEUJqg/NjDGbRPBDqxf0SiDqEs6qvsW+OCcwb8MsDm
         FSl/vPLVeLE3WbViPJ7qJkjjD3/OmqDY67oo87HqrnhgyDLtZDL+cRmo0Q+tCtCdMAMF
         IwS+w8hLmRBHHE5Y1rdtVdeDccxUyP39iGbCgI3XzAM0fm2EBBi+MtDdAINMsMuxlgr5
         O1+Q==
X-Gm-Message-State: AOJu0Yy22Iqw5Zh1Msrrjjusxf/RsVRmiQhdg4G0jrFYxWzj9s9SCGRW
	aQZp5OFrP86PzkzbN+nXtz/wig==
X-Google-Smtp-Source: AGHT+IGof/O1OGnHaLOZnn6ikBllpdYsJKE4lZGWZe1M6TLjaYOYsj7vsLD/q57/Kn0PjoMIKgomtQ==
X-Received: by 2002:a05:600c:450b:b0:408:3f61:cb4f with SMTP id t11-20020a05600c450b00b004083f61cb4fmr2927268wmo.23.1700846399037;
        Fri, 24 Nov 2023 09:19:59 -0800 (PST)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:1243:6910:fe68:2de5])
        by smtp.googlemail.com with ESMTPSA id o18-20020adf8b92000000b00332e8dd713fsm2547663wra.74.2023.11.24.09.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 09:19:58 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Daniel Scally <dan.scally@ideasonboard.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
References: <20231114-topic-amlogic-upstream-isp-clocks-v1-0-223958791501@linaro.org>
Subject: Re: [PATCH 0/3] clk: meson: add MIPI ISP & CSI PHY clocks
Message-Id: <170084639792.2638113.9821910765744986123.b4-ty@baylibre.com>
Date: Fri, 24 Nov 2023 18:19:57 +0100
MIME-Version: 1.0
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_092004_452293_D8A0E88E 
X-CRM114-Status: UNSURE (   4.19  )
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

Applied to clk-meson (v6.8/drivers), thanks!

[1/3] dt-bindings: clock: g12a-clkc: add MIPI ISP & CSI PHY clock ids
      https://github.com/BayLibre/clk-meson/commit/439d3404addf
[2/3] clk: meson: g12a: add MIPI ISP clocks
      https://github.com/BayLibre/clk-meson/commit/773e4e987308
[3/3] clk: meson: g12a: add CSI & ISP gates clocks
      https://github.com/BayLibre/clk-meson/commit/5205628ab0bf

Best regards,
--
Jerome


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9968EF8FE5
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQvG5/fuc9cvv7qruwndJVNUVzGm9xwGT1cc8btevEU=; b=d2drEO6sD3+FP5
	DLD+CK4qekSqHltGuk5bVzd1lq3h0ViHGzvPzY+/H6tizxis2gOVV+KTjH/6eNV3dIEXPt9ekydjI
	7b3Xhued9751ikjVN3ELNnbUndHEZNUJ4yqVgWfPg8SAtkAWbrc5M8tvNi5v/3VS+cNkSG/jbxJ5W
	3xSM1DLsLm6tU8CYfSDM5jsxNWXORnvJyVWYtx98HTgPqU7jP+C3CymawRa+QXZ4u8Uw5VpaZNAUv
	+jNJkuWp2ofeV2YwiKcSANA7lbYjeB0c5K7244HLUDvh4XSOk/dwa/pz75M5uQyyt9u09XvuKaiFv
	6Y6qnDnBdSJCQS2yT9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn12-0000000HMdY-1Jhd;
	Wed, 04 Mar 2026 14:15:56 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn0z-0000000HMcX-46pf
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:15:55 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-c70e96737a5so2198904a12.2
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:15:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633753; x=1773238553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=cEdoUsu8lZZW9vUfHfLc54F2V+FXDqYUp7g6OomfEOdIit+Qz/0AMNqsgDlusHHUQk
         XqfERp9AAEwzZS9YQSeWxazFJT5q9A6HALtC9Xvv0CUC3BAlSQqIu9kLOlHTaLbMBcae
         Qr/tl8dH2Pq0hkRdQi9N5/qRj6bdjELNDwP9iHD+Cjqt4G09Ry95mZ0BvjX4voQAz1tU
         x1oJTO227eFjiGyCjUuzLO9eIIlffQXuxKcfFxUY0l58oW/zyOEwOHnUBD5tgFHYfEYs
         sktQ+hM74UoEUUg+dKmn7tdJ9X761OBfYA3ov2XLz/KSanCyANX+8P/vyhgkV11E0Q0Z
         jWEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633753; x=1773238553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/CrWSKJRkZKN008VlCo4uVGQadvKlijsjSi8/hdflIY=;
        b=vVzWbSfKpHdmKfCQGgrrk5t93c6GzU3oK7pUn3ULUKa39lrwD74wAp45GI/VrAga1I
         UHu/KKdgAHYcv7SHBNYHSflilXG8/YKkVkztuhFP+KC1BK2Mu4Z9nQXLITd4d1PAoBBu
         euBLbRsYvSaVzOa855EiCQXXO8X89ubG9ITBarX0FuR4VsrU/6BF+XS/M6feKk9oAF4l
         5jzWL9Ojapo/p7K81kBcwtJ7aA7eJsAooT0qfpB8w1F1UiIUspNc6hEJkq4KTmXvuUZQ
         dIiA07CYZFNMHNJK5vtNSlk2hb+ReCNEBWMdp1jPiaJlFXcO0d8JVSK6cQgBTFR+vuJ0
         wvBg==
X-Forwarded-Encrypted: i=1; AJvYcCU5O9Zh+F4e6FlPy/OBP2SMpEoev9p87+HEKonrEXbnyrMYyXadnFxv3nqjFohPAUd363nMIKvjz7CBZhsu@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs8Iu+c1n4oWR/PK9lpPgiSLEZyEhShBrv++uLQZnhR0Ir77FB
	s1vhoI/USvJ3s4FZ8Cq3cinuPPVO8AIC6dXZteRdG9D8LeyW5Kn+hxxV
X-Gm-Gg: ATEYQzxkN4ip6aM0Gl1GPJzYWZqzwtTjNxx5lPNTZpDDAIlzyaaB7aJ48N669POZ0E7
	YlAKQczjwv2J5WoBoNqfwpbGVNOLtCh9njvAD0eD0MEUpVO40O296sAevI+B+og61SRDn9P/jid
	k4niufab8/qk2BbEEQf1bfwp5FTESQ5495k2brCBJsjvRiuZyU0ZjVbSHIbEoHvuL9pyUOKkeiO
	Ep2TzKkz/Y31jmcPRz3AthEWzqeoVBAU18qidl9BHnd9BncXtx6ZSzvp/wMDE1coVv2pBoH3IsH
	dxASNWKhmVGiNQ3SHxAvp/kogIAz/iVDLagRjiMUeIrUmNZv33m41jClwuc/fc14IAeNvFUNWlm
	D7OW0ecnkA4uAASkmlCO7rYkF8rhBZwV56uT9PGnXnhNyrXPkqp6ry9R2bvUMYZW6Ib0bRS2d8F
	4tRsS85He1ucWzAvZ+XHWk
X-Received: by 2002:a17:90b:3506:b0:354:a57c:65dd with SMTP id 98e67ed59e1d1-359a6a66b87mr2001714a91.24.1772633753114;
        Wed, 04 Mar 2026 06:15:53 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:52 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
	Koichiro Den <den@valinux.co.jp>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 15/18] PCI: sophgo: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:58 +0530
Message-ID: <20260304140329.7089-16-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061554_021381_60C087BA 
X-CRM114-Status: GOOD (  11.38  )
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

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pcie-sophgo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-sophgo.c b/drivers/pci/controller/dwc/pcie-sophgo.c
index 044088898819..0393f4b613de 100644
--- a/drivers/pci/controller/dwc/pcie-sophgo.c
+++ b/drivers/pci/controller/dwc/pcie-sophgo.c
@@ -269,6 +269,7 @@ static struct platform_driver sophgo_pcie_driver = {
 		.name = "sophgo-pcie",
 		.of_match_table = sophgo_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.probe = sophgo_pcie_probe,
 };
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

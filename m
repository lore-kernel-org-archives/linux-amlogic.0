Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2ECEF8FEA
	for <linux-amlogic@archiver.kernel.org>; Wed,  4 Mar 2026 14:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AWFDuyjVNT9v6PjPW9WyoHHPmcIuLslLut749Iu78WU=; b=nIo/1EPxhBe3vu
	2eJQmnEbixxqycfiDbng+GbTP8bHnMhTlVfe0GDPYAblTQCXV7iBQYngQCuMGoIbz2Ferb2jt4CQb
	XvZsJBklqj9Sqq/Z2QMtK8PpoCY2FfghEHLkumTkDYaQ3+tMk5ufckyw0ageAmNKvxNiS/CRupkBH
	MM5LjNBRl1JAC2ZS+PZyQK8/PN9SJF18tTsbckkOzKc/R2vrRAlazNcN3dvlKQisGBEypldwXRyhg
	gBCy65lBsImvuMLoMyGJji4GtWTb9SqBuN5Ac88VvQ9xPMre78Lf4GMBDoIka3AeUlAWjEj/2PzwX
	16AnPkwSsMrJ9piVyGDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn3Q-0000000HNb9-1DJ5;
	Wed, 04 Mar 2026 14:18:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn3O-0000000HNa0-2xZ7
	for linux-amlogic@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:18:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=gOqiu9rk3pfbNQbzbq46fMvxLJFiDFeJ6tCyKh6dPNk=; b=mMkMi4Dm5UpEaj899jZC2H+dkb
	toyEVgRMC6czQ8kRhr2JwzWrZEUsYMdfvRpa2u/U8JqMXD55zl4v7CSXBp7wxV8uCx0PAYIOrWpTS
	Rr5Eo6evroxHyuD2IUQXDyX5mnDojdPKKLYuDIf+YysrnFkWo35aZcj9yvUqrKyBkGYCCsHtUHrHg
	MmDgCWnJ+MrbKXvF6mV20formfXvA71Ues2Mr+gMrDpFFCD5DTHXprSuFXeqQzOVEthD6u4jjmA9y
	WPeo5XnBlbmuFSg4R5lx0BoW6MRqHGJIUKgC5rR7lJ3ozEHbzfrvTOb6eEaCuaaX2RRkCQRLDZfOP
	OFHgIWGQ==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn3L-00000004jze-1Bgf
	for linux-amlogic@lists.infradead.org;
	Wed, 04 Mar 2026 14:18:21 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-358ed696623so2834994a91.0
        for <linux-amlogic@lists.infradead.org>; Wed, 04 Mar 2026 06:18:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633897; x=1773238697; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gOqiu9rk3pfbNQbzbq46fMvxLJFiDFeJ6tCyKh6dPNk=;
        b=ZVr6DtLkDCpAMiQyP4K362IQNU5FBynlYLcGYpnPOqIgEbmhlHhs1PNPtUd7lQ4HyJ
         QhutxR39Z844Wub6Xbsl6ynMG0Lccop/GQWQKCIDVtzwKVZSGYVWgMWy1VfJCwnc3MET
         8Asva6aw1HwEKuzZxXj05F5Bbx3h1lZxoIrbRq+pm8uPHHqnxIWszIuvWLMxvimCFATF
         B/JZM8QgtwJKJzzP9KtyDH3GpHJ0j6G5t10UatQp8hNRTKOrPf79J9fo4l55i9q17lLh
         qQttu6Xgsy563Cyl9GTNC7bqvD11crLwlXYTGs8B4X04PtHu8V+03tlhWauZO1tfojy3
         lS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633897; x=1773238697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gOqiu9rk3pfbNQbzbq46fMvxLJFiDFeJ6tCyKh6dPNk=;
        b=uHmzTwd4JKvjQaxhXcxZLE87YpylE9C0qGnYryiOKAt9E+/jPhcLKnLxALXUUfiqYt
         9u8EHmx2q+sujCgosqSpbBkrKve2krx0vhcBiYRGgg4cjsoh86L0/da27D5TaNWbIYKF
         wQUDOcoK8oLA6ahQBKOawcrgaxKQWR9zzspgO4yiRacQnrU+BtdoqQ6Z3fDQpPoy4MXK
         9M5U8WdYLNQtSA+7OX7exIKHp2Kha6++ICxGR7/tNVQt2VVNdx4uLU4u9IOiC9AtL9K/
         mHblM4I94/wsSyUjgZVra76Muxt0eaXvfYngHMOUTkubfCpr1s9mEZrgh/0upmwHeF0Z
         VTUA==
X-Forwarded-Encrypted: i=1; AJvYcCWEhw0oAxZMkIEkWt7elsscItb7PccXExhTDiyr4jMbl562z5Elb288dlAgfPsBL3ZjQ/zYo4GcnTVCPY4w@lists.infradead.org
X-Gm-Message-State: AOJu0YwKJ3otxEwuB2KY22KIXiLRJzfBPAo1Dv6yF5MkU/9copyyh+Wp
	GRkF7kdxHUigSLydJEEtRfv0f37IyOlTbfcwAgx9hXNbr1y/qQPPqA+q
X-Gm-Gg: ATEYQzzLiF/sbHgiNO7O5ylSf/5fNIvE2kpWvRApFhvrJUsUuoN5z9USqHUkGgrtxPM
	Fcnfdfqe20+7lgTa9ct2J/1cvhMi+R7fSvFb39WogDTYD1Bf8Ku4QnUHV/SOheZJerkA9Ow7QLY
	fXUhw+YhQ13hXjUtzQ+cmGSAn7CEzL+OskAVuOkfJqWCiotfs/W165y5xkOXDcxJ8g2X+SbgK/h
	te5OendY9sfZ6L+H0t6BALV0et0nDpKjPhTFaKBKttdyKmFRqejF6IEWMrOd5zQm95nh03hGbTG
	DIocAlSzQtd/eurgwWXNZybX/4o6EHtI9F9PjSccehcn1NigjMaD+7RYwDtrkFgVyIeJ1f4UhFV
	Nojn9pBj0oe/GfQG0Yc9hUL0VUPj+o5s7iI97Fc55vJzPAW4wsTG59VXPnf+/mXpKKDI7sV8B1B
	vfS7qWR/uHL2V/8huqpQtWWBqNahJIATw=
X-Received: by 2002:a17:90b:4a87:b0:352:bdcd:118a with SMTP id 98e67ed59e1d1-359a6a21675mr2061241a91.21.1772633897136;
        Wed, 04 Mar 2026 06:18:17 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:18:16 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RFC v1 18/18] PCI: visconti: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:22:01 +0530
Message-ID: <20260304140329.7089-19-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141819_472467_AF56E88F 
X-CRM114-Status: GOOD (  10.80  )
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
 drivers/pci/controller/dwc/pcie-visconti.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-visconti.c b/drivers/pci/controller/dwc/pcie-visconti.c
index cdeac6177143..f21cc95fe89f 100644
--- a/drivers/pci/controller/dwc/pcie-visconti.c
+++ b/drivers/pci/controller/dwc/pcie-visconti.c
@@ -324,6 +324,7 @@ static struct platform_driver visconti_pcie_driver = {
 		.name = "visconti-pcie",
 		.of_match_table = visconti_pcie_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(visconti_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

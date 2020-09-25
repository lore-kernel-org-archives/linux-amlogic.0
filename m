Return-Path: <SRS0=7OpP=DC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A68BC4363D
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 08:54:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16ABA20936
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Sep 2020 08:54:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EFWkDvw/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="fEA++s28"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16ABA20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nvidia.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wMTGgU/WkojrB8PRfhq0ZNEnMK01ueCvtZ7gbHMTJ9Y=; b=EFWkDvw/ivnouKM7qMBNiYwQ2
	UFS2YHmtc91U3w38UQfxEV9xZOK4ZPSGHX6r1CUGoKSkN9LdZvgW3mn5Qs3PUWgPaKaS3sEFTWv/s
	gENe17xI3AXlZtN0Y2ASFXWeXRfhb5P4f6rsWE0UkN2ie+i81qnB7CH8yiEcl+VjoVtAKScsuLI2g
	Pk8OLk0GG+KsK+1vT43eiJD0mrg+dx1wfr2pG5VJY6FhhgGLfdbVqZWaXxs0qeWhYKj6XfR/aVbHN
	eNl7sATfGz1Ehj5E42Bgo/g5eIj7goLIKZ4jeoFqSGUzZXUj1ZD2MH3GrYynL7k4MT5Sb6fIv5fvm
	hBDr8HukQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLjUd-00076Q-Dp; Fri, 25 Sep 2020 08:54:15 +0000
Received: from hqnvemgate24.nvidia.com ([216.228.121.143])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLjUW-00075b-GT; Fri, 25 Sep 2020 08:54:11 +0000
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f6dafcb0001>; Fri, 25 Sep 2020 01:52:27 -0700
Received: from [10.26.74.254] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 25 Sep
 2020 08:53:48 +0000
Subject: Re: [PATCH v2 0/5] PCI: dwc: improve msi handling
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>, Kishon Vijay Abraham I
 <kishon@ti.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han
 <jingoohan1@gmail.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach
 <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, "Yue
 Wang" <yue.wang@Amlogic.com>, Kevin Hilman <khilman@baylibre.com>, "Neil
 Armstrong" <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jesper Nilsson
 <jesper.nilsson@axis.com>, Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang
 <wangbinghui@hisilicon.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pratyush Anand <pratyush.anand@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Masahiro Yamada
 <yamada.masahiro@socionext.com>
References: <20200924190421.549cb8fc@xhacker.debian>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <de4d9294-4f6d-c7d1-efc7-c8ef6570bd64@nvidia.com>
Date: Fri, 25 Sep 2020 09:53:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924190421.549cb8fc@xhacker.debian>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601023947; bh=fWA/VvBZqbohPm2n/wszG6Dx2YqT5L4FZiRaNfHoaCY=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=fEA++s28b/AQ7mzCLkLzYFRlJF2BG2COMVrHmZ9Cjc9p5TbBFqA5BOrVtJltGemIH
 oSNwCyvZoGvaq8JWbamivR4JiDHJ/fbHitkOBJUyOKk7fhFokWkA1SANddNTwBcXbB
 rJtZyjOJgzSgh4jh1o7XcmqvLXAzSBHYcicmtJ9h9TR22K1MmS7jVQdifrj4pS6LSh
 CZ5NHyDgIi28TtEhytLl0KvjvjNJQH8L1ZdjBKU9CMVcbwGoJxuinK8SOz6YpIuAxo
 hXWH5k1Il3WIy1HCnjUYcvviC2GDIwIFEgHTYvXo7Sko+a01zKS96FQk+ozLWpbU2o
 blYdOUWHAkYjw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_045408_627268_BA5E098A 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: linux-samsung-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com,
 Vidya Sagar <vidyas@nvidia.com>, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org


On 24/09/2020 12:05, Jisheng Zhang wrote:
> Improve the msi code:
> 1. Add proper error handling.
> 2. Move dw_pcie_msi_init() from each users to designware host to solve
> msi page leakage in resume path.

Apologies if this is slightly off topic, but I have been meaning to ask
about MSIs and PCI. On Tegra194 which uses the DWC PCI driver, whenever we
hotplug CPUs we see the following warnings ...

 [      79.068351] WARNING KERN IRQ70: set affinity failed(-22).
 [      79.068362] WARNING KERN IRQ71: set affinity failed(-22).

These interrupts are the MSIs ...

70:          0          0          0          0          0          0          0          0   PCI-MSI 134217728 Edge      PCIe PME, aerdrv
71:          0          0          0          0          0          0          0          0   PCI-MSI 134742016 Edge      ahci[0001:01:00.0]

This caused because ...

 static int dw_pci_msi_set_affinity(struct irq_data *d,
                                    const struct cpumask *mask, bool force)
 {
         return -EINVAL;
 }

Now the above is not unique to the DWC PCI host driver, it appears that
most PCIe drivers also do the same. However, I am curious if there is
any way to avoid the above warnings given that setting the affinity does
not appear to be supported in anyway AFAICT.

Cheers
Jon 

-- 
nvpublic

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

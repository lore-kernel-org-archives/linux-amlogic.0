Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF23C04FFE
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 May 2024 11:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=toa5rBG3zdtRtc7FkPzcelDwMxVFtJ6RlTgSC0L98z0=; b=WyP5pCfPM280fl
	uBepBB+O/yIhZplAI13jQafPx05TloD8S4svbAwt0Z6xwLbkwnW6L+nusCkJd658OnwNMlbfuXfxW
	mtgyfijMxMf9QD8iMgg4Ic8egihvD9l6kWibWR/t4H4Ru741HUUh9u0FolxiWXYjhhDYuszmGfqQq
	jJEgzLjel88WnyhGVpalFFmUNh0RX9bxv45hEuweAGgUoWvwkjJk6tSe9YRgVmzWOIvusvyqHyyGf
	E+ibsWkw7cFOPFK2rqhPyZJ8dmibMalYZs0VS2I485O+HKTjeoWXveq7R5F2JTZp1+hdXntkIBkNf
	sQ+HebrBiypJU/DLObsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9119-0000000EGCr-35fz;
	Mon, 20 May 2024 11:17:23 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9116-0000000EGCH-0MeN;
	Mon, 20 May 2024 11:17:21 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44KBGaTh127346;
	Mon, 20 May 2024 06:16:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716203796;
	bh=DtbotRrxlfh+3BepWZTeI8VdjCOrKh6fu9usGat9L9E=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=g3O5Mq+LDVkAiOTfu89f+qA4Hc5CXAw8hwO6CDpVZOWCWTiaPXueaSCSB4aV5yfpo
	 7kuGcJqh/HJywyzhyxgs+Jn/UDIqkdj825k8R7YYhVLHbxsqxQUNfeptJZiZDPQQU8
	 /Iwl/AjrCGfhiuyQLi1IETRhlb3zpxdwUt3cYlao=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44KBGahd004860
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 20 May 2024 06:16:36 -0500
Received: from flwvowa02.ent.ti.com (10.64.41.53) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 20
 May 2024 06:16:36 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by flwvowa02.ent.ti.com
 (10.64.41.53) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Mon, 20 May
 2024 06:16:35 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 20 May 2024 06:16:35 -0500
Received: from localhost (uda0492258.dhcp.ti.com [172.24.227.9])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44KBGZ84034645;
	Mon, 20 May 2024 06:16:35 -0500
Date: Mon, 20 May 2024 16:46:34 +0530
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Onkarnath <onkarnath.1@samsung.com>
CC: Siddharth Vadapalli <s-vadapalli@ti.com>,
        "bhelgaas@google.com"
	<bhelgaas@google.com>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
        "kw@linux.com"
	<kw@linux.com>, "robh@kernel.org" <robh@kernel.org>,
        "yue.wang@Amlogic.com"
	<yue.wang@Amlogic.com>,
        "neil.armstrong@linaro.org"
	<neil.armstrong@linaro.org>,
        "khilman@baylibre.com" <khilman@baylibre.com>,
        "jbrunet@baylibre.com" <jbrunet@baylibre.com>,
        "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
        "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
        "shawn.guo@linaro.org" <shawn.guo@linaro.org>,
        "lchuanhua@maxlinear.com"
	<lchuanhua@maxlinear.com>,
        "srikanth.thokala@intel.com"
	<srikanth.thokala@intel.com>,
        "songxiaowei@hisilicon.com"
	<songxiaowei@hisilicon.com>,
        "wangbinghui@hisilicon.com"
	<wangbinghui@hisilicon.com>,
        "manivannan.sadhasivam@linaro.org"
	<manivannan.sadhasivam@linaro.org>,
        "thierry.reding@gmail.com"
	<thierry.reding@gmail.com>,
        "jonathanh@nvidia.com" <jonathanh@nvidia.com>,
        "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
        "mhiramat@kernel.org" <mhiramat@kernel.org>,
        "pali@kernel.org"
	<pali@kernel.org>,
        "toan@os.amperecomputing.com"
	<toan@os.amperecomputing.com>,
        "daire.mcnamara@microchip.com"
	<daire.mcnamara@microchip.com>,
        "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>,
        "marek.vasut+renesas@gmail.com"
	<marek.vasut+renesas@gmail.com>,
        "shawn.lin@rock-chips.com"
	<shawn.lin@rock-chips.com>,
        "heiko@sntech.de" <heiko@sntech.de>,
        "nirmal.patel@linux.intel.com" <nirmal.patel@linux.intel.com>,
        "jonathan.derrick@linux.dev" <jonathan.derrick@linux.dev>,
        "kishon@kernel.org" <kishon@kernel.org>,
        "jdmason@kudzu.us"
	<jdmason@kudzu.us>,
        "dave.jiang@intel.com" <dave.jiang@intel.com>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "lenb@kernel.org" <lenb@kernel.org>,
        "mahesh@linux.ibm.com" <mahesh@linux.ibm.com>,
        "oohall@gmail.com"
	<oohall@gmail.com>,
        "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "linux-amlogic@lists.infradead.org"
	<linux-amlogic@lists.infradead.org>,
        "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>,
        "linux-tegra@vger.kernel.org"
	<linux-tegra@vger.kernel.org>,
        Rohit Thapliyal <r.thapliyal@samsung.com>,
        Maninder Singh <maninder1.s@samsung.com>
Subject: Re: [PATCH 1/1] PCI : Refactoring error log prints for better
 readability
Message-ID: <e0e28988-9699-4e6c-abb0-30fa2727c2c3@ti.com>
References: <4ec3b167-9324-41d3-a086-74ca001b9042@ti.com>
 <20240517105923.2406246-1-onkarnath.1@samsung.com>
 <CGME20240517105941epcas5p3e8dbb97f19c9553bf9942ad146124806@epcms5p5>
 <20240520104358epcms5p50e00970ef70f66e87ceaaa893fc0ba67@epcms5p5>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520104358epcms5p50e00970ef70f66e87ceaaa893fc0ba67@epcms5p5>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_041720_290874_2F607642 
X-CRM114-Status: GOOD (  15.31  )
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

On Mon, May 20, 2024 at 04:13:58PM +0530, Onkarnath wrote:
> Hi,
> 
> 

[...]

> 
> >>Similar question as above regarding converting "failed, ret" to
> 
> >>"failed:". Is this a new convention that is expected to be followed,
> 
> >where all errors are supposed to have "failed: %pe", rather than custom
> 
> >statements? Please let me know if this has already been discussed
> 
> >elsewhere.
> 
> 
> Bjorn suggested to make all errors consistent.
> 
> and I thought printing error like below:
> 
> 
> "gpio request failed: -ENOMEM".
> 
> 
> Seems more suitable than
> 
> 
> "gpio request failed, ret (-ENOMEM)".
> 
> 
> If it needs to be changed in other format, please let me know, i will make all
> errors in that format.
> 
> and will share v2.

Thank you for clarifying. It appeared to me that the suggestion was
limited to the %d to %pe conversion. The existing implementation looks
good in that case.

Regards,
Siddharth.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

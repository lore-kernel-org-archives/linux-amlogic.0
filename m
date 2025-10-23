Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3E5DCCD1BC
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Oct 2025 16:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=/72BucN0CfdHWQXRjQx3MXZjuzPcxN3okgr5EZqOLtQ=; b=stjZ7o6I/LbUxL
	qrZ7pwZMRUKzoQPoPoBc+mtB/WdOe5Yz2LvuCVJpm1E/9MEIQsfXpuSrq1w1GJyhXbO805MqrICiK
	NTc4BQYzYJ7upf6tGU8P18cjeIkU61RF/kzi5v28lWyzJcjjjnwQ2Mh5omijJu0X5lrQ13xDA6Crn
	QdhUkilK04Y5IgDPi8/52XkOYe7UcmRz8VBovdSKoaCafxGtKkME2vsKFYplXAjYJ0UblC2bNzrBD
	aBNttCWKZ0rrCWRO7RJs7YVZ995K1W1nTkkWt8psIJcdObWPRfX2FrXDaiS38xYQtVP/PuvGGZzf+
	JcEafAODP5VNswk3N4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByO9-00000006vzA-29IW;
	Thu, 23 Oct 2025 16:42:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vByO7-00000006vyk-2uoI
	for linux-amlogic@lists.infradead.org;
	Thu, 23 Oct 2025 16:42:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E04C437AB;
	Thu, 23 Oct 2025 16:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65469C4CEE7;
	Thu, 23 Oct 2025 16:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761237726;
	bh=uJlSRfT8/bS/3xoosDFJ8lVEcav1dFXv/a8+4Z4p9yU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=E0c6/U5APlHZou8vlFPJ5i8G+pQK2bxrRcJDExNNhIVu/u7etT0Y2H9Z4rb3xftrM
	 0Vjf5301edc0190v3pxs7zi/L8/O3Sn/QweobA4o86du8XidbyWifaYtaLclEcMA8q
	 Q6MIZ7Oe9KfuN34xfcvQezpP/3PO50tmOAWqm3+pLRsoVp6RRptrBlf5fW03miAbND
	 wUW0sOn86j3UQ8DApmdq29SyZWg4lAn3BVrPOLhUyl5R2+8kI4UaNKUKNHwjtf92yS
	 l3XNdyeYuJWbZiKJhBTd03iiWeNZgz5CgyBUhhiGvWhHZf/QYYvdrw+YfP8s6vqArM
	 5VoidMT8evUdw==
Date: Thu, 23 Oct 2025 11:42:05 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Linnaea Lavia <linnaea-von-lavia@live.com>
Cc: "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	regressions@lists.linux.dev, Yue Wang <yue.wang@amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: PCIe probe failure on AmLogic A311D after 6.18-rc1
Message-ID: <20251023164205.GA1299816@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM4PR05MB102707B8CDF84D776C39F22F2C7F0A@DM4PR05MB10270.namprd05.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_094207_752364_E71C20F6 
X-CRM114-Status: UNSURE (   9.72  )
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

[+cc Meson folks, Krishna, author of c96992a24bec]

On Thu, Oct 23, 2025 at 11:33:07AM +0000, Linnaea Lavia wrote:
> I'm getting the following in dmesg after installing 6.18-rc1 on a VIM3 board.
> 
> [    5.391324] [     T50] dw-pcie fc000000.pcie: error -ENXIO: IRQ index 1 not found
> [    5.411265] [     T50] meson-pcie fc000000.pcie: host bridge /soc/pcie@fc000000 ranges:
> [    5.415323] [     T50] meson-pcie fc000000.pcie:       IO 0x00fc600000..0x00fc6fffff -> 0x0000000000
> [    5.422278] [     T50] meson-pcie fc000000.pcie:      MEM 0x00fc700000..0x00fdffffff -> 0x00fc700000
> [    5.442280] [     T50] meson-pcie fc000000.pcie: error -EBUSY: can't request region for resource [mem 0xfc000000-0xfc3fffff]
> [    5.449631] [     T50] meson-pcie fc000000.pcie: Add PCIe port failed, -16
> [    5.458779] [     T50] meson-pcie fc000000.pcie: probe with driver meson-pcie failed with error -16
> 
> I think the problem is related to c96992a24bec("PCI: dwc: Add
> support for ELBI resource mapping") and 2f2cea1ea70a("PCI:
> dwc/meson: Rework PCI config and DW port logic register accesses"),
> as they're both trying to map ELBI/DBI registers.

Thanks for the report!  Can you post complete dmesg logs for working
and broken boots, e.g., v6.17 and v6.18-rc1?

#regzbot ^introduced: v6.18-rc1

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

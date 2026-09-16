Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9538C982C9
	for <linux-amlogic@archiver.kernel.org>; Wed, 16 Sep 2026 16:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MkH2vV7jV+hjhdJ//RI7rgBnuFZo8PsrrnkJ58msy74=; b=mPqRX2k+rkpI+J
	WJFk4GbRxr6mMpZTqsxA4zwqnMgaMdaRqMwxbb1Rdegz+bzIvSJq3B4nVu7+gBV1Kd+x8gvji3hn/
	MnNPoo9cci1ipOXEFxi+smx4gGVGHRFBKMkEGaHyZcPh+fvLboJ3rHhbxbSDadegaaBJXR4Ym49RI
	nW1aqAfVkOLpzjtUKuUPa/r8cMU6AU2c7W9sEoNAsfHPPIHd5DUxS2Uos7xhSfL6nlOPjQVqVVqe5
	aFkJgawLa448GwxdXycoQIJFh6BELVoUFnsWJOhgclUtHDhS8GL5D99ZAoE/+sq6aaIEaW7F7JL7S
	3uyKGRYaY/SG3FnUHyoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s5Q-00000009gHL-2vIB;
	Wed, 16 Sep 2026 16:02:16 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6s5O-00000009gGa-0X8o
	for linux-amlogic@lists.infradead.org;
	Wed, 16 Sep 2026 16:02:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=oDMuup7k0NYHwbtaJC3oPVr62QOUwrPoiy1ADTfugyU=;
	b=J/9oBK6Wu/kZNtfpZOhyWg5U4d/5UuiySlf2pMK4+LE5K1kAEd9f5ySt7lorzD
	tKLGX8QjdqQYUY1obkJ0vLRSjmjVqHNHmMlQsHBUZxnZNMnCB/uiaJQD1IlNI8B6
	88vn+C2c75CrBDBKqDdBtcMqqQZduegWLvSHxVVPhr+nw=
Received: from [IPV6:240e:b8f:91b3:d000:a95a:12fc:887a:b0f1] (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXGiZ9vapqTugESA--.43532S2;
	Thu, 17 Sep 2026 00:02:05 +0800 (CST)
Message-ID: <c96534dd-9623-46e7-8385-220566938b8d@163.com>
Date: Thu, 17 Sep 2026 00:02:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] PCI: Configure Root Port MPS during host probing
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org,
 linux-pci@vger.kernel.org
References: <20260916153907.60344-1-18255117159@163.com>
 <20260916153907.60344-3-18255117159@163.com>
 <20260916155143.2E31B1F000FF@smtp.kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260916155143.2E31B1F000FF@smtp.kernel.org>
X-CM-TRANSID: PygvCgBXGiZ9vapqTugESA--.43532S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryDury7Zw48KFyfXrWkZwb_yoW5tF4xpa
	y5JasYyFs7GFyIya92v348Zr1rJF93Ca17G398Wryvv3ZxC347Kry2yws5G34xGrs7Wry2
	yan0v34xArn8ZFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRepBfUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:a95a:12fc:887a:b0f1]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6x3Td2qqvX08gQAA3v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_090214_521178_044A5ED1 
X-CRM114-Status: GOOD (  21.93  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Thanks for the review.



On 9/16/26 23:51, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] pci: dangerous dynamic MPS reduction under PCIE_BUS_DEFAULT
> --
> 
> commit 32945143b32b8b42f1dd3e1f419414a5bf8f9acf
> Author: Hans Zhang <18255117159@163.com>
> 
> PCI: Configure Root Port MPS during host probing
> 
> This commit updates the PCIe initialization logic to set a Root Port's Maximum
> Payload Size (MPS) to its maximum supported value during host controller
> probing. It does this as long as the MPS strategy is not PCIE_BUS_TUNE_OFF or
> PCIE_BUS_PEER2PEER, meaning it applies under the default PCIE_BUS_DEFAULT
> strategy.
> 
>> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
>> index 232bce2819f06..08af75aa7366b 100644
>> --- a/drivers/pci/probe.c
>> +++ b/drivers/pci/probe.c
>> @@ -2248,6 +2248,21 @@ static void pci_configure_mps(struct pci_dev *dev)
>>   		return;
>>   	}
>>   
>> +	/*
>> +	 * Unless MPS strategy is PCIE_BUS_TUNE_OFF (don't touch MPS at all) or
>> +	 * PCIE_BUS_PEER2PEER (use minimum MPS for peer-to-peer), set Root Ports'
>> +	 * MPS to their maximum supported value. Depending on the MPS strategy
>> +	 * and MPSS of downstream devices, a Root Port's MPS may be reduced
>> +	 * later during device enumeration.
>> +	 */
>> +	if (pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT &&
>> +	    pcie_bus_config != PCIE_BUS_TUNE_OFF &&
>> +	    pcie_bus_config != PCIE_BUS_PEER2PEER) {
>> +		rc = pcie_set_mps(dev, 128 << dev->pcie_mpss);
> 
> [Severity: High]
> Does this code introduce a regression where active downstream topologies are
> exposed to dangerous dynamic MPS reductions under the default PCIE_BUS_DEFAULT
> strategy?
> 
> By forcing the Root Port MPS to its maximum supported value here, it overrides
> safe firmware settings. If a device with a smaller MPSS is subsequently
> enumerated or hotplugged, pci_configure_mps() will detect that the downstream
> MPSS is smaller than the Root Port's MPS, triggering pcie_reduce_mps() on the
> entire hierarchy.
> 
> Because pcie_reduce_mps() modifies the Root Port first and sequentially walks
> downstream without quiescing active devices, this creates a dangerous window.
> 
> If an existing downstream device (such as an active NIC or early
> firmware-driven display controller) is actively performing DMA, could it
> transmit a payload exceeding the newly reduced MPS of the Root Port,
> potentially leading to Malformed TLP Fatal Errors and a system crash?


The scenario you describe requires pcie_reduce_mps() to modify the MPS
of a device that is already active.  As explained in the review of patch
1/3, pci_configure_mps() is only reached from pci_setup_device() during
enumeration, before the device is bound to its driver and before it can
generate TLPs.  The reduction is therefore performed while the hierarchy
is still quiescent.

The pre-existing behaviour from 9f0e89359775 already lowers the Root
Port's MPS when a downstream device has a smaller MPSS, so this series
does not introduce dynamic reduction of an active hierarchy.  Patch 1/3
additionally covers Switch ports and already-programmed siblings, which
the old code missed; that is what fixes the Switch case reported in v8.

> 
>> +		if (rc)
>> +			dev_warn(&dev->dev, "failed to set root port MPS\n");
>> +	}
>> +
>>   	if (!bridge || !pci_is_pcie(bridge))
>>   		return;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DD3C3ABD7
	for <linux-amlogic@archiver.kernel.org>; Tue, 13 May 2025 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Hny5udPeLZyE4WvjCXIqz2Mjh6cEhmZSlKj4Aq9qMk=; b=3aSOsd4aI6NIK9
	3QMhOexkmjWBC03GB1ZC5R+vc0eQxdnt22GhaZNoEIGkJuKczdbtpytPJbAeN5cqikf2IJvs3b5J9
	MfsYx2jl/mxPxvIfIQPpeHUAuK4bCnan3nOSqntbpPg/ccHReIWlnBOLQFRPlcSYbbJdzybuBMu4u
	CQ1APAxZfJpYh5kou2uO/U02yX9NbLtaj0XznJ/KdBMfo1jzb3rWYsbPNcHhWxMVwUUn4kEK3UKLU
	NDaAQRQ/GqsacRvJGUQeFaYcKWj7cYGBKcqRSPh6h8y7qUDtNbf2kBvV7oi80o1VwBc+QJI8Tdi8e
	WmIHtinp2R/9YVtnjRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr43-0000000CgXt-0Zdy;
	Tue, 13 May 2025 14:57:03 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEr1K-0000000Cg25-3RZR;
	Tue, 13 May 2025 14:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=nXQDzb+tFFVU+4SLdENHkW/1SY6XdLMilSABvcCoeBU=;
	b=M4t9yiWS6jQq9lz15VN6CVAutd+twdoSe9/gfmvn4tn9O3peNgeaTMQ/EcejzC
	KEFcIIZ6IYe7GW1kjoyKFkMSD8kwDZqSOPo4tO5tOF4QO+EsyfmPBlZD8DhhkCr9
	/4j2/u98y0120iF+3FSwZbK/zCM1HUC867PBfoJZz+UA8=
Received: from [192.168.71.93] (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDXt+XpXCNoldCmBA--.8342S2;
	Tue, 13 May 2025 22:53:30 +0800 (CST)
Message-ID: <ade4c14a-ff20-4001-8eda-75fef15df62c@163.com>
Date: Tue, 13 May 2025 22:53:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] PCI: Configure root port MPS during host probing
To: Niklas Cassel <cassel@kernel.org>
Cc: lpieralisi@kernel.org, kw@linux.com, bhelgaas@google.com,
 heiko@sntech.de, manivannan.sadhasivam@linaro.org, yue.wang@amlogic.com,
 pali@kernel.org, neil.armstrong@linaro.org, robh@kernel.org,
 jingoohan1@gmail.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250510155607.390687-1-18255117159@163.com>
 <20250510155607.390687-2-18255117159@163.com> <aCL9CStLrGEY2MEH@ryzen>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <aCL9CStLrGEY2MEH@ryzen>
X-CM-TRANSID: _____wDXt+XpXCNoldCmBA--.8342S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJF1rtrW7uFW3uw4rAFWkZwb_yoW8ur1Dpa
	y8Xw4vyFZ7WryfG3WDAa109rWjqas5CF43JrZ8JryqqFn8C3WqqrWYka1Fqas7Grnayw1j
	vw1jqry8uws0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UpKZXUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiOhxMo2gjWD+jDQAAsL
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_075415_276946_1EDE6C7E 
X-CRM114-Status: GOOD (  11.16  )
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



On 2025/5/13 16:04, Niklas Cassel wrote:
> On Sat, May 10, 2025 at 11:56:06PM +0800, Hans Zhang wrote:
>> Current PCIe initialization logic may leave root ports operating with
>> non-optimal Maximum Payload Size (MPS) settings. While downstream device
>> configuration is handled during bus enumeration, root port MPS values
>> inherited from firmware or hardware defaults might not utilize the full
>> capabilities supported by the controller hardware. This can result is
>> uboptimal data transfer efficiency across the PCIe hierarchy.
>>
>> During host controller probing phase, when PCIe bus tuning is enabled,
>> the implementation now configures root port MPS settings to their
>> hardware-supported maximum values. By iterating through bridge devices
>> under the root bus and identifying PCIe root ports, each port's MPS is
>> set to 128 << pcie_mpss to match the device's maximum supported payload
>> size. The Max Read Request Size (MRRS) is subsequently adjusted through
>> existing companion logic to maintain compatibility with PCIe
>> specifications.
>>
>> Explicit initialization at host probing stage ensures consistent PCIe
>> topology configuration before downstream devices perform their own MPS
>> negotiations. This proactive approach addresses platform-specific
>> requirements where controller drivers depend on properly initialized
>> root port settings, while maintaining backward compatibility through
>> PCIE_BUS_TUNE_OFF conditional checks. Hardware capabilities are fully
>> utilized without altering existing device negotiation behaviors.
>>
>> Suggested-by: Niklas Cassel <cassel@kernel.org>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
> 
> Looks good to me, but since this I'm the one who suggested this specific
> implementation, it would be good if someone else could review it as well.
> 
> Reviewed-by: Niklas Cassel <cassel@kernel.org>

Dear Niklas,

Thank you very much for your review and suggestions. Let's wait for 
others' opinions.

Best regards,
Hans


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

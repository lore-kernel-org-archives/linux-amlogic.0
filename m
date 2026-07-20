Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9C47C4452B
	for <linux-amlogic@archiver.kernel.org>; Mon, 20 Jul 2026 15:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dJkgduQFb66cWLD4a8o6CK3yIpNXhJ6LbktghYNUoQ8=; b=TQ0U2TpK/eoLB4
	IbDqDBf44mSfi1CQk/qhNzWbokjF5Ud0DwDaU/vpBmeLp4AQvBhpWefDQLRmhy9vzcamSyGWuOhQ5
	qhN2eUF/tbPFoeLZJ9XQ1cLcs+NEQFEpR94A/eoSvEEgQWuv5g3x88N26QsKUPlod36dnBNzQ1ZOV
	+PWwjT70GZs09NxlhIV1fMX0hXULzk9UWiBKYJW2+9k0vZNfk0hkzGOIXBdEx80ltSp8RdL7Cuvm4
	RFMQ2yq3IGo24OTvfnqf2KU1xeaGxJNQ9NeaGU56jttDy/fnCLI5NX97c+9UsaorEAFiu9pcg104S
	drupg5uCuz5nMJq3Iu1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpuK-00000007BqF-1w7Y;
	Mon, 20 Jul 2026 15:27:52 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpuH-00000007Bo1-3dCc
	for linux-amlogic@lists.infradead.org;
	Mon, 20 Jul 2026 15:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=qcO4Jx5AKS6Igcf3/JaMxYeNZarJWUVQHogxhHenLsQ=;
	b=oozf8t223x6rPeIKh3fmOHRTrFfQEJHXO5I1LTSkPyUvi/v8oNl9euSwX9hk7I
	7ChfbVtq4Tabfm7+2t+8vO2eg3/K57yr/35p3O6QNrVqgqRe5NgCzUppEu/soTNh
	tHyP1Aeb9EwpaW0sBzrazvG0R3Qsk5QBmpK21+/Za7DRU=
Received: from [IPV6:240e:b8f:91b3:d000:f138:f837:e143:4264] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD31y5hPl5qiykBKQ--.65457S2;
	Mon, 20 Jul 2026 23:27:30 +0800 (CST)
Message-ID: <7b76cdd1-1001-4d2d-a221-33988261faf9@163.com>
Date: Mon, 20 Jul 2026 23:27:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/16] PCI: dwc: Add pcie_cap field and helper in
 designware header
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, linux-pci@vger.kernel.org, imx@lists.linux.dev,
 neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
References: <20260720150619.24733-1-18255117159@163.com>
 <20260720150619.24733-2-18255117159@163.com>
 <20260720151732.7B9A41F00A3A@smtp.kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260720151732.7B9A41F00A3A@smtp.kernel.org>
X-CM-TRANSID: _____wD31y5hPl5qiykBKQ--.65457S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW5WF1UurW5ZFyUXFWfuFg_yoW8Kr1Upa
	9xJFyayF48JF43ZF97Aa15WF1akF9IyFy3G3y3G34fZFya9F17Ka1FyrWrKF17GrZ7Kr1Y
	kr4UtF9xCrn5JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U4BTOUUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:f138:f837:e143:4264]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7APZfWpePmPkIQAA3n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_082750_267965_B92153C7 
X-CRM114-Status: GOOD (  17.38  )
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



On 7/20/26 23:17, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Data race and logically flawed caching in dw_pcie_get_pcie_cap() due to unprotected read-modify-write and failure to cache 'not found' state.
> --
> 
> --- Patch [1]: [PATCH v3 01/16] PCI: dwc: Add pcie_cap field and helper in designware header ---
> commit ab22dc6f534d77b34df13c99dd929771547f5ff1
> Author: Hans Zhang <18255117159@163.com>
> 
> PCI: dwc: Add pcie_cap field and helper in designware header
> 
> This commit adds a pcie_cap field to struct dw_pcie to cache the offset of
> the PCI Express Capability structure. It introduces dw_pcie_get_pcie_cap()
> to perform the capability search on the first call and cache the result.
> 
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> [ ... ]
>> @@ -829,6 +831,21 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
>>   	dw_pcie_writel_dbi(pci, reg, val);
>>   }
>>   
>> +/**
>> + * dw_pcie_get_pcie_cap() - Return cached PCIe Capability offset
>> + * @pci: DWC instance
>> + *
>> + * Finds and caches the offset of PCI_CAP_ID_EXP on first call.
>> + * Returns 0 if the capability is not present.
>> + */
>> +static inline u8 dw_pcie_get_pcie_cap(struct dw_pcie *pci)
>> +{
>> +	if (!pci->pcie_cap)
>> +		pci->pcie_cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> 
> [Severity: Medium]
> Will this repeatedly search the configuration space if the capability is
> not found? If dw_pcie_find_capability() returns 0 when the capability is
> missing, pci->pcie_cap will remain 0, causing the search to be repeated
> on every subsequent call instead of being cached.
> 
> Also, since this helper might be called concurrently by different threads,
> could the unprotected read and write to pci->pcie_cap cause a data race?
> 

Hi,

As mentioned in the previous reply, there is no need for us to worry 
about this.

https://lore.kernel.org/linux-pci/5cc6fbcc-98eb-4da5-b123-2c04c4d39326@163.com/


Best regards,
Hans


>> +
>> +	return pci->pcie_cap;
>> +}
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

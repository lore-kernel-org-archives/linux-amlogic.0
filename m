Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 342C4606A31A
	for <linux-amlogic@archiver.kernel.org>; Wed, 28 Oct 2026 03:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YZCHpqln;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=MzWVMjzN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xpK/9hpvtasx/HmiaChgXc2IUtI5v9ehsEstSjRzPzM=; b=YZCHpqlnuGrriyqJWlGsLmb6GH
	zGi8K5ywclBVuuL9zGZ7vwqfc4q3CR+NytK+y9ItE7c6xb6PSq/Tp0eG01d7Hvow1tLbMesOCQGza
	zWhKHDjHncj9kyI9EORjcYf4G10lgd1JtlHelcrylbpI0QkERZ3eHfi8TFhDueVnWhwnpChB1jd1v
	zUB6bciOz9EUNkqcOJVOJyHK41fGnuBiTYsf17YlQrdCH6piuApDVlGgzxVCX54PNjrWveeR/0dgB
	chTO0cSiskE2ieICPzdj0BLdn5LeR77ILwUShnzCBVox9oFjmE5PVDA+fPTybvqXD1r0NSTBDYVXX
	/6HG68DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuC6-00000006CQO-3wjl;
	Wed, 28 Oct 2026 03:19:18 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLuC3-00000006CPx-3ZJ3
	for linux-amlogic@lists.infradead.org;
	Wed, 28 Oct 2026 03:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=d0TnDNXpTSOKkU/wZ+OsWRKYPI+WZH1qEV3bCcO11Io=;
	b=MzWVMjzNB+Aunb0I6CPgaT0gJpqVlQGRp7urPYKPy4M8wXJ1rzLA/o2GdiMEvN
	pwctFPB09l1Mz1hQljpkTWCaq1qZtWMd8UaJwDn+0PPigoQmDB19uiRvV18FjfPX
	742AEZYlU0YChS4UdCouOmDguwXejJdhucENZ7cLvJV/o=
Message-ID: <3773fc58-a6ab-4f8d-a9a1-c865217afe84@163.com>
Date: Wed, 28 Oct 2026 11:18:51 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] PCI: dwc: Add pcie_cap field and caching helper
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, linux-amlogic@lists.infradead.org,
 linux-pci@vger.kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
References: <20261028030652.2917756-1-18255117159@163.com>
 <20261028030652.2917756-2-18255117159@163.com>
 <sashiko-outbox-187403@kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <sashiko-outbox-187403@kernel.org>
X-CM-TRANSID: PSgvCgCn8AehaeFqDd1zCQ--.33353S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuryDZw4xCF1ruryxCrWktFb_yoW5Wr17pa
	9xJFyYkFWUJrW7ZFn2y3WrXr13tasxAFW7Gws3GrnavFy2yr17GF4YkrW3t3Z7GrWI9ryj
	krWaqr9ruFs5JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UzT5LUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AGVOWrhaaGG1wAA3T
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_201916_254991_55DAAACA 
X-CRM114-Status: GOOD (  19.60  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/28/26 11:15, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] PCI: dwc: unconfirmed offset returned in dw_pcie_get_pcie_cap()
> --
> 
> commit c6fcd840cdb57dd351ea1787cae915ad3164fb13
> Author: Hans Zhang <18255117159@163.com>
> 
> PCI: dwc: Add pcie_cap field and caching helper
> 
> This commit adds a pcie_cap field to struct dw_pcie and introduces a
> dw_pcie_get_pcie_cap() helper that lazily looks up and caches the PCI
> Express Capability offset on first use once confirmed via a DBI read-back.
> 
>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>> index 6d788aa000117..dede6b3966585 100644
>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> [ ... ]
>> @@ -832,6 +834,42 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
>>   	dw_pcie_writel_dbi(pci, reg, val);
>>   }
>>   
>> +/**
>> + * dw_pcie_get_pcie_cap() - Return the PCIe Capability offset
>> + * @pci: DWC instance
>> + *
> [ ... ]
>> + * Return: the offset of the PCIe Capability, or 0 if it could not be
>> + * found or has not been confirmed yet.
>> + */
>> +static inline u8 dw_pcie_get_pcie_cap(struct dw_pcie *pci)
>> +{
>> +	u8 cap = READ_ONCE(pci->pcie_cap);
>> +
>> +	if (!cap) {
>> +		cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>> +		if (cap && dw_pcie_readb_dbi(pci, cap) == PCI_CAP_ID_EXP)
>> +			WRITE_ONCE(pci->pcie_cap, cap);
>> +	}
>> +
>> +	return cap;
>> +}
> 
> [Severity: Medium]
> In drivers/pci/controller/dwc/pcie-designware.h, the kernel-doc for
> dw_pcie_get_pcie_cap() states that it returns 0 if the capability could not
> be found or has not been confirmed yet.
> 
> However, when pci->pcie_cap is 0 and transient DBI data causes
> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to return a non-zero offset cap
> while the confirmation check dw_pcie_readb_dbi(pci, cap) == PCI_CAP_ID_EXP
> evaluates to false, pci->pcie_cap is left as 0, but the unconfirmed non-zero
> cap is still returned to the caller.
> 
> Callers that guard DBI writes on a non-zero return (such as
> rockchip_pcie_enable_l0s()) or cache a non-zero return in driver state (such
> as tegra_pcie_dw_host_init() setting pcie->pcie_cap_base when
> !pcie->pcie_cap_base) will then consume or permanently store the unconfirmed
> offset.
> 
> Should dw_pcie_get_pcie_cap() return 0 when the confirmation read-back fails,
> or should the kernel-doc comment be updated to match the implementation?
> 

Hi,

We have already replied to Bjorn before. According to the specification, 
the value of pcie_cap is not equal to 0.


Best regards,
Hans




_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

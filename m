Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F21606A32C
	for <linux-amlogic@archiver.kernel.org>; Sat,  7 Nov 2026 17:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IKmvL2/H;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Fi221Vvl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eFKA+0Cmo5DlCbTjHI0n3yjboa1+x8ZvAQkUrPIb7Nk=; b=IKmvL2/HrUo43V1PZepQ882tMl
	BoO1bgFIHrO3zMXmQnJs+rErgZzLYJDVH2kbhW0tYCyivaiYT8yCn0OM5UtZcRRkZx1IhSkD79MET
	g1NjeUijGx3oG7UwWxB+rm3T+uFbBdePNhHfIPj8DyCqwKHTMqa1LKFV9ZiPI08xrlwjngNscO1V4
	hvvCiAjCPKIhouYiN3VZvDr26m4s5nCNgfxkwlSpuyiBesC9pkcl+9BwBWsUbtr9q8dm8Gb0p/Kq+
	lAths6b90L9ligW+bf7s3aQTL9wHH/4vfk8v0mr0UNbHndvA2oa4mzIXWgDrIwMIX8fCsl0lYRiEA
	lDQrbZpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkQT-0000000F72E-0Izt;
	Sat, 07 Nov 2026 17:42:01 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPkQN-0000000F6zF-1N6z
	for linux-amlogic@lists.infradead.org;
	Sat, 07 Nov 2026 17:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=T0TcPMhnJboefGjG0dX42ucxF+Z41m2N3+6Nxl59W/o=;
	b=Fi221VvloIkNvZbdj3lKq+HdEGQPtgHh2/PWzntI6Mo1izjyXJ/McQnd04eCYp
	o2csqEQI2t/NQWx37zq1bOGSzaay7/KWf4DsGH/z0mxkNGlwWn1R7g0tBzh6JUl+
	jjOWCsqtGE3wci9D6Uv8uEGJn/w+SLk1nn1NzgnoJLxzo=
Received: from [IPV6:240e:b8f:91b3:d000:dbd3:438:3de0:f148] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHYznHYu9qSfN5Eg--.55065S2;
	Sun, 08 Nov 2026 01:41:27 +0800 (CST)
Message-ID: <5512a99d-9c72-4988-aa94-0826d098a09d@163.com>
Date: Sun, 8 Nov 2026 01:41:27 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/16] PCI: dwc: Add pcie_cap field and caching helper
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev,
 linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org,
 Frank.Li@kernel.org, neil.armstrong@linaro.org
References: <20261028030652.2917756-1-18255117159@163.com>
 <20261028030652.2917756-2-18255117159@163.com>
 <sashiko-outbox-187403@kernel.org>
 <3773fc58-a6ab-4f8d-a9a1-c865217afe84@163.com>
 <179399401605.55876.3520713514569261990.b4-reply@b4>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <179399401605.55876.3520713514569261990.b4-reply@b4>
X-CM-TRANSID: PigvCgDHYznHYu9qSfN5Eg--.55065S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF43Cw48AFWfArWUCFy3Arb_yoWrGr18p3
	9rJayYyF4DJr42vFnFv3WrXrnIyasxAFW7WwnrGrnIvr9Fyr17KF4ayFWjg3Z7GrWIkr1j
	9rWaqr9ruFn8JFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jUzVbUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wdgBGrvYsdbgQAA3y
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_094155_733905_DB99FF1B 
X-CRM114-Status: GOOD (  18.03  )
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



On 11/7/26 03:40, Manivannan Sadhasivam wrote:
> On 2026-10-28 11:18 +0800, Hans Zhang wrote:
>>
>>
>> On 10/28/26 11:15, sashiko-bot@kernel.org wrote:
>>> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>>> - [Medium] PCI: dwc: unconfirmed offset returned in dw_pcie_get_pcie_cap()
>>> --
>>>
>>> commit c6fcd840cdb57dd351ea1787cae915ad3164fb13
>>> Author: Hans Zhang <18255117159@163.com>
>>>
>>> PCI: dwc: Add pcie_cap field and caching helper
>>>
>>> This commit adds a pcie_cap field to struct dw_pcie and introduces a
>>> dw_pcie_get_pcie_cap() helper that lazily looks up and caches the PCI
>>> Express Capability offset on first use once confirmed via a DBI read-back.
>>>
>>>> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
>>>> index 6d788aa000117..dede6b3966585 100644
>>>> --- a/drivers/pci/controller/dwc/pcie-designware.h
>>>> +++ b/drivers/pci/controller/dwc/pcie-designware.h
>>> [ ... ]
>>>> @@ -832,6 +834,42 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
>>>>    	dw_pcie_writel_dbi(pci, reg, val);
>>>>    }
>>>>    
>>>> +/**
>>>> + * dw_pcie_get_pcie_cap() - Return the PCIe Capability offset
>>>> + * @pci: DWC instance
>>>> + *
>>> [ ... ]
>>>> + * Return: the offset of the PCIe Capability, or 0 if it could not be
>>>> + * found or has not been confirmed yet.
>>>> + */
>>>> +static inline u8 dw_pcie_get_pcie_cap(struct dw_pcie *pci)
>>>> +{
>>>> +	u8 cap = READ_ONCE(pci->pcie_cap);
>>>> +
>>>> +	if (!cap) {
>>>> +		cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>>>> +		if (cap && dw_pcie_readb_dbi(pci, cap) == PCI_CAP_ID_EXP)
>>>> +			WRITE_ONCE(pci->pcie_cap, cap);
>>>> +	}
>>>> +
>>>> +	return cap;
>>>> +}
>>>
>>> [Severity: Medium]
>>> In drivers/pci/controller/dwc/pcie-designware.h, the kernel-doc for
>>> dw_pcie_get_pcie_cap() states that it returns 0 if the capability could not
>>> be found or has not been confirmed yet.
>>>
>>> However, when pci->pcie_cap is 0 and transient DBI data causes
>>> dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to return a non-zero offset cap
>>> while the confirmation check dw_pcie_readb_dbi(pci, cap) == PCI_CAP_ID_EXP
>>> evaluates to false, pci->pcie_cap is left as 0, but the unconfirmed non-zero
>>> cap is still returned to the caller.
>>>
>>> Callers that guard DBI writes on a non-zero return (such as
>>> rockchip_pcie_enable_l0s()) or cache a non-zero return in driver state (such
>>> as tegra_pcie_dw_host_init() setting pcie->pcie_cap_base when
>>> !pcie->pcie_cap_base) will then consume or permanently store the unconfirmed
>>> offset.
>>>
>>> Should dw_pcie_get_pcie_cap() return 0 when the confirmation read-back fails,
>>> or should the kernel-doc comment be updated to match the implementation?
>>>
>>
>> Hi,
>>
>> We have already replied to Bjorn before. According to the specification,
>> the value of pcie_cap is not equal to 0.
>>
> 
> Then please update the stale the kernel doc.

Hello Mani,

How about modifying it to "stale the kernel documentation"? If the 
description below is valid, do I still need to send the v6 series patch?


+ * A DBI read issued while the controller is not accessible returns
+ * platform specific data, and a transient bogus value must not stick in
+ * the cache.  The offset is therefore only cached once the capability
+ * ID has been read back at that offset.  If the read-back does not
+ * confirm the capability, the offset is still returned for the current
+ * access but not cached, so the next call performs the lookup again.
+ *
+ * Return: the offset of the PCIe Capability, or 0 if it could not be
+ * found.


Best regards,
Hans


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

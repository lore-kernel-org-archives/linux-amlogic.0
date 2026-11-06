Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2AC6606A326
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2026 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v978V7Sp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:In-Reply-To:
	Cc:To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=05m6PQgNyGJ6Axft1J44f6tdksy7teqfVuWM3xqSTl0=; b=v978V7SpZE/AIfflDyEKy+Ruce
	X6TjhqPNUZ+UJalWcNJO4WWzL2trUBsslCOvOzd1tyLjiGn9Fs4Q63xht8o52/ONt7sQpiljEvDE0
	pOwW5opR+bXleCOhPMiuvb/teazm18R7VtPpg7ULMo+mqtiodE4pg0cnUOlYInZw2F9YT1rJDMKI2
	YvR0YMGbjc6p6eURqgGiRftYmNnUEfyvJzr3Htj4Ld2UqbnLvpNaaTtUPZjYnlGaKLpPxj1hk2Jve
	S18LO136jTpra9UE79D69FBh8sDDDtkp4c6Tef+8HnM+Bb+kwXO4agaYcgo2FrTXLhFalB475vmRc
	SYFCBh9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPnV-0000000DXr7-1hKV;
	Fri, 06 Nov 2026 19:40:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPPnT-0000000DXqz-1VY7
	for linux-amlogic@lists.infradead.org;
	Fri, 06 Nov 2026 19:40:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 57F2F601C0;
	Fri,  6 Nov 2026 19:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8B8D1F0089F;
	Fri,  6 Nov 2026 19:40:21 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v5 01/16] PCI: dwc: Add pcie_cap field and caching
 helper
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: Hans Zhang <18255117159@163.com>
Cc: sashiko-reviews@lists.linux.dev, imx@lists.linux.dev, 
 linux-amlogic@lists.infradead.org, linux-pci@vger.kernel.org, 
 Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <3773fc58-a6ab-4f8d-a9a1-c865217afe84@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
 <20261028030652.2917756-2-18255117159@163.com>
 <sashiko-outbox-187403@kernel.org>
 <3773fc58-a6ab-4f8d-a9a1-c865217afe84@163.com>
Date: Sat, 07 Nov 2026 01:10:16 +0530
Message-Id: <179399401605.55876.3520713514569261990.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3038;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=1tMG3qbjDNeqUpxfEBEvQAkk2kZSTgYVoHa4KZ6UwNk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq7i0gBLa0hX8gTIugn2MLgSu3YqcqnGaKfSliE
 khZL5oFTgSJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCau4tIAAKCRBVnxHm/pHO
 9QLzB/98XUV9FjvnZTWHvlQLojLVfWOzHoACcUgVHDiCq/7ZVYkJoCtPGTWAeY87dvCUBo8RYxk
 GUtJUQAxM6Kdbfc6bvVhkdbMJYgzw1ARlnHSM6rFe5ZNxhO2wJRzRu1dylIg15lRDsjgsHOUdyE
 n2GGcV/wmgckVB9+3Hlyhd8KlTcrWPkrsSAJzS7C6H5CM1gDz3iKCkE8iCv1BjaUaTWDnbZwxYe
 Da2RS37T9+o5tqMzFNLfUDIl9bPiJUQiv5rzK0BkpGvdZ4r7mzK50bFeFJXVeDVl27SvwL2gsj8
 WHO1wGfB+Zd5qVajvJelHygoWeU2HgRGKSpzR93/kohcOiXL
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-28 11:18 +0800, Hans Zhang wrote:
> 
> 
> On 10/28/26 11:15, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> > - [Medium] PCI: dwc: unconfirmed offset returned in dw_pcie_get_pcie_cap()
> > --
> > 
> > commit c6fcd840cdb57dd351ea1787cae915ad3164fb13
> > Author: Hans Zhang <18255117159@163.com>
> > 
> > PCI: dwc: Add pcie_cap field and caching helper
> > 
> > This commit adds a pcie_cap field to struct dw_pcie and introduces a
> > dw_pcie_get_pcie_cap() helper that lazily looks up and caches the PCI
> > Express Capability offset on first use once confirmed via a DBI read-back.
> > 
> >> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> >> index 6d788aa000117..dede6b3966585 100644
> >> --- a/drivers/pci/controller/dwc/pcie-designware.h
> >> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> > [ ... ]
> >> @@ -832,6 +834,42 @@ static inline void dw_pcie_dbi_ro_wr_dis(struct dw_pcie *pci)
> >>   	dw_pcie_writel_dbi(pci, reg, val);
> >>   }
> >>   
> >> +/**
> >> + * dw_pcie_get_pcie_cap() - Return the PCIe Capability offset
> >> + * @pci: DWC instance
> >> + *
> > [ ... ]
> >> + * Return: the offset of the PCIe Capability, or 0 if it could not be
> >> + * found or has not been confirmed yet.
> >> + */
> >> +static inline u8 dw_pcie_get_pcie_cap(struct dw_pcie *pci)
> >> +{
> >> +	u8 cap = READ_ONCE(pci->pcie_cap);
> >> +
> >> +	if (!cap) {
> >> +		cap = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
> >> +		if (cap && dw_pcie_readb_dbi(pci, cap) == PCI_CAP_ID_EXP)
> >> +			WRITE_ONCE(pci->pcie_cap, cap);
> >> +	}
> >> +
> >> +	return cap;
> >> +}
> > 
> > [Severity: Medium]
> > In drivers/pci/controller/dwc/pcie-designware.h, the kernel-doc for
> > dw_pcie_get_pcie_cap() states that it returns 0 if the capability could not
> > be found or has not been confirmed yet.
> > 
> > However, when pci->pcie_cap is 0 and transient DBI data causes
> > dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) to return a non-zero offset cap
> > while the confirmation check dw_pcie_readb_dbi(pci, cap) == PCI_CAP_ID_EXP
> > evaluates to false, pci->pcie_cap is left as 0, but the unconfirmed non-zero
> > cap is still returned to the caller.
> > 
> > Callers that guard DBI writes on a non-zero return (such as
> > rockchip_pcie_enable_l0s()) or cache a non-zero return in driver state (such
> > as tegra_pcie_dw_host_init() setting pcie->pcie_cap_base when
> > !pcie->pcie_cap_base) will then consume or permanently store the unconfirmed
> > offset.
> > 
> > Should dw_pcie_get_pcie_cap() return 0 when the confirmation read-back fails,
> > or should the kernel-doc comment be updated to match the implementation?
> > 
> 
> Hi,
> 
> We have already replied to Bjorn before. According to the specification, 
> the value of pcie_cap is not equal to 0.
> 

Then please update the stale the kernel doc.

- Mani



_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

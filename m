Return-Path: <SRS0=GF6O=CS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C18C433E2
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:23:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7715C21941
	for <linux-amlogic@archiver.kernel.org>; Wed,  9 Sep 2020 12:23:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i2ujHJHp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7715C21941
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1+ahqLOJUdJz/Itba5qds7fOhpZUyJONHylBcWM87Aw=; b=i2ujHJHpPSyWqTxdPGHCR/Q1u
	IZ+n/TcyQJ25bWCTjYUctw6DROCli7ti/AOZkhz6Y9Y2GMsFkKap3g6E1WdHHkfg0kO6fWaeBEzTt
	/dqBkemTQUDksRYQMlUnsbs4RgkKfXSfO3XMrEQZE4Tk1VusD/r81azBU2v8hspO+u2KC2WK74EkA
	3zuuqWxlg0x6Q1Yu3MsAKIut5qLR+DEBI3+33eaxkCoPYiOHLiOWopbvRg++rm4lmehY3/3db6CMZ
	xfy9eb//lGmCAUlIr9ipMUyjd3hn9PR7mME0FUJzXz6KMlPiA82grPI69K/E32DO0TnTN6rFB/ks6
	qlG29U6Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFz8R-0002eq-Ot; Wed, 09 Sep 2020 12:23:35 +0000
Received: from foss.arm.com ([217.140.110.172])
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFz8P-0002dw-HG; Wed, 09 Sep 2020 12:23:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC786101E;
 Wed,  9 Sep 2020 05:23:30 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C22013F68F;
 Wed,  9 Sep 2020 05:23:29 -0700 (PDT)
Subject: Re: [PATCH 1/5] iommu/io-pgtable-arm: Add BROKEN_NS quirk to disable
 shareability on ARM LPAE
To: Neil Armstrong <narmstrong@baylibre.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com
References: <20200908151853.4837-1-narmstrong@baylibre.com>
 <20200908151853.4837-2-narmstrong@baylibre.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <f8ec460a-d61f-852d-2620-a49306bb1de4@arm.com>
Date: Wed, 9 Sep 2020 13:23:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200908151853.4837-2-narmstrong@baylibre.com>
Content-Language: en-GB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_082333_616568_E33C40B4 
X-CRM114-Status: GOOD (  23.28  )
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
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Subject: s/BROKEN_NS/BROKEN_SH/

Steve

On 08/09/2020 16:18, Neil Armstrong wrote:
> The coherency integration of the IOMMU in the Mali-G52 found in the Amlogic G12B SoCs
> is broken and leads to constant and random faults from the IOMMU.
> 
> Disabling shareability completely fixes the issue.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/iommu/io-pgtable-arm.c | 7 ++++---
>   include/linux/io-pgtable.h     | 4 ++++
>   2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index dc7bcf858b6d..d2d48dc86556 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -440,7 +440,9 @@ static arm_lpae_iopte arm_lpae_prot_to_pte(struct arm_lpae_io_pgtable *data,
>   				<< ARM_LPAE_PTE_ATTRINDX_SHIFT);
>   	}
>   
> -	if (prot & IOMMU_CACHE)
> +	if (data->iop.cfg.quirks & IO_PGTABLE_QUIRK_ARM_BROKEN_SH)
> +		pte |= ARM_LPAE_PTE_SH_NS;
> +	else if (prot & IOMMU_CACHE)
>   		pte |= ARM_LPAE_PTE_SH_IS;
>   	else
>   		pte |= ARM_LPAE_PTE_SH_OS;
> @@ -1005,8 +1007,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
>   {
>   	struct arm_lpae_io_pgtable *data;
>   
> -	/* No quirks for Mali (hopefully) */
> -	if (cfg->quirks)
> +	if (cfg->quirks & ~(IO_PGTABLE_QUIRK_ARM_BROKEN_SH))
>   		return NULL;
>   
>   	if (cfg->ias > 48 || cfg->oas > 40)
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index 23285ba645db..efb9c8f20909 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -86,6 +86,9 @@ struct io_pgtable_cfg {
>   	 *
>   	 * IO_PGTABLE_QUIRK_ARM_TTBR1: (ARM LPAE format) Configure the table
>   	 *	for use in the upper half of a split address space.
> +	 *
> +	 * IO_PGTABLE_QUIRK_ARM_BROKEN_SH: (ARM LPAE format) Disables shareability
> +	 *	when coherency integration is broken.
>   	 */
>   	#define IO_PGTABLE_QUIRK_ARM_NS		BIT(0)
>   	#define IO_PGTABLE_QUIRK_NO_PERMS	BIT(1)
> @@ -93,6 +96,7 @@ struct io_pgtable_cfg {
>   	#define IO_PGTABLE_QUIRK_ARM_MTK_EXT	BIT(3)
>   	#define IO_PGTABLE_QUIRK_NON_STRICT	BIT(4)
>   	#define IO_PGTABLE_QUIRK_ARM_TTBR1	BIT(5)
> +	#define IO_PGTABLE_QUIRK_ARM_BROKEN_SH	BIT(6)
>   	unsigned long			quirks;
>   	unsigned long			pgsize_bitmap;
>   	unsigned int			ias;
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

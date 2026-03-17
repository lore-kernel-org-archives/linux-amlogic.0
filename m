Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D79AFD707B
	for <linux-amlogic@archiver.kernel.org>; Tue, 17 Mar 2026 11:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=obrG6HgS8BhSIlyGb2qvXrsSCu0rXBUYBE0arrMlUlc=; b=BSIfpAjucDHiH7
	y7wz6PYTh77Z48KO01T9rL2ooc4S7VcUa511g4l8MbguwoBeYkARMlkTS9mDH3yupByfz1R5CpsbH
	B9VzjFDCozbMRYebWj9zmYjRN/PSFCfZp4mK1sICnF/SXMgSdJkaigvHggTRCEwIKSw0SQlzO4yUw
	/Pxba6pLzHlFVabV8dud/YKHadERM+chbWmumGpmRZB7fq2YxGhlh0RiqneOpQQCHVc9F5Okxz/ot
	V9wXMtRUoeFyZHQcLLib+C6GlbJnlh+tG2ht73qNdlAILC33zccWoku1aTkYOHxcLbOibA/tCubDN
	sM4pWzHK3bwdSBkgW+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SMW-000000066AO-1sWM;
	Tue, 17 Mar 2026 11:13:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2SMU-000000066AH-2GyG
	for linux-amlogic@lists.infradead.org;
	Tue, 17 Mar 2026 11:13:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D11E60008;
	Tue, 17 Mar 2026 11:13:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9747DC4CEF7;
	Tue, 17 Mar 2026 11:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773746001;
	bh=A4k44UqySYK9sBzDZ65HlwjIbkEi1C81mQWx6Wneq/E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BN4OvIHsgbwLgRezuXX+qMCFE0z812uNPJ9isuRxchmBDsKjWaXzTUTLVWnM7Bfdd
	 vMfHaG1KT8/XVIs1YNXau89CSWykOVGhdZcx+SITNe+aSiluskaWz4L7FDs0iyC/jW
	 k0wyksijDe55/zUnE17hXYiYnQ1IDq1JU4NT4A36NApXlJcPWC/KShcBdgPE/QF4vn
	 aUp+XeV0TFVyAd+0z6CkDTAzZLMbRGX499M4KyuWK4dtulyX9vIydWTzp6aPJU4+Ch
	 W8BsjoO1wcKst8WwmJGQy8edFc82Kb6/mjnRFmqf1fiuG3Cb3gQ/GE/Jp458V2HcXx
	 l5cgK8BH7vEqg==
Date: Tue, 17 Mar 2026 16:43:17 +0530
From: Vinod Koul <vkoul@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, linux-amlogic@lists.infradead.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v6 2/3] dmaengine: amlogic: Add general DMA driver for A9
Message-ID: <abk3TUTaov3zIfFm@vaman>
References: <20260309-amlogic-dma-v6-0-63349d23bd4b@amlogic.com>
 <20260309-amlogic-dma-v6-2-63349d23bd4b@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309-amlogic-dma-v6-2-63349d23bd4b@amlogic.com>
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

On 09-03-26, 06:33, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>

> +static dma_cookie_t aml_dma_tx_submit(struct dma_async_tx_descriptor *tx)
> +{
> +	return dma_cookie_assign(tx);
> +}

You lost tx, why was it not saved into a queue?

> +static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
> +		(struct dma_chan *chan, struct scatterlist *sgl,
> +		unsigned int sg_len, enum dma_transfer_direction direction,
> +		unsigned long flags, void *context)
> +{
> +	struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
> +	struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
> +	struct aml_dma_sg_link *sg_link;
> +	struct scatterlist *sg;
> +	int idx = 0;
> +	u64 paddr;
> +	u32 reg, link_count, avail, chan_id;
> +	u32 i;
> +
> +	if (aml_chan->direction != direction) {
> +		dev_err(aml_dma->dma_device.dev, "direction not support\n");
> +		return NULL;
> +	}
> +
> +	switch (aml_chan->status) {
> +	case DMA_IN_PROGRESS:
> +		dev_err(aml_dma->dma_device.dev, "not support multi tx_desciptor\n");
> +		return NULL;

And why is that. You are preparing a descriptor and keep it ready and
submit after the current one finishes


> +
> +	case DMA_COMPLETE:
> +		aml_chan->data_len = 0;
> +		chan_id = aml_chan->chan_id;
> +		reg = (direction == DMA_DEV_TO_MEM) ? WCH_INT_MASK : RCH_INT_MASK;
> +		regmap_set_bits(aml_dma->regmap, reg, BIT(chan_id));
> +
> +		break;
> +	default:
> +		dev_err(aml_dma->dma_device.dev, "status error\n");
> +		return NULL;
> +	}
> +
> +	link_count = sg_nents_for_dma(sgl, sg_len, SG_MAX_LEN);
> +
> +	if (link_count > DMA_MAX_LINK) {
> +		dev_err(aml_dma->dma_device.dev,
> +			"maximum number of sg exceeded: %d > %d\n",
> +			sg_len, DMA_MAX_LINK);
> +		aml_chan->status = DMA_ERROR;
> +		return NULL;
> +	}
> +
> +	aml_chan->status = DMA_IN_PROGRESS;
> +
> +	for_each_sg(sgl, sg, sg_len, i) {
> +		avail = sg_dma_len(sg);
> +		paddr = sg->dma_address;
> +		while (avail > SG_MAX_LEN) {
> +			sg_link = &aml_chan->sg_link[idx++];
> +			/* set dma address and len  to sglink*/
> +			sg_link->address = paddr;
> +			sg_link->ctl = FIELD_PREP(LINK_LEN, SG_MAX_LEN);
> +			paddr = paddr + SG_MAX_LEN;
> +			avail = avail - SG_MAX_LEN;
> +		}
> +		sg_link = &aml_chan->sg_link[idx++];
> +		/* set dma address and len  to sglink*/
> +		sg_link->address = paddr;
> +		sg_link->ctl = FIELD_PREP(LINK_LEN, avail);
> +
> +		aml_chan->data_len += sg_dma_len(sg);
> +	}
> +	aml_chan->sg_link_cnt = idx;

There is no descriptor management here. You are directly writing to
channel. This is _very_ inefficient and defeats the use of dmaengine.

Please revise the driver. Implement queues to manage multiple txns and
we have vchan to help you implement these, so take use of that

-- 
~Vinod

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

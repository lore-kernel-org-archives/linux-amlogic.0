Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EFC606A31F
	for <linux-amlogic@archiver.kernel.org>; Mon, 26 Oct 2026 15:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=njK3VnOV;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FnFAugCV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KCPKVhAfVsOI5javdoDqLZkpWOQdhtZl1KTSnq4KkIA=; b=njK3VnOV/Z2y+Rzfz/wWhewWWU
	KwnxR0sYGBa3TAnT6aoFmc0HCjn/ROvk1rryvOPfvFLpa57R1IkoSAH1jYXb6FocoDpSsNj4Hg85d
	OF4iu9OgghyaCN/fk2UpApl7IPCR0Vw9zWfQTew8arnnnGcmR2ujXa3hWmIrp1MAcmZxfrd7aCNLD
	nH9cnXrsUMjCM4cGIDYvz8XN1J3SZz3mr+GdHOrgytJChM2UL+x1fS9k6/V6HfthvV+e9GVwajsLa
	PDh+0E9LgnoIZLD/AdiGE6Nndx9Pa/dyFtVmua9mTBeIhQouyjCYLluN2hXar6ebCGTJG1WAYeSQI
	6nMn0ARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMX2-00000002kru-2ZNj;
	Mon, 26 Oct 2026 15:22:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLMX1-00000002krn-0hcH
	for linux-amlogic@lists.infradead.org;
	Mon, 26 Oct 2026 15:22:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42C6C600DA;
	Mon, 26 Oct 2026 15:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3319F1F01825;
	Mon, 26 Oct 2026 15:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793028158;
	bh=RZDDaJ57x7rY16pTWiAgH2N6hWJkfwlHnV205h0LFhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FnFAugCV2anMB8GwwB//iiEOTlFCvHL4vGHno2iTe+GQfR3JvTClws4We8W6Xpw6h
	 WywyeqBz2SbedLzQXZnhBV5LqqKXUL3qDO9xfsWrLY8Cy575GtuWYPYdyWnMIf4+ii
	 4g5q5cFR6H88yv5JWvlD+zUbxmnqPru6OQp9hCMuXl+t8JcvlzejGxR7iXJ8U2dCTa
	 VP7V1elV/PpCapJjDhEKRbLhvZAIfjrarAUNU8+trmOnLbq4QgizSxtQfqJUcTvSa/
	 74OrWew4/OrvFmxOa9YM9nhfmZrYO+bpq2PkEA9LDGccSa8r5EKnAKJuFry74/ZL2U
	 dRJlcg5Df2X4Q==
Date: Mon, 26 Oct 2026 16:22:33 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xianwei Zhao <xianwei.zhaol@amlogic.com>, Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: amlogic: Add Amlogic A9 I2C controller driver
Message-ID: <at8nuDtiHEDq4AZ2@zenone.zhora.eu>
References: <20261022-a9-i2c-v2-0-45e3cef175bf@amlogic.com>
 <20261022-a9-i2c-v2-2-45e3cef175bf@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261022-a9-i2c-v2-2-45e3cef175bf@amlogic.com>
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
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Junyi,

Sashiko's comments look legit to me, can you please take a look
at those?

Besides...

> +static irqreturn_t aml_i2c_irq(int irqno, void *dev_id)
> +{
> +	struct aml_i2c *i2c = dev_id;
> +	u8 *buf = NULL;
> +	int ret;
> +	u32 rd_len, i;
> +	u32 rd_val;
> +
> +	spin_lock(&i2c->lock);
> +	ret = controller_is_error(i2c);
> +	if (ret) {
> +		i2c->error = ret;
> +		goto complete_irq_out;
> +	}
> +
> +	switch (i2c->state) {
> +	case A9_STATE_READ:
> +		buf = i2c->msg->buf;
> +		rd_len = min(i2c->msg->len - i2c->pos, A9_I2C_FIFO_DEPTH);
> +		for (i = 0; i < rd_len; i++) {
> +			rd_val = readl(i2c->regs + REG_CFG_RX);
> +			buf[i2c->pos++] = rd_val & TX_RX_DATA;
> +		}
> +		/* Rx must clear thresh after read fifo */
> +		clear_irq_status(i2c, A9_RX_THRESH_READ);
> +		break;
> +	case A9_STATE_WRITE:
> +		aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_HALF);
> +		if ((i2c->pos + A9_I2C_HALF_FIFO) >= i2c->msg->len)
> +			aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_TX_THRESH_WRITE, 0);
> +		i2c->pos += i2c->count;
> +		/* Tx must clear thresh after write fifo */
> +		clear_irq_status(i2c, A9_TX_THRESH_WRITE);
> +		break;
> +	case A9_STATE_IDLE:
> +		dev_warn(i2c->dev, "i2c irq triggered abnormally, irq_state:0x%x,irq_en:0x%x\n",
> +			 readl(i2c->regs + REG_CFG_IRQ_STATE),
> +			 readl(i2c->regs + REG_CFG_IRQ_ENABLE));
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	if (!controller_is_done(i2c)) {
> +		goto irq_trans_out;
> +	} else {
> +		if (i2c->state == A9_STATE_READ && (i2c->msg->len - i2c->pos))
> +			goto irq_trans_out;
> +	}

No need for brackets here:

if (...)
	goto ...;
else if (...)
	goto ...;

But perhaps the two can be even merged.

(i2c->msg->len - i2c->pos) is equal to (i2c->pos < i2c->msg->len)

> +
> +complete_irq_out:
> +	reset_fifo_pos(i2c);
> +	complete(&i2c->done);
> +	i2c->state = A9_STATE_IDLE;
> +	aml_i2c_set_mask(i2c, REG_CFG_IRQ_ENABLE, A9_RX_THRESH_READ | A9_TX_THRESH_WRITE, 0);
> +	clear_irq_status(i2c, IRQ_ALL_MASK);
> +irq_trans_out:
> +	spin_unlock(&i2c->lock);

...

> +	i2c->state = (msg->flags & I2C_M_RD) ? A9_STATE_READ : A9_STATE_WRITE;
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	aml_i2c_prepare_xfer(i2c, A9_FIFO_FILL_FULL);
> +	i2c->pos += i2c->count;
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +	reinit_completion(&i2c->done);
> +
> +	if (last)
> +		aml_i2c_set_mask(i2c, REG_CFG_BUS, BUS_NO_STOP, 0);
> +	else
> +		aml_i2c_set_mask(i2c, REG_CFG_BUS, BUS_NO_STOP, BUS_NO_STOP);
> +	/* Start the transfer */
> +	aml_i2c_do_start(i2c, msg);

I think this should also be under spinlock in order to avoid that
the interrupt handler accesses a partially initialized state.

> +
> +	time_left = msecs_to_jiffies(I2C_TIMEOUT_MS);
> +	time_left = wait_for_completion_timeout(&i2c->done, time_left);
> +
> +	/*
> +	 * Protect access to i2c struct and registers from interrupt
> +	 * handlers triggered by a transfer terminated after the
> +	 * timeout period
> +	 */
> +
> +	spin_lock_irqsave(&i2c->lock, flags);
> +	if (!time_left) {
> +		i2c->state = A9_STATE_IDLE;
> +		clear_irq_status(i2c, IRQ_ALL_MASK);
> +		reset_fifo_pos(i2c);
> +		ret = -ETIMEDOUT;

the next instruction overwrites this error. Perhaps you could
use a goto to spin_unlock and return.

Andi

> +	}
> +
> +	if (i2c->error)
> +		ret = i2c->error;
> +	spin_unlock_irqrestore(&i2c->lock, flags);
> +
> +	return ret;
> +}

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

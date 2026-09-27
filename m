Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B05BC9830E
	for <linux-amlogic@archiver.kernel.org>; Sun, 27 Sep 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzzHSvrNZ6ZmZqIBV0816OUw5tKqlzZ6hc+dEpEvCHQ=; b=sY6F695UhSIcXN
	wniey0kgZwckMZVjoC+nlvSzLvsoXAmDB5y2cOGYppi9xwg6seb4+GNtalPUcAJ4JXz4DPZkZ+E3C
	jC5l6YustXaiKaOpDBO+lH28nzSvRCCh1YoervRj7sk1sGN1sYRNpqdA3J8jhxLAbkZbplALx+4Y3
	idzl1WmODqmenyIYQSarpJMLQi0zL3OE0UFzpwqsLhHuf5076+P036J43JiCvZDlV/u0IRqUqeLyd
	nGi2dZhPDOBeDjijc4JHxXepqLTqi2lfdng/sTr/iBdXGTHyPRxah7+jm9oN9dfQaz6a36ycKEwr+
	7/yfk1bma3xYR++6oucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAngg-0000000GIIU-3t8G;
	Sun, 27 Sep 2026 12:08:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAngg-0000000GIIO-0c0P
	for linux-amlogic@lists.infradead.org;
	Sun, 27 Sep 2026 12:08:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 433E360AAE;
	Sun, 27 Sep 2026 12:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32321F000FF;
	Sun, 27 Sep 2026 12:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790510936;
	bh=rcdgXK0+/7Z3a45Y7RvKNKnFXrswv/Vtt6X/xMOE8Mw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jPqsnKUvX6X7CHH8Y/NNNye+Xs8G4JdMvmlSM5tdvWOrEG6s6dQnvHPEL0kCYvIy6
	 NWbqIbkPWehnuTcR5ZdBWlIdEbBnTcQOiO534/FewHSU1jQGK/CZl4nV04WYNdvP2G
	 N7H545RQ8Hc0Hw5xrcRsElvfo3iKZjynTJ2mz4OKSjGfVFMAcw50gKY5Hjc653Qu/Y
	 2RYtJlUwNWKVpopIvVwxo5K1VcKZwW9A8Vo/42E+WzF8oUAt454IRwhrKwyOTmRZ3E
	 4kl7lQnMwZ9xWR+a7yZcxQxQrn+zSn3XROnvoZlpDVoiFHMEmR4aQm3p6pSBJJjdlS
	 pNqNL8XOxq5vw==
Date: Sun, 27 Sep 2026 14:08:52 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: xianwei.zhao@amlogic.com
Cc: Junyi Zhao <junyi.zhao@amlogic.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Xianwei Zhao <xianwei.zhaol@amlogic.com>, Junyi Zhao <junyi.zhaol@amlogic.com>, linux-i2c@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] i2c: amlogic: Add Amlogic A9 I2C controller driver
Message-ID: <arkDNC8st4Nsqu1C@zenone.zhora.eu>
References: <20260924-a9-i2c-v1-0-b8ad9b46f4a8@amlogic.com>
 <20260924-a9-i2c-v1-2-b8ad9b46f4a8@amlogic.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924-a9-i2c-v1-2-b8ad9b46f4a8@amlogic.com>
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

Hi Xianwei,

...

> +config I2C_AMLOGIC_A9
> +	tristate "Amlogic new I2C controller"
> +	depends on ARCH_MESON || COMPILE_TEST
> +	depends on COMMON_CLK
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C interface on the new Amlogic family of SoCs.
> +
> +

Please, remove this extra line

>  config I2C_MICROCHIP_CORE
>  	tristate "Microchip FPGA I2C controller"
>  	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST

...

> +#include <linux/clk.h>
> +#include <linux/completion.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/delay.h>

Please sort the above in alphabetic order.

> +/* Amlogic I2C register map */
> +#define REG_CFG_RDY		0x00
> +#define REG_CFG_I2C		0x04
> +#define REG_CFG_START		0x08
> +#define REG_CFG_BUS		0x0c
> +#define REG_TX_RD_ADDR		0x10
> +#define REG_TX_WR_ADDR		0x14
> +#define REG_RX_RD_ADDR		0x18
> +#define REG_RX_WR_ADDR		0x1c
> +#define REG_CGF_TX		0x20
> +#define REG_CGF_RX		0x24
> +#define REG_CGF_IRQ_STATE	0x30
> +#define REG_CGF_IRQ_ENABLE	0x34
> +#define REG_SHAKE_BLK_CNT	0x38
> +
> +/* CFG RDY fields */
> +#define RDY_TEE_ONLY		BIT(1)
> +#define RDY_IF			BIT(0)
> +
> +/* CFG I2C fields */
> +#define I2C_RX_THR		GENMASK(23, 16)
> +#define I2C_TX_THR		GENMASK(15, 8)
> +
> +/* CFG BUS fields */
> +#define BUS_NO_STOP		BIT(18)
> +#define BUS_SPEED_MODE		BIT(17)
> +#define BUS_SLAVE_MODE		BIT(16)
> +#define BUS_FILTER_MASK		GENMASK(15, 12)
> +/* SCL = clk/b_ratio	if b_ratio<=8, SCL = clk/8 */
> +#define BUS_RATIO_MASK		GENMASK(11, 0)
> +
> +/* CFG START fields */
> +#define START_START		BIT(31)
> +#define START_LEN		GENMASK(23, 12)
> +#define START_LEN_SHIFT		12
> +#define START_SLAVE_ADDR	GENMASK(10, 1)
> +#define START_READ		BIT(0)
> +
> +/* CFG TX_RX fields */
> +#define TX_RX_EMPTY		BIT(9)
> +#define TX_RX_FULL		BIT(8)
> +#define TX_RX_DATA		GENMASK(7, 0)
> +
> +/*CGF IRQ fields */
> +#define IRQ_ALL_MASK		0xffff
> +#define A9_NCK_ERROR		BIT(0)
> +#define A9_RX_EMPTY		BIT(1)
> +#define A9_RX_FULL		BIT(2)
> +#define A9_TX_EMPTY		BIT(3)
> +#define A9_TX_FULL		BIT(4)
> +#define A9_RX_THRESH_READ	BIT(5)
> +#define A9_TX_THRESH_WRITE	BIT(6)
> +#define A9_PHY_DONE		BIT(7)
> +#define A9_TASK_DONE		BIT(8)
> +#define A9_ALL_DONE		BIT(9)
> +
> +#define A9_TRANS_DONE		(A9_PHY_DONE | A9_NCK_ERROR)
> +#define A9_TRANS_ERROR		(A9_NCK_ERROR)
> +#define A9_ENABLE_IRQ_BIT	(A9_NCK_ERROR | A9_PHY_DONE)
> +#define THRESH_MODE		(A9_RX_THRESH_READ | A9_TX_THRESH_WRITE)
> +
> +#define A9_I2C_FIFO_DEPTH	32
> +#define A9_I2C_HALF_FIFO	(A9_I2C_FIFO_DEPTH >> 1)
> +
> +#define I2C_TIMEOUT_MS		500
> +
> +enum {
> +	STATE_IDLE,
> +	STATE_READ,
> +	STATE_WRITE,
> +};
> +
> +enum fifo_fill_mode {
> +	FIFO_FILL_FULL,
> +	FIFO_FILL_HALF,
> +};

For all the enums and defines above, please use the prefix of the
driver name, A9, I guess.

...

> +static void aml_i2c_put_data(struct aml_i2c *i2c, char *buf, int len)
> +{
> +	int i;
> +
> +	/* this i2c module when trans 0 byte, must put at least 1.
> +	 */

Please use the kernel style commenting format, I think checkpatch
would have had raised this.

> +	if (!i2c->msg->len) {
> +		writel(0x00, i2c->regs + REG_CGF_TX);
> +		return;
> +	}
> +
> +	for (i = 0; i < len; i++, buf++)
> +		writel(*buf, i2c->regs + REG_CGF_TX);
> +}
> +
> +static void aml_i2c_prepare_xfer(struct aml_i2c *i2c, enum fifo_fill_mode mode)
> +{
> +	bool write = !(i2c->msg->flags & I2C_M_RD);
> +
> +	if (write) {

you can revert the logic here with if (!write) return; to save a
level of indentation.

> +		if (mode == FIFO_FILL_FULL)
> +			i2c->count = min(i2c->msg->len - i2c->pos, A9_I2C_FIFO_DEPTH);
> +		else
> +			i2c->count = min(i2c->msg->len - i2c->pos, A9_I2C_HALF_FIFO);
> +		aml_i2c_put_data(i2c, i2c->msg->buf + i2c->pos, i2c->count);
> +	}
> +}

...

> +static int aml_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> +{
> +	struct aml_i2c *i2c = adap->algo_data;
> +	int i, ret = 0;
> +
> +	for (i = 0; i < num; i++) {
> +		ret = aml_i2c_xfer_msg(i2c, msgs + i, i == num - 1);
> +		if (ret)
> +			break;

you can save some code here by doing

	for (...) {
		int ret;

		ret = aml_i2c_xfer_msg(...);
		if (ret)
			return ret;
	}

	return i;

> +	}
> +
> +	return ret ?: i;
> +}

...

> +static int aml_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np = pdev->dev.of_node;
> +	struct aml_i2c *i2c;

...

> +	i2c->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(i2c->clk)) {
> +		dev_err(&pdev->dev, "can't get device clock\n");
> +		return PTR_ERR(i2c->clk);
> +	}

Please use return dev_err_probe(...);

Andi

> +

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic

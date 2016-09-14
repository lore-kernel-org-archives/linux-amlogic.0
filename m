From: khilman@baylibre.com (Kevin Hilman)
Date: Tue, 13 Sep 2016 17:16:10 -0700
Subject: [RFC / POC] mmc: meson-gxbb: experimental SDIO support
In-Reply-To: <20160828165829.21882-1-martin.blumenstingl@googlemail.com>
 (Martin Blumenstingl's message of "Sun, 28 Aug 2016 18:58:29 +0200")
References: <20160828165829.21882-1-martin.blumenstingl@googlemail.com>
Message-ID: <7ha8fbnxo5.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Martin Blumenstingl <martin.blumenstingl@googlemail.com> writes:

> This adds experimental SDIO support to the meson mmc controller.
> The patch consists of four main changes:
> - remove meson_mmc_check_cmd to allow the SDIO commands

FYI, I've dropped this part from v3 of my MMC driver which will be
posted shortly..  That was leftover from some debugging and not needed
(as you noticed.)

Kevin

> - implement meson_mcc_enable_sdio_irq - this requires adding the
>   irq_mask field to our priv struct so we always configure the
>   correct IRQs.
> - get rid of the magic value IRQ_EN_MASK and replace it with an OR
>   of the corresponding bit/masks (when initializing host->irq_mask)
> - it adds a small bugfix in meson_mmc_probe when probing failed (in
>   my case: probing had to be deferred because the mmc-initseq was not
>   ready yet) which disabled and unprepared a clock which was not
>   enabled
>
> I am sending this patch because I only have limited access to my board
> in the next 2 weeks. Please see this as "proof of concept" and not a
> finished patch. If someone wants to work in this: feel free - otherwise
> I'll do it when I have full access to my board again.
>
> An additional patch which enables wifi on the Tronsmart S95 Vega Meta
> can be found here:
> https://github.com/xdarklight/linux/tree/meson-gxbb-integration-4.8-20160828
>
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/mmc/host/meson-gxbb.c | 81 ++++++++++++++++++++++++-------------------
>  1 file changed, 45 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gxbb.c b/drivers/mmc/host/meson-gxbb.c
> index 10eac41..77a7a1f 100644
> --- a/drivers/mmc/host/meson-gxbb.c
> +++ b/drivers/mmc/host/meson-gxbb.c
> @@ -123,7 +123,6 @@
>  #define   STATUS_BUSY BIT(31)
>  
>  #define SD_EMMC_IRQ_EN 0x4c
> -#define   IRQ_EN_MASK 0x3fff
>  #define   IRQ_RXD_ERR_SHIFT 0
>  #define   IRQ_RXD_ERR_MASK 0xff
>  #define   IRQ_TXD_ERR BIT(8)
> @@ -181,6 +180,8 @@ struct meson_host {
>  	unsigned long clk_rate;
>  	unsigned long clk_src_rate;
>  	unsigned short clk_src_div;
> +
> +	u32 irq_mask;
>  };
>  
>  #define reg_read(host, offset) readl(host->regs + offset)
> @@ -457,28 +458,6 @@ static int meson_mmc_request_done(struct mmc_host *mmc, struct mmc_request *mrq)
>  	return 0;
>  }
>  
> -static int meson_mmc_cmd_invalid(struct mmc_host *mmc, struct mmc_command *cmd)
> -{
> -	cmd->error = -EINVAL;
> -	meson_mmc_request_done(mmc, cmd->mrq);
> -
> -	return -EINVAL;
> -}
> -
> -static int meson_mmc_check_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
> -{
> -	int ret = 0;
> -
> -	/* FIXME: needs update for SDIO support */
> -	if (cmd->opcode == SD_IO_SEND_OP_COND
> -	    || cmd->opcode == SD_IO_RW_DIRECT
> -	    || cmd->opcode == SD_IO_RW_EXTENDED) {
> -		ret = meson_mmc_cmd_invalid(mmc, cmd);
> -	}
> -
> -	return ret;
> -}
> -
>  static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  {
>  	struct meson_host *host = mmc_priv(mmc);
> @@ -588,14 +567,11 @@ static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  
>  	/* clear, ack, enable all interrupts */
>  	reg_write(host, SD_EMMC_IRQ_EN, 0);
> -	reg_write(host, SD_EMMC_STATUS, IRQ_EN_MASK);
> -	reg_write(host, SD_EMMC_IRQ_EN, IRQ_EN_MASK);
> +	reg_write(host, SD_EMMC_STATUS, host->irq_mask);
> +	reg_write(host, SD_EMMC_IRQ_EN, host->irq_mask);
>  
>  	host->mrq = mrq;
>  
> -	if (meson_mmc_check_cmd(mmc, mrq->cmd))
> -		return;
> -
>  	if (mrq->sbc)
>  		meson_mmc_start_cmd(mmc, mrq->sbc);
>  	else
> @@ -629,6 +605,7 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  	struct mmc_request *mrq = host->mrq;
>  	struct mmc_command *cmd = host->cmd;
>  	u32 irq_en, status, raw_status;
> +	bool sdio_irq = false;
>  	irqreturn_t ret = IRQ_HANDLED;
>  
>  	if (WARN_ON(!host))
> @@ -675,8 +652,9 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  		dev_dbg(host->dev, "Unhandled IRQ: Descriptor timeout\n");
>  		cmd->error = -ETIMEDOUT;
>  	}
> +
>  	if (status & IRQ_SDIO)
> -		dev_dbg(host->dev, "Unhandled IRQ: SDIO.\n");
> +		sdio_irq = true;
>  
>  	if (status & (IRQ_END_OF_CHAIN | IRQ_RESP_STATUS))
>  		ret = IRQ_WAKE_THREAD;
> @@ -698,6 +676,9 @@ out:
>  	/* ack all (enabled) interrupts */
>  	reg_write(host, SD_EMMC_STATUS, status);
>  
> +	if (sdio_irq)
> +		mmc_signal_sdio_irq(host->mmc);
> +
>  	if (ret == IRQ_HANDLED) {
>  		meson_mmc_read_resp(host->mmc, cmd);
>  		meson_mmc_request_done(host->mmc, cmd->mrq);
> @@ -757,10 +738,34 @@ static int meson_mmc_get_cd(struct mmc_host *mmc)
>  	return status;
>  }
>  
> +static void meson_mcc_enable_sdio_irq(struct mmc_host *mmc, int enable)
> +{
> +	struct meson_host *host = mmc_priv(mmc);
> +	unsigned long flags;
> +	u32 irqen;
> +
> +	spin_lock_irqsave(&host->lock, flags);
> +
> +	irqen = reg_read(host, SD_EMMC_IRQ_EN);
> +
> +	if (enable) {
> +		irqen |= IRQ_SDIO;
> +		host->irq_mask |= IRQ_SDIO;
> +	} else {
> +		irqen &= ~IRQ_SDIO;
> +		host->irq_mask &= ~IRQ_SDIO;
> +	}
> +
> +	reg_write(host, SD_EMMC_IRQ_EN, irqen);
> +
> +	spin_unlock_irqrestore(&host->lock, flags);
> +}
> +
>  static struct mmc_host_ops meson_mmc_ops = {
> -	.request	= meson_mmc_request,
> -	.set_ios	= meson_mmc_set_ios,
> -	.get_cd         = meson_mmc_get_cd,
> +	.request		= meson_mmc_request,
> +	.set_ios		= meson_mmc_set_ios,
> +	.get_cd         	= meson_mmc_get_cd,
> +	.enable_sdio_irq	= meson_mcc_enable_sdio_irq,
>  };
>  
>  static int meson_mmc_probe(struct platform_device *pdev)
> @@ -847,26 +852,30 @@ static int meson_mmc_probe(struct platform_device *pdev)
>  
>  	clk_prepare_enable(host->core_clk);
>  
> +	host->irq_mask = IRQ_RXD_ERR_MASK | IRQ_TXD_ERR | IRQ_DESC_ERR |
> +			 IRQ_RESP_ERR | IRQ_RESP_TIMEOUT | IRQ_DESC_TIMEOUT |
> +			 IRQ_END_OF_CHAIN;
> +
>  	ret = meson_mmc_clk_init(host);
>  	if (ret)
> -		goto free_host;
> +		goto free_host_clk_prepared;
>  
>  	/* Stop execution */
>  	reg_write(host, SD_EMMC_START, 0);
>  
>  	/* clear, ack, enable all interrupts */
>  	reg_write(host, SD_EMMC_IRQ_EN, 0);
> -	reg_write(host, SD_EMMC_STATUS, IRQ_EN_MASK);
> +	reg_write(host, SD_EMMC_STATUS, host->irq_mask);
>  
>  	mmc->ops = &meson_mmc_ops;
>  	mmc_add_host(mmc);
>  
>  	return 0;
>  
> +free_host_clk_prepared:
> +	clk_disable_unprepare(host->core_clk);
>  free_host:
>  	dev_dbg(host->dev, "Failed to probe: ret=%d\n", ret);
> -	if (host->core_clk)
> -		clk_disable_unprepare(host->core_clk);
>  	mmc_free_host(mmc);
>  	return ret;
>  }

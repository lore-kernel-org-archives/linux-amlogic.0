From: khilman@baylibre.com (Kevin Hilman)
Date: Wed, 15 Feb 2017 11:36:57 -0800
Subject: [PATCH 17/18] mmc: meson-gx: remove member mrq from struct
 meson_host
In-Reply-To: <66202cf4-fed6-a6ac-558f-c91979980629@gmail.com> (Heiner
 Kallweit's message of "Tue, 14 Feb 2017 21:07:13 +0100")
References: <420b75a9-b8c2-b3d7-ae60-3ed8a5a18ead@gmail.com>
 <66202cf4-fed6-a6ac-558f-c91979980629@gmail.com>
Message-ID: <m2r32z6yau.fsf@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Heiner Kallweit <hkallweit1@gmail.com> writes:

> Struct mmc_command includes a reference to the related mmc_request.
> Therefore we don't have to store mrq separately in struct meson_host.

This patch also removes a bunch of WARNs also, which shoulc be mentioned
here as well.  Those were quite handy during development, but now that
things have stabilized, I'm OK with them being removed.

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

With the changelog update,

Acked-by: Kevin Hilman <khilman@baylibre.com>

> ---
>  drivers/mmc/host/meson-gx-mmc.c | 23 ++---------------------
>  1 file changed, 2 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 6721aee2..08ff29be 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -123,7 +123,6 @@
>  struct meson_host {
>  	struct	device		*dev;
>  	struct	mmc_host	*mmc;
> -	struct	mmc_request	*mrq;
>  	struct	mmc_command	*cmd;
>  
>  	spinlock_t lock;
> @@ -407,9 +406,6 @@ static void meson_mmc_request_done(struct mmc_host *mmc,
>  {
>  	struct meson_host *host = mmc_priv(mmc);
>  
> -	WARN_ON(host->mrq != mrq);
> -
> -	host->mrq = NULL;
>  	host->cmd = NULL;
>  	mmc_request_done(host->mmc, mrq);
>  }
> @@ -506,11 +502,6 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  
>  static void meson_mmc_request(struct mmc_host *mmc, struct mmc_request *mrq)
>  {
> -	struct meson_host *host = mmc_priv(mmc);
> -
> -	WARN_ON(host->mrq != NULL);
> -
> -	host->mrq = mrq;
>  	meson_mmc_start_cmd(mmc, mrq->cmd);
>  }
>  
> @@ -535,7 +526,6 @@ static void meson_mmc_read_resp(struct mmc_host *mmc, struct mmc_command *cmd)
>  static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  {
>  	struct meson_host *host = dev_id;
> -	struct mmc_request *mrq;
>  	struct mmc_command *cmd;
>  	u32 irq_en, status, raw_status;
>  	irqreturn_t ret = IRQ_HANDLED;
> @@ -545,11 +535,6 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  
>  	cmd = host->cmd;
>  
> -	mrq = host->mrq;
> -
> -	if (WARN_ON(!mrq))
> -		return IRQ_NONE;
> -
>  	if (WARN_ON(!cmd))
>  		return IRQ_NONE;
>  
> @@ -598,7 +583,7 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  	else  {
>  		dev_warn(host->dev, "Unknown IRQ! status=0x%04x: MMC CMD%u arg=0x%08x flags=0x%08x stop=%d\n",
>  			 status, cmd->opcode, cmd->arg,
> -			 cmd->flags, mrq->stop ? 1 : 0);
> +			 cmd->flags, cmd->mrq->stop ? 1 : 0);
>  		if (cmd->data) {
>  			struct mmc_data *data = cmd->data;
>  
> @@ -623,14 +608,10 @@ static irqreturn_t meson_mmc_irq(int irq, void *dev_id)
>  static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>  {
>  	struct meson_host *host = dev_id;
> -	struct mmc_request *mrq = host->mrq;
>  	struct mmc_command *cmd = host->cmd;
>  	struct mmc_data *data;
>  	unsigned int xfer_bytes;
>  
> -	if (WARN_ON(!mrq))
> -		return IRQ_NONE;
> -
>  	if (WARN_ON(!cmd))
>  		return IRQ_NONE;
>  
> @@ -647,7 +628,7 @@ static irqreturn_t meson_mmc_irq_thread(int irq, void *dev_id)
>  	if (mmc_op_multi(cmd->opcode))
>  		meson_mmc_start_cmd(host->mmc, data->stop);
>  	else
> -		meson_mmc_request_done(host->mmc, mrq);
> +		meson_mmc_request_done(host->mmc, cmd->mrq);
>  
>  	return IRQ_HANDLED;
>  }

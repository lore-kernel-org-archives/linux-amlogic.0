From: ulf.hansson@linaro.org (Ulf Hansson)
Date: Thu, 30 Mar 2017 21:31:41 +0200
Subject: [PATCH 2/2] mmc: meson-gx: factor out setting response
 configuration bits
In-Reply-To: <aeb1c108-59c9-664d-ad5d-c28d95176f36@gmail.com>
References: <b9a9a85b-8975-abca-7901-b557ea7ccc13@gmail.com>
 <aeb1c108-59c9-664d-ad5d-c28d95176f36@gmail.com>
Message-ID: <CAPDyKFo7SDN+ncaJawDJ4=ZrspxnY2npGi7vwdSH19pj-qSjsw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 27 March 2017 at 22:02, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> Factor out setting the response configuration bits thus further reducing
> complexity of function meson_mmc_start_cmd.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>


Thanks, applied for next!

Kind regards
Uffe


> ---
>  drivers/mmc/host/meson-gx-mmc.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/mmc/host/meson-gx-mmc.c b/drivers/mmc/host/meson-gx-mmc.c
> index 0de32008..0036680b 100644
> --- a/drivers/mmc/host/meson-gx-mmc.c
> +++ b/drivers/mmc/host/meson-gx-mmc.c
> @@ -456,6 +456,23 @@ static void meson_mmc_set_blksz(struct mmc_host *mmc, unsigned int blksz)
>         writel(cfg, host->regs + SD_EMMC_CFG);
>  }
>
> +static void meson_mmc_set_response_bits(struct mmc_command *cmd, u32 *cmd_cfg)
> +{
> +       if (cmd->flags & MMC_RSP_PRESENT) {
> +               if (cmd->flags & MMC_RSP_136)
> +                       *cmd_cfg |= CMD_CFG_RESP_128;
> +               *cmd_cfg |= CMD_CFG_RESP_NUM;
> +
> +               if (!(cmd->flags & MMC_RSP_CRC))
> +                       *cmd_cfg |= CMD_CFG_RESP_NOCRC;
> +
> +               if (cmd->flags & MMC_RSP_BUSY)
> +                       *cmd_cfg |= CMD_CFG_R1B;
> +       } else {
> +               *cmd_cfg |= CMD_CFG_NO_RESP;
> +       }
> +}
> +
>  static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>  {
>         struct meson_host *host = mmc_priv(mmc);
> @@ -469,20 +486,7 @@ static void meson_mmc_start_cmd(struct mmc_host *mmc, struct mmc_command *cmd)
>         cmd_cfg |= FIELD_PREP(CMD_CFG_CMD_INDEX_MASK, cmd->opcode);
>         cmd_cfg |= CMD_CFG_OWNER;  /* owned by CPU */
>
> -       /* Response */
> -       if (cmd->flags & MMC_RSP_PRESENT) {
> -               if (cmd->flags & MMC_RSP_136)
> -                       cmd_cfg |= CMD_CFG_RESP_128;
> -               cmd_cfg |= CMD_CFG_RESP_NUM;
> -
> -               if (!(cmd->flags & MMC_RSP_CRC))
> -                       cmd_cfg |= CMD_CFG_RESP_NOCRC;
> -
> -               if (cmd->flags & MMC_RSP_BUSY)
> -                       cmd_cfg |= CMD_CFG_R1B;
> -       } else {
> -               cmd_cfg |= CMD_CFG_NO_RESP;
> -       }
> +       meson_mmc_set_response_bits(cmd, &cmd_cfg);
>
>         /* data? */
>         if (data) {
> --
> 2.12.1
>
>

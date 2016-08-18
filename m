From: sjg@chromium.org (Simon Glass)
Date: Wed, 17 Aug 2016 21:44:35 -0600
Subject: [PATCH 1/4] pinctrl: generic: scan for "pins" and "groups"
 properties in sub-nodes
In-Reply-To: <1471340990-16247-2-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
 <1471340990-16247-2-git-send-email-b.galvani@gmail.com>
Message-ID: <CAPnjgZ3jRtWwxdQaDFsQY-d_K6wYNgHOp9mjectcDp==e5F0Yg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 16 August 2016 at 03:49, Beniamino Galvani <b.galvani@gmail.com> wrote:
> In cases where the pins and groups definitions are in a sub-node, as:
>
>         uart_a {
>                 mux {
>                         groups = "uart_tx_a", "uart_rx_a";
>                         function = "uart_a";
>                 };
>         };
>
> pinctrl_generic_set_state_subnode() returns an error for the top-level
> node and pinctrl_generic_set_state() fails. Instead, return success so
> that the child nodes are tried.
>
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>  drivers/pinctrl/pinctrl-generic.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Simon Glass <sjg@chromium.org>

Masahiro, are you happy with this change?

We really need some pinctrl tests.

>
> diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-generic.c
> index e86b72a..baff40f 100644
> --- a/drivers/pinctrl/pinctrl-generic.c
> +++ b/drivers/pinctrl/pinctrl-generic.c
> @@ -312,8 +312,10 @@ static int pinctrl_generic_set_state_subnode(struct udevice *dev,
>                 is_group = true;
>                 strings_count = fdt_count_strings(fdt, node,
>                                                   subnode_target_type);
> -               if (strings_count < 0)
> -                       return -EINVAL;
> +               if (strings_count < 0) {
> +                       /* skip this node; may contain config child nodes */
> +                       return 0;
> +               }
>         }
>
>         for (i = 0; i < strings_count; i++) {
> --
> 2.7.4
>

Regards,
Simon

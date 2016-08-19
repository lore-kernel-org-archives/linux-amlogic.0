From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Fri, 19 Aug 2016 18:19:54 +0900
Subject: [U-Boot] [PATCH 1/4] pinctrl: generic: scan for "pins" and
 "groups" properties in sub-nodes
In-Reply-To: <1471340990-16247-2-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-1-git-send-email-b.galvani@gmail.com>
 <1471340990-16247-2-git-send-email-b.galvani@gmail.com>
Message-ID: <CAK7LNASNDMQUzp+Mri-o4VXjYFg4DLsXFz+m+JdnVCpcsa78AQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

2016-08-16 18:49 GMT+09:00 Beniamino Galvani <b.galvani@gmail.com>:
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


Looks good to me.  Thanks!

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>


-- 
Best Regards
Masahiro Yamada

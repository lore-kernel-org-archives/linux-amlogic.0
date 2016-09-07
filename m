From: trini@konsulko.com (Tom Rini)
Date: Wed, 7 Sep 2016 13:57:26 -0400
Subject: [U-Boot, 1/4] pinctrl: generic: scan for "pins" and "groups"
 properties in sub-nodes
In-Reply-To: <1471340990-16247-2-git-send-email-b.galvani@gmail.com>
References: <1471340990-16247-2-git-send-email-b.galvani@gmail.com>
Message-ID: <20160907175726.GN4990@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Aug 16, 2016 at 11:49:47AM +0200, Beniamino Galvani wrote:

> In cases where the pins and groups definitions are in a sub-node, as:
> 
> 	uart_a {
> 		mux {
> 			groups = "uart_tx_a", "uart_rx_a";
> 			function = "uart_a";
> 		};
> 	};
> 
> pinctrl_generic_set_state_subnode() returns an error for the top-level
> node and pinctrl_generic_set_state() fails. Instead, return success so
> that the child nodes are tried.
> 
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>
> Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to u-boot/master, thanks!

-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20160907/07d357f4/attachment.sig>

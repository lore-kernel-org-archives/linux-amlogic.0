From: trini@konsulko.com (Tom Rini)
Date: Sat, 4 Aug 2018 19:39:29 -0400
Subject: [U-Boot, u-boot, 2/2] clk: clk_meson: Add mux and div support
 for reparent and rate setting
In-Reply-To: <1532613244-4585-3-git-send-email-narmstrong@baylibre.com>
References: <1532613244-4585-3-git-send-email-narmstrong@baylibre.com>
Message-ID: <20180804233929.GQ32145@bill-the-cat>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, Jul 26, 2018 at 03:54:04PM +0200, Neil Armstrong wrote:

> This patch adds support for :
> - Rate calculation through muxes and generic dividers
> - Basic gate setting propagation
> - Reparenting for muxes
> - Clock rate setting through generic dividers without reparenting
> 
> Support is only added to the Composite VPU and VAPB clocks in order
> to support the Video Processing Unit Power Domain clock setup.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Simon Glass <sjg@chromium.org>

I get:
Building current source for 1 boards (1 thread, 16 jobs per thread)
   aarch64:  +   khadas-vim
+(khadas-vim) In file included from include/linux/bug.h:7:0,
+(khadas-vim)                  from include/common.h:25,
+(khadas-vim)                  from drivers/clk/clk_meson.c:8:
+(khadas-vim)   debug("%s: %sabling %d\n", __func__, on ? "en" : "dis", id);
+(khadas-vim)         ^
+(khadas-vim) include/linux/printk.h:37:21: note: in definition of macro 'pr_fmt'
+(khadas-vim)  #define pr_fmt(fmt) fmt
+(khadas-vim)                      ^~~
+(khadas-vim) include/log.h:141:2: note: in expansion of macro 'debug_cond'
+(khadas-vim)   debug_cond(_DEBUG, fmt, ##args)
+(khadas-vim)   ^~~~~~~~~~
+(khadas-vim) drivers/clk/clk_meson.c:198:2: note: in expansion of macro 'debug'
+(khadas-vim)   ^~~~~
+(khadas-vim)   debug("%s: really %sabling %d\n", __func__, on ? "en" : "dis", id);
+(khadas-vim) drivers/clk/clk_meson.c:218:2: note: in expansion of macro 'debug'
+(khadas-vim) arch/arm/dts/meson-gxl-s905x-khadas-vim.dtb: Warning (avoid_unnecessary_addr_size): /gpio-keys-polled: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
w+(khadas-vim) drivers/clk/clk_meson.c: In function 'meson_set_gate_by_id':
w+(khadas-vim) drivers/clk/clk_meson.c:198:8: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
w+(khadas-vim) drivers/clk/clk_meson.c:218:8: warning: format '%d' expects argument of type 'int', but argument 4 has type 'long unsigned int' [-Wformat=]
 
-- 
Tom
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20180804/86241ad4/attachment.sig>

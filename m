From: carlo@caione.org (Carlo Caione)
Date: Tue, 5 Jul 2016 20:55:27 +0200
Subject: [PATCH 1/7] clk: meson: Rename meson8b-clkc.c to reflect gxbb
 naming convention
In-Reply-To: <1467741391-60534-2-git-send-email-serveralex@gmail.com>
References: <1467741391-60534-1-git-send-email-serveralex@gmail.com>
 <1467741391-60534-2-git-send-email-serveralex@gmail.com>
Message-ID: <20160705185527.GA17348@localhost>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 05/07/16 19:56, Alexander M?ller wrote:
> Signed-off-by: Alexander M?ller <serveralex@gmail.com>
> ---
>  drivers/clk/meson/Makefile       |   2 +-
>  drivers/clk/meson/meson8b-clkc.c | 458 ---------------------------------------
>  drivers/clk/meson/meson8b.c      | 458 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 459 insertions(+), 459 deletions(-)
>  delete mode 100644 drivers/clk/meson/meson8b-clkc.c
>  create mode 100644 drivers/clk/meson/meson8b.c

Can you create the patch passing the '-M' parameter to git-format-patch
to detect renames?

Thanks,

-- 
Carlo Caione

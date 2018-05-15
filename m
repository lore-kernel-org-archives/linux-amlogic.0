From: festevam@gmail.com (Fabio Estevam)
Date: Tue, 15 May 2018 14:02:31 -0300
Subject: [PATCH] clk: meson: use SPDX license identifiers consistently
In-Reply-To: <20180515164229.4606-1-jbrunet@baylibre.com>
References: <20180515164229.4606-1-jbrunet@baylibre.com>
Message-ID: <CAOMZO5A20PRCgajpc7FaaWdGEGi13dV+dO9Z9SLDZEhxfs94Mw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, May 15, 2018 at 1:42 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> diff --git a/drivers/clk/meson/clk-audio-divider.c b/drivers/clk/meson/clk-audio-divider.c
> index f7ab5b1db342..ac0743cd0f2f 100644
> --- a/drivers/clk/meson/clk-audio-divider.c
> +++ b/drivers/clk/meson/clk-audio-divider.c
> @@ -1,18 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0+

Here you put GPL2.0+, but it should be GPL2.0 instead

>  /*
>   * Copyright (c) 2017 AmLogic, Inc.
>   * Author: Jerome Brunet <jbrunet@baylibre.com>
> - *
> - * This program is free software; you can redistribute it and/or modify it
> - * under the terms and conditions of the GNU General Public License,
> - * version 2, as published by the Free Software Foundation.

.... according to the original text.

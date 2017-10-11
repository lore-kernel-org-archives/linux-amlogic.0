From: linus.walleij@linaro.org (Linus Walleij)
Date: Wed, 11 Oct 2017 09:54:49 +0200
Subject: [PATCH] pinctrl: meson: remove unused pin_base
In-Reply-To: <20171006085407.27905-1-jbrunet@baylibre.com>
References: <20171006085407.27905-1-jbrunet@baylibre.com>
Message-ID: <CACRpkda7z==geUfZFGRXHiVLPaUcZU6s9Pub2VSa4UNuEUr4fw@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Fri, Oct 6, 2017 at 10:54 AM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> While removing the need to have pin_base defined in meson pinctrl
> drivers, I forgot to remove the corresponding field from the
> pinctrl_data structure.
>
> Fixing this now.
>
> Fixes: 70e5ecb1b994 ("pinctrl: meson: get rid of pin_base")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied with Kevin's reviewed-by.

Yours,
Linus Walleij

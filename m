From: linus.walleij@linaro.org (Linus Walleij)
Date: Thu, 21 Sep 2017 14:18:33 +0200
Subject: [PATCH] pinctrl: meson: fix incorrect usage of ENOSYS
In-Reply-To: <20170920140815.20776-1-jbrunet@baylibre.com>
References: <20170920140815.20776-1-jbrunet@baylibre.com>
Message-ID: <CACRpkdaiXX3Wn9XO=_U9iCCnJiXnrBWWUFMqz_6rygnLYi6uRQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Sep 20, 2017 at 4:08 PM, Jerome Brunet <jbrunet@baylibre.com> wrote:

> ENOSYS is special and should only be used for incorrect syscall number.
> It is not the case here. let's use ENOTSUPP instead.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Patch applied.

Yours,
Linus Walleij

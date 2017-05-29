From: linus.walleij@linaro.org (Linus Walleij)
Date: Mon, 29 May 2017 09:57:46 +0200
Subject: [PATCH RfC v4 2/6] irqchip: add Amlogic Meson GPIO irqchip driver
In-Reply-To: <b23d0417-a43b-a28c-3d9f-2be9bf6623f1@gmail.com>
References: <49ab677f-3165-d6f5-75f5-a963879e8ecf@gmail.com>
 <b23d0417-a43b-a28c-3d9f-2be9bf6623f1@gmail.com>
Message-ID: <CACRpkda+i8VN6a+5RiW3z9uNQ4UrvpzmTPe28S_Nk7ZdDgPfbA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, May 28, 2017 at 9:11 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Add a driver supporting the GPIO interrupt controller on certain
> Amlogic meson SoC's.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

This is a really nice approach.

If I get an ACK from one of the irqchip maintainers I can merge this
through the pin control tree along with the other stuff.

Yours,
Linus Walleij

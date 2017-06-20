From: linus.walleij@linaro.org (Linus Walleij)
Date: Tue, 20 Jun 2017 10:47:54 +0200
Subject: [PATCH v7 5/9] gpiolib: export gpiochip_irq_reqres and
 gpiochip_irq_relres
In-Reply-To: <e6618077-a362-86cf-7cd3-f46de39396e4@gmail.com>
References: <5b352c8d-a426-fa73-58b7-0c935979492b@gmail.com>
 <e6618077-a362-86cf-7cd3-f46de39396e4@gmail.com>
Message-ID: <CACRpkdaS2emkbWP6Rq=i_8obSqieecK7Sq80symcCcfw3mXoaA@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Jun 10, 2017 at 11:57 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> Customized versions of the request_resources and release_resources
> callbacks usually just extend what is available in gpiochip_irq_reqres
> and gpiochip_irq_relres. Therefore export them to make them available
> to gpio drivers.
>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

I'm not happy with this patch.

The gpiolib IRQchip abstraction was created to pull common
code into the gpiolib library so I get less mess of GPIO IRQ drivers
spread out all over the place.

This does the reverse and start to spread it all over the place again.

Can you think about a way to try to centralize what you are trying to
do into the gpiolib with a flag or special registration call or
similar?

I guess I don't understand the context, I guess this is part of the
problem Jerome is discussing with me in another thread.

Yours,
Linus Walleij

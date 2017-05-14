From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Sun, 14 May 2017 12:19:51 +0200
Subject: [PATCH v2 0/6] pintrl: meson: add support for GPIO IRQs
In-Reply-To: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
References: <36164ed8-aa59-2a77-b7fc-9adce03a2fc1@gmail.com>
Message-ID: <c9810441-66d7-fb5b-7e3a-57a236f2ff5d@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Heiner,

Am 12.05.2017 um 21:01 schrieb Heiner Kallweit:
> Heiner Kallweit (5):
>   pinctrl: meson: add interrupts to pinctrl data
>   pinctrl: meson: document GPIO IRQ DT binding
>   pinctrl: meson: add DT node for GPIO IRQ on Meson GX
>   pinctrl: meson: add DT node for GPIO IRQ on Meson 8 / 8b
>   pinctrl: meson: improve meson_get_bank and export it
>   pinctrl: meson: add support for GPIO interrupts

For some odd reason, all subjects of your actual patches arrived without
the c in pinctrl, but you have it spelled correctly above...

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)

From: carlo@caione.org (Carlo Caione)
Date: Wed, 22 Mar 2017 18:22:29 +0100
Subject: meson_uart: enabling the core clock for uart_A
In-Reply-To: <a415ddf8-ad5d-39bb-272b-f10589cf9963@gmail.com>
References: <a415ddf8-ad5d-39bb-272b-f10589cf9963@gmail.com>
Message-ID: <CAOQ7t2Z+HdqBQxSWCZ5CRkrVFVz3TnUBaxO3mUmam24PAdWS0Q@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Mar 22, 2017 at 5:58 PM, Helmut Klein <hgkr.klein@gmail.com> wrote:
> Hallo Carlo,
>
> the u-boot of my s905 based media player (netxeon minimx, p200 compatible)
> doesn't enable the core clock for uart_A. therefore my bluetooth adapter,
> which is connected to this device, isn't operational.

weird. Which kernel are you using?

> i've added some lines, extracted from amlogic's driver, to meson_uart.c and
> modified the clock header files, to be able to add the core clock info to
> the dtb.
>
> May i send you the patches?

Send the patches to the Amlogic ML.

> if yes, which git tree should i use as the base?

Probably the integration branch is the better choice
https://git.kernel.org/cgit/linux/kernel/git/khilman/linux-amlogic.git

Cheers,

-- 
Carlo Caione

From: robh+dt@kernel.org (Rob Herring)
Date: Mon, 29 Oct 2018 15:09:35 -0500
Subject: [PATCH 0/2] meson6_timer: dt-bindings updates
In-Reply-To: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
References: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
Message-ID: <CAL_Jsq+q4NX+19zuD2LErdFbZ-WJKdXhrGM3AXVoeWOuiDDhSg@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Oct 28, 2018 at 7:35 AM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> The dt-bindings don't match the actual IP block implementation:
> - each timer has four IRQ lines (Timer A, B, C and D)
> - the IP block has internal dividers which use XTAL as parent clock.
>   the result can then be used as timebase for Timers A, B, C, D and E.
>   internal dividers are (XTAL is running at 24MHz): 24 for 1us, 240 for
>   10us, 2400 for 100us and 24000 for 1ms.
> - Timer E can use the "system clock" (clk81) as timebase
>
> I'm not sure whether these patches will go through tip.git or Kevin's
> linux-amlogic tree. Daniel, Thomas: please let Kevin know if he should
> take these through his drivers branch

Normally would be the subsystem tree, but I'm happy to take binding
only changes thru the DT tree. We just can't have them go thru a
mixture of trees if you have further changes.

Are these fixes to reflect what the dts files and timers already
expect? If so, they should be applied for 4.20. If not, you should
have one series with all the updates.

> Martin Blumenstingl (2):
>   dt-bindings: timer: meson6_timer: document all interrupts
>   dt-bindings: timer: meson6_timer: document the clock inputs

Resend to the DT list if you want me to apply. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

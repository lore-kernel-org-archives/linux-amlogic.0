From: robh+dt@kernel.org (Rob Herring)
Date: Mon, 29 Oct 2018 18:26:00 -0500
Subject: [PATCH 0/2] meson6_timer: dt-bindings updates
In-Reply-To: <CAFBinCATZhuNn8aTEPS1zEYX_1PjRyuEpzqyzu6bpVCwNvUbqQ@mail.gmail.com>
References: <20181028123514.12660-1-martin.blumenstingl@googlemail.com>
 <CAL_Jsq+q4NX+19zuD2LErdFbZ-WJKdXhrGM3AXVoeWOuiDDhSg@mail.gmail.com>
 <CAFBinCATZhuNn8aTEPS1zEYX_1PjRyuEpzqyzu6bpVCwNvUbqQ@mail.gmail.com>
Message-ID: <CAL_JsqK_jE9+tFXYb3BZbGmpVtiqPZir9ak_yn5u+3aBqCj8qQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, Oct 29, 2018 at 4:23 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
>
> Hi Rob,
>
> On Mon, Oct 29, 2018 at 9:09 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Sun, Oct 28, 2018 at 7:35 AM Martin Blumenstingl
> > <martin.blumenstingl@googlemail.com> wrote:
> > >
> > > The dt-bindings don't match the actual IP block implementation:
> > > - each timer has four IRQ lines (Timer A, B, C and D)
> > > - the IP block has internal dividers which use XTAL as parent clock.
> > >   the result can then be used as timebase for Timers A, B, C, D and E.
> > >   internal dividers are (XTAL is running at 24MHz): 24 for 1us, 240 for
> > >   10us, 2400 for 100us and 24000 for 1ms.
> > > - Timer E can use the "system clock" (clk81) as timebase
> > >
> > > I'm not sure whether these patches will go through tip.git or Kevin's
> > > linux-amlogic tree. Daniel, Thomas: please let Kevin know if he should
> > > take these through his drivers branch
> >
> > Normally would be the subsystem tree, but I'm happy to take binding
> > only changes thru the DT tree. We just can't have them go thru a
> > mixture of trees if you have further changes.
> >
> > Are these fixes to reflect what the dts files and timers already
> > expect? If so, they should be applied for 4.20. If not, you should
> > have one series with all the updates.
> both the meson6_timer driver and the .dts currently only specify one
> interrupt and nothing else
>
> I have .dts patches in my tree which add the missing interrupts and the clocks
> however, I prefer to send the .dts patches later as I have two other
> pending patch series which are modifying the same .dts files
> thus I'd like to re-send the two patches from this series (with your
> Reviewed-by) together with the .dts changes
>
> can you please confirm that Kevin can take everything through his
> linux-amlogic tree (dt-bindings patches probably in his drivers
> branch, .dts patches in his dt branch) if the clocksource maintainers
> don't care either?

Yeah, that should be fine.

Rob

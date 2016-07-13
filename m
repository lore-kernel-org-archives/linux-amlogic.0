From: mark.rutland@arm.com (Mark Rutland)
Date: Wed, 13 Jul 2016 12:25:26 +0100
Subject: [PATCH v3 2/4] meson-rtc: add device-tree binding
In-Reply-To: <51411c13-8cb4-3623-f70e-03b4190655f2@codethink.co.uk>
References: <1467748122-14833-1-git-send-email-ben.dooks@codethink.co.uk>
 <1467748122-14833-4-git-send-email-ben.dooks@codethink.co.uk>
 <5785D83C.2000809@gmail.com>
 <51411c13-8cb4-3623-f70e-03b4190655f2@codethink.co.uk>
Message-ID: <20160713112525.GI14522@leverpostej>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Wed, Jul 13, 2016 at 10:09:44AM +0100, Ben Dooks wrote:
> On 13/07/16 06:57, Frank Rowand wrote:
> > On 07/05/16 12:48, Ben Dooks wrote:
> >> Add documentation for the AMLogic Meson RTC.
> >>
> >> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> >> Acked-by: Rob Herring <robh@kernel.org>
> >> ---
> >>  .../devicetree/bindings/rtc/rtc-amlogic.txt         | 21 +++++++++++++++++++++
> >>  1 file changed, 21 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/rtc/rtc-amlogic.txt
> > 
> > Hi Ben,
> > 
> > I suspect you already know this since you have Rob's ack, but you need to
> > send bindings to
> > 
> >   Rob Herring <robh+dt@kernel.org>
> >   Mark Rutland <mark.rutland@arm.com>
> 
> Sorry, missed copying the email when sending.
> 
> I hope he's seen them from being on the devicetree at vger.kernel.org
> list? I've added him as an CC: on this one to check.

>From my perspective, having devicetree at vger.kernel.org alone is fine. I
appreciate tastes vary across maintainers, either way is fine by me. :)

You already have Rob's ack, which is sufficient, but FWIW the patch
looks fine, so feel free to add mine:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Thanks,
Mark.

From: stern@rowland.harvard.edu (Alan Stern)
Date: Thu, 12 Oct 2017 17:17:01 -0400 (EDT)
Subject: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation
 for USB root-hub
In-Reply-To: <CAFBinCCc+Fj6wwGk+OLNQTHEYU8xBPe7OGHVSQ82kMew3xUsww@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1710121715390.1278-100000@iolanthe.rowland.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, 12 Oct 2017, Martin Blumenstingl wrote:

> I haven't tested the described use-case. however, this patch is not
> supposed to change the binding for actual devices.
> USB device numbering starts at 1, while 0 is reserved for the root-hub
> (at least from what I know).

Actually 1 is reserved for the root hub.  External devices are numbered 
starting from 2.  (We can't use 0 for the root hub because, as you 
said, USB device numbering starts at 1!)

Alan Stern

> before this patch there was no way to
> describe the root-hub via .dts. this however is required for some
> platforms that need to set up a PHY for each port on the root-hub
> (Amlogic Meson GXL platform is one example: there are two ports
> enabled on dwc3's root-hub with 2x USB2 and 1x USB3 PHYs) - so this
> patch uses a similar binding as we already have (to describe the
> devices) to describe the root-hub
> 
> 
> Regards,
> Martin
> --
> To unsubscribe from this list: send the line "unsubscribe linux-usb" in
> the body of a message to majordomo at vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 

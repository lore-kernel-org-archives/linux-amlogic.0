From: stern@rowland.harvard.edu (Alan Stern)
Date: Fri, 13 Oct 2017 10:15:05 -0400 (EDT)
Subject: [RFC usb-next v5 1/3] dt-bindings: usb: add the documentation
 for USB root-hub
In-Reply-To: <CAFBinCBwzzzj-ew-VTb9zojfzC9gedHd0uu0ez4WejBRTpnsWg@mail.gmail.com>
Message-ID: <Pine.LNX.4.44L0.1710131008390.1364-100000@iolanthe.rowland.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Thu, 12 Oct 2017, Martin Blumenstingl wrote:

> Hi Alan,
> 
> On Thu, Oct 12, 2017 at 11:17 PM, Alan Stern <stern@rowland.harvard.edu> wrote:
> > On Thu, 12 Oct 2017, Martin Blumenstingl wrote:
> >
> >> I haven't tested the described use-case. however, this patch is not
> >> supposed to change the binding for actual devices.
> >> USB device numbering starts at 1, while 0 is reserved for the root-hub
> >> (at least from what I know).
> >
> > Actually 1 is reserved for the root hub.  External devices are numbered
> > starting from 2.  (We can't use 0 for the root hub because, as you
> > said, USB device numbering starts at 1!)
> I just had a look at lsusb again:
> $ lsusb -t
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 5000M
> 
> however, for the devicetree bindings the devices are supposed to use 1-31: [0]
> 
> Alan: just to make sure I understood you correctly: do you agree with
> this patch?

I have no idea.  I haven't read the patch and I'm not familiar with the
details of DeviceTree.  I was just trying to clear up your
misunderstanding of USB device numbering.

Alan Stern

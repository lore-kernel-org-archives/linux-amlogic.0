From: gregkh@linuxfoundation.org (Greg KH)
Date: Tue, 27 Mar 2018 11:00:04 +0200
Subject: [RFC usb-next v3 1/2] usb: core: split
 usb_phy_roothub_{init,alloc}
In-Reply-To: <05b749dc-c8e6-260f-287d-7b3e8f599d13@ti.com>
References: <20180326203846.7248-1-martin.blumenstingl@googlemail.com>
 <20180326203846.7248-2-martin.blumenstingl@googlemail.com>
 <05b749dc-c8e6-260f-287d-7b3e8f599d13@ti.com>
Message-ID: <20180327090004.GA6649@kroah.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Tue, Mar 27, 2018 at 11:24:08AM +0300, Roger Quadros wrote:
> On 26/03/18 23:38, Martin Blumenstingl wrote:
> > Before this patch usb_phy_roothub_init served two purposes (from a
> > caller's point of view - like hcd.c):
> > - parsing the PHYs and allocating the list entries
> > - calling phy_init on each list entry
> > 
> > While this worked so far it has one disadvantage: if we need to call
> > phy_init for each PHY instance then the existing code cannot be re-used.
> > Solve this by splitting off usb_phy_roothub_alloc which only parses the
> > PHYs and allocates the list entries.
> > usb_phy_roothub_init then gets a struct usb_phy_roothub and only calls
> > phy_init on each PHY instance (along with the corresponding cleanup if
> > that failed somewhere).
> > 
> > This is a preparation step for adding proper suspend support for some
> > hardware that requires phy_exit to be called during suspend and phy_init
> > to be called during resume.
> > 
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> I don't think we need RFC in subject.

As I don't apply series with RFC in the subject, that might be a good
idea :)

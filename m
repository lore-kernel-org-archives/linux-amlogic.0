From: gregkh@linuxfoundation.org (Greg KH)
Date: Mon, 23 Apr 2018 09:39:35 +0200
Subject: [PATCH usb v6 6/6] usb: core: phy: add the
 SPDX-License-Identifier and include guard
In-Reply-To: <CAFBinCBv+zwjjjA_HeDY_e=aZwVpktzqM7wszZ-Ejvid+ZBe-A@mail.gmail.com>
References: <20180418193951.17922-1-martin.blumenstingl@googlemail.com>
 <20180418193951.17922-7-martin.blumenstingl@googlemail.com>
 <20180422130109.GA5781@kroah.com>
 <CAFBinCBv+zwjjjA_HeDY_e=aZwVpktzqM7wszZ-Ejvid+ZBe-A@mail.gmail.com>
Message-ID: <20180423073935.GA2484@kroah.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Apr 22, 2018 at 09:41:56PM +0200, Martin Blumenstingl wrote:
> Hi Greg,
> 
> On Sun, Apr 22, 2018 at 3:01 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> > On Wed, Apr 18, 2018 at 09:39:51PM +0200, Martin Blumenstingl wrote:
> >> This clarifies the license of the code. While here also add an include
> >> guard to the header file.
> >>
> >> Fixes: 07dbff0ddbd86c ("usb: core: add a wrapper for the USB PHYs on the HCD")
> >> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> >> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> >> ---
> >>  drivers/usb/core/phy.h | 12 ++++++++++++
> >>  1 file changed, 12 insertions(+)
> >>
> >> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
> >> index bbc969383074..88a3c037e9df 100644
> >> --- a/drivers/usb/core/phy.h
> >> +++ b/drivers/usb/core/phy.h
> >> @@ -1,3 +1,13 @@
> >> +/* SPDX-License-Identifier: GPL-2.0+ */
> >
> > Do you _really_ mean GPLv2 or anything later?
> drivers/usb/core/hcd.c uses the same license identifier
> that code is much more "valuable" than my few lines which manage a
> list of PHYs - so I'm fine with "GPLv2 or anything later"
> 
> > I have to ask...
> if you see any problems with this (for example that phy.h couldn't be
> used from some special module with another license, ...) then please
> let me know

Nope, that's fine, thanks for the quick response, I'll go apply this
now.

greg k-h

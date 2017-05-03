From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Wed, 3 May 2017 13:02:57 +0200
Subject: ZoomTak UPlus flashing
In-Reply-To: <b10a39fd-5fc9-0179-3869-f61b9c8c2349@gmail.com>
References: <851f5607-17c3-a811-6f52-80e1eac111b1@gmail.com>
 <7ce87c03-17eb-7ad0-9c0f-2541dca2b5f9@suse.de>
 <b10a39fd-5fc9-0179-3869-f61b9c8c2349@gmail.com>
Message-ID: <b2d10a10-f1e2-30cd-f9cb-340b2602d99d@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hey David,

Am 03.05.2017 um 03:39 schrieb David Marceau:
> Odroid c2 device advantages:
[...]
> RECOMMENDATIONS
> ===============
> 
> To encourage more archlinux/amlogic s905 odroid c2 users to do more
> newer kernel testing, here is what I would recommend:
[snip]

SUSE is clearly the wrong addressee for complaints about Arch Linux!!!

My JeOS-odroidc2 openSUSE Tumbleweed images do use GRUB, making it very
easy to switch between multiple kernels; the only part requiring manual
updates for us is U-Boot. This is all Open Source and mainline (and we
published a paper "UEFI on top of U-Boot" at Embedded World Conference
2017 - copy available on request). If your Linux distro doesn't use the
existing bootloader mechanisms, you need to contact them instead.

https://en.opensuse.org/HCL:OdroidC2

You specifically asked about flashing your S912 TV box, which my
response (and the subject) was about. If you have other topics, don't
address them to random people that happened to reply to unrelated
questions, and pose your questions clearly, without top-posting.
Remember, this mailing list is about the mainline Linux kernel, not
about random "amlogic images", whatever exactly you mean by that.
Providing pre-built images is what distros do, not the kernel community.

You also seem to have some misconceptions about eMMC: It will be a chip
soldered onto the main PCB of your TV box. Ball Grid Array (BGA) means
that the contacts are on the bottom of your chip, so you have no
realistic chance to find a "reader/writer" for it like there is for the
Odroid-C2. Had you taken any look inside your box you would've noticed
that... Which is why I was cautioning about making changes to flash and
instead suggesting to investigate things in a safe backup made from your
Android, on another machine.

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)

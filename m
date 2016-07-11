From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Mon, 11 Jul 2016 05:57:57 +0200
Subject: [U-Boot] [PATCH v7 0/4] Amlogic Meson GXBaby and ODROID-C2 support
In-Reply-To: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
References: <1462689017-3160-1-git-send-email-b.galvani@gmail.com>
Message-ID: <57831945.2040009@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi,

Am 08.05.2016 um 08:30 schrieb Beniamino Galvani:
> this series adds a very basic support for Amlogic S905 SoC (GXBaby)
> and for the ODROID-C2 board [1], and is based on u-boot sources
> available from the board vendor [2]. At the moment the only supported
> devices are the integrated UART and Ethernet adapter.

On current master with these four patches merged, should I expect to see
any output after BL31? o.O

Note that the README is outdated in that Hardkernel now has sources for
fip_create and no binary any more. I've verified that the behavior is
the same when using the binary and the self-compiled tool. Last output:

NOTICE:  BL3-1: v1.0(debug):4d2e34d
NOTICE:  BL3-1: Built : 17:08:35, Oct 29 2015
INFO:    BL3-1: Initializing runtime services
INFO:    BL3-1: Preparing for EL3 exit to normal world
INFO:    BL3-1: Next image address = 0x1000000
INFO:    BL3-1: Next image spsr = 0x3c9

I.e., no U-Boot SPL output on serial.

Regards,
Andreas

P.S. The upstream arm-trusted-firmware fip_create tool doesn't know
about --bl30 and --bl301 btw, anyone any insights?

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)

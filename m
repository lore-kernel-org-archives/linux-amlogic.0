From: carlo@caione.org (Carlo Caione)
Date: Fri, 20 May 2016 08:27:00 +0200
Subject: [PATCH 0/2] Add support for Amlogic Meson MMC controller
In-Reply-To: <573E97BB.1090903@gmail.com>
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
 <573E97BB.1090903@gmail.com>
Message-ID: <20160520062700.GA16199@mephisto>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 19/05/16 21:51, Robert Gadsdon wrote:
> Applied this on my Odroid C2, and it worked OK when installed on the
> SDcard, but failed when installed on the eMMC module:
> 
> => version
> U-Boot 2016.05-rc3 (May 14 2016 - 21:06:28 -0700) odroid-c2
> aarch64-linux-gnu-gcc (GCC) 5.3.1 20160212 (Red Hat Cross 5.3.1-2)
> GNU ld version 2.26.20160125
> 
> => mmc info
> Card did not respond to voltage select!

Yes, this is expected since the muxing in the board file is only
enabling the SDcard. Could you try to set the correct muxing also for
the eMMC and check again?

Unfortunately I don't have an eMMC for the Odroid-C2 to check this out.
I'll try to prepare a board file also for the P20x so I can test this
better.

Thank you for testing this BTW.

Cheers,

-- 
Carlo Caione

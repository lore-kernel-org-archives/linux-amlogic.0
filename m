From: rhgadsdon@gmail.com (Robert Gadsdon)
Date: Thu, 19 May 2016 21:51:07 -0700
Subject: [PATCH 0/2] Add support for Amlogic Meson MMC controller
In-Reply-To: <1463056902-8533-1-git-send-email-carlo@caione.org>
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
Message-ID: <573E97BB.1090903@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Applied this on my Odroid C2, and it worked OK when installed on the
SDcard, but failed when installed on the eMMC module:

=> version
U-Boot 2016.05-rc3 (May 14 2016 - 21:06:28 -0700) odroid-c2
aarch64-linux-gnu-gcc (GCC) 5.3.1 20160212 (Red Hat Cross 5.3.1-2)
GNU ld version 2.26.20160125

=> mmc info
Card did not respond to voltage select!

Robert Gadsdon.

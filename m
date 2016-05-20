From: carlo@caione.org (Carlo Caione)
Date: Fri, 20 May 2016 10:07:32 +0200
Subject: [PATCH 0/2] Add support for Amlogic Meson MMC controller
In-Reply-To: <20160520062700.GA16199@mephisto>
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
 <573E97BB.1090903@gmail.com> <20160520062700.GA16199@mephisto>
Message-ID: <20160520080732.GA16732@mephisto>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 20/05/16 08:27, Carlo Caione wrote:
> On 19/05/16 21:51, Robert Gadsdon wrote:
> > Applied this on my Odroid C2, and it worked OK when installed on the
> > SDcard, but failed when installed on the eMMC module:

Oh, reading this again you meant that you put u-boot directly on the
eMMC? Ok then, something is wrong when using the driver with the eMMC.

I'll try to boot it on the P20x and check what's wrong with it.

Thanks,

-- 
Carlo Caione

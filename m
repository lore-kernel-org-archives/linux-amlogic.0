From: rhgadsdon@gmail.com (Robert Gadsdon)
Date: Fri, 20 May 2016 11:58:51 -0700
Subject: [PATCH 0/2] Add support for Amlogic Meson MMC controller
In-Reply-To: <20160520080732.GA16732@mephisto>
References: <1463056902-8533-1-git-send-email-carlo@caione.org>
 <573E97BB.1090903@gmail.com> <20160520062700.GA16199@mephisto>
 <20160520080732.GA16732@mephisto>
Message-ID: <573F5E6B.5010208@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 05/20/2016 01:07 AM, Carlo Caione wrote:
> On 20/05/16 08:27, Carlo Caione wrote:
>> On 19/05/16 21:51, Robert Gadsdon wrote:
>>> Applied this on my Odroid C2, and it worked OK when installed on the
>>> SDcard, but failed when installed on the eMMC module:
> 
> Oh, reading this again you meant that you put u-boot directly on the
> eMMC? Ok then, something is wrong when using the driver with the eMMC.
> 

Yes, I installed it directly on the eMMC, using the micro-sd adapter,
and following the same instructions as for the SDcard..

Robert Gadsdon.

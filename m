From: narmstrong@baylibre.com (Neil Armstrong)
Date: Fri, 24 Jun 2016 16:29:06 +0200
Subject: S805 RTC driver
In-Reply-To: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
References: <1466713278-24419-1-git-send-email-ben.dooks@codethink.co.uk>
Message-ID: <576D43B2.9060404@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On 06/23/2016 10:21 PM, Ben Dooks wrote:
> This has been sitting in my tree for a while, so I thought
> it would be a good idea to try and get it moving along and
> possibly submittied soon.
> 
> I've not been able to fully test this as I don't have an
> S805 MMC driver to allow me to boot to a userland on my
> ODroid-C1 board.

You could generate a dummy buildroot initramfs loaded in the Image with the RTC tools.

Neil

> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

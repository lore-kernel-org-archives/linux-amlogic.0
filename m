From: narmstrong@baylibre.com (Neil Armstrong)
Date: Thu, 23 Mar 2017 08:43:40 +0100
Subject: [PATCH 0/4] meson_uart: add support for core clock handling
In-Reply-To: <839065e6-8329-068f-8da3-7d0163ac37e0@gmail.com>
References: <839065e6-8329-068f-8da3-7d0163ac37e0@gmail.com>
Message-ID: <58D37CAC.7030902@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Le 22/03/2017 21:45, Helmut Klein a ?crit :
> to be able to use the none AO uarts of the s905 SoCs, the core clock has to be enabled.
> (see chapter 22.3 of the public s905 data sheet)
> at least the u-boot of my s905 based media player (netxeon minimx) doesn't do this.
> so the driver has to do this.
> 
> this patch set does:
> - exposes the CLKID_UART0 to the dtb
> - adds documentation for the dt-bindings of meson_uart
> - adds the core clock handling to the driver
> 
> none of the available s905 dts use uart_A actively. so there is no patch for any of the existing dts files.

Hi Heiner,

Thanks for these patches, I'm surprise neither the gate clock handling or the dt-bindings were pushed with the serial driver.

Nevertheless, please use the git "format-patch" tool to generate the patchset.

My steps to generate a patchset are :

- Order all the commits in the order and form you want to have them sent
- Use "git rebase -i" to reword (change commit message), change order or edit each patches
- When you have a clean set, generate the email files with :
# git format-patch -3 -s --cover-letter -o my-patchset-directory/
The "-3" gives the number of patches to extract
The "-s" will add the Signed-off-by tag
The "--cover-letter" will generate the 0000-cover-letter to fill up
- Then fill the cover letter and check all your patches with scripts/checkpatch.pl
- When it's clean, get the maintainers emails with scripts/get_maintainer.pl
- Then send them with the "git send-email" tool :
# git send-email my-patchset-directory/*

If you have more questions, please ask ! It's not easy to understand, but it will save you a lot of time !

Neil

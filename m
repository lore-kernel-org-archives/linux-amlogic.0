From: hgkr.klein@gmail.com (Helmut Klein)
Date: Wed, 22 Mar 2017 21:45:32 +0100
Subject: [PATCH 0/4] meson_uart: add support for core clock handling
Message-ID: <839065e6-8329-068f-8da3-7d0163ac37e0@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

to be able to use the none AO uarts of the s905 SoCs, the core clock has 
to be enabled.
(see chapter 22.3 of the public s905 data sheet)
at least the u-boot of my s905 based media player (netxeon minimx) 
doesn't do this.
so the driver has to do this.

this patch set does:
- exposes the CLKID_UART0 to the dtb
- adds documentation for the dt-bindings of meson_uart
- adds the core clock handling to the driver

none of the available s905 dts use uart_A actively. so there is no patch 
for any of the existing dts files.

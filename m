From: hgkr.klein@gmail.com (Helmut Klein)
Date: Wed, 22 Mar 2017 17:58:13 +0100
Subject: meson_uart: enabling the core clock for uart_A
Message-ID: <a415ddf8-ad5d-39bb-272b-f10589cf9963@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hallo Carlo,

the u-boot of my s905 based media player (netxeon minimx, p200 
compatible) doesn't enable the core clock for uart_A. therefore my 
bluetooth adapter, which is connected to this device, isn't operational.

i've added some lines, extracted from amlogic's driver, to meson_uart.c 
and modified the clock header files, to be able to add the core clock 
info to the dtb.

May i send you the patches?

if yes, which git tree should i use as the base?

regards
Helmut

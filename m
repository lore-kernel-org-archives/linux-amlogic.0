From: ldevulder@suse.de (Loic Devulder)
Date: Wed, 21 Nov 2018 00:53:24 +0100
Subject: [U-Boot] [PATCH u-boot] spi: Add Amlogic Meson SPI Flash
 Controller driver
In-Reply-To: <d3aed81a-71fe-563e-fc63-9bc85b0a3588@suse.de>
References: <1541496359-18064-1-git-send-email-narmstrong@baylibre.com>
 <d3aed81a-71fe-563e-fc63-9bc85b0a3588@suse.de>
Message-ID: <c6e73efc-dc05-0434-b1c5-295efc539f68@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Neil,

I just saw that you found a bug and you will send a v2 patch, so I will
retest it with the new version.

On 11/21/18 12:45 AM, Loic Devulder wrote:
> Hi Neil,
> 
> I was able to detect the W25Q16FW SPI flash of my Khadas VIM2 with your
> patch:
> => sspi
> SF: Detected w25q16dw with page size 256 Bytes, erase size 4 KiB, total
> 2 MiB
> 
> => sf probe
> SF: Detected w25q16dw with page size 256 Bytes, erase size 4 KiB, total
> 2 MiB
> 
> So, you can add a "Tested-by: Loic Devulder <ldevulder@suse.de>" :)
> 
> On 11/6/18 10:25 AM, Neil Armstrong wrote:
>> The Amlogic Meson SoCs embeds a Flash oriented SPI Controller name SPIFC.
>> This driver, ported from the Linux meson-spi-spifc driver, add support
>> for this controller on the Amlogic Meson GX SoCs in U-Boot.
>>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>

[ ... ]

-- 
Loic Devulder <ldevulder@suse.com> | ldevulder at irc
0x175A963893C85F55 | D220 DEF5 56A3 DE00 9DAA 78BA 175A 9638 93C8 5F55
Senior QA Engineer | Container & Storage Solutions Quality Assurance
team (qa-css)
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nuernberg, Germany
GF: F. Imend?rffer, J. Smithard, J. Guild, D. Upmanyu, G. Norton HRB,
21284 (AG Nuernberg)

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 488 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181121/7cd9d3af/attachment.sig>

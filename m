From: afaerber@suse.de (=?UTF-8?Q?Andreas_F=c3=a4rber?=)
Date: Sun, 26 Nov 2017 14:48:44 +0100
Subject: [U-Boot] [PATCH v2 5/5] arm: Add Khadas VIM support based on
 Meson GXL family
In-Reply-To: <CAPnjgZ2Bcv==RCoJmdZyVG1uqzBQDXTUL8hTcQ3we-qWC5Jc8g@mail.gmail.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
 <1511357151-3771-6-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ2Bcv==RCoJmdZyVG1uqzBQDXTUL8hTcQ3we-qWC5Jc8g@mail.gmail.com>
Message-ID: <82d31d94-29cc-ed99-32f1-f9ea8dc121bb@suse.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Simon,

Am 24.11.2017 um 23:35 schrieb Simon Glass:
> On 22 November 2017 at 06:25, Neil Armstrong <narmstrong@baylibre.com> wrote:
>> +Go back to mainline U-Boot source tree then :
>> + > mkdir fip
>> +
>> + > cp $FIPDIR/gxl/bl2.bin fip/
>> + > cp $FIPDIR/gxl/acs.bin fip/
>> + > cp $FIPDIR/gxl/bl21.bin fip/
>> + > cp $FIPDIR/gxl/bl30.bin fip/
>> + > cp $FIPDIR/gxl/bl301.bin fip/
>> + > cp $FIPDIR/gxl/bl31.img fip/
>> + > cp u-boot.bin fip/bl33.bin
>> +
>> + > $FIPDIR/blx_fix.sh \
>> +       fip/bl30.bin \
>> +       fip/zero_tmp \
>> +       fip/bl30_zero.bin \
>> +       fip/bl301.bin \
>> +       fip/bl301_zero.bin \
>> +       fip/bl30_new.bin \
>> +       bl30
>> +
>> + > $FIPDIR/acs_tool.pyc fip/bl2.bin fip/bl2_acs.bin fip/acs.bin 0
>> +
>> + > $FIPDIR/blx_fix.sh \
>> +       fip/bl2_acs.bin \
>> +       fip/zero_tmp \
>> +       fip/bl2_zero.bin \
>> +       fip/bl21.bin \
>> +       fip/bl21_zero.bin \
>> +       fip/bl2_new.bin \
>> +       bl2
>> +
>> + > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl30_new.bin
>> + > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl31.img
>> + > $FIPDIR/gxl/aml_encrypt_gxl --bl3enc --input fip/bl33.bin
>> + > $FIPDIR/gxl/aml_encrypt_gxl --bl2sig --input fip/bl2_new.bin --output fip/bl2.n.bin.sig
>> + > $FIPDIR/gxl/aml_encrypt_gxl --bootmk \
>> +               --output fip/u-boot.bin \
>> +               --bl2 fip/bl2.n.bin.sig \
>> +               --bl30 fip/bl30_new.bin.enc \
>> +               --bl31 fip/bl31.img.enc \
>> +               --bl33 fip/bl33.bin.enc
>> +
>> +and then write the image to SD with:
>> +
>> + > DEV=/dev/your_sd_device
>> + > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=512 skip=1 seek=1
>> + > dd if=fip/u-boot.bin.sd.bin of=$DEV conv=fsync,notrunc bs=1 count=444
> 
> This bit (from 'got back to U-Boot sources') seems like a job for
> binman, as I just mentioned in the other patch.

I'm not familiar with binman either but would like to point out that
I've authored Open Source meson-tools for GXBB that could/should/will be
adapted to GXL at some point, too.

https://github.com/afaerber/meson-tools

So I'll be strictly opposed to hiding the above instructions from users
or to hardcoding the use of non-free x86_64-only tools inside U-Boot!

Regards,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 N?rnberg, Germany
GF: Felix Imend?rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N?rnberg)

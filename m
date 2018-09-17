From: narmstrong@baylibre.com (Neil Armstrong)
Date: Mon, 17 Sep 2018 20:42:44 +0200
Subject: Fwd: Possible ROOTFS issue?
In-Reply-To: <bf22971f-4ee9-dfb0-4330-422eccb521ca@gmail.com>
References: <CAPzmcFtKaoyE+Ox3bWTX01wFe4SYvYqvMifgsor7UgyFxWEB0g@mail.gmail.com>
 <CAPzmcFsdgfBLNv51hi0DGG1Cm-Sb4iSSE=U9CtOS=jb_ZWAVeQ@mail.gmail.com>
 <bf22971f-4ee9-dfb0-4330-422eccb521ca@gmail.com>
Message-ID: <168d9839-ddfe-520b-13b7-6419a68b2097@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

hi,

Yes, but since the kernel can crash early, please use :

setenv bootargs "console=ttyAML0,115200 earlycon"

to have debug output from the beginning of the kernel boot.

Neil

On 17/09/2018 20:08, MOHAMMAD RASIM wrote:
> Hi,
> 
> Mainline kernel renamed the Uart device node and because you use the vendor U-boot it passes the wrong name to the kernel so you need to set the console boot parameter before booting, something like this
> 
> setenv bootargs "console=ttyAML0,115200"
> 
> run it before running the bootm command
> 
> 
> Regards
> 
> On 9/17/18 3:19 PM, Joe Foster wrote:
>> Good morning,
>>
>> I have come from an OpenWRT background and am currently trying to
>> compile Linux for an S905x A95x unit (the tidy little Nexbox unit) due
>> to its exception tech spec vs its cost.
>>
>> I have compile the kernel as per instructions and via a UART
>> connection I am getting the below output.
>> Is this normal as their is no Root File Structure native to the kernel
>> compile, especially no BusyBox which would permit something /
>> anything. I have also compiled a rootfs from
>> (http://openlinux.amlogic.com:8000/download/ARM/filesystem/) and put
>> on a second ext4 partition on the same USB stick.
>>
>> It seems to only be reaching half way.
>>
>> ######################## SERIAL OUTPUT ######################
>> gxl_p212_v1#usb start
>>
>> (Re)start USB...
>> USB0:?? USB3.0 XHCI init start
>> Register 2000140 NbrPorts 2
>> Starting the controller
>> USB XHCI 1.00
>> scanning bus 0 for devices... 2 USB Device(s) found
>> ??????? scanning usb for storage devices... init_part() 278: PART_TYPE_DOS
>> 1 Storage Device(s) found
>> gxl_p212_v1#fatload usb 0:1 0x01080000 uImage
>>
>> reading uImage
>> 18424384 bytes read in 1697 ms (10.4 MiB/s)
>> gxl_p212_v1#fatload usb 0:1 $dtb_mem_addr dtb
>>
>> reading dtb
>> 22401 bytes read in 26 ms (840.8 KiB/s)
>> gxl_p212_v1#bootm 0x1080000 - $dtb_mem_addr
>>
>> ee_gate_off ...
>> ## Booting kernel from Legacy Image at 01080000 ...
>> ??? Image Name:?? linux-next
>> ??? Image Type:?? AArch64 Linux Kernel Image (uncompressed)
>> ??? Data Size:??? 18424320 Bytes = 17.6 MiB
>> ??? Load Address: 01080000
>> ??? Entry Point:? 01080000
>> ??? Verifying Checksum ... OK
>> load dtb from 0x1000000 ......
>> ?????? Amlogic multi-dtb tool
>> ?????? Single dtb detected
>> ## Flattened Device Tree blob at 01000000
>> ??? Booting using the fdt blob at 0x1000000
>> ??? Loading Kernel Image(COMP_NONE) ... OK
>> ??? kernel loaded at 0x01080000, end = 0x02212200
>> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
>> [rsvmem] fdt get prop fail.
>> ??? Loading Device Tree to 000000001fff7000, end 000000001ffff780 ... OK
>> fdt_instaboot: no instaboot image
>>
>> Starting kernel ...
>>
>> uboot time: 86193017 us
>>
>> ################ OUTPUT END #################################
>>
>>
>> I downloaded the source from:
>> https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-amlogic.git
>>
>> Also as this stems from the original Amlogic linux code, is has anyone
>> else experienced the problem below:
>>
>> [??? 0.000000 at 0] Call trace:
>> [??? 0.000000 at 0] [<ffffff8009fa2f0c>] setup_arch+0xec/0x544
>> [??? 0.000000 at 0] [<ffffff8009fa082c>] start_kernel+0x64/0x378
>> [??? 0.000000 at 0] [<ffffff8009fa01e0>] __primary_switched+0x5c/0x64
>> [??? 0.000000 at 0] Code: 913ec040 94003324 97fff61c d50344ff (d5384100)
>> [??? 0.000000 at 0] ---[ end trace 0000000000000000 ]---
>> [??? 0.000000 at 0] Kernel panic - not syncing: Attempted to kill the idle task!
>> [??? 0.000000 at 0] ---[ end Kernel panic - not syncing: Attempted to
>> kill the idle task!
>>
>> Yes I have googled this and applied the node begin / end patch. Still
>> ouccouring.
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic at lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 21 Nov 2018 10:34:08 +0100
Subject: [U-Boot] [PATCH u-boot 13/19] ARM: meson: rework soc arch file to
 prepare for new SoC
In-Reply-To: <6c757972-bfa1-b900-36cf-6d827d8a6f51@suse.de>
References: <1541777218-472-1-git-send-email-narmstrong@baylibre.com>
 <1541777218-472-14-git-send-email-narmstrong@baylibre.com>
 <6c757972-bfa1-b900-36cf-6d827d8a6f51@suse.de>
Message-ID: <98f64f0b-e144-d340-3a25-620c1b785a73@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Loic,

On 20/11/2018 22:11, Loic Devulder wrote:
> Hi Neil,
> 
> On 11/9/18 4:26 PM, Neil Armstrong wrote:
>> From: Jerome Brunet <jbrunet@baylibre.com>
>>
>> We are about to add support for the Amlogic AXG SoC. While very close to
>> the Gx SoC family, we will need to handle a few thing which are different
>> in this SoC. Rework the meson arch directory to prepare for this.
>>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
>> ---

[...]

>> diff --git a/arch/arm/mach-meson/board-common.c b/arch/arm/mach-meson/board-common.c
>> new file mode 100644
>> index 0000000..0446507
>> --- /dev/null
>> +++ b/arch/arm/mach-meson/board-common.c
>> @@ -0,0 +1,56 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * (C) Copyright 2016 Beniamino Galvani <b.galvani@gmail.com>
>> + */
>> +
>> +#include <common.h>
>> +#include <linux/libfdt.h>
>> +#include <linux/err.h>
>> +#include <asm/arch/mem.h>
>> +#include <asm/arch/sm.h>
>> +#include <asm/armv8/mmu.h>
>> +#include <asm/unaligned.h>
>> +#include <efi_loader.h>
>> +
>> +DECLARE_GLOBAL_DATA_PTR;
>> +
>> +int dram_init(void)
>> +{
>> +	const fdt64_t *val;
>> +	int offset;
>> +	int len;
>> +
>> +	offset = fdt_path_offset(gd->fdt_blob, "/memory");
>> +	if (offset < 0)
>> +		return -EINVAL;
>> +
>> +	val = fdt_getprop(gd->fdt_blob, offset, "reg", &len);
>> +	if (len < sizeof(*val) * 2)
>> +		return -EINVAL;
>> +
>> +	/* Use unaligned access since cache is still disabled */
>> +	gd->ram_size = get_unaligned_be64(&val[1]);
>> +
>> +	return 0;
>> +}
>> +
>> +void meson_board_add_reserved_memory(void *fdt, u64 start, u64 size)
>> +{
>> +	int ret;
>> +
>> +	ret = fdt_add_mem_rsv(fdt, start, size);
>> +	if (ret)
>> +		printf("Could not reserve zone @ 0x%llx\n", start);
>> +
>> +	if (IS_ENABLED(CONFIG_EFI_LOADER)) {
>> +		efi_add_memory_map(start,
>> +				   ALIGN(size, EFI_PAGE_SIZE) >> EFI_PAGE_SHIFT,
>> +				   EFI_RESERVED_MEMORY_TYPE, false);
>> +	}
>> +}
>> +
>> +void reset_cpu(ulong addr)
>> +{
>> +	psci_system_reset();
>> +}
>> +
> 
> Also a small warning because of this blank line at EOF.

Will fix in v2, thanks !

> 
>> diff --git a/arch/arm/mach-meson/board-gx.c b/arch/arm/mach-meson/board-gx.c
>> new file mode 100644
>> index 0000000..f1397f8

[...]
Neil

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: OpenPGP digital signature
URL: <http://lists.infradead.org/pipermail/linux-amlogic/attachments/20181121/5646c5e6/attachment.sig>

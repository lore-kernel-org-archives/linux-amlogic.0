From: narmstrong@baylibre.com (Neil Armstrong)
Date: Wed, 26 Sep 2018 17:11:06 +0200
Subject: [U-Boot] [PATCH v2 1/1] ARM: meson: Extend mem_map to support
 3GiB of RAM
In-Reply-To: <20180925143035.20621-1-ldevulder@suse.de>
References: <20180925143035.20621-1-ldevulder@suse.de>
Message-ID: <a0c52f5a-2e47-224c-7dd1-1f7d5c0206c0@baylibre.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hi Loic,

On 25/09/2018 16:30, Loic Devulder wrote:
> The current mem_map definition for Meson SoCs has support for up
> to 2GiB of RAM. According to S905, S905X, S912 and S805X datasheets
> the DDR region is set from 0x00000000 to 0xBFFFFFFF, so mem_map's
> definition should be changed accordingly.
> 
> It is also needed to be able to boot Khadas VIM2 board with S912
> SoC.
> 
> Signed-off-by: Loic Devulder <ldevulder@suse.de>
> ---
> v2: set the correct size for devices memory map
> 
>  arch/arm/mach-meson/board.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-meson/board.c b/arch/arm/mach-meson/board.c
> index 1ef7e5a6d1..48096ca7cf 100644
> --- a/arch/arm/mach-meson/board.c
> +++ b/arch/arm/mach-meson/board.c
> @@ -111,13 +111,13 @@ static struct mm_region gx_mem_map[] = {
>  	{
>  		.virt = 0x0UL,
>  		.phys = 0x0UL,
> -		.size = 0x80000000UL,
> +		.size = 0xc0000000UL,
>  		.attrs = PTE_BLOCK_MEMTYPE(MT_NORMAL) |
>  			 PTE_BLOCK_INNER_SHARE
>  	}, {
> -		.virt = 0x80000000UL,
> -		.phys = 0x80000000UL,
> -		.size = 0x80000000UL,
> +		.virt = 0xc0000000UL,
> +		.phys = 0xc0000000UL,
> +		.size = 0x30000000UL,
>  		.attrs = PTE_BLOCK_MEMTYPE(MT_DEVICE_NGNRNE) |
>  			 PTE_BLOCK_NON_SHARE |
>  			 PTE_BLOCK_PXN | PTE_BLOCK_UXN
> 

You were faster than me, and already reviewed physically by Marek and Alexander !!

This will fix support for upcoming 3GiB capable boards !

Acked-by: Neil Armstrong <narmstrong@baylibre.com>

Neil

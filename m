From: hs@denx.de (Heiko Schocher)
Date: Mon, 20 Nov 2017 13:40:02 +0100
Subject: [PATCH 2/2] odroid-c2: enable I2C
In-Reply-To: <20171029090901.24299-3-b.galvani@gmail.com>
References: <20171029090901.24299-1-b.galvani@gmail.com>
 <20171029090901.24299-3-b.galvani@gmail.com>
Message-ID: <d16bdfcd-cd65-07f9-8f8b-80142cf070bb@denx.de>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

Hello Beniamino,

Am 29.10.2017 um 10:09 schrieb Beniamino Galvani:
> Signed-off-by: Beniamino Galvani <b.galvani@gmail.com>
> ---
>   arch/arm/include/asm/arch-meson/gxbb.h | 1 +
>   board/amlogic/odroid-c2/odroid-c2.c    | 1 +
>   configs/odroid-c2_defconfig            | 3 +++
>   3 files changed, 5 insertions(+)

Applied to u-boot-i2c master.

Thanks!

bye,
Heiko
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-52   Fax: +49-8142-66989-80   Email: hs at denx.de
